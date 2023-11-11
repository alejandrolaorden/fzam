{*******************************************************}
{                                                       }
{       FactuZam                                        }
{                                                       }
{       Copyright (C) 2023 Alejandro Laorden Hidalgo    }
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
    procedure AppException(Sender: TObject; E: Exception);
  public
    //    function getMd5(const vValue: string): string;
        { Public declarations }
  end;
procedure ShowMtoLogon(Owner: TComponent);
//procedure ShowMtoPrin(Owner        : TComponent);
//function sMD5(const texto:string):string;
var
  frmLogon          : TfrmLogon;
  sPass, sPassEn, sUserPassOK, sSuccess: string;

implementation

uses inLibWin, //md5,
  //inLibDate,
  inLibGlobalVar,
  inlibtb,
  inLibDir,
  inLibLog;

{$R *.dfm}

procedure ShowMtoLogon(Owner: TComponent);
var
  FfrmLog           : TfrmLogon;
begin
  Application.CreateForm(TfrmLogon, FfrmLog);
end;

procedure TfrmLogon.FormCreate(Sender: TObject);
begin
//  Application.OnException := AppException;
  sUserPassOK := 'false';
  Self.Position := poScreenCenter;
  Self.Width := 338;
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
  if ((chkRememberUser.Checked = True) and
    (chkRememberPassword.Checked = True)
    ) then
    btnAceptarClick(Self);
end;

procedure TfrmLogon.btnConfClick(Sender: TObject);
begin
  Self.Width := 772;
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
    sNewPass := InputBox('Introduzca el nuevo password de la BBDD', '','');
    qryCommand := TUniQuery.Create(nil);
    qryCommand.Connection := f;
    qryCommand.SQL.Text := 'FLUSH PRIVILEGES;';
    qryCommand.ExecSQL;
    qryCommand.SQL.Text := 'ALTER USER root@localhost IDENTIFIED BY :PASS;';
    qryCommand.ParamByName('PASS').AsString := sNewPass;
    qryCommand.ExecSQL;
    ShowMessage('Password de la BBDD cambiado correctamente. ' +
                ' Reinicie el sistema o el servicio para que tome efecto.');
    sPassEnBD := EncriptAES(sNewPass);
    sPass := sNewPass;
    esCadIniDir('ConnData', 'PasswordEn', sPassEnBD, GetUserFolder);
    qryCommand.Free;
  end;
end;

function TfrmLogon.CrearBD(sDatabaseN: string):String;
var
  MyText            : TSTringList;
begin
  MyText := TStringList.Create;
  MyText.LoadFromFile(DirApp + '\factuzam_original.sql');
  Result := StringReplace(MyText.Text, 'factuzam', sDatabaseN, [rfReplaceAll,
                                                                rfIgnoreCase]);
  MyText.Free;
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

procedure TfrmLogon.AppException(Sender: TObject; E: Exception);
begin
  Log(oConn, edtUser.Text, E.Message, Sender, tlCritical, E.ClassName);
end;

procedure TfrmLogon.btChangePassRootClick(Sender: TObject);
var
  bAllowChange:Boolean;
  sOldPass:String;
  //sNewPass:String;
begin
  inherited;
  bAllowChange := False;
  if sPass = 'Zamora2023' then
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
    if bAllowChange then
    begin
      CambiarPass(ucConexion);
    end
    else
    begin
      ShowMessage('El password que ha introducido no coincide.');
    end;
  end;
end;

procedure TfrmLogon.btnAceptarClick(Sender: TObject);
var
  sGrupoAdmin       : string;
  unqryTestBD       : TUniQuery;
begin
  if ucConexion.Connected then
    ucConexion.Disconnect;
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
  if (unqryTestBD.RecordCount = 0) then
  begin
     if Application.MessageBox(PWideChar(Format(
       'No existe una base de datos llamada %s, '  +
       '¿desea crearla? ', [edtNomBD.Text])),
       'Error',  MB_YESNO) = ID_YES then
     begin
       UdDump.SQL.Text := CrearBD(edtNomBD.Text);
       UdDump.Restore;
       ShowMessage('La Base de Datos se creó exitosamente');
       btChangePassRootClick(Sender);
     end
     else
     begin
       Exit;
     end;
  end;
  if ucConexion.Connected then
    ucConexion.Disconnect;
  ConstruirConexionConnect(ucConexion,
                            edtUserBD.Text,
                            sPass,
                            edtHostName.Text,
                            edtPortBD.Text,
                            edtNomBD.Text);
  //Log(ucConexion, edtUser.Text, 'Intento de conexión');
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
  if chkRememberUser.Checked = True then
  begin
    esCadINIDir('UserInfo', 'RememberUser', 'Yes', GetUserFolder);
    esCadINIDir('UserInfo', 'NomUser', edtUser.Text, GetUserFolder);
  end;
  if chkRememberPassword.Checked = True then
  begin
    esCadINIDir('UserInfo', 'RememberPassword', 'Yes', GetUserFolder);
    esCadINIDir('UserInfo', 'PasswordEn',
      EncriptAES(edtPass.Text), GetUserFolder);
  end;
end;

procedure TfrmLogon.ucConexionError(Sender: TObject; E: EDAError;
  var Fail: Boolean);
begin
  Fail := False;
end;

procedure TfrmLogon.GetIniValues;
var
  sRememberUser,
  sRememberPassword     : string;
begin
  sRememberUser := leCadINIDir('UserInfo',
    'RememberUser',
    'No',
    GetUserFolder);
  sRememberPassword := leCadINIDir('UserInfo',
    'RememberPassword',
    'No',
    GetUserFolder);
  if sRememberUser <> 'No' then
  begin
    chkRememberUser.Checked := True;
    edtUser.Text := leCadINIDir('UserInfo',
      'NomUser',
      'Administrador',
      GetUserFolder);
  end;
  if sRememberPassword <> 'No' then
  begin
    chkRememberPassword.Checked := True;
    edtPass.Text := DecriptAES(leCadINIDir('UserInfo',
                                             'PasswordEn',
                                             'q7heHfD7ENowuvRQhW56Og==',
                                             GetUserFolder));
  end;
end;

procedure TfrmLogon.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  SetIniValues;
  if (ucConexion.Connected = true) then
    ucConexion.Disconnect;
end;

end.

