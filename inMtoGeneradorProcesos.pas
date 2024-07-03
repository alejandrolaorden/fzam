﻿{*******************************************************}
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
  Dialogs, cxGraphics, cxControls, cxLookAndFeels, Math,
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
  SynDBEdit, SynEditTypes, Vcl.AppEvnts, JvComponentBase, JvEnterTab,
  dxShellDialogs ;

const
  ecSelColumnMode = 2577;
  ecSelLineMode = 2578;

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
    dbsyndtTexto: TDBSynEdit;
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
    procedure dbsyndtTextoKeyDown(Sender: TObject;
      var Key: Word; Shift: TShiftState);
    procedure syndtEstructuraKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnEditarClick(Sender: TObject);
    procedure btnEditarMetaClick(Sender: TObject);
    procedure btnExportarExcelMetaClick(Sender: TObject);
    procedure dbsyndtTextoKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbsyndtTextoMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  public
    procedure CrearTablaPrincipal; override;
  end;

var
  frmMtoGeneradorProcesos: TfrmMtoGeneradorProcesos;
  dmmGeneradorProcesos : TdmGeneradorProcesos;
  IsColumnMode: Boolean;

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
  dmmGeneradorProcesos := tdmDataModule as TdmGeneradorProcesos;
  tv1.DataSource := dmmGeneradorProcesos.dsMetadatos;
  tvMetadatostvVista.DataController.DataSource :=
                                               dmmGeneradorProcesos.dsContenido;
  btRefreshClick(nil);
  tvVista.DataController.DataSource := dmmGeneradorProcesos.dsVista;
  pcPestana.ActivePage := tsSQL;
  pkFieldName := 'CODIGO_GENERADORPROCESO';
  // Asegúrate de que las opciones predeterminadas estén configuradas correctamente
  dbsyndtTexto.Options := dbsyndtTexto.Options - [eoAltSetsColumnMode];
  IsColumnMode := False;
end;

procedure TfrmMtoGeneradorProcesos.cxdbtxtdtNOMBRE_METADATOPropertiesChange(
  Sender: TObject);
var
  sExec:string;
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
      mmo1.Lines.Text :=
                      Trim(unqryEstructura.FieldByName('Create View').AsString);
      mmo1.Lines.Text := StringReplace(mmo1.Lines.Text,
                           'ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` '+
                           'SQL SECURITY DEFINER',
                           '',
                           [rfReplaceAll]);
      if FileExists(GetTempPath + 'code.txt') then
        DeleteFile(GetTempPath + 'code.txt');
      if FileExists(GetTempPath + 'code_formatted.txt') then
        DeleteFile(GetTempPath + 'code_formatted.txt');
      mmo1.Lines.SaveToFile(GetTempPath + 'code.txt');
      sExec := DirApp + 'fsqlf.exe ' + GetTempPath + 'code.txt ' +
                              GetTempPath + 'code_formatted.txt';
      //ShowMessage(sExec);
      ExecuteAndWait(sExec);
      syndtEstructura.Lines.LoadFromFile(GetTempPath + '\code_formatted.txt');
//      syndtEstructura.Lines.Text :=
//                                 FormatSqlOnlineSqlformatOrg(mmo1.Lines.Text);
      //syndtEstructura.Lines.Text := Trim(mmo1.Lines.text);
    end
      else
    if ((unqryMetadatos.FieldByName('PARENT_METADATO').AsString = '3')) then
    begin
      unqryEstructura.SQL.Text := 'SHOW CREATE PROCEDURE ' +
                         unqryMetadatos.FieldByName('NOMBRE_METADATO').AsString;
      unqryEstructura.Open;
      syndtEstructura.Lines.Text := StringReplace(unqryEstructura.FieldByName(
                                                 'Create Procedure').AsString,
                                                 ' DEFINER=`root`@`localhost`',
                                                 '',
                                                 [rfReplaceAll]);
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

procedure TfrmMtoGeneradorProcesos.dbsyndtTextoKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
var
  StartLine, EndLine, i: Integer;
  SelStart, SelEnd: TBufferCoord;
  NewCaretX, NewCaretY: Integer;
  s:String;
begin
  inherited;

  if Key = VK_TAB then
  begin
    dbsyndtTexto.SelText := #9; // Insertar tabulador
    Key := 0; // Prevenir que el control cambie el foco
  end;
  if (ssAlt in Shift) then
  begin
    if (ssShift in Shift) then
    begin
      if not IsColumnMode then
      begin
        IsColumnMode := True;
        dbsyndtTexto.SelectionMode := smColumn;
      end;
    end;
    // Manejar movimiento del cursor con Alt
    if Key in [VK_LEFT, VK_RIGHT, VK_UP, VK_DOWN] then
    begin
      Key := 0; // Prevenir comportamiento predeterminado
      NewCaretX := dbsyndtTexto.CaretX;
      NewCaretY := dbsyndtTexto.CaretY;
      case Key of
        VK_LEFT:  NewCaretX := Max(1, NewCaretX - 1);
        VK_RIGHT: NewCaretX := Min(Length(dbsyndtTexto.Lines[NewCaretY - 1]) + 1, NewCaretX + 1);
        VK_UP:    NewCaretY := Max(1, NewCaretY - 1);
        VK_DOWN:  NewCaretY := Min(dbsyndtTexto.Lines.Count, NewCaretY + 1);
      end;
      dbsyndtTexto.CaretXY := BufferCoord(NewCaretX, NewCaretY);
    end;
  end
  else if (ssShift in Shift) and not (ssAlt in Shift) then
  begin
    // Mantenemos el comportamiento normal de Shift
    IsColumnMode := False;
    dbsyndtTexto.SelectionMode := smNormal;
  end
  else if not (ssShift in Shift) and not (ssAlt in Shift) then
  begin
    IsColumnMode := False;
    dbsyndtTexto.SelectionMode := smNormal;
  end;
  if (Key = VK_TAB) and (dbsyndtTexto.SelAvail) then
  begin
    Key := 0; // Previene el comportamiento predeterminado del tabulador
    // Obtiene las líneas de inicio y fin de la selección
    SelStart := dbsyndtTexto.BlockBegin;
    SelEnd := dbsyndtTexto.BlockEnd;
    StartLine := SelStart.Line;
    EndLine := SelEnd.Line;
    dbsyndtTexto.BeginUpdate;
    try
      // Añade un tabulador al inicio de cada línea seleccionada
      for i := StartLine to EndLine do
      begin
        dbsyndtTexto.Lines[i - 1] := #9 + dbsyndtTexto.Lines[i - 1];
      end;
      // Ajusta la selección para incluir los tabuladores añadidos
      dbsyndtTexto.BlockBegin := BufferCoord(SelStart.Char + 1, SelStart.Line);
      dbsyndtTexto.BlockEnd := BufferCoord(SelEnd.Char + 1, SelEnd.Line);
    finally
      dbsyndtTexto.EndUpdate;
    end;
  end
  else
  begin
    if (Key = VK_TAB) and (ssShift in Shift) then
    begin
      Key := 0; // Prevenir el comportamiento predeterminado

      // Obtener las líneas de inicio y fin de la selección
      StartLine := dbsyndtTexto.BlockBegin.Line - 1;
      EndLine := dbsyndtTexto.BlockEnd.Line - 1;

      // Si no hay selección, usar la línea actual
      if StartLine = EndLine then
      begin
        StartLine := dbsyndtTexto.CaretY - 1;
        EndLine := StartLine;
      end;

      dbsyndtTexto.BeginUpdate;
      try
        for i := StartLine to EndLine do
        begin
          s := dbsyndtTexto.Lines[i];
          if (Length(s) > 0) and (s[1] = #9) then
            // Eliminar el primer tabulador
            dbsyndtTexto.Lines[i] := Copy(s, 2, Length(s))
          else if (Length(s) >= dbsyndtTexto.TabWidth) and
                  (Copy(s, 1, dbsyndtTexto.TabWidth) =
                  StringOfChar(' ', dbsyndtTexto.TabWidth)) then
            // Eliminar los espacios equivalentes a un tabulador
            dbsyndtTexto.Lines[i] :=
                                  Copy(s, dbsyndtTexto.TabWidth + 1, Length(s));
        end;
      finally
        dbsyndtTexto.EndUpdate;
      end;
    end;
  end;
end;

procedure TfrmMtoGeneradorProcesos.dbsyndtTextoKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if not (ssAlt in Shift) and not (ssShift in Shift) then
  begin
    IsColumnMode := False;
    dbsyndtTexto.SelectionMode := smNormal;
  end;
end;

procedure TfrmMtoGeneradorProcesos.dbsyndtTextoMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  if not (ssShift in Shift) and not (ssAlt in Shift) then
  begin
    IsColumnMode := False;
    dbsyndtTexto.SelectionMode := smNormal;
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
