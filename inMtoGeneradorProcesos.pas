{*******************************************************}
{                                                       }
{       FactuZam                                        }
{                                                       }
{       Copyright (C) 2023 fzam.6dvdy@slmail.me    }
{                                                       }
{*******************************************************}

unit inMtoGeneradorProcesos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, dxSkinsCore,
  dxSkinscxPCPainter, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxEdit, cxNavigator, DB, cxDBData, cxContainer,
  cxCheckBox, cxTextEdit, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, ComCtrls, StdCtrls, Buttons, ExtCtrls,
  dxBarBuiltInMenu, cxPC, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox,
  cxMaskEdit, cxDropDownEdit, cxDBEdit, cxLabel,
  cxGridBandedTableView, cxGridDBBandedTableView,  cxLocalization,
  dxBevel, cxDBNavigator, cxGridExportLink,
  dxDateRanges, MemDS, DBAccess, Uni, cxImage, dxGDIPlusClasses, inMtoGen,
  Vcl.Menus, dxSkinsForm, cxButtons, dxSkinsDefaultPainters, cxMemo, cxSpinEdit,
  cxCalendar, cxBlobEdit, dxScrollbarAnnotations, dxCore, cxRadioGroup,
  cxSplitter, SynEditHighlighter, SynHighlighterSQL, SynEdit,
  dxtree, dxdbtree, UniDataGeneradorProcesos, cxCurrencyEdit, inMtoPrincipal2,
  SynDBEdit, SynEditTypes, Vcl.AppEvnts, JvComponentBase, JvEnterTab ;

type
  TfrmMtoGeneradorProcesos = class(TfrmMtoGen)
    pnl1: TPanel;
    cxdbtxtdt1: TcxDBTextEdit;
    cxdbtxtdt2: TcxDBTextEdit;
    pnl2: TPanel;
    pcPestana: TcxPageControl;
    tsSQL: TcxTabSheet;
    cxdbtxtdt15: TcxDBTextEdit;
    Panel1: TPanel;
    lblCodigo: TcxLabel;
    lblNombre: TcxLabel;
    tsVistaDatos: TcxTabSheet;
    cxgrdbclmnPerfilUSUARIO_GRUPO_PERFILES: TcxGridDBColumn;
    cxgrdbclmnPerfilKEY_PERFILES: TcxGridDBColumn;
    cxgrdbclmnPerfilSUBKEY_PERFILES: TcxGridDBColumn;
    cxgrdbclmnPerfilVALUE_PERFILES: TcxGridDBColumn;
    cxgrdbclmnPerfilVALUE_TEXT_PERFILES: TcxGridDBColumn;
    cxgrdbclmnPerfilTYPE_BLOB_PERFILES: TcxGridDBColumn;
    cxgrdbclmnPerfilVALUE_BLOB_PERFILES: TcxGridDBColumn;
    cxgrdbclmnPerfilINSTANTEMODIF: TcxGridDBColumn;
    cxgrdbclmnPerfilINSTANTEALTA: TcxGridDBColumn;
    cxgrdbclmnPerfilUSUARIOALTA: TcxGridDBColumn;
    cxgrdbclmnPerfilUSUARIOMODIF: TcxGridDBColumn;
    txtNOMBRE_FAMILIA: TcxDBTextEdit;
    cxgrdbclmnGrdDBTabPrinCODIGO_GENERADORPROCESO: TcxGridDBColumn;
    cxgrdbclmnGrdDBTabPrinNOMBRE_GENERADORPROCESO: TcxGridDBColumn;
    cxgrdbclmnGrdDBTabPrinINSTANTEMODIF: TcxGridDBColumn;
    cxgrdbclmnGrdDBTabPrinINSTANTEALTA: TcxGridDBColumn;
    cxgrdbclmnGrdDBTabPrinUSUARIOALTA: TcxGridDBColumn;
    cxgrdbclmnGrdDBTabPrinUSUARIOMODIF: TcxGridDBColumn;
    cxspltr1: TcxSplitter;
    pnl6: TPanel;
    pnl7: TPanel;
    synsqlsyn2: TSynSQLSyn;
    btnEjecutar: TcxButton;
    cxmResul: TcxMemo;
    tsMetadatos: TcxTabSheet;
    cxspltr2: TcxSplitter;
    pnlTabs: TPanel;
    pcMetadato: TcxPageControl;
    tsEstructura: TcxTabSheet;
    syndtEstructura: TSynEdit;
    mmo1: TMemo;
    tsContenido: TcxTabSheet;
    cxgrdMetadatos1: TcxGrid;
    tvMetadatostvVista: TcxGridDBTableView;
    tv2: TcxGridDBTableView;
    cxgrdbclmncxgrdbtblvwcxgrd1DBTableView1LINEA_LINEA1: TcxGridDBColumn;
    cxgrdbclmncxgrdbtblvwcxgrd1DBTableView1CODIGO_ARTICULO_LINEA1: TcxGridDBColumn;
    cxgrdbclmncxgrdbtblvwcxgrd1DBTableView1DESCRIPCION_ARTICULO_LINEA1: TcxGridDBColumn;
    cxgrdbclmncxgrdbtblvwcxgrd1DBTableView1CANTIDAD_LINEA1: TcxGridDBColumn;
    cxgrdbclmnLineasFacturacionTIPO_CANTIDAD_ARTICULO_FACTURA_LINEA1: TcxGridDBColumn;
    cxgrdbclmnLineasFacturacionPRECIOVENTA_SIVA_ARTICULO_FACTURA_LINEA1: TcxGridDBColumn;
    cxgrdbclmnLineasFacturacionPORCEN_IVA_FACTURA_LINEA1: TcxGridDBColumn;
    cxgrdbclmnLineasFacturacionTIPOIVA_ARTICULO_FACTURA_LINEA1: TcxGridDBColumn;
    cxgrdbclmncxgrdbtblvwcxgrd1DBTableView1PRECIOVENTA_ARTICULO_LINEA1: TcxGridDBColumn;
    cxgrdbclmncxgrdbtblvwcxgrd1DBTableView1SUM_TOTAL_LINEA1: TcxGridDBColumn;
    cxgrdbclmnLineasFacturacionFECHA_ENTREGA_FACTURA_LINEA1: TcxGridDBColumn;
    cxgrdlvlMetadatoslv11: TcxGridLevel;
    pnlTree: TPanel;
    tv1: TdxDBTreeView;
    pnlTreeBotton: TPanel;
    btRefresh: TcxButton;
    cxdbtxtdtNOMBRE_METADATO: TcxDBTextEdit;
    cxVista: TcxGrid;
    tvVista: TcxGridDBTableView;
    tv3: TcxGridDBTableView;
    cxgrdbclmncxgrdbtblvwcxgrd1DBTableView1LINEA_LINEA11: TcxGridDBColumn;
    cxgrdbclmncxgrdbtblvwcxgrd1DBTableView1CODIGO_ARTICULO_LINEA11: TcxGridDBColumn;
    cxgrdbclmncxgrdbtblvwcxgrd1DBTableView1DESCRIPCION_ARTICULO_LINEA11: TcxGridDBColumn;
    cxgrdbclmncxgrdbtblvwcxgrd1DBTableView1CANTIDAD_LINEA11: TcxGridDBColumn;
    cxgrdbclmnLineasFacturacionTIPO_CANTIDAD_ARTICULO_FACTURA_LINEA11: TcxGridDBColumn;
    cxgrdbclmnLineasFacturacionPRECIOVENTA_SIVA_ARTICULO_FACTURA_LINEA11: TcxGridDBColumn;
    cxgrdbclmnLineasFacturacionPORCEN_IVA_FACTURA_LINEA11: TcxGridDBColumn;
    cxgrdbclmnLineasFacturacionTIPOIVA_ARTICULO_FACTURA_LINEA11: TcxGridDBColumn;
    cxgrdbclmncxgrdbtblvwcxgrd1DBTableView1PRECIOVENTA_ARTICULO_LINEA11: TcxGridDBColumn;
    cxgrdbclmncxgrdbtblvwcxgrd1DBTableView1SUM_TOTAL_LINEA11: TcxGridDBColumn;
    cxgrdbclmnLineasFacturacionFECHA_ENTREGA_FACTURA_LINEA11: TcxGridDBColumn;
    lvVista: TcxGridLevel;
    tsOtros: TcxTabSheet;
    pnl3: TPanel;
    cxdbtxtdtDIRECCION1_CLIENTE: TcxDBTextEdit;
    cxlblUsuarioAlta: TcxLabel;
    cxlblInstanteAlta: TcxLabel;
    cxdbtxtdtUSUARIOALTA: TcxDBTextEdit;
    cxdbtxtdtINSTANTEALTA: TcxDBTextEdit;
    cxlblInstanteModif: TcxLabel;
    cxdbtxtdtUSUARIOALTA1: TcxDBTextEdit;
    cxlblUsuarioModif: TcxLabel;
    dbsyndtPROCESO_GENERADORPROCESO: TDBSynEdit;
    pnlFacturaOpts: TPanel;
    btnExportarExcel: TcxButton;
    btnEditar: TcxButton;
    pnlFacturaOpts1: TPanel;
    btnExportarExcelMeta: TcxButton;
    btnEditarMeta: TcxButton;
    procedure tv1DblClick(Sender: TObject);
    procedure btRefreshClick(Sender: TObject);
    procedure cxdbtxtdtNOMBRE_METADATOPropertiesChange(Sender: TObject);
    procedure btnVerDatosClick(Sender: TObject);
    procedure btnEjecutarClick(Sender: TObject);
    procedure btnExportarExcelClick(Sender: TObject);
    procedure dbsyndtPROCESO_GENERADORPROCESOKeyDown(Sender: TObject;
      var Key: Word; Shift: TShiftState);
    procedure syndtEstructuraKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnEditarClick(Sender: TObject);
    procedure btnEditarMetaClick(Sender: TObject);
    procedure btnExportarExcelMetaClick(Sender: TObject);
  public
    procedure CrearTablaPrincipal; override;
  end;

var
  frmMtoGeneradorProcesos: TfrmMtoGeneradorProcesos;
  dmmGeneradorProcesos : TdmGeneradorProcesos;

implementation

uses
  inLibWin,
  inLibUser,
  inLibNet,
  inLibDevExp,
  inLibGlobalVar,
  inLibDir;

{$R *.dfm}

procedure ForceReferenceToClass(C: TClass); begin end;

procedure TfrmMtoGeneradorProcesos.btnEditarClick(Sender: TObject);
begin
  inherited;
  tvVista.OptionsData.Editing := True;
  tvVista.OptionsData.Inserting := True;
  tvVista.OptionsData.Deleting := True;
  tvVista.OptionsData.Appending := True;
end;

procedure TfrmMtoGeneradorProcesos.btnEditarMetaClick(Sender: TObject);
begin
  inherited;
  tvMetadatostvVista.OptionsData.Editing := True;
  tvMetadatostvVista.OptionsData.Inserting := True;
  tvMetadatostvVista.OptionsData.Deleting := True;
  tvMetadatostvVista.OptionsData.Appending := True;
end;

procedure TfrmMtoGeneradorProcesos.btnEjecutarClick(Sender: TObject);
var
  sTartTime: TDateTime;
  iRowsAffected: Integer;
  sFormatteddt,
  sSQL:String;
begin
  inherited;
  if ((dsTablaG.DataSet.State = dsInsert) or
      (dsTablaG.DataSet.State = dsEdit)
     ) then
    dsTablaG.DataSet.Post;
  with dmmGeneradorProcesos do
  begin
  sSQL := unqryTablaG.FieldByName('PROCESO_GENERADORPROCESO').AsString;
  if Pos('SELECT', UpperCase(Trim(sSQL))) = 1 then
  begin
    unqryVista.Close;
    tvVista.ClearItems;
    unqryVista.SQL.Text := sSQL;
    try
      startTime := Now;
      unqryVista.Open;
      DateTimeToString(sformatteddt,'ss:zzz', (Now - startTime));
      cxmResul.Lines.Add('Se recuperaron ' +
                          IntToStr(unqryVista.RecordCount) +
                         ' registros en ' + sformatteddt + ' seg:ms');
      tvVista.DataController.CreateAllItems();
      tvVista.ApplyBestFit();
      pcPestana.ActivePage := tsVistaDatos;
    except on E: Exception do
      begin
        cxmResul.Lines.Add(E.Message);
        ShowMessage('Error en consulta SQL: ' + E.Message);
      end;
    end
  end
  else
  begin
    unqryCommand.SQL.Text := sSQL;
    try
      sTartTime := Now;
      unqryCommand.ExecSQL;
      iRowsAffected := unqryCommand.RowsAffected;
      DateTimeToString(sformatteddt,'ss:zzz', (Now - startTime));
      cxmResul.Lines.Add('Se actualizaron ' + IntToStr(iRowsAffected) +
                         ' registros en ' + sformatteddt + ' seg:ms');
      except on E: Exception do
        begin
          cxmResul.Lines.Add(E.Message);
          ShowMessage('Error en consulta SQL: ' + E.Message);
        end;
      end
  end; // end if
  end; // end with
end;

procedure TfrmMtoGeneradorProcesos.btnExportarExcelClick(Sender: TObject);
var
  saveDialog : tsavedialog;
begin
  saveDialog := TSaveDialog.Create(self);
  saveDialog.Title := 'Guardar listado a Excel';
  saveDialog.InitialDir :=  GetSpecialFolderPath(CSIDL_MYDOCUMENTS);
  saveDialog.Filter := 'Archivo Excel|*.xlsx';
  saveDialog.DefaultExt := 'xlsx';
  saveDialog.FilterIndex := 1;
  if ( saveDialog.Execute ) then
    ExportGridToXLSX(saveDialog.FileName, cxVista);
  saveDialog.Free;
end;

procedure TfrmMtoGeneradorProcesos.btnExportarExcelMetaClick(Sender: TObject);
var
  saveDialog : tsavedialog;
begin
  saveDialog := TSaveDialog.Create(self);
  saveDialog.Title := 'Guardar listado a Excel';
  saveDialog.InitialDir :=  GetSpecialFolderPath(CSIDL_MYDOCUMENTS);
  saveDialog.Filter := 'Archivo Excel|*.xlsx';
  saveDialog.DefaultExt := 'xlsx';
  saveDialog.FilterIndex := 1;
  if ( saveDialog.Execute ) then
    ExportGridToXLSX(saveDialog.FileName, cxgrdMetadatos1);
  saveDialog.Free;
end;

procedure TfrmMtoGeneradorProcesos.btnVerDatosClick(Sender: TObject);
var
    startTime:TDateTime;
    sformatteddt:String;
begin
  inherited;
  if ((dsTablaG.DataSet.State = dsInsert) or
      (dsTablaG.DataSet.State = dsEdit)
     ) then
    dsTablaG.DataSet.Post;
 end;

procedure TfrmMtoGeneradorProcesos.btRefreshClick(Sender: TObject);
begin
  inherited;
  with dmmGeneradorProcesos do
  begin
    unstrdprcRefresh.ParamByName('pDATABASENAME').AsString :=
                                                  oConn.Database;
    unstrdprcRefresh.ExecProc;
    if unqryMetadatos.Active = False then
      unqryMetadatos.Open
    else
      unqryMetadatos.Refresh;
  end;
end;

procedure TfrmMtoGeneradorProcesos.CrearTablaPrincipal;
begin
  inherited;
  dmmGeneradorProcesos := TdmGeneradorProcesos.Create(Self);
  tv1.DataSource := dmmGeneradorProcesos.dsMetadatos;
  tvMetadatostvVista.DataController.DataSource :=
                                               dmmGeneradorProcesos.dsContenido;
  btRefreshClick(nil);
  tvVista.DataController.DataSource := dmmGeneradorProcesos.dsVista;
  pcPestana.ActivePage := tsSQL;
  pkFieldName := 'CODIGO_GENERADORPROCESO';
end;

procedure TfrmMtoGeneradorProcesos.cxdbtxtdtNOMBRE_METADATOPropertiesChange(
  Sender: TObject);
begin
  inherited;
  with dmmGeneradorProcesos do
  begin
    pcMetadato.ActivePage := tsEstructura;
    if ((unqryMetadatos.FieldByName('PARENT_METADATO').AsString = '1')) then
    begin
      unqryEstructura.SQL.Text := 'SHOW CREATE TABLE ' +
                         unqryMetadatos.FieldByName('NOMBRE_METADATO').AsString;
      //dbsynedtEstructura.DataField := 'Create Table';
      unqryEstructura.Open;
      syndtEstructura.Lines.Text :=
                           unqryEstructura.FieldByName('Create Table').AsString;
    end
      else
    if ((unqryMetadatos.FieldByName('PARENT_METADATO').AsString = '2')) then
    begin
      unqryEstructura.SQL.Text := 'SHOW CREATE VIEW ' +
                         unqryMetadatos.FieldByName('NOMBRE_METADATO').AsString;
      unqryEstructura.Open;
      mmo1.Lines.Text := unqryEstructura.FieldByName('Create View').AsString;
      mmo1.Lines.SaveToFile('code.txt');
      ExecuteAndWait('fsqlf.exe' + ' code.txt code_formatted.txt');
      syndtEstructura.Lines.LoadFromFile('code_formatted.txt');
//      syndtEstructura.Lines.Text :=
//                                   FormatSqlOnlineSqlformatOrg(mmo1.Lines.Text);
      //syndtEstructura.Lines.Text := Trim(mmo1.Lines.text);
    end
      else
    if ((unqryMetadatos.FieldByName('PARENT_METADATO').AsString = '3')) then
    begin
      unqryEstructura.SQL.Text := 'SHOW CREATE PROCEDURE ' +
                         unqryMetadatos.FieldByName('NOMBRE_METADATO').AsString;
      unqryEstructura.Open;
      syndtEstructura.Lines.Text :=
                       unqryEstructura.FieldByName('Create Procedure').AsString;
    end
      else
        syndtEstructura.Lines.Clear;
  end;
end;

procedure TfrmMtoGeneradorProcesos.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if (Key = VK_F5) then
    btnEjecutarClick(Sender);
end;

procedure TfrmMtoGeneradorProcesos.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (ActiveControl is TSynEdit) or (ActiveControl is TDBSynEdit) then
    Exit;
  inherited;
end;

procedure TfrmMtoGeneradorProcesos.dbsyndtPROCESO_GENERADORPROCESOKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = VK_TAB then
  begin
    dbsyndtPROCESO_GENERADORPROCESO.SelText := #9; // Insertar tabulador
    Key := 0; // Prevenir que el control cambie el foco
  end;
end;

procedure TfrmMtoGeneradorProcesos.syndtEstructuraKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = VK_TAB then
  begin
    syndtEstructura.SelText := #9; // Insertar tabulador
    Key := 0; // Prevenir que el control cambie el foco
  end;
end;

procedure TfrmMtoGeneradorProcesos.tv1DblClick(Sender: TObject);
begin
  inherited;
  pcMetadato.ActivePage := tsContenido;
  with dmmGeneradorProcesos do
  begin
    if ((unqryMetadatos.FieldByName('PARENT_METADATO').AsString = '1') or
        (unqryMetadatos.FieldByName('PARENT_METADATO').AsString = '2')) then
    begin
      tvMetadatostvVista.ClearItems;
      unqryContenido.SQL.Text := 'SELECT * FROM ' +
                         unqryMetadatos.FieldByName('NOMBRE_METADATO').AsString;
      unqryContenido.Open;
      tvMetadatostvVista.DataController.CreateAllItems();
      tvMetadatostvVista.ApplyBestFit();
    end
    else
      tvMetadatostvVista.ClearItems;
  end;
end;

initialization
  ForceReferenceToClass(TfrmMtoGeneradorProcesos);
end.
