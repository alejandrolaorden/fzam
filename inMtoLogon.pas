{*******************************************************}
{                                                       }
{       FactuZam                                        }
{                                                       }
{       Copyright (C) 2023 fzam.6dvdy@slmail.me    }
{                                                       }
{*******************************************************}

unit inMtoLogon;

interface

uses
  {$IFDEF DEBUG}
    FastMM4,
  {$ENDIF}
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons,
  UniDataConn, inLibUser, ImgList, Buttons, cxControls, cxContainer,
  Vcl.ExtCtrls, Data.DB, DBAccess, Uni, UniProvider, MySQLUniProvider, DADump,
  UniDump, MemDS, cxGraphics, cxLookAndFeels, Vcl.Menus, cxEdit, cxCheckBox,
  cxTextEdit, dxSkinsCore, inMtoFrmBase, cxClasses, cxLocalization;

type
  EInvalidUser = class(Exception);
  EPassWordCorrupt = class(Exception);
  TfrmLogon = class(TfrmBase)
    lblUsuario: TLabel;
    lblContrasena: TLabel;
    btnAceptar: TcxButton;
    btnSalir: TcxButton;
    edtUser: TcxTextEdit;
    edtPass: TcxTextEdit;
    edtGrupo: TcxTextEdit;
    btnConf: TcxButton;
    edtHostName: TcxTextEdit;
    lblHostBBDD: TLabel;
    Bevel1: TBevel;
    lblNomBBDD: TLabel;
    edtNomBD: TcxTextEdit;
    lblUserBBDD: TLabel;
    edtUserBD: TcxTextEdit;
    lblPasswordBBDD: TLabel;
    edtPassBD: TcxTextEdit;
    edtPortBD: TcxTextEdit;
    lblPortHost: TLabel;
    btnTest: TcxButton;
    MySQLUniProvider1: TMySQLUniProvider;
    ucConexion: TUniConnection;
    btnSubirScript: TcxButton;
    btnCopiaSeguridad: TcxButton;
    udDump: TUniDump;
    btnRecover: TcxButton;
    chkRememberPassword: TcxCheckBox;
    chkRememberUser: TcxCheckBox;
    tbUsers: TUniTable;
    btChangePassRoot: TcxButton;
    chkAuto: TcxCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure btnSalirClick(Sender: TObject);
    procedure btnAceptarClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
//    procedure rfbAbrirCarpetaClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnConfClick(Sender: TObject);
    procedure btnTestClick(Sender: TObject);
    procedure btnSubirScriptClick(Sender: TObject);
    procedure btnCopiaSeguridadClick(Sender: TObject);
    procedure btnRecoverClick(Sender: TObject);
    procedure ucConexionError(Sender: TObject; E: EDAError; var Fail: Boolean);
    procedure edtPassBDExit(Sender: TObject);
    procedure btChangePassRootClick(Sender: TObject);
    procedure edtPortBDPropertiesChange(Sender: TObject);
  private
    procedure CambiarPass(f:TUniConnection);
    function CrearBD(sDatabaseN:string):string;
    procedure leerini;
    procedure escribirini;
    procedure SetIniValues;
    procedure GetIniValues;
    function ExisteUser(sNom: string; f: TUniConnection): Boolean;
    function LoginCorrecto(sNom, sPassLogin: string; f: TUniConnection): Boolean;
    function GetGrupo(sUser: string; conn: TUniConnection;
      var EsGrupoAdmin: string): string;
//    procedure AppException(Sender: TObject; E: Exception);
  public
    function IsInitializeAuto:Boolean;
    function CheckIfExistsDataBase:Boolean;
    function CheckIfDatabaseIsUpdated:Boolean;
  end;
var
  frmLogon          : TfrmLogon;
  sPass, sPassEn, sUserPassOK, sSuccess: string;

implementation

uses  inLibWin,
      inLibGlobalVar,
      inlibtb,
      inLibDir,
      inLibLog;

{$R *.dfm}

procedure TfrmLogon.FormCreate(Sender: TObject);
begin
//  Application.OnException := AppException;
  sUserPassOK := 'false';
  Self.Position := poScreenCenter;
  Self.Width := 338;
  Self.ClientHeight := 253;
  edtUser.Text := '';
  leerini;
  try
    GetIniValues;
  except
    on E:Exception do
    if (E is EAccessViolation) or (E is ERangeError) then
      begin
        raise EPassWordCorrupt.Create('Fallo en la lectura y desencriptación' +
                                      ' de password de usuario.');
      end;
  end;
  sPassEn := leCadINIDir('ConnData',
                         'PasswordEn',
                         '2qJFaDfegP/9y6RDno1FRg==',
                         GetUserFolder);
  if (sPassEn.Length > 2) then
  begin
    try
      sPass := DecriptAES(sPassEn);
    except
    on E:Exception do
      begin
        raise EPassWordCorrupt.Create('Fallo en la lectura y desencriptación' +
                                      ' de password BBDD.');
      end;
    end;
  end;
  if (IsInitializeAuto) then
    btnAceptarClick(Self);
end;

procedure TfrmLogon.btnConfClick(Sender: TObject);
begin
  Self.Width := 799;
  Self.ClientHeight := 253;
end;

procedure TfrmLogon.btnCopiaSeguridadClick(Sender: TObject);
var
  savedialog        : TSaveDialog;
  s                 : string;
  MyText            : TStringlist;
begin
  ConstruirConexionConnect(ucConexion, edtUserBD.Text,
    sPass,
    edtHostName.Text,
    edtPortBD.Text,
    edtNomBD.Text);
  savedialog := TSaveDialog.Create(Self);
  saveDialog.Title := 'Guardar copia de seguridad';
  saveDialog.InitialDir := GetUserDeskFolder;
  savedialog.FileName := 'copia_seguridad_' + sPassEn + '_'
    + FormatDateTime('_dd_mm_yy__hh_mm', Now) + '.crypt';
  if (saveDialog.Execute = True) then
  begin
    udDump.Backup;
    s := udDump.SQL.Text;
    s := StringReplace(s, 'DEFINER=`root`@`localhost`', '',
      [rfReplaceAll, rfIgnoreCase]);
    s := 'DROP DATABASE IF EXISTS factuzam; ' + sLineBreak +
         'CREATE DATABASE factuzam ' +
         '  CHARACTER SET utf8mb4 ' +
         '       COLLATE utf8mb4_spanish_ci; ' +  sLineBreak +
         'USE factuzam;' + sLineBreak + sLineBreak + s;
    s := EncriptAESPass(s, sPass);
    MyText := TStringlist.Create;
    MyText.Text := s;
    saveDialog.InitialDir := GetUserDeskFolder;
    MyText.SaveToFile(saveDialog.FileName);
    MyText.Free;
    Log(ucConexion, edtUser.Text, 'Guardada copia Encriptada en ' +
      savedialog.FileName);
    ShowMessage('La copia se guardó exitosamente');
  end
  else
    ShowMessage('La copia se canceló');
  FreeAndNil(savedialog);
end;

procedure TfrmLogon.btnSubirScriptClick(Sender: TObject);
var
  openDialog        : TOpenDialog;
  unqryTestBD: TUniQuery;
begin
  sPass := InputBox('Introduzca password de la BBDD', '','');
  ConstruirConexionConnect(ucConexion, edtUserBD.Text,
    sPass,
    edtHostName.Text,
    edtPortBD.Text,
    'information_schema');
  unqryTestBD := TUniQuery.Create(nil);
  unqryTestBD.Connection := ucConexion;
  unqryTestBD.SQL.Text := 'SELECT SCHEMA_NAME ' +
                          '  FROM INFORMATION_SCHEMA.SCHEMATA ' +
                          ' WHERE SCHEMA_NAME = :BBDD ' ;
  unqryTestBD.ParamByName('BBDD').AsString := edtNomBD.Text;
  unqryTestBD.Open;
  if (unqryTestBD.RecordCount > 0) then
  begin
     if ucConexion.Connected = true then
     begin
       ucConexion.Disconnect;
       ConstruirConexionConnect(ucConexion,
                             edtUserBD.Text,
                             sPass,
                             edtHostName.Text,
                             edtPortBD.Text,
                             edtNomBD.Text);
     end;
  end;
  opendialog := TOpenDialog.Create(Self);
  opendialog.Title := 'Cargar script';
  opendialog.Filter := 'Fichero SQL (*.sql)|*.sql';
  openDialog.InitialDir := GetUserDeskFolder;
  if openDialog.Execute then
  begin
    udDump.RestoreFromFile(opendialog.FileName);
    ShowMessage('El script se ejecutó exitosamente');
  end
  else
    ShowMessage('El script no fue ejecutado');
  FreeAndNil(opendialog);
  FreeAndNil(unqryTestBD);
  if (ucConexion.Connected = true) then
    ucConexion.Disconnect;
end;

procedure TfrmLogon.btnTestClick(Sender: TObject);
begin
  escribirini;
  ConstruirConexionConnect(ucConexion, edtUserBD.Text,
    sPass,
    edtHostName.Text,
    edtPortBD.Text,
    edtNomBD.Text);
  ShowMessage('La conexión se estableció exitosamente.');
  Exit;
end;

procedure TfrmLogon.CambiarPass(f: TUniConnection);
var
  qryCommand:TUniQuery;
  sNewPass:String;
  sPassEnBD:String;
begin
  if not f.Connected then
    ShowMessage('No hay conexión con la bbdd')
  else
  begin
    if ( Application.MessageBox(' ¿Desea cambiar el password por defecto ' +
                                'de la Base de Datos?',
                                'Mensaje Advertencia',
                                MB_YESNO ) = ID_YES ) then
    begin
      sNewPass := InputBox('Introduzca el nuevo password de la BBDD', '','');
      qryCommand := TUniQuery.Create(nil);
      qryCommand.Connection := f;
      qryCommand.SQL.Text := 'FLUSH PRIVILEGES;';
      qryCommand.ExecSQL;
      qryCommand.SQL.Text := 'ALTER USER root@localhost IDENTIFIED BY :PASS;';
      qryCommand.ParamByName('PASS').AsString := sNewPass;
      qryCommand.ExecSQL;
      sPassEnBD := EncriptAES(sNewPass);
      sPass := sNewPass;
      ShowMessage('Password de la BBDD cambiado correctamente.' + sLineBreak +
                  'Anote el password en un lugar seguro para evitar problemas:'+
                  sPass);
      esCadIniDir('ConnData', 'PasswordEn', sPassEnBD, GetUserFolder);
      qryCommand.Free;
    end;
  end;
end;

function TfrmLogon.CheckIfDatabaseIsUpdated: Boolean;
var
  unqryTestBD       : TUniQuery;
  bActualizar: boolean;
begin
  Result := false;
  unqryTestBD := TUniQuery.Create(nil);
  unqryTestBD.Connection := ucConexion;
  unqryTestBD.SQL.Text := 'SELECT VALUE_PERFILES ' +
                          '  FROM fza_usuarios_perfiles ' +
                          ' WHERE SUBKEY_PERFILES = ' +
                                                QuotedStr('DataBaseVersion')  +
                          '   AND VALUE_PERFILES = :VerBBDD ' ;
  unqryTestBD.ParamByName('VerBBDD').AsString := inLibGlobalVar.oVersion;
  unqryTestBD.Open;
  if (unqryTestBD.RecordCount = 1) then
    Result := True;
  bActualizar := (unqryTestBD.RecordCount = 0);
  unqryTestBD.Close;
  FreeAndNil(unqryTestBD);
  if (bActualizar) then
  begin
    if ( Application.MessageBox('Es necesario actualizar la BBDD' +
                                ' con nuevos cambios,' + sLineBreak +
                                ' ¿desea proceder con el procedimiento' +
                                ' de actualización?', 'Mensaje Advertencia',
                                 MB_YESNO ) = ID_YES ) then
    begin
      var MyText := TStringList.Create;
      if (Not(FileExists(DirApp + '\factuzam_original_update_script.sql'))) then
      begin
        ShowMessage('No existe script de actualización, instalación fallida');
        Exit;
      end;
      MyText.LoadFromFile(DirApp + '\factuzam_original_update_script.sql');
      var sScript :string := StringReplace(MyText.Text,
                                   'factuzam',
                                   edtNomBD.Text,
                                   [rfReplaceAll,rfIgnoreCase]);
      UdDump.SQL.Text := sScript;
      UdDump.Restore;
      ShowMessage('La Base de Datos se actualizó a ' + inLibGlobalVar.oVersion);
      Result := True;
      FreeAndNil(MyText);
    end;
  end;
end;

function TfrmLogon.CheckIfExistsDataBase: Boolean;
var
  unqryTestBD       : TUniQuery;
begin
  Result := False;
  ConstruirConexionConnect( ucConexion,
                            edtUserBD.Text,
                            sPass,
                            edtHostName.Text,
                            edtPortBD.Text,
                            'information_schema');
  unqryTestBD := TUniQuery.Create(nil);
  unqryTestBD.Connection := ucConexion;
  unqryTestBD.SQL.Text := 'SELECT SCHEMA_NAME ' +
                          '  FROM INFORMATION_SCHEMA.SCHEMATA ' +
                          ' WHERE SCHEMA_NAME = :BBDD ' ;
  unqryTestBD.ParamByName('BBDD').AsString := edtNomBD.Text;
  unqryTestBD.Open;
  if (unqryTestBD.RecordCount > 0) then
    Result := True
  else
    if (unqryTestBD.RecordCount = 0) then
    begin
       if Application.MessageBox(PWideChar(Format(
         'No existe una base de datos llamada %s, '  +
         '¿desea crearla? ', [edtNomBD.Text])),
         'Error',  MB_YESNO) = ID_YES then
       begin
         UdDump.SQL.Text := CrearBD(edtNomBD.Text);
         if UdDump.SQL.Text <> '' then
         begin
           UdDump.Restore;
           ShowMessage('La Base de Datos se creó exitosamente');
           btChangePassRootClick(Self);
           Result := True;
         end;
       end;
    end;
  unqryTestBD.Close;
  FreeAndNil(unqryTestBD);
end;

function TfrmLogon.CrearBD(sDatabaseN: string):String;
var
  MyText            : TSTringList;
begin
  MyText := TStringList.Create;
  Result := '';
  if (Not(FileExists(DirApp + '\factuzam_original.sql'))) then
  begin
    ShowMessage('No existe script de creación de BD, instalación fallida');
  end
  else
  begin
    MyText.LoadFromFile(DirApp + '\factuzam_original.sql');
    Result := StringReplace(MyText.Text, 'factuzam', sDatabaseN, [rfReplaceAll,
                                                                rfIgnoreCase]);
  end;
  FreeAndNil(MyText);
end;

procedure TfrmLogon.btnRecoverClick(Sender: TObject);
var
  openDialog        : topendialog;
  MyText            : TSTringList;
  s                 : string;
  unqryTestBD       : TUniQuery;
begin
  sPass := InputBox('Escriba password de la BBDD', '', '');
  ConstruirConexionConnect(ucConexion, edtUserBD.Text,
    sPass,
    edtHostName.Text,
    edtPortBD.Text,
    'information_schema');
  unqryTestBD := TUniQuery.Create(nil);
  unqryTestBD.Connection := ucConexion;
  unqryTestBD.SQL.Text := 'SELECT SCHEMA_NAME ' +
                          '  FROM INFORMATION_SCHEMA.SCHEMATA ' +
                          ' WHERE SCHEMA_NAME = :BBDD ' ;
  unqryTestBD.ParamByName('BBDD').AsString := edtNomBD.Text;
  unqryTestBD.Open;
  if (unqryTestBD.RecordCount > 0) then
  begin
     if ucConexion.Connected = true then
     begin
       ucConexion.Disconnect;
       ConstruirConexionConnect( ucConexion,
                                 edtUserBD.Text,
                                 sPass,
                                 edtHostName.Text,
                                 edtPortBD.Text,
                                 edtNomBD.Text);
     end;
  end;
  opendialog := TOpenDialog.Create(Self);
  opendialog.Title := 'Cargar copia';
  opendialog.Filter := 'Copia encriptada (*.crypt)|*.crypt';
  openDialog.InitialDir := GetUserDeskFolder;
  if openDialog.Execute then
  begin
    MyText := TStringlist.create;
    MyText.LoadFromFile(opendialog.FileName);
    s := MyText.Text;
    MyText.Free;
    try
      udDump.SQL.Text := DecriptAESPass(s, edtPassBD.Text);
    except
      on E: Exception do
      begin
        ShowMessage('Contraseña incorrecta.E:' + E.ClassName +
          ' Mensaje:' + E.Message);
        raise;
        Exit;
      end;
    end;
    udDump.Restore;
    //Log(ucConexion, edtUser.Text, 'Recuperada copia encriptada de ' +
    //  openDialog.FileName);
    ShowMessage('El script se ejecutó exitosamente.');
  end
  else
    ShowMessage('Se canceló la carga del script.');
  FreeAndNil(opendialog);
  unqryTestBD.Close;
  FreeAndNil(unqryTestBD);
end;

procedure TfrmLogon.btnSalirClick(Sender: TObject);
begin
  ModalResult := mrCancel;
  Close;
end;

function TfrmLogon.GetGrupo(sUser: string; conn: TUniConnection;
  var EsGrupoAdmin: string): string;
var
  qryGrupo          : TUniQuery;
  sResult           : string;
begin
  qryGrupo := TUniQuery.Create(Self);
  qryGrupo.SQL.Text := 'SELECT GRUPO_USUARIO, ESGRUPOADMINISTRADOR_GRUPO ' +
    '  FROM VI_USUARIOS  ' +
    ' WHERE USUARIO_USUARIO = ' + QuotedStr(sUser);
  qryGrupo.Connection := conn;
  qryGrupo.Open;
  sResult := qryGrupo.Fields[0].AsString;
  EsGrupoAdmin := qryGrupo.Fields[1].AsString;
  qryGrupo.Close;
  FreeAndNil(qryGrupo);
  Result := sResult;
end;

//procedure TfrmLogon.AppException(Sender: TObject; E: Exception);
//begin
//  Log(oConn, edtUser.Text, E.Message, Sender, tlCritical, E.ClassName);
//end;

procedure TfrmLogon.btChangePassRootClick(Sender: TObject);
var
  bAllowChange:Boolean;
  sOldPass:String;
  //sNewPass:String;
begin
  inherited;
  bAllowChange := False;
  if (sPass = 'Zamora2023') then
    bAllowChange := True
  else
  begin
    sOldPass := InputBox('Introduzca el password actual de la BBDD', '','');
  end;
  if not bAllowChange then
  begin
    if ucConexion.Connected then
      ucConexion.Disconnect;
    ConstruirConexionConnect( ucConexion,
                              edtUserBD.Text,
                              sPass,
                              edtHostName.Text,
                              edtPortBD.Text,
                              'information_schema');
    if ucConexion.Connected = true then
      bAllowChange := True;
  end;
  if bAllowChange then
  begin
    CambiarPass(ucConexion);
  end
  else
  begin
    ShowMessage('El password que ha introducido no coincide.');
  end;
end;

procedure TfrmLogon.btnAceptarClick(Sender: TObject);
var
  sGrupoAdmin       : string;

begin
  if ucConexion.Connected then
    ucConexion.Disconnect;
  if CheckIfExistsDataBase then
  begin
    if ucConexion.Connected then
      ucConexion.Disconnect;
    ConstruirConexionConnect(ucConexion,
                              edtUserBD.Text,
                              sPass,
                              edtHostName.Text,
                              edtPortBD.Text,
                              edtNomBD.Text);
    //Log(ucConexion, edtUser.Text, 'Intento de conexión');
    if not CheckIfDatabaseIsUpdated then
    begin
      ShowMessage('No puede entrar a una base de datos sin actualizar');
      Exit;
    end;
    if not ExisteUser(edtUser.Text, ucConexion) then
    begin
      raise EInvalidUser.Create('El nombre de usuario no existe');
    end
    else if not LoginCorrecto(edtUser.text, edtPass.Text, ucConexion) then
    begin
      Log(ucConexion, edtUser.Text, 'La contraseña de usuario no es correcta. ');
      ShowMessage('La contraseña de usuario no es correcta. ');
    end
    else
    begin
      tbUsers.Edit;
      tbUsers.FieldByName('ULTIMOLOGIN_USUARIO').AsDateTime := Now;
      tbUsers.Post;
      tbUsers.Close;
      oUser := edtUser.Text;
      oGroup := GetGrupo(edtUser.Text, ucConexion, sGrupoAdmin);
      orootGroup := sGrupoAdmin;
      //Log(ucConexion, oUser + '\' + Group + '\' + orootGroup,
      //  'Conexión exitosa');
      sUserPassOK := 'true';
      sSuccess := 'S';
      PostMessage(Handle, WM_CLOSE, 0, 0);
      modalResult := mrOK;
    end;
  end;
end;

function TfrmLogon.ExisteUser(sNom: string; f: TUniConnection): Boolean;
begin
  tbUsers.Open;
  tbUsers.First;
  Result := tbUsers.Locate('USUARIO_USUARIO', sNom, []);
end;

function TfrmLogon.LoginCorrecto(sNom, sPassLogin: string;
  f: TUniConnection): Boolean;
var
  sPassMd5          : string;
  sPassBD           : string;
begin
  if sPassLogin <> '' then
  begin
    sPassMd5 := sMd5(sPassLogin);
  end;
  tbUsers.Locate('USUARIO_USUARIO', sNom, []);
  sPAssBD := tbUsers.FindField('PASSWORD_USUARIO').AsString;
  if sPassMd5 = sPassBD then
    Result := True
  else
    Result := False;
end;

procedure TfrmLogon.edtPassBDExit(Sender: TObject);
begin
//  sPass := edtPassBDExit.Text;
//  sPass := EncriptAES(sPass);

//  sPassEn := leCadINI('ConnData', 'PasswordEn', 'x');
//  try
//    sPass := EncriptAES(sPassEn);
//  except
//    on E: Exception do
//    begin
//      ShowMessage('Password erroneo. E:' + E.ClassName +
//        ' Mensaje:' + E.Message);
//      raise;
//      Exit;
//    end;
//  end;
end;

procedure TfrmLogon.edtPortBDPropertiesChange(Sender: TObject);
begin
//
end;

procedure TfrmLogon.escribirini;
begin
  esCadIniDir('ConnData', 'HostName', edtHostName.Text, GetUserFolder);
  esCadIniDir('ConnData', 'Database', edtNomBD.Text, GetUserFolder);
  esCadIniDir('ConnData', 'User', edtUserBD.Text, GetUserFolder);
  esCadIniDir('ConnData', 'Puerto', edtPortBD.Text, GetUserFolder);
  if (edtPassBD.Text <> '') then
  begin
    sPass := edtPassBD.Text;
    sPassEn := EncriptAES(sPass);
    esCadIniDir('ConnData', 'PasswordEn', sPassEn, GetUserFolder);
  end;
end;

procedure tfrmLogon.leerini;
begin
  edtHostName.Text := leCadIniDir('ConnData', 'HostName', '127.0.0.1',
                                                                 GetUserFolder);
  edtNomBD.Text := leCadIniDir('ConnData', 'Database', 'factuzam',
                                                                 GetUserFolder);
  edtUserBD.Text := leCadIniDir('ConnData', 'User', 'root', GetUserFolder);
  edtPortBD.Text := leCadIniDir('ConnData', 'Puerto', '3310', GetUserFolder);
end;

procedure TfrmLogon.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (((ORD(key) = VK_F12) or (ord(key) = VK_RETURN)) and
    (btnAceptar.Enabled = true)) then
    btnAceptar.Click
  else if ORD(key) = VK_ESCAPE then
    btnSalir.click;
end;

procedure TfrmLogon.SetIniValues;
begin
  if (chkRememberUser.Checked = True) then
  begin
    esCadINIDir('UserInfo', 'RememberUser', 'Yes', GetUserFolder);
    esCadINIDir('UserInfo', 'NomUser', edtUser.Text, GetUserFolder);
  end;
  if (chkRememberPassword.Checked = True) then
  begin
    esCadINIDir('UserInfo', 'RememberPassword', 'Yes', GetUserFolder);
    esCadINIDir('UserInfo', 'PasswordEn',
      EncriptAES(edtPass.Text), GetUserFolder);
  end;
  if (chkAuto.Checked = True) then
      esCadINIDir('UserInfo', 'AutoLogin', 'Yes', GetUserFolder);
end;

procedure TfrmLogon.ucConexionError(Sender: TObject; E: EDAError;
  var Fail: Boolean);
begin
  Fail := False;
end;

procedure TfrmLogon.GetIniValues;
var
  sRememberUser,
  sAutoRun,
  sRememberPassword     : string;
begin
  sRememberUser := leCadINIDir('UserInfo',
    'RememberUser',
    'No',
    GetUserFolder);
  sAutoRun := leCadINIDir('UserInfo',
                          'AutoLogin',
                          'No',
                          GetUserFolder);
  sRememberPassword := leCadINIDir('UserInfo',
    'RememberPassword',
    'No',
    GetUserFolder);
  if SameText(sAutoRun,'Yes') then
  begin
    chkAuto.Checked := True;
  end;
  if SameText(sRememberUser, 'Yes') then
  begin
    chkRememberUser.Checked := True;
    edtUser.Text := leCadINIDir('UserInfo',
      'NomUser',
      'Administrador',
      GetUserFolder);
  end;
  if SameText(sRememberPassword, 'Yes') then
  begin
    chkRememberPassword.Checked := True;
    edtPass.Text := DecriptAES(leCadINIDir('UserInfo',
                                             'PasswordEn',
                                             'q7heHfD7ENowuvRQhW56Og==',
                                             GetUserFolder));
  end;
end;

function TfrmLogon.IsInitializeAuto: Boolean;
begin
  Result := chkAuto.Checked;
end;

procedure TfrmLogon.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  SetIniValues;
  if (ucConexion.Connected = true) then
    ucConexion.Disconnect;
end;

end.

