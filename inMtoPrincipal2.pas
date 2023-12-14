{*******************************************************}
{                                                       }
{       FactuZam                                        }
{                                                       }
{       Copyright (C) 2023 fzam.6dvdy@slmail.me    }
{                                                       }
{*******************************************************}

unit inMtoPrincipal2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, System.Generics.Collections, Vcl.ActnList,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, dxBarBuiltInMenu, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, dxCore, cxContainer,
  cxEdit, dxSkinsForm, cxStyles, cxClasses, Vcl.ExtCtrls, DADump, UniDump,
  Vcl.Menus, cxPC, cxTextEdit, cxMemo, dxStatusBar, inMtoFrmBase, UniDataConn,
  UniDataPerfiles, cxLocalization, Vcl.Buttons, inLibUnitForm, JvMenus,
  System.UITypes;

type
  TcxPageControlPropertiesAccess = class(TcxPageControlProperties);
  TfrmOpenApp2 = class(TfrmBase)
    undmp1: TUniDump;
    tmr1: TTimer;
    StyleRepository1: TcxStyleRepository;
    StylCab: TcxStyle;
    SkinController1: TdxSkinController;
    EditStyleController: TcxEditStyleController;
    LookAndFeelController1: TcxLookAndFeelController;
    dxstsbr1: TdxStatusBar;
    Panel1: TPanel;
    pcPrincipal: TcxPageControl;
    pnlPPBottom: TPanel;
    cxMemo1: TcxMemo;
    jvMnMenuPrin: TJvMainMenu;
    Archivo1: TMenuItem;
    Ventas1: TMenuItem;
    Utilidades1: TMenuItem;
    Ayuda1: TMenuItem;
    mnuEmpresas: TMenuItem;
    mnuClientes: TMenuItem;
    mnuProveedores: TMenuItem;
    mnuArticulos: TMenuItem;
    mnuFacturas: TMenuItem;
    ablasAuxiliares1: TMenuItem;
    mnuTarifas: TMenuItem;
    mnuFamilias: TMenuItem;
    Salir1: TMenuItem;
    mnuGruposdeIVA: TMenuItem;
    mnuIvas: TMenuItem;
    mnuContadores: TMenuItem;
    mnuFormasdePago: TMenuItem;
    N1: TMenuItem;
    UsuariosGruposyPerfiles1: TMenuItem;
    HacerCopiadeSeguridad1: TMenuItem;
    mnuEjecutarScript: TMenuItem;
    mnuGeneradorProcesos: TMenuItem;
    mnuUsuarios: TMenuItem;
    mnuGrupos: TMenuItem;
    mnuPerfiles: TMenuItem;
    Acercade1: TMenuItem;
    procedure mnuEmpresasClick(Sender: TObject);
    procedure mnuClientesClick(Sender: TObject);
    procedure mnuProveedoresClick(Sender: TObject);
    procedure mnuArticulosClick(Sender: TObject);
    procedure mnuTarifasClick(Sender: TObject);
    procedure mnuFamiliasClick(Sender: TObject);
    procedure mnArchivoSalirClick(Sender: TObject);
    procedure mnuFacturasClick(Sender: TObject);
    procedure mnuGruposdeIVAClick(Sender: TObject);
    procedure mnuIvasClick(Sender: TObject);
    procedure mnuContadoresClick(Sender: TObject);
    procedure mnuUsuariosClick(Sender: TObject);
    procedure mnuGruposClick(Sender: TObject);
    procedure mnuPerfilesClick(Sender: TObject);
    procedure mnuFormasdepagoClick(Sender: TObject);
    procedure CopiasdeSeguridad1Click(Sender: TObject);
    procedure mnuEjecutarScriptClick(Sender: TObject);
    procedure mnuGeneradorProcesosClick(Sender: TObject);
    procedure tmr1Timer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure sbCerrarClick(Sender: TObject);
    procedure mnuAcercadeClick(Sender: TObject);
    function IsShortCut(var Message: TWMKey): Boolean; override;
  private
    FException: boolean;
//    procedure AppException(Sender: TObject; E: Exception);
    procedure CopiaSeguridad;

  public
    { Public declarations }
    FDmConn: TdmConn;
    FdmDataPerfiles: TdmPerfiles;
    oFzaWinf : TfzaWinF;
  end;

var
  frmOpenApp2: TfrmOpenApp2;

implementation

uses inLibUser,
  inLibWin,
  inLibShowMto,
  inLibtb,
  inLibGlobalVar,
  inLibLog,
  inLibDir,
  inMtoSplash,
  inMtoClientes,
  inMtoEmpresas,
  inMtoIvas,
  inMtoIvasGrupos,
  inMtoProveedores,
  inMtoFamilias,
  inMtoArticulos,
  inMtoFacturas,
  inMtoUsuarios,
  inMtoGrupos,
  inMtoContadores,
  inMtoFormasdePago,
  inMtoTarifas,
  inMtoUsuariosPerfiles,
  inMtoGeneradorProcesos;

{$R *.dfm}

procedure TfrmOpenApp2.FormCreate(Sender: TObject);
var
  sDis              : string;
begin
//  Application.OnException := AppException;
  sDis := '';
  oMemoSQL := cxMemo1;
  FdmConn := TdmConn.Create(Self);
  FdmConn.conUni.Connect;
  FdmDataPerfiles := TdmPerfiles.Create(Self);
  odmPerfiles := FdmDataPerfiles;
  oConn := FdmConn.conUni;
  odmConn := FdmConn;
  ofrmMto2 := Self;
  //carga de todos los forms con sus propiedades y módulos de datos
  oFzaWinF := TfzaWinf.Create(Self);
  oFzaWinF.Charge(oConn);
  dxstsbr1.Panels[1].Text := FdmConn.conUni.Server + ':'
    + IntToStr(fdmconn.conUni.Port)
    + ' (' + FdmConn.conUni.Database + ')';
  if oRootGroup = 'S' then
    sDis := ' ✪';
  dxstsbr1.Panels[2].Text := oUser + '  (' + oGroup + ') : ' + sDis + ' : ';
  Self.Caption := oAppName + ' ' + oVersion;
  pnlPPBottom.Visible := False;
  cxMemo1.Visible := False;
  {$IFDEF DEBUG}
    pnlPPBottom.Visible := True;
    cxMemo1.Visible := True;
  {$ENDIF }
  // Log(FdmConn.ConUni, oUSer, 'Entrando en el software', Self);
  //  zqryPermisoMenu.Connection := FdmConn.ZconnGlent;
  //  zqryPermisoMenu.SQL.Text := 'SELECT Entidad, Menu, PermisoAcceso, PermisoListado, PermisoEscritura ' +
  //                         '  FROM glt_user_permisos ' +
  //                         ' WHERE Entidad = ' + QuotedStr(oUser) +
  //                         '    OR Entidad = ' + QuotedStr(oGroup) +
  //                         '  ORDER BY Menu, PermisoAcceso';
  //  zqryPermisoMenu.Open;
  //  SetPermisosMenu(mnMenuPrin, oUser, oGroup);
  //  zqryPermisoMenu.Close;

  //https://stackoverflow.com/questions/2750102/
  //how-can-i-change-the-fontsize-of-the-mainmenu-items-in-delphi
  Screen.MenuFont.Name := 'Lucida Sans';
  Screen.MenuFont.Size := 13;
//  https://www.tek-tips.com/viewthread.cfm?qid=1360646
end;

procedure TfrmOpenApp2.mnuTarifasClick(Sender: TObject);
begin
  if (mnuTarifas.Visible = True) then
    ShowMto(Self,
            'Tarifas');
end;

//procedure TfrmOpenApp2.AppException(Sender: TObject; E: Exception);
//begin
  //OJO!!! DA PROBLEMAS!!!!
  //Log(oConn, oUser, E.Message, Sender, tlCritical, E.ClassName);
  //('ERROR de clase:' + E.ClassName + ' with Message: ' + E.Message);
  //Exit;
//end;

procedure TfrmOpenApp2.CopiasdeSeguridad1Click(Sender: TObject);
begin
  CopiaSeguridad;
end;

//validar iban online https://www.iban.com
//validar nif europeo https://ec.europa.eu/taxation_customs/tin/#/check-tin

procedure TfrmOpenApp2.CopiaSeguridad;
var
  savedialog        : TSaveDialog;
  iButtonSel        : Integer;
  s                 : string;
  MyText            : TStringlist;
begin
  savedialog := TSaveDialog.Create(Self);
  saveDialog.Title := 'Guardar copia de seguridad';
  saveDialog.InitialDir := GetCurrentDir;
  savedialog.FileName := 'copiaseguridad' + FormatDateTime('_dd_mm', Now) +
    '.sql';
  undmp1.Connection := FDmConn.conUni;
  if saveDialog.Execute then
  begin
    if FileExists(savedialog.FileName) then
    begin
      iButtonSel := MessageDlg('¿Desea reemplazar el fichero existente?',
        mtCustom, [mbYes, mbNo], 0);
      s:= 'DROP DATABASE IF EXISTS factuzam; ' + sLineBreak +
                       'CREATE DATABASE factuzam ' +
                       '  CHARACTER SET utf8mb4 ' +
                       '       COLLATE utf8mb4_spanish_ci; ' +  sLineBreak +
                       'USE factuzam;' + sLineBreak + sLineBreak + s;
      if iButtonSel = mrYes then
      begin
        undmp1.Backup;
        s := s + undmp1.SQL.Text;
        s := StringReplace(s, 'DEFINER=`root`@`localhost`', '', [rfReplaceAll,
            rfIgnoreCase]);
        MyText := TStringlist.Create;
        MyText.Text := s;
        saveDialog.InitialDir := GetUserDeskFolder;
        MyText.SaveToFile(saveDialog.FileName, TEncoding.UTF8);
        MyText.Free;
        ShowMessage('La copia se guardó exitosamente');
      end;
    end
    else
    begin
      undmp1.Backup;
      s := s + undmp1.SQL.Text;
      s := StringReplace(s, 'DEFINER=`root`@`localhost`', '', [rfReplaceAll,
          rfIgnoreCase]);
      MyText := TStringlist.Create;
      MyText.Text := s;
      saveDialog.InitialDir := GetUserDeskFolder;
      MyText.SaveToFile(saveDialog.FileName, TEncoding.UTF8);
      MyText.Free;
      ShowMessage('La copia se guardó exitosamente');
    end;
  end;
  FreeAndNil(savedialog);
end;

procedure TfrmOpenApp2.FormClose(Sender: TObject; var Action: TCloseAction);
var
  I:Integer;
begin
  for I := Pred(pcPrincipal.PageCount) downto 0 do
    TcxPageControlPropertiesAccess((pcPrincipal).Properties).DoCloseTab(I);
  //FdmDataPerfiles.unqryPerfiles.Close;
  if (FdmDataPerfiles <> nil) then
    FreeAndNil(FdmDataPerfiles);
  FreeAndNil(oFzaWinf);
  FreeAndNil(FdmConn);
  Action := caFree;
  Application.Terminate;
  Application.ProcessMessages;
  ExitProcess(0);
  //Halt;
end;

procedure TfrmOpenApp2.mnArchivoSalirClick(Sender: TObject);
begin
  Self.Close;
end;

procedure TfrmOpenApp2.FormShow(Sender: TObject);
begin
  //si ocurre una excepción durante la carga, se fuerza el cierre de la ventana
  if FException then
  begin
    PostMessage(Handle, wm_Close, 0, 0);
    Exit;
  end;
end;

function TfrmOpenApp2.IsShortCut(var Message: TWMKey): Boolean;
var
  Component:TComponent;
  ts:TcxTabSheet;
  I:Integer;
  iPageActive:Integer;
  bFound:Boolean;
  aShortCut:TList<integer>;
begin
  I := 0;
  Result := True;
  bFound := False;
  //Defino los posibles ShortCuts que envío desde TActionList
  //Mejor usar el respositorio de ventanas y añadir el shortcut en algún sitio
  if (GetKeyState(VK_CONTROL) < 0) then
  begin
    //Empiezo con la 'A' de la tabla ascii. Lo minimo será Control + 'A'
    if (Message.CharCode >= 65) then
    begin
      aShortCut := oFzaWinf.GetShortCutListOrd;
      if (  (aShortCut.Contains(Message.CharCode))
         ) then
      begin
        //Sólo proceso si hay ventanas abiertas
        if (Self.pcPrincipal.PageCount) > 0 then
        begin
          //Sólo proceso el TActionList de la ventana activa
          iPageActive := pcPrincipal.ActivePageIndex;
          ts := (Self.pcPrincipal.Pages[iPageActive] as TcxTabSheet);
          if (ts.Controls[0] is TForm) then
          I:= 0;
          while ( (I >= 0) and
                  (I < (ts.Controls[0] as TForm).ComponentCount - 1) and
                  (not(bFound)) )  do
          begin
            Component := (ts.Controls[0] as TForm).Components[I];
            if (Component is TActionList) then
            begin
              //Si el ShortCut está en este ActionList, lo proceso
              if TActionList(Component).IsShortCut(Message) then
              begin
                bFound := True;
                Result := False;
                Break;
              end;
            end;
            Inc(I);
          end;
        end;
      end;
      FreeAndNil(aShortCut);
    end;
  end;
  if (bFound = False) then
    Result := inherited IsShortCut(Message);
end;

procedure TfrmOpenApp2.mnuEjecutarScriptClick(Sender: TObject);
var
  openDialog        : topendialog;
begin
  if (mnuEjecutarScript.Visible) then
  begin
    opendialog := TOpenDialog.Create(Self);
    opendialog.Title := 'Cargar script';
    openDialog.InitialDir := GetCurrentDir;
    undmp1.Connection := FDmConn.conUni;
    if openDialog.Execute then
    begin
      try
        undmp1.RestoreFromFile(opendialog.FileName);
        ShowMessage('El script se ejecutó exitosamente');
      except
        on E: Exception do
        begin
          ShowMessage('Hubo problemas al ejecutar el script. E:' + E.ClassName +
            ' Mensaje:' + E.Message);
          raise;
          Exit;
        end;
      end;
      FreeAndNil(opendialog);
    end;
  end;
end;

procedure TfrmOpenApp2.sbCerrarClick(Sender: TObject);
var
  I:Integer;
begin
  inherited;
  i := EncuentraPagina(pcPrincipal, 'Facturas');
  if i<>-1 then
    TcxPageControlPropertiesAccess((pcPrincipal).Properties).DoCloseTab(i);
end;

procedure TfrmOpenApp2.tmr1Timer(Sender: TObject);
var
  ADateStr          : string;
  ATimeStr          : string;
  bIsConnected      : boolean;
begin
  bIsConnected := False;
  ADateStr := DateToStr(Now);
  ATimeStr := FormatDateTime('hh:mm', Now);
  if FDmConn <> nil then
    if FDmConn.conUni.Connected then
    begin
      bIsConnected := True;
      dxstsbr1.Panels.Items[3].Text := '' + ADateStr + ' ' + ATimeStr + ' Conn';
    end;
  if (FdmConn = nil) or (not bIsConnected) then
  begin
    dxstsbr1.Panels.Items[3].Text := '' + ADateStr + ' ' +
                                            ATimeStr + 'NO Conn';
  end;
end;

procedure TfrmOpenApp2.mnuAcercadeClick(Sender: TObject);
var
  frmSplash: TfrmSplash;
begin
  inherited;
  try
    frmSplash := TfrmSplash.Create(Self);
    frmSplash.ShowModal;
  finally
    FreeAndNil(frmSplash);
  end;
end;

procedure TfrmOpenApp2.mnuArticulosClick(Sender: TObject);
begin
  if (mnuArticulos.Visible) then
    ShowMto(Self, 'Articulos');
end;

procedure TfrmOpenApp2.mnuClientesClick(Sender: TObject);
begin
  if (mnuClientes.Visible) then
    ShowMto(Self,
            'Clientes');
end;

procedure TfrmOpenApp2.mnuContadoresClick(Sender: TObject);
begin
  if (mnuContadores.Visible) then
    ShowMto(Self,
            'Contadores');
end;

procedure TfrmOpenApp2.mnuFacturasClick(Sender: TObject);
begin
  if (mnuFacturas.Visible) then
    ShowMto(Self,
            'Facturas');
end;

procedure TfrmOpenApp2.mnuFamiliasClick(Sender: TObject);
begin
  if (mnuFamilias.Visible) then
    ShowMto(Self,
            'Familias');
end;

procedure TfrmOpenApp2.mnuGeneradorProcesosClick(Sender: TObject);
begin
  if (mnuGeneradorProcesos.Visible) then
    ShowMto(Self,
            'GeneradorProcesos');
end;

procedure TfrmOpenApp2.mnuGruposClick(Sender: TObject);
begin
  if (mnuGrupos.Visible) then
    ShowMto(Self,
            'Grupos');
end;

procedure TfrmOpenApp2.mnuGruposdeIVAClick(Sender: TObject);
begin
  if (mnuGruposdeIVA.Visible) then
    ShowMto(Self,
            'IvasGrupos');
end;

procedure TfrmOpenApp2.mnuIvasClick(Sender: TObject);
begin
  if (mnuIvas.Visible) then
    ShowMto(Self,
            'Ivas');
end;

procedure TfrmOpenApp2.mnuEmpresasClick(Sender: TObject);
begin
  if (mnuEmpresas.Visible) then
    ShowMto(Self,
            'Empresas');
end;

procedure TfrmOpenApp2.mnuPerfilesClick(Sender: TObject);
begin
  if (mnuPerfiles.Visible) then
    ShowMto(Self,
            'UsuariosPerfiles');
end;

procedure TfrmOpenApp2.mnuFormasdepagoClick(Sender: TObject);
begin
  if mnuFormasdepago.Visible then
    ShowMto(Self,
            'FormasdePago');
end;

procedure TfrmOpenApp2.mnuProveedoresClick(Sender: TObject);
begin
  if (mnuProveedores.Visible) then
    ShowMto(Self,
            'Proveedores');
end;

procedure TfrmOpenApp2.mnuUsuariosClick(Sender: TObject);
begin
  if (mnuUsuarios.Visible) then
    ShowMto(Self,
            'Usuarios');
end;
end.
