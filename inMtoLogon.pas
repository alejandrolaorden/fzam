﻿{*******************************************************}
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
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, rtti,
  UniDataConn, inLibUser, ImgList, Buttons, cxControls, cxContainer,
  Vcl.ExtCtrls, Data.DB, DBAccess, Uni, UniProvider, MySQLUniProvider, DADump,
  UniDump, MemDS, cxGraphics, cxLookAndFeels, Vcl.Menus, cxEdit, cxCheckBox,
  cxTextEdit, dxSkinsCore, inMtoFrmBase, cxClasses, cxLocalization, cxMemo,
  DASQLMonitor, UniSQLMonitor, System.UITypes, dxShellDialogs, dxSkinBlue;

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
    pnlPPBottom: TPanel;
    cxMemo1: TcxMemo;
    UniSQLMonitor1: TUniSQLMonitor;
    saveDialog: TdxSaveFileDialog;
    openDialog: TdxOpenFileDialog;
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
    procedure UniSQLMonitor1SQL(Sender: TObject; Text: string;
      Flag: TDATraceFlag);
//    procedure cxButton1Click(Sender: TObject);
    procedure leerini;
    procedure GetIniValues;
  private
    procedure CambiarPass(f:TUniConnection);
    function CrearBD(sDatabaseN:string):string;

    procedure escribirini;
    procedure SetIniValues;

    function ExisteUser(sNom: string; f: TUniConnection): Boolean;
    function LoginCorrecto(sNom, sPassLogin: string; f: TUniConnection): Boolean;
    function GetGrupo(sUser: string; conn: TUniConnection;
      var EsGrupoAdmin: string): string;
    procedure AppException(Sender: TObject; E: Exception);
  public
    sSuccess:String;
    function IsInitializeAuto:Boolean;
    function CheckIfExistsDataBase:Boolean;
    function CheckIfDatabaseIsUpdated:Boolean;
  end;
var
  frmLogon          : TfrmLogon;
  sPass, sPassEn, sUserPassOK: string;

implementation

uses  inLibWin,
      inLibGlobalVar,
      inlibtb,
      inLibMsg,
      inLibDir,
      inLibLog;

{$R *.dfm}

procedure TfrmLogon.FormCreate(Sender: TObject);
begin
  ucConexion.Pooling := True;
  ucConexion.PoolingOptions.MinPoolSize := 1;
  ucConexion.PoolingOptions.MaxPoolSize := 50;
  ucConexion.PoolingOptions.ConnectionLifeTime := 3 * 60; // 3 minutos
  Application.OnException := AppException;
  UniSQLMonitor1.Active := False;
  Self.Width := 338;
  Self.ClientHeight := 253;
  cxMemo1.Visible := False;
  pnlPPBottom.Visible := False;
  {$IFDEF DEBUG}
    inliblog.Log.LogInfo('Arrancando en modo Debug');
    pnlPPBottom.Visible := True;
    UniSQLMonitor1.Active := True;
    cxMemo1.Visible := True;
    Self.ClientHeight := 493;
    Self.Width := 783;
  {$ENDIF}
  sUserPassOK := 'false';
  Self.Position := poScreenCenter;
  edtUser.Text := '';
  //leerini;
//  try
//    GetIniValues;

//  except
//    on E:Exception do
//    if (E is EAccessViolation) or (E is ERangeError) then
//      begin
//        raise EPassWordCorrupt.Create(SErrorDecryptPass);
//      end;
//  end;
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
        raise EPassWordCorrupt.Create(SErrorDecryptPassBBDD);
      end;
    end;
  end;
  //if (IsInitializeAuto) then
  //  btnAceptarClick(Self);
end;

procedure TfrmLogon.btnConfClick(Sender: TObject);
begin
  Self.Width := 799;
  Self.ClientHeight := 253;
end;

procedure TfrmLogon.btnCopiaSeguridadClick(Sender: TObject);
var
  //savedialog: TSaveDialog;
  s         : string;
  MyText    : TStringlist;
  iButtonSel:Integer;
begin
  ConstruirConexionConnect(ucConexion, edtUserBD.Text,
    sPass,
    edtHostName.Text,
    edtPortBD.Text,
    edtNomBD.Text);
  iButtonSel := 0;
  //savedialog := TSaveDialog.Create(nil);
  saveDialog.Title := 'Guardar copia de seguridad';
  saveDialog.InitialDir := GetCurrentDir;
  savedialog.FileName := 'copiaseguridad_' +sPassEn+
                                       FormatDateTime('_dd_mm', Now) + '.crypt';
  if (saveDialog.Execute) then
  begin
    if FileExists(savedialog.FileName) then
    begin
      iButtonSel := MessageDlg('¿Desea reemplazar el fichero existente?',
        mtCustom, [mbYes, mbNo], 0);
    end;
    if ((iButtonSel = mrYes) or (not FileExists(saveDialog.FileName))) then
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
      s := EncriptAESPass(s, AnsiString(sPass));
      MyText := TStringlist.Create;
      MyText.Text := s;
      saveDialog.InitialDir := GetUserDeskFolder;
      MyText.SaveToFile(saveDialog.FileName);
      MyText.Free;
      Log.LogInfo(edtUser.Text + ' Guardó copia Encriptada en ' +
        savedialog.FileName);
      ShowMessage('La copia se guardó exitosamente');
    end;
  end
  else
  begin
    Log.LogError('La copia se canceló');
    ShowMessage('La copia se canceló');
  end;
  //FreeAndNil(savedialog);
end;

procedure TfrmLogon.btnSubirScriptClick(Sender: TObject);
var
  //openDialog        : TOpenDialog;
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
//  opendialog := TOpenDialog.Create(Self);
  opendialog.Title := 'Cargar script';
  opendialog.Filter := 'Fichero SQL (*.sql)|*.sql';
  openDialog.InitialDir := GetUserDeskFolder;
  if openDialog.Execute then
  begin
    udDump.RestoreFromFile(opendialog.FileName);
    Log.LogInfo('El script se ejecutó exitosamente');
    ShowMessage('El script se ejecutó exitosamente');
  end
  else
  begin
    Log.LogInfo('El script no fue ejecutado');
    ShowMessage('El script no fue ejecutado');
  end;

  //FreeAndNil(opendialog);
  FreeAndNil(unqryTestBD);
  if (ucConexion.Connected = true) then
    ucConexion.Disconnect;
end;

procedure TfrmLogon.btnTestClick(Sender: TObject);
begin
  escribirini;
  ConstruirConexionConnect( ucConexion,
                            edtUserBD.Text,
                            sPass,
                            edtHostName.Text,
                            edtPortBD.Text,
                            edtNomBD.Text);
  Log.LogInfo(SconnSuccBBDD);
  ShowMessage(SConnSuccBBDD);
  Exit;
end;

procedure TfrmLogon.CambiarPass(f: TUniConnection);
var
  qryCommand:TUniQuery;
  sNewPass:String;
  sPassEnBD:String;
begin
  if not f.Connected then
    ShowMessage(SNoConnBBDD)
  else
  begin
    if (Application.MessageBox(PWideChar(SWantDefChgBBDD),
                               PWideChar(SAdvMsg), MB_YESNO ) = ID_YES ) then
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
      ShowMessageFmt(SPasswordBBDDChanged, [sPass]);
      Log.LogInfo(sPasswordBBDDChanged);
      esCadIniDir('ConnData', 'PasswordEn', sPassEnBD, GetUserFolder);
      qryCommand.Free;
    end;
  end;
end;

function TfrmLogon.CheckIfDatabaseIsUpdated: Boolean;
var
  unqryTestBD       : TUniQuery;
  sFileUp:String;
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
    if ( Application.MessageBox(PWideChar(SAdviceUpdateBBDD),
                                PWideChar(SAdvMsg),
                                MB_YESNO ) = ID_YES ) then
    begin
      var MyText := TStringList.Create;
      sFileUp := DirApp + '\factuzam_original_update_script.sql';
      if (Not(FileExists(sFileUp))) then
      begin
        ShowMessageFmt(SNotExistsUpBBDDFile, [sFileUp]);
        Exit;
      end;
      MyText.LoadFromFile(sFileUp);
      var sScript :string := StringReplace(MyText.Text,
                                   'factuzam',
                                   edtNomBD.Text,
                                   [rfReplaceAll,rfIgnoreCase]);
      UdDump.SQL.Text := sScript;
      UdDump.Restore;
      ShowMessage(SBBDDUpdateTo + inLibGlobalVar.oVersion);
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
       if Application.MessageBox(PWideChar(Format( SErrorCreateBBDD,
                                                   [edtNomBD.Text])),
         'Error',  MB_YESNO) = ID_YES then
       begin
         UdDump.SQL.Text := CrearBD(edtNomBD.Text);
         if UdDump.SQL.Text <> '' then
         begin
           UdDump.Restore;
           ShowMessage(SCreateSuccBBDD);
           Log.LogInfo(SCreateSuccBBDD);
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
  MyText: TSTringList;
  sFile : String;
begin
  MyText := TStringList.Create;
  Result := '';
  sFile := DirApp + '\factuzam_original.sql';
  if (Not(FileExists(sFile))) then
  begin
    ShowMessage(SFailLoadScriptBBDD);
    Log.LogError(SFailLoadScriptBBDD);
  end
  else
  begin
    MyText.LoadFromFile(sFile);
    Result := StringReplace(MyText.Text, 'factuzam', sDatabaseN, [rfReplaceAll,
                                                                rfIgnoreCase]);
  end;
  FreeAndNil(MyText);
end;

//procedure TfrmLogon.cxButton1Click(Sender: TObject);
//  procedure ListClassesDeclaredInNamedUnit(const UnitName: string);
//  var
//    Context: TRttiContext;
//    t: TRttiType;
//    DeclaringUnitName: string;
//  begin
//    Context := TRttiContext.Create;
//    for t in Context.GetTypes do
//      if t.IsInstance then
//      begin
//        DeclaringUnitName := t.AsInstance.DeclaringUnitName;
//        if SameText(DeclaringUnitName, UnitName) then
//          mList.Lines.add(t.ToString +' '+ DeclaringUnitName);
//      end;
//  end;
//begin
//  inherited;
//  ListClassesDeclaredInNamedUnit(edtUnit.Text);
//end;

procedure TfrmLogon.btnRecoverClick(Sender: TObject);
var
//  openDialog        : topendialog;
  MyText            : TSTringList;
  s                 : string;
  unqryTestBD       : TUniQuery;
begin
  sPass := InputBox(SGetPassBBDD, '', '');
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
  //opendialog := TOpenDialog.Create(Self);
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
      udDump.SQL.Text := DecriptAESPass(s, AnsiString(edtPassBD.Text));
    except
      on E: Exception do
      begin
        ShowMessage(SErrorPassMatchBBDD +' '+ E.ClassName +
          ' Mensaje:' + E.Message);
        raise;
        Exit;
      end;
    end;
    udDump.Restore;
    ShowMessage(SScriptSuccess);
  end
  else
    ShowMessage('Se canceló la carga del script.');
  //FreeAndNil(opendialog);
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
  qryGrupo.SQL.Text := ' SELECT GRUPO_USUARIO, ESGRUPOADMINISTRADOR_GRUPO ' +
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
  inliblog.Log.LogError('Error general: ' + E.ClassName +': '+ E.Message) ;
end;

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
    sOldPass := InputBox(SEnterPassBBDD, '','');
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
    ShowMessage(SErrorPassMatch);
  end;
end;

procedure TfrmLogon.btnAceptarClick(Sender: TObject);
var
  sGrupoAdmin: string;
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
      Log.LogError('No puede entrar a una base de datos sin actualizar');
      ShowMessage('No puede entrar a una base de datos sin actualizar');
      Exit;
    end;
    if not ExisteUser(edtUser.Text, ucConexion) then
    begin
      Log.LogError('El nombre de usuario no existe');
      raise EInvalidUser.Create('El nombre de usuario no existe');
    end
    else if not LoginCorrecto(edtUser.text, edtPass.Text, ucConexion) then
    begin
      if (Sender <> nil) then // Si se llamó desde el botón (no auto-login)
        ShowMessage(SErrorAuthPass);
      sSuccess := 'N';
      Log.LogError(SErrorAuthPass);
    end
    else
    begin
      Log.LogInfo('Login Correcto');
      tbUsers.Edit;
      tbUsers.FieldByName('ULTIMOLOGIN_USUARIO').AsDateTime := Now;
      tbUsers.Post;
      tbUsers.Close;
      oUser := edtUser.Text;
      oGroup := GetGrupo(edtUser.Text, ucConexion, sGrupoAdmin);
      orootGroup := sGrupoAdmin;
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

procedure TfrmLogon.UniSQLMonitor1SQL(Sender: TObject; Text: string;
  Flag: TDATraceFlag);
begin
  inherited;
  {$IFDEF DEBUG}
    cxMemo1.Lines.Add(Text);
    Log.LogSQL(Text);
  {$ENDIF}
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
  inliblog.Log.LogInfo('Leyendo archivo ini de usuario');
end;

function TfrmLogon.IsInitializeAuto: Boolean;
begin
  Result := chkAuto.Checked;
  {$IFDEF DEBUG}
    Result := False;
  {$ENDIF }
end;

procedure TfrmLogon.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  SetIniValues;
  if (ucConexion.Connected = true) then
    ucConexion.Disconnect;
  ucConexion.Pooling := false;
end;

end.

