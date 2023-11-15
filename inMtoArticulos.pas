﻿{*******************************************************}
{                                                       }
{       FactuZam                                        }
{                                                       }
{       Copyright (C) 2023 fzam.6dvdy@slmail.me    }
{                                                       }
{*******************************************************}

unit inMtoArticulos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, dxSkinsCore, dxSkinBlue,
  dxSkinscxPCPainter, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxEdit, cxNavigator, DB, cxDBData, cxContainer,
  cxCheckBox, cxTextEdit, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, ComCtrls, StdCtrls, Buttons, ExtCtrls,
  dxBarBuiltInMenu, cxPC, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox,
  cxMaskEdit, cxDropDownEdit, cxDBEdit, cxLabel,
  cxGridBandedTableView, cxGridDBBandedTableView,  cxLocalization,
  cxCurrencyEdit, cxDataControllerConditionalFormattingRulesManagerDialog,
  dxBevel, cxDBNavigator, UniDataArticulos,
  dxDateRanges, MemDS, DBAccess, Uni, cxImage, dxGDIPlusClasses, inMtoGen,
  Vcl.Menus, dxSkinsForm, cxButtons, dxSkinsDefaultPainters, cxMemo, cxSpinEdit,
  cxCalendar, cxBlobEdit, Vcl.DBCtrls, cxCheckComboBox, cxDBCheckComboBox,
  cxGroupBox, cxCheckGroup, cxDBCheckGroup, cxRadioGroup,
  dxScrollbarAnnotations, dxCore, System.Actions, Vcl.ActnList,
  Vcl.PlatformDefaultStyleActnCtrls, Vcl.ActnMan, cxButtonEdit, cxSplitter,
  cxDBExtLookupComboBox, cxListView, Vcl.AppEvnts, JvComponentBase, JvEnterTab;

type
  TfrmMtoArticulos = class(TfrmMtoGen)
    pnlTopFicha: TPanel;
    pnlButtonFicha: TPanel;
    pcDetail: TcxPageControl;
    txtDESCRIPCION_ARTICULO: TcxDBTextEdit;
    txtCODIGO_ARTICULO: TcxDBTextEdit;
    pnlBodyFicha: TPanel;
    lblCodigo: TcxLabel;
    lblNombre: TcxLabel;
    tsOtros: TcxTabSheet;
    pnl3: TPanel;
    cxdbtxtdtDIRECCION1_CLIENTE: TcxDBTextEdit;
    lblUsuarioAlta: TcxLabel;
    lblInstanteAlta: TcxLabel;
    cxdbtxtdtUSUARIOALTA: TcxDBTextEdit;
    cxdbtxtdtINSTANTEALTA: TcxDBTextEdit;
    lblInstanteModif: TcxLabel;
    cxdbtxtdtUSUARIOALTA1: TcxDBTextEdit;
    lblUsuarioModif: TcxLabel;
    chkActivo: TcxDBCheckBox;
    cbbFamilia: TcxDBLookupComboBox;
    lblFamilia: TcxLabel;
    tsTarifas: TcxTabSheet;
    cxgrdbclmnGrdDBTabPrinCODIGO_ARTICULO: TcxGridDBColumn;
    cxgrdbclmnGrdDBTabPrinACTIVO_ARTICULO: TcxGridDBColumn;
    cxgrdbclmnGrdDBTabPrinDESCRIPCION_ARTICULO: TcxGridDBColumn;
    cxgrdbclmnGrdDBTabPrinCODIGO_FAMILIA_ARTICULO: TcxGridDBColumn;
    cxgrdbclmnGrdDBTabPrinTIPOIVA_ARTICULO: TcxGridDBColumn;
    rgTipoIVA: TcxDBRadioGroup;
    cxgrdbclmnGrdDBTabPrinDESCRIPCION_FAMILIA: TcxGridDBColumn;
    cxgrdTarifas: TcxGrid;
    tvTarifas: TcxGridDBTableView;
    cxgrdlvlTarifas: TcxGridLevel;
    chkACTIVO_ARTICULO: TcxDBCheckBox;
    tsProveedores: TcxTabSheet;
    tsLineasFactura: TcxTabSheet;
    cxgrdProveedores: TcxGrid;
    tvProveedores: TcxGridDBTableView;
    cxgrdlvlProveedores: TcxGridLevel;
    cxgrdLinFac: TcxGrid;
    tvLinFac: TcxGridDBTableView;
    cxgrdlvlLinFac: TcxGridLevel;
    cxgrdbclmnProveedoresCODIGO_PROVEEDOR: TcxGridDBColumn;
    cxgrdbclmnProveedoresCODIGO_ARTICULO: TcxGridDBColumn;
    cxgrdbclmnProveedoresPRECIO_ULT_COMPRA: TcxGridDBColumn;
    cxgrdbclmnProveedoresFECHA_VALIDEZ: TcxGridDBColumn;
    cxgrdbclmnProveedoresINSTANTEMODIF: TcxGridDBColumn;
    cxgrdbclmnProveedoresINSTANTEALTA: TcxGridDBColumn;
    cxgrdbclmnProveedoresUSUARIOALTA: TcxGridDBColumn;
    cxgrdbclmnProveedoresUSUARIOMODIF: TcxGridDBColumn;
    cxgrdbclmnLinFacNRO_FACTURA_LINEA: TcxGridDBColumn;
    cxgrdbclmnLinFacSERIE_FACTURA_LINEA: TcxGridDBColumn;
    cxgrdbclmnLinFacLINEA_FACTURA_LINEA: TcxGridDBColumn;
    cxgrdbclmnLinFacCODIGO_ARTICULO_FACTURA_LINEA: TcxGridDBColumn;
    cxgrdbclmnLinFacCODIGO_FAMILIA_FACTURA_LINEA: TcxGridDBColumn;
    cxgrdbclmnLinFacNOMBRE_FAMILIA_FACTURA_LINEA: TcxGridDBColumn;
    cxgrdbclmnLinFacFECHA_ENTREGA_FACTURA_LINEA: TcxGridDBColumn;
    cxgrdbclmnLinFacTIPO_CANTIDAD_ARTICULO_FACTURA_LINEA: TcxGridDBColumn;
    cxgrdbclmnLinFacESIMP_INCL_TARIFA_FACTURA_LINEA: TcxGridDBColumn;
    cxgrdbclmnLinFacTIPOIVA_ARTICULO_FACTURA_LINEA: TcxGridDBColumn;
    cxgrdbclmnLinFacDESCRIPCION_ARTICULO_FACTURA_LINEA: TcxGridDBColumn;
    cxgrdbclmnLinFacCANTIDAD_FACTURA_LINEA: TcxGridDBColumn;
    cxgrdbclmnLinFacPRECIOVENTA_SIVA_ARTICULO_FACTURA_LINEA: TcxGridDBColumn;
    cxgrdbclmnLinFacPORCEN_IVA_FACTURA_LINEA: TcxGridDBColumn;
    cxgrdbclmnLinFacPRECIOVENTA_CIVA_ARTICULO_FACTURA_LINEA: TcxGridDBColumn;
    cxgrdbclmnLinFacTOTAL_FACTURA_LINEA: TcxGridDBColumn;
    cxgrdbclmnLinFacNOMBRE_TARIFA: TcxGridDBColumn;
    pnlFacturaOpts: TPanel;
    btnIraFactura: TcxButton;
    btnIraEmpresa: TcxButton;
    btnExportarLineas: TcxButton;
    pnlFacturaOpts1: TPanel;
    btnIraProveedor: TcxButton;
    btnExportarProveedor: TcxButton;
    pnlFacturaOpts2: TPanel;
    btnIraTarifa: TcxButton;
    btnCrearTarifa: TcxButton;
    btnExportarTarifa: TcxButton;
    btnIraCliente: TcxButton;
    cxgrdbclmnProveedoresRAZONSOCIAL_PROVEEDOR: TcxGridDBColumn;
    btnAddProveedor: TcxButton;
    cxgrdbclmnProveedoresESPROVEEDORPRINCIPAL: TcxGridDBColumn;
    cxdbtxtdtTIPO_CANTIDAD_ARTICULO: TcxDBTextEdit;
    lblNombre1: TcxLabel;
    splSplitterFicha: TcxSplitter;
    cxgrdbclmnTarifasCODIGO_ARTICULO_TARIFA: TcxGridDBColumn;
    cxgrdbclmnTarifasDESCRIPCION_ARTICULO: TcxGridDBColumn;
    cxgrdbclmnTarifasTIPO_CANTIDAD_ARTICULO: TcxGridDBColumn;
    cxgrdbclmnTarifasTIPO_IVA_ARTICULO: TcxGridDBColumn;
    cxgrdbclmnTarifasACTIVO_TARIFA: TcxGridDBColumn;
    cxgrdbclmnTarifasCODIGO_TARIFA: TcxGridDBColumn;
    cxgrdbclmnTarifasFECHA_DESDE_TARIFA: TcxGridDBColumn;
    cxgrdbclmnTarifasFECHA_HASTA_TARIFA: TcxGridDBColumn;
    dbcTarifasPRECIOFINAL: TcxGridDBColumn;
    dbcTarifasPRECIOSALIDA: TcxGridDBColumn;
    dbcTarifasPORCEN_DTO_TARIFA: TcxGridDBColumn;
    dbcTarifasPRECIO_DTO_TARIFA: TcxGridDBColumn;
    cxgrdbclmnTarifasCODIGO_PROVEEDOR: TcxGridDBColumn;
    cxgrdbclmnTarifasRAZONSOCIAL_PROVEEDOR: TcxGridDBColumn;
    cxgrdbclmnTarifasPRECIO_ULT_COMPRA: TcxGridDBColumn;
    cxgrdbclmnTarifasFECHA_VALIDEZ: TcxGridDBColumn;
    cxgrdbclmnTarifasCODIGO_FAMILIA_ARTICULO: TcxGridDBColumn;
    cxgrdbclmnTarifasDESCRIPCION_FAMILIA: TcxGridDBColumn;
    cxgrdbclmnTarifasINSTANTEALTA: TcxGridDBColumn;
    cxgrdbclmnTarifasINSTANTEMODIF: TcxGridDBColumn;
    cxgrdbclmnTarifasUSUARIOALTA: TcxGridDBColumn;
    cxgrdbclmnTarifasUSUARIOMODIF: TcxGridDBColumn;
    cxgrdbclmnTarifasNOMBRE_TARIFA: TcxGridDBColumn;
    lblTextoLegal11: TcxLabel;
    cxdbspndtORDEN_CLIENTE: TcxDBSpinEdit;
    btnNuevoArticulo: TcxButton;
    tsVariaciones: TcxTabSheet;
    pnlUpVariaciones: TPanel;
    pnlBodyVariaciones: TPanel;
    lbl11: TcxLabel;
    cbbVARIACIONES_ARTICULOS: TcxDBLookupComboBox;
    pnlRightVariacion: TPanel;
    pnlBodyVariacion: TPanel;
    cxGrid1: TcxGrid;
    tvVariaciones: TcxGridDBTableView;
    lv1: TcxGridLevel;
    dbcVariacionesCODIGO_ARTICULO: TcxGridDBColumn;
    dbcVariacionesNOMBRE_COLUMNA: TcxGridDBColumn;
    dbcVariacionesVALOR_VARIACION: TcxGridDBColumn;
    dbcVariacionesCODIGO_UNICO: TcxGridDBColumn;
    dbcVariacionesCODIGO_VARIACION: TcxGridDBColumn;
    dbcVariacionesNOMBRE_VARIACION: TcxGridDBColumn;
    dbcVariacionesACTIVO_VARIACION: TcxGridDBColumn;
    dbcVariacionesORDEN_VARIACION: TcxGridDBColumn;
    ActionListArticulos: TActionList;
    actEmpresas: TAction;
    actFacturas: TAction;
    actClientes: TAction;
    actProveedores: TAction;
    actTarifas: TAction;
    dbcTarifasCODIGO_UNICO_TARIFA: TcxGridDBColumn;
    dbcTarifasESIMP_INCL_TARIFA: TcxGridDBColumn;
    dbcTarifasESDEFAULT_TARIFA: TcxGridDBColumn;
    procedure btnAddProveedorClick(Sender: TObject);
    procedure cxgrdbclmnProveedoresCODIGO_PROVEEDORPropertiesButtonClick(
      Sender: TObject; AButtonIndex: Integer);
    procedure btnIraProveedorClick(Sender: TObject);
    procedure actProveedoresExecute(Sender: TObject);
    procedure btnGrabarClick(Sender: TObject);
    procedure actTarifasExecute(Sender: TObject);
    procedure btnNuevoArticuloClick(Sender: TObject);
    procedure actFacturasExecute(Sender: TObject);
    procedure actFamiliasExecute(Sender: TObject);
    procedure btnIraFacturaClick(Sender: TObject);
    procedure btnIraEmpresaClick(Sender: TObject);
    procedure btnCrearTarifaClick(Sender: TObject);
    procedure btnExportarTarifaClick(Sender: TObject);
    procedure btnExportarProveedorClick(Sender: TObject);
    procedure btnIraTarifaClick(Sender: TObject);
    procedure dbcTarifasPORCEN_DTO_TARIFAPropertiesEditValueChanged(
      Sender: TObject);
    procedure dbcTarifasPRECIOSALIDAPropertiesEditValueChanged(
      Sender: TObject);
    procedure dbcTarifasPRECIO_DTO_TARIFAPropertiesEditValueChanged(
      Sender: TObject);
    procedure dbcTarifasPRECIOFINALPropertiesEditValueChanged(
      Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actEmpresasExecute(Sender: TObject);
    procedure actClientesExecute(Sender: TObject);
    procedure btnIraClienteClick(Sender: TObject);
    procedure btnBuscarClick(Sender: TObject);
    procedure dsTablaGStateChange(Sender: TObject);
  private
     procedure BuscarProveedores;
     procedure IncorporarTarifas;
     procedure IterateCheckedList(lst:TcxListView);
  public
    procedure CrearTablaPrincipal; override;
    procedure ResetForm; override;
  end;

var
  frmMtoArticulos: TfrmMtoArticulos;
  dmmArticulos : TdmArticulos;

implementation

uses
  inLibWin,
  inLibUser,
  inLibDevExp,
  inLibShowMto,
  inMtoProveedores,
  inMtoPrincipal2,
  inMtoTarifas,
  inMtoFamilias,
  inMtoEmpresas,
  inMtoFacturas,
  inMtoModalArtTar,
  inMtoGenSearch;

{$R *.dfm}

procedure ForceReferenceToClass(C: TClass); begin end;

procedure TfrmMtoArticulos.actClientesExecute(Sender: TObject);
begin
  inherited;
  //Control + K
  //https://stackoverflow.com/questions/2317208/
  //how-to-fire-keypreview-event-when-form-has-a-tactionmainmenubar
  if ((pcDetail.ActivePage = tsLineasFactura)
     ) then
       btnIraClienteClick(Sender)
  else
    ShowMto(Self.Owner,
            'Clientes');
end;

procedure TfrmMtoArticulos.actEmpresasExecute(Sender: TObject);
begin
  inherited;
  //Control + E   -> Empresas
   with tvLinFac.DataController.DataSet do
    if (
        (pcDetail.ActivePage = tsLineasFactura)        and
        (not(FieldByName('CODIGO_EMPRESA_FACTURA_LINEA').IsNull))
       ) then
      btnIraEmpresaClick(Sender)
    else
      ShowMto(Self.Owner,
              'Facturas');

end;

procedure TfrmMtoArticulos.actFacturasExecute(Sender: TObject);
begin
  inherited;
  //Control + F   -> Facturas
   with tvLinFac.DataController.DataSet do
    if (
        (pcDetail.ActivePage = tsLineasFactura)        and
        (not(FieldByName('NRO_FACTURA_LINEA').IsNull))  and
        (not(FieldByName('SERIE_FACTURA_LINEA').IsNull))
       ) then
      btnIraFacturaClick(Sender)
    else
      ShowMto(Self.Owner,
              'Facturas');
end;

procedure TfrmMtoArticulos.actFamiliasExecute(Sender: TObject);
begin
  inherited;
  //Control + N     -> Familias
  with dsTablaG.DataSet do
    if ((not(FieldByName('CODIGO_FAMILIA_ARTICULO').IsNull))
       ) then
      ShowMto(Self.Owner,
              'Familias',
              FieldByName('CODIGO_FAMILIA_ARTICULO').AsString)
    else
      ShowMto(Self.Owner,
              'Familias');
end;

procedure TfrmMtoArticulos.actProveedoresExecute(Sender: TObject);
begin  //control + P -> proveedores
  inherited;
  with tvProveedores.DataController.DataSet do
    if (
        (pcDetail.ActivePage = tsProveedores) and
        (not(FieldByName('CODIGO_PROVEEDOR').IsNull))
       ) then
      btnIraProveedorClick(Sender)
    else
      ShowMto(Self.Owner,
              'Proveedores');
end;

procedure TfrmMtoArticulos.actTarifasExecute(Sender: TObject);
begin
  inherited;
  //Control + T -> Tarifas
  with tvTarifas.DataController.DataSet do
    if (
        (pcDetail.ActivePage = tsTarifas) and
        (not(FieldByName('CODIGO_TARIFA').IsNull))
       ) then
      btnIraTarifaClick(Sender)
    else
      ShowMto(Self.Owner,
              'Tarifas');
end;

procedure TfrmMtoArticulos.btnAddProveedorClick(Sender: TObject);
begin
  with dmmArticulos do
    if ((unqryTablaG.State = dsInsert) or (unqryTablaG.State = dsEdit)) then
    unqryTablaG.Post;
  BuscarProveedores;
end;

procedure TfrmMtoArticulos.btnBuscarClick(Sender: TObject);
begin
  inherited;
  sleep(0);
end;

procedure TfrmMtoArticulos.btnCrearTarifaClick(Sender: TObject);
begin
  inherited;
  if ( (dmmArticulos.unqryTablaG.State = dsInsert) or
       (dmmArticulos.unqryTablaG.State = dsEdit)) then
    dmmArticulos.unqryTablaG.Post;
  if ( (dmmArticulos.unqryTarifasArticulos.State = dsInsert) or
       (dmmArticulos.unqryTarifasArticulos.State = dsEdit)) then
  begin
    dmmArticulos.unqryTarifasArticulos.Post;
  end;
  //dmmArticulos.unqryTarifasArticulos.Insert;
  IncorporarTarifas;
end;

procedure TfrmMtoArticulos.btnExportarProveedorClick(Sender: TObject);
begin
  inherited;
  ExportarExcel(cxgrdProveedores, 'Historico_Proveedores_Artículo_' +
                      dsTablaG.Dataset.FieldByName('CODIGO_ARTICULO').AsString);
end;

procedure TfrmMtoArticulos.btnExportarTarifaClick(Sender: TObject);
begin
  inherited;
  ExportarExcel(cxGrdTarifas, 'Historico_Tarifas_Artículo_' +
                dsTablaG.Dataset.FieldByName('CODIGO_ARTICULO').AsString);
end;

procedure TfrmMtoArticulos.btnIraClienteClick(Sender: TObject);
begin
  inherited;
    with tvLinFac.DataController.DataSet do
  ShowMto(Self.Owner,
          'Clientes',
          FieldByName('CODIGO_CLIENTE_FACTURA_LINEA').AsString);
end;

procedure TfrmMtoArticulos.btnIraEmpresaClick(Sender: TObject);
begin
  inherited;
  ShowMto(Self.Owner,
          'Empresas',
          tvLinfac.DataController.DataSet.FieldByName(
                                      'CODIGO_EMPRESA_FACTURA_LINEA').AsString);
end;

procedure TfrmMtoArticulos.btnIraFacturaClick(Sender: TObject);
begin
  inherited;
  with tvLinFac.DataController.DataSource.DataSet do
  ShowMto(Self.Owner,
          'Facturas',
          FieldByName('NRO_FACTURA_LINEA').AsString + ',' +
          FieldByName('SERIE_FACTURA_LINEA').AsString);
end;

procedure TfrmMtoArticulos.btnIraProveedorClick(Sender: TObject);
begin
  inherited;
    ShowMto(Self.Owner,
    'Proveedores',
    tvProveedores.DataController.DataSet.FieldByName(
                                                  'CODIGO_PROVEEDOR').AsString);
end;

procedure TfrmMtoArticulos.btnIraTarifaClick(Sender: TObject);
begin
  inherited;
    ShowMto(Self.Owner,
            'Tarifas',
                 dmmArticulos.unqryTarifasArticulos.FieldByName(
                                                     'CODIGO_TARIFA').AsString);
end;

procedure TfrmMtoArticulos.btnGrabarClick(Sender: TObject);
begin
  if ( (dmmArticulos.unqryTablaG.State = dsInsert) or
       (dmmArticulos.unqryTablaG.State = dsEdit)) then
  begin
    dmmArticulos.unqryTablaG.Post;
  end;
  if ( (dmmArticulos.unqryProveedoresArticulos.State = dsInsert) or
       (dmmArticulos.unqryProveedoresArticulos.State = dsEdit)) then
  begin
    dmmArticulos.unqryProveedoresArticulos.Post;
  end;
  if ( (dmmArticulos.unqryTarifasArticulos.State = dsInsert) or
       (dmmArticulos.unqryTarifasArticulos.State = dsEdit)) then
  begin
    dmmArticulos.unqryTarifasArticulos.Post;
  end;
end;

procedure TfrmMtoArticulos.btnNuevoArticuloClick(Sender: TObject);
begin
  inherited;
  if ( (dmmArticulos.unqryTablaG.State = dsInsert) or
       (dmmArticulos.unqryTablaG.State = dsEdit)) then
  begin
    dmmArticulos.unqryTablaG.Post;
  end;
  dmmArticulos.unqryTablaG.Insert;
  pcPantalla.Properties.ActivePage := tsFicha;
  tsFicha.SetFocus;
  ResetForm;
  txtDESCRIPCION_ARTICULO.SetFocus;
end;

procedure TfrmMtoArticulos.IncorporarTarifas;
var
  formulario : TfrmMtoModalArtTar;
begin
  formulario := TfrmMtoModalArtTar.Create(Self.Owner);
  formulario.Name := 'frmMtoModalArtTar';
  formulario.Caption := 'Seleccione Tarifas a incorporar al artículo';
  try
    dmmArticulos.FillTarifas(formulario.lstTarifas);
    formulario.ShowModal;
  finally
      inherited;
      if formulario.sFicha = 'S' then
      begin
        IterateCheckedList(formulario.lstTarifas);
      end;
      FreeAndNil(formulario);
  end;
end;

procedure TfrmMtoArticulos.IterateCheckedList(lst: TcxListView);
var
  bAdded:Boolean;
  i: Integer;
  item: TListItem;
begin
  bAdded := False;
  with dmmArticulos.unqryTarifasArticulos do
  begin
    for i := 0 to lst.Items.Count - 1 do
    begin
      item := lst.Items[i];
      if item.Checked then
      begin
        Insert;
        FieldByName('CODIGO_TARIFA').AsString := item.Caption;
        FieldByName('ACTIVO_TARIFA').AsString := 'S';
        FieldByName('FECHA_DESDE_TARIFA').AsDateTime := Now;
        FieldByName('PRECIOSALIDA_TARIFA').AsInteger := 0;
        FieldByName('PRECIOFINAL_TARIFA').AsInteger := 0;
        Post;
        bAdded := True;
      end;
    end;
    Refresh;
  end;
  if bAdded then
    dbcTarifasPRECIOSALIDA.FocusWithSelection;
end;

procedure TfrmMtoArticulos.ResetForm;
begin
  inherited;
  pcDetail.ActivePage := tsTarifas;
end;

procedure TfrmMtoArticulos.BuscarProveedores;
var
  formulario : TfrmMtoSearch;
begin
  formulario := TfrmMtoSearch.Create(Self.Owner);
  formulario.Name := 'frmMtoArtProvSearch';
  formulario.Caption := 'Búsqueda de Proveedores en Articulos';
  try
    formulario.dsTablaG.DataSet := dmmArticulos.unqryProveedores;
    formulario.dsTablaG.DataSet.Open;
    formulario.ProcesarPerfiles;  //debe ir después de abrir el datase
    formulario.ShowModal;
  finally
      inherited;
      if formulario.sFicha = 'S' then
      begin
        if (dmmArticulos.unqryProveedoresArticulos.State = dsBrowse) then
          dmmArticulos.unqryProveedoresArticulos.Insert;
        dmmArticulos.CopiarProveedoraArticulo(dmmArticulos.unqryProveedores);
      end;
      formulario.dsTablaG.DataSet.Close;
      FreeAndNil(formulario);
  end;
end;

procedure TfrmMtoArticulos.CrearTablaPrincipal;
begin
  inherited;
  dmmArticulos := TdmArticulos.Create(Self);
  cbbFamilia.Properties.ListSource := dmmArticulos.dsFamiliaArticulos;
  tvTarifas.DataController.DataSource := dmmArticulos.dsTarifasArticulos;
  tvProveedores.DataController.DataSource :=
                                            dmmArticulos.dsProveedoresArticulos;
  tvLinFac.DataController.DataSource := dmmArticulos.dsLinFacturasArticulos;
  ResetForm;
  pkFieldName := 'CODIGO_ARTICULO';
end;

procedure
    TfrmMtoArticulos.cxgrdbclmnProveedoresCODIGO_PROVEEDORPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
begin
  inherited;
  BuscarProveedores;
end;

procedure TfrmMtoArticulos.
                          dbcTarifasPORCEN_DTO_TARIFAPropertiesEditValueChanged(
  Sender: TObject);
var
    e: TcxCustomEdit;
begin
  inherited;
  if (dmmArticulos <> nil) then
    with dmmArticulos.unqryTarifasArticulos do
    begin
      if ((State = dsInsert) or (State = dsEdit)) then
      begin
        e := Sender as TcxCustomEdit;
        FindField('PORCEN_DTO_TARIFA').AsString := VarToStr(e.EditingValue);
        FindField('PRECIO_DTO_TARIFA').AsFloat :=
                               (FindField('PRECIOSALIDA_TARIFA').AsFloat * (
                                FindField('PORCEN_DTO_TARIFA').AsFloat / 100));
        FindField('PRECIOFINAL_TARIFA').AsFloat :=
                                    ( FindField('PRECIOSALIDA_TARIFA').AsFloat -
                                      FindField('PRECIO_DTO_TARIFA').AsFloat
                                    );
      end;
    end;
end;

procedure TfrmMtoArticulos.dbcTarifasPRECIOFINALPropertiesEditValueChanged(
  Sender: TObject);
var
    e: TcxCustomEdit;
  begin
  inherited;
  if (dmmArticulos <> nil) then
    with dmmArticulos.unqryTarifasArticulos do
    begin
      if ((State = dsInsert) or (State = dsEdit)) then
      begin
        e := Sender as TcxCustomEdit;
        FindField('PRECIOFINAL_TARIFA').AsString := VarToStr(e.EditingValue);
        if (FindField('PORCEN_DTO_TARIFA').AsFloat <> 0) then
        begin
          FindField('PRECIO_DTO_TARIFA').AsFloat :=
                                (FindField('PRECIOFINAL_TARIFA').AsFloat * (
                                 FindField('PORCEN_DTO_TARIFA').AsFloat / 100));
          FindField('PRECIOSALIDA_TARIFA').AsFloat :=
                                        FindField('PRECIOFINAL_TARIFA').AsFloat
                                       - FindField('PRECIO_DTO_TARIFA').AsFloat;
        end
        else
        begin
          FindField('PRECIOSALIDA_TARIFA').AsString :=
                                       FindField('PRECIOFINAL_TARIFA').AsString;
          FindField('PRECIO_DTO_TARIFA').AsFloat := 0;
          FindField('PORCEN_DTO_TARIFA').AsFloat := 0;
        end;
      end;
    end;
end;

procedure TfrmMtoArticulos.dbcTarifasPRECIOSALIDAPropertiesEditValueChanged(
  Sender: TObject);
var
    e: TcxCustomEdit;
begin
  inherited;
  if (dmmArticulos <> nil) then
    with dmmArticulos.unqryTarifasArticulos do
    begin
    if ((State = dsInsert) or (State = dsEdit)) then
      begin
        e := Sender as TcxCustomEdit;
        FindField('PRECIOSALIDA_TARIFA').AsString := VarToStr(e.EditingValue);
        FindField('PRECIOFINAL_TARIFA').AsFloat :=
                                    ( FindField('PRECIOSALIDA_TARIFA').AsFloat -
                                      FindField('PRECIO_DTO_TARIFA').AsFloat
                                    );
      end;
    end;
end;

procedure TfrmMtoArticulos.
                          dbcTarifasPRECIO_DTO_TARIFAPropertiesEditValueChanged(
  Sender: TObject);
var
    e: TcxCustomEdit;
begin
  inherited;
  if (dmmArticulos <> nil) then
    with dmmArticulos.unqryTarifasArticulos do
    begin
      if ((State = dsInsert) or (State = dsEdit)) then
      begin
        e := Sender as TcxCustomEdit;
        FindField('PRECIO_DTO_TARIFA').AsString := VarToStr(e.EditingValue);
        if (FindField('PRECIOSALIDA_TARIFA').AsFloat <> 0) then
        begin
          FindField('PORCEN_DTO_TARIFA').AsFloat :=
                             ((FindField('PRECIO_DTO_TARIFA').AsFloat /
                               FindField('PRECIOSALIDA_TARIFA').AsFloat) * 100);
          FindField('PRECIOFINAL_TARIFA').AsFloat :=
                                    ( FindField('PRECIOSALIDA_TARIFA').AsFloat -
                                      FindField('PRECIO_DTO_TARIFA').AsFloat);
        end;
      end;
    end;
end;

procedure TfrmMtoArticulos.dsTablaGStateChange(Sender: TObject);
begin
  inherited;
  if (dsTablaG.state = dsInsert) then
    txtCODIGO_ARTICULO.Enabled := True
  else
  begin
    txtCODIGO_ARTICULO.Enabled := False;
  end;
end;

procedure TfrmMtoArticulos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Freeandnil(dmmArticulos);
end;

initialization
  ForceReferenceToClass(TfrmMtoArticulos);
end.
