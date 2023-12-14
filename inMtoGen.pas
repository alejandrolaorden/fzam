{*******************************************************}
{                                                       }
{       FactuZam                                        }
{                                                       }
{       Copyright (C) 2023 fzam.6dvdy@slmail.me    }
{                                                       }
{*******************************************************}

unit inMtoGen;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, UniDataGen,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, inMtoFrmBase, dxSkinsCore,
  dxSkinsDefaultPainters, cxPC, dxDockControl, cxControls, dxDockPanel,
  Vcl.ExtCtrls, cxClasses, cxLocalization, cxGraphics, cxLookAndFeels,
  cxLookAndFeelPainters, cxNavigator, cxDBNavigator, Vcl.StdCtrls, Vcl.Buttons,
  cxContainer, cxEdit, cxLabel, dxBarBuiltInMenu, Vcl.Menus, cxButtons,
  dxSkinsLookAndFeelPainter, cxStyles, dxSkinscxPCPainter, inMtoPrincipal2,
  dxSkinsForm, cxCustomData, cxFilter, cxData, cxDataStorage, dxDateRanges,
  Data.DB, cxDBData, cxGridLevel, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, dxmdaset, cxTextEdit, dxBevel,
  inLibDevExp, cxGridExportLink, inLibUser, System.UITypes, UniDataPerfiles,
  Uni, inLibDir, inLibtb, Data.DBCommon, inLibWin, UniDataConn, cxBlobEdit,
  dxCore, dxScrollbarAnnotations, cxRadioGroup, Vcl.AppEvnts, JvComponentBase,
  JvEnterTab;
type
  TcxPageControlPropertiesAccess = class(TcxPageControlProperties);
  THackWinControl = class(TWinControl);
  TfrmMtoGen = class(TfrmBase)
    pButtonPage: TPanel;
    pButtonRightBar: TPanel;
    pButtonBDStat: TPanel;
    pButtonGen: TPanel;
    pnStateDataSet: TPanel;
    lblEditMode: TcxLabel;
    pcPantalla: TcxPageControl;
    tsLista: TcxTabSheet;
    tsFicha: TcxTabSheet;
    btnGrabar: TcxButton;
    btnCancelar: TcxButton;
    cxGrdDBTabPrin: TcxGridDBTableView;
    cxGrdLvPrin: TcxGridLevel;
    cxgrdPrincipal: TcxGrid;
    dsTablaG: TDataSource;
    pnlTopPage: TPanel;
    pnlTopGrid: TPanel;
    sbExportExcel: TSpeedButton;
    edtBusqGlobal: TcxTextEdit;
    nvNavegador: TcxDBNavigator;
    lblTextoaBuscar: TcxLabel;
    tsPerfil: TcxTabSheet;
    pnlPerfilTop: TPanel;
    edtPerfilBusq: TcxTextEdit;
    lblTextoaBuscarPerfil: TcxLabel;
    pnlPerfilDetail: TPanel;
    cxgrdPerfil: TcxGrid;
    tvPerfil: TcxGridDBTableView;
    cxgrdlvlPerfil: TcxGridLevel;
    btnCargarColumnas: TcxButton;
    btnCargarCaptions: TcxButton;
    btnCargarVblesGlob: TcxButton;
    tvPerfilUSUARIO_GRUPO_PERFILES: TcxGridDBColumn;
    tvPerfilKEY_PERFILES: TcxGridDBColumn;
    tvPerfilSUBKEY_PERFILES: TcxGridDBColumn;
    tvPerfilVALUE_PERFILES: TcxGridDBColumn;
    tvPerfilVALUE_TEXT_PERFILES: TcxGridDBColumn;
    tvPerfilTYPE_BLOB_PERFILES: TcxGridDBColumn;
    tvPerfilVALUE_BLOB_PERFILES: TcxGridDBColumn;
    rbBBDD: TcxRadioButton;
    rbGrid: TcxRadioButton;
    sbGrabarGrid: TSpeedButton;
    sbResetGrid: TSpeedButton;
    pnlDataSetName: TPanel;
    lblTablaOrigen: TcxLabel;
    JvEnterAsTab1: TJvEnterAsTab;
    btnBusq: TcxButton;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    //procedure btnSalirClick(Sender: TObject);
    procedure btnGrabarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure cxGrdDBTabPrinDblClick(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure dsTablaGStateChange(Sender: TObject);
    procedure sbExportExcelClick(Sender: TObject);
    procedure btnCargarColumnasClick(Sender: TObject);
    procedure btnCargarCaptionsClick(Sender: TObject);
    procedure btnCargarVblesGlobClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure rbGridClick(Sender: TObject);
    procedure rbBBDDClick(Sender: TObject);
//    procedure edtPerfilBusqKeyPress(Sender: TObject; var Key: Char);
    procedure pcPantallaPageChanging(Sender: TObject; NewPage: TcxTabSheet;
      var AllowChange: Boolean);
    procedure sbResetGridClick(Sender: TObject);
    procedure sbGrabarGridClick(Sender: TObject);
    procedure btnBusqClick(Sender: TObject);
//    procedure edtBusqGlobalPropertiesValidate(Sender: TObject;
//      var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
    //procedure FormShortCut(var Msg: TWMKey; var Handled: Boolean);
//    procedure ApplicationEvents1ShortCut(var Msg: TWMKey; var Handled: Boolean);
  private
    procedure CargarPerfilesComunes(sUser:string = 'Todos');
  public
    tdmDataModule:TdmBase;
    sDataModuleName:string;
    oPerfilDic : TProfileDicc;
    sUso:string;
    pkFieldName:string;
    tsFichCab:TcxTabSheet;
    tsFichBut:TcxTabSheet;
    procedure ProcesarPerfiles;
    procedure AplicarEtiquetas;     virtual;
    procedure CrearTablaPrincipal;  virtual;
    procedure ResetForm;  virtual;
    procedure AbrirPerfiles(bTabVisible:Boolean);
    procedure CargarPerfilesParticulares; virtual;
//    constructor CreateWithDataModule(AOwner: TComponent; ADataModule: TdmBase);
  end;
var
  frmMtoGen: TfrmMtoGen;
  sConsultaO:string;
  sConsultaP:string;

implementation

{$R *.dfm}

uses inMtoGenSearch,
     inLibGlobalVar,
     inLibShowMto,
     inMtoModalGenImpSave;

{https://stackoverflow.com/questions/3979298/
 how-to-simulate-an-ondestroy-event-on-a-tframe-in-delphi}

//procedure TfrmMtoGen.FormShortCut(var Msg: TWMKey; var Handled: Boolean);
//var
//  Message: TMessage absolute Msg;
//  Shift: TShiftState;
//begin
//  Handled := False;
//  if ActiveControl is TCustomEdit then
//  begin
//    Shift := KeyDataToShiftState(Msg.KeyData);
//    // add more cases if needed
//    Handled := (Shift = [ssCtrl]) and
//               (Msg.CharCode in [Ord('F'), Ord('A'), Ord('E'), Ord('K')]);
//    if Handled then
//      TCustomEdit(ActiveControl).DefaultHandler(Message);
//  end;
//  //else if ActiveControl is ... then ... // add more cases as needed
//end;

procedure TfrmMtoGen.AbrirPerfiles(bTabVisible:Boolean);
begin
  if (bTabVisible = true) then
  begin
    if (tdmDataModule = nil) then //es caja de busqueda modal
    begin
      with (Self as TfrmMtoSearch).unqryPerfiles do
      begin
        Connection := oConn;
        if ((Pos('Nothing', SQL.Text) > 0) or
            (Trim(SQL.Text) = '')
           ) then
        begin
          SQL.Text :='SELECT * '+
                     '  FROM fza_usuarios_perfiles ' +
                     ' WHERE (KEY_PERFILES = :NameFormModule)';
          ParamByName('NameFormModule').AsString := Self.Name;
        end;
        if (Active = false) then
          Open;
      end;
    end
    else //es modulo mantenimiento
      begin
        with (tdmDataModule as TdmBase).unqryPerfiles do
        begin
          tvPerfil.DataController.DataSource :=
                                          (tdmDataModule as TdmBase).dsPerfiles;
          Connection := oConn;
          if ( (Pos('Nothing', SQL.Text) > 0) or
               (Trim(SQL.Text) = '') or
               (Pos(':NameDataModule', SQL.Text ) > 0)
             ) then
          begin
            SQL.Text :=   'SELECT * '+
                          '  FROM fza_usuarios_perfiles ' +
                          ' WHERE ((KEY_PERFILES = :NameDataModule) ' +
                          '    OR  (KEY_PERFILES = :NameFormModule)) ';
            ParamByName('NameDataModule').AsString := Self.Name;
            ParamByName('NameFormModule').AsString := tdmDataModule.Name;
          end;
          if (Active = false) then
            Open;
        end;
      end;
  end;
end;

procedure TfrmMtoGen.AplicarEtiquetas;
var
  i:integer;
  cComponent : TComponent;
  cxGrid: TcxGridDBTableView;
begin
  if (DsTablaG.Dataset <> nil) then
    lblTablaOrigen.Caption :=
                GetTableNameFromQuery((dsTablaG.Dataset as TUNIQuery).SQL.Text);
  if (StrToBool(GetPerfilValueDef(oPerfilDic, 'oCreateItems', 'False'))) then
  begin
   for cComponent in (Self as TComponent) do
   begin
     if cComponent.ClassNameis('TcxGridDBTableView') then
     begin
      if ((GetPerfilValueDef(oPerfilDic, 'oApplyWidth', 'False')) = 'True') then
       begin
         cxGrid := (cComponent as TcxGridDBTableView);
         cxGrid.ClearItems;
         cxGrid.DataController.CreateAllItems;
         cxGrid.ApplyBestFit();
       end;
     end;
   end;
  end;
  if ((GetPerfilValueDef(oPerfilDic, 'oApplyWidth', 'False')) = 'True') then
  begin
    for i:= 0 to Self.Componentcount - 1 do
    begin
      if (Self.Components[i].ClassNameis('TcxGridDBTableView')) then
      begin
        cxGrid := (Self.Components[i] as TcxGridDBTableView);
        if ((GetPerfilValueDef(oPerfilDic, cxGrid.Name + '__oApplyWidth',
                               'False')) = 'True') then
        begin
          PonerAnchosTitulos(  cxGrid,
                               Self.Name,
                               oPerfilDic);
        end;
      end;
    end;
  end;
  //if ((GetPerfilValueDef(oPerfilDic, 'oApplySkin', 'False')) = 'True') then
//  SetSkin(GetPerfilValue(oPerfilDic, 'oSkin'));
  Self.Caption := GetPerfilValueDef(oPerfilDic, 'Caption', Self.Caption);
  if ((GetPerfilValueDef(oPerfilDic,
                         'oRenameComponents', 'False')) = 'True') then
    SetLabelForm(Self, oPerfilDic);
  tsPerfil.TabVisible :=
            StrToBool(GetPerfilValueDef(oPerfilDic, 'oMostrarPerfil', 'False'));
  {$IFDEF DEBUG}
    tsPerfil.TabVisible := True;
  {$ENDIF }
  if (tsPerfil.TabVisible = true) then
    AbrirPerfiles(tsPerfil.TabVisible);
end;

procedure TfrmMtoGen.btnCargarCaptionsClick(Sender: TObject);
begin
  inherited;
  CargarCaptions(Self, Self.Owner);
end;

procedure TfrmMtoGen.btnCargarColumnasClick(Sender: TObject);
var
  i:Integer;
  cxGrid : TcxGridDBTableView;
begin
  inherited;
  for i:= 0 to Self.Componentcount - 1 do
  begin
      if (Self.Components[i].ClassNameis('TcxGridDBTableView')) then
    begin
      cxGrid := (Self.Components[i] as TcxGridDBTableView);
      GetSettingsColumn(cxGrid, Self.Name, Self.Owner);
    end;
  end;
end;

procedure TfrmMtoGen.btnCargarVblesGlobClick(Sender: TObject);
begin
  inherited;
  CargarPerfilesComunes;
  CargarPerfilesParticulares;
end;

procedure TfrmMtoGen.btnGrabarClick(Sender: TObject);
begin
  inherited;
  Screen.Cursor := crHourGlass;
  GrabarGrids(Self);
  if oDmConn.conUni.InTransaction = True then
    oDmConn.conUni.Commit;
  Screen.Cursor := crDefault;
end;

procedure TfrmMtoGen.sbGrabarGridClick(Sender: TObject);
var
  formulario: TfrmModalGenImpSave;
  bGuardar, IsSavingGrid: Boolean;
  sPermisos, sSavingGrid:String;
  i:Integer;
  cxGrid : TcxGridDBTableView;
begin
  inherited;
  //Grabar Grid
   bGuardar := False;
  formulario := TfrmModalGenImpSave.Create(Application);
  formulario.edtDescripcion.Enabled := False;
  formulario.edtNombreOrigen.Text := Self.Name;
  formulario.edtDescripcion.Text := 'Grabar Grids';
  formulario.ShowModal;
  if (formulario.sFicha = 'S') then
  begin
    bGuardar := True;
    sPermisos := formulario.cbbPermisos.Text;
  end;
  FreeAndNil(formulario);
  if bGuardar then
  begin
    CargarPerfilesComunes(sPermisos);
    if (tdmDataModule <> nil) then
      GrabarPerfilDatam(tdmDataModule, Self.Owner, sPermisos);
    CargarCaptions(Self, Self.Owner, sPermisos);
    if Not(GetPerfilValueDef(oPerfilDic, 'oApplyWidth', 'False') = 'True') then
    begin
        odmPerfiles.GrabarPerfil(sPermisos, Self.Name, 'oApplyWidth',
                                                                 'True'  );
    end;
    for i:= 0 to Self.Componentcount - 1 do
    begin
        if (Self.Components[i].ClassNameis('TcxGridDBTableView')) then
        begin
          cxGrid := (Self.Components[i] as TcxGridDBTableView);
        // Hay que resetear aquí los registros que contengan el grid en perfiles
          tdmDataModule.ResetGridsProfile(cxGrid.Name, Self.Name, sPermisos);
          IsSavingGrid := (GetPerfilValueDef(oPerfilDic,
                                   cxGrid.Name + '__' + 'oApplyWidth',
                                   'False') = 'True');
          if IsSavingGrid then
            sSavingGrid := 'True'
          else
            sSavingGrid := 'False';
          odmPerfiles.GrabarPerfil( sPermisos,
                                                                      Self.Name,
                                              cxGrid.Name + '__' +'oApplyWidth',
                                                                   sSavingGrid);
          GetSettingsColumnProfile(cxGrid, Self.Name, Self.Owner, sPermisos);
        end;
    end;
  end;
end;

procedure TfrmMtoGen.sbResetGridClick(Sender: TObject);
var
  formulario: TfrmModalGenImpSave;
  bGuardar: Boolean;
  sPermisos:String;
  i:Integer;
  cxGrid : TcxGridDBTableView;
begin
  inherited;
  //Grabar Grid
   bGuardar := False;
  formulario := TfrmModalGenImpSave.Create(Self);
  formulario.edtNombreOrigen.Text := Self.Name;
  formulario.edtDescripcion.Text := 'Reset Grids';
  formulario.ShowModal;
  if (formulario.sFicha = 'S') then
  begin
    bGuardar := True;
    sPermisos := formulario.cbbPermisos.Text;
  end;
  FreeAndNil(formulario);
  if bGuardar then
  begin
    for i:= 0 to Self.Componentcount - 1 do
    begin
        if (Self.Components[i].ClassNameis('TcxGridDBTableView')) then
      begin
        cxGrid := (Self.Components[i] as TcxGridDBTableView);
        tdmDataModule.ResetGridsProfile(cxGrid.Name, Self.Name, sPermisos);
      end;
    end;
  end;
end;

procedure TfrmMtoGen.CargarPerfilesComunes(sUser:string = 'Todos');
begin
  with odmPerfiles do
  begin
    GrabarPerfil(sUser, Self.Name, 'oRenameComponents', 'False' );
    GrabarPerfil(sUser, Self.Name, 'oCreateItems', 'True' );
    GrabarPerfil(sUser, Self.Name, 'oBusqGlobal', 'Grid' );
    GrabarPerfil(sUser, Self.Name, 'oApplyWidth', 'True' );
    GrabarPerfil(sUser, Self.Name, 'oMostrarPerfil', 'False' );
    GrabarPerfil(sUser, Self.Name, 'oGetSQLFromDB', 'False' );
  end;
end;

procedure TfrmMtoGen.CargarPerfilesParticulares;
begin
  if (tdmDataModule <> nil) then
    GrabarPerfilDatam(tdmDataModule, Self.Owner);
end;

procedure TfrmMtoGen.CrearTablaPrincipal;
var
  sNameModule:string;
begin
  tdmDataModule := nil;
  sNameModule := '';
  sNameModule :=
        (Self.Owner as TfrmOpenApp2).oFzaWinf.GetDataModuleName(Self.UnitName +
                                                          '.' + Self.ClassName);
  if (sNameModule <> '') then
    tdmDataModule := CrearDataModule(sNameModule, Self);
  inherited;
end;

procedure TfrmMtoGen.cxGrdDBTabPrinDblClick(Sender: TObject);
begin
  inherited;
  if (tsFicha.TabVisible = True) then
    pcPantalla.ActivePage := tsFicha;
end;

procedure TfrmMtoGen.dsTablaGStateChange(Sender: TObject);
begin
  inherited;
  if ( dsTablaG.Dataset <> nil ) then
  begin
    if ( dsTablaG.DataSet.State = dsInsert ) then
    begin
      lblEditMode.Caption := 'Insertando';
    end;
    if ( dsTablaG.DataSet.State = dsEdit ) then
    begin
      lblEditMode.Caption := 'Editando';
    end;
    if ( dsTablaG.DataSet.State = dsBrowse ) then
    begin
      lblEditMode.Caption := 'Navegando';
    end;
      if ( dsTablaG.DataSet.State = dsInactive ) then
    begin
      lblEditMode.Caption := 'Inactivo';
      Self.Close;
    end;
  end;
end;

//procedure TfrmMtoGen.edtPerfilBusqKeyPress(Sender: TObject; var Key: Char);
//begin
//  inherited;
////    BusqDataBase((tdmdatamodule.unqryPerfiles as TUniQuery),
////                 edtPerfilBusq.Text,
////                 sConsultaP);
//end;

procedure TfrmMtoGen.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  sConsultaO := '';
  sConsultaP := '';
  if (oPerfilDic <> nil) then
    FreeAndNil(oPerfilDic);
  if (tdmDataModule <> nil) then
    FreeAndNil(tdmDataModule);
end;

procedure TfrmMtoGen.FormCreate(Sender: TObject);
var
  sModoBusq:String;
begin
  inherited;
  //Application.ProcessMessages;
  tsFichCab := nil;
  tsFichBut := nil;
  Self.Position  := poScreenCenter;
  ProcesarPerfiles;
  //Self.OnShortCut := FormShortCut;
  sModoBusq := GetPerfilValueDef(oPerfilDic, 'oBusqGlobal', 'Database');
  if sModoBusq = 'DataBase' then
  begin
    rbBBDD.Checked := true;
    rbGrid.Checked := false;
  end
  else
  begin
    rbBBDD.Checked := false;
    rbGrid.Checked := true;
  end;

end;

procedure TfrmMtoGen.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if (Key = VK_ESCAPE) then
  begin
    CancelarGrids(Owner);
    if ((pcPantalla.ActivePage = tsFicha)) then
        pcPantalla.ActivePage := tsLista;
//      else
//        if ( (dsTablaG.State = dsBrowse) and
//             (pcPantalla.ActivePage = tsLista)
//           ) then
//          if ( Application.MessageBox( '¿Desea abandonar la ficha?',
//                                   'Mensaje Advertencia',
//                                   MB_YESNO ) = ID_YES ) then
//         Close;
  end;
  if (dsTablaG.State = dsBrowse) then
  begin
    if (Key = VK_PRIOR) then
       nvNavegador.Buttons.Prior.Click;
    if (Key = VK_NEXT) then
       nvNavegador.Buttons.Next.Click;
    if (Key = VK_INSERT) then
      dsTablaG.DataSet.Insert;
    if (key = VK_HOME) then
      dsTablaG.DataSet.First;
    if (key = VK_END) then
      dsTablaG.DataSet.Last;
    if (key = VK_F2) then
      dsTablaG.DataSet.Edit;
  end;
    if (key = VK_F12) then
      if ((dsTablaG.State = dsEdit) or
          (dsTablaG.State = dsInsert)) then
        dsTablaG.DataSet.Post;
//  if ((Key = VK_RETURN) and (Shift <> [ssCtrl])) then
//    Perform(CM_DIALOGKEY, VK_TAB, 0);
end;

procedure TfrmMtoGen.FormShow(Sender: TObject);
begin
  inherited;
  if (tsLista.TabVisible = true) then
    pcPantalla.ActivePage := tsLista;
//  if (sUso <> 'Busq') then
//    Self.WindowState := wsMaximized;
//  if SameText(sUso, 'Busq') then
//    Self.WindowState := wsNormal;
  edtBusqGlobal.SetFocus;
end;

procedure TfrmMtoGen.pcPantallaPageChanging(Sender: TObject;
  NewPage: TcxTabSheet; var AllowChange: Boolean);
begin
  inherited;
  if ( (not NewPage.Visible) and
       (not NewPage.Enabled)
     ) then
  begin
    if (NewPage.Name = 'tsFicha') then
      AllowChange := False;
  end;
end;

procedure TfrmMtoGen.ProcesarPerfiles;
begin
  inLibUser.GetFormUserProfile(oPerfilDic, Self.Name);
  CrearTablaPrincipal;
  AplicarEtiquetas;
end;

procedure TfrmMtoGen.rbBBDDClick(Sender: TObject);
begin
  inherited;
  if (rbBBDD.Checked = true) then
    rbGrid.Checked := false
  else
    rbGrid.Checked := true;
end;

procedure TfrmMtoGen.rbGridClick(Sender: TObject);
begin
  inherited;
  if rbGrid.Checked = true then
    rbBBDD.Checked := false
  else

    rbBBDD.Checked := true;
end;

procedure TfrmMtoGen.ResetForm;
begin

end;

procedure TfrmMtoGen.btnBusqClick(Sender: TObject);
//var
//  sBusq:string;
begin
  inherited;
//  if (rbBBDD.Checked = true) then
//    sBusq := 'Database'
//  else
//    sBusq := 'Grid';
//  if ( sBusq = 'Grid') then
//  begin
    //filtro del grid de Developer Express
    BusqAllGrid(cxGrdDBTabPrin,
                edtBusqGlobal.Text);
//  end
//  else
//    begin
//      //filtro desde la consulta sql, añadiendo las opc de búsqueda al sql
//      BusqDataBase( (dsTablaG.DataSet  as TUniQuery),
//                     edtBusqGlobal.Text,
//                     sConsultaO);
//    end;
  if ((pcPantalla.ActivePage <> tsLista) and (tsLista.TabVisible = true)) then
    pcPantalla.ActivePage := tsLista;
end;

procedure TfrmMtoGen.btnCancelarClick(Sender: TObject);
begin
  inherited;
  Screen.Cursor := crHourGlass;
  CancelarGrids(Owner);
  Screen.Cursor := crDefault;
end;

procedure TfrmMtoGen.sbExportExcelClick(Sender: TObject);
var
  saveDialog : tsavedialog;
begin  saveDialog := TSaveDialog.Create(self);
  saveDialog.Title := 'Guardar listado a Excel';
  saveDialog.InitialDir :=  GetSpecialFolderPath(CSIDL_MYDOCUMENTS);
  saveDialog.Filter := 'Archivo Excel|*.xlsx';
  saveDialog.DefaultExt := 'xlsx';
  saveDialog.FilterIndex := 1;
  if ( saveDialog.Execute ) then
    ExportGridToXLSX(saveDialog.FileName, cxGrdPrincipal);
  saveDialog.Free;
end;

//procedure TfrmMtoGen.btnSalirClick(Sender: TObject);
//var
//  i:Integer;
//  ts : TcxTabSheet;
//  pc:TcxPageControl;
//begin
//  inherited;
//  if (dsTablaG.DataSet <> nil) then
//    if ( dsTablaG.DataSet.State = dsInsert ) or
//       ( dsTablaG.DataSet.State = dsEdit ) then
//    begin
//       if ( Application.MessageBox( '¿Desea cancelar la entrada de datos?',
//                                   'Mensaje Advertencia',
//                                   MB_YESNO ) = ID_YES ) then
////         Close;
//    end;
//    ts := parent as TcxTabSheet;
//    pc := ts.PageControl;//else
//    i := EncuentraPagina(pc, 'Facturas');
//    if i<>-1 then
//       TcxPageControlPropertiesAccess((pc).Properties).DoCloseTab(i);
//end;
end.
