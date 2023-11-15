{*******************************************************}
{                                                       }
{       FactuZam                                        }
{                                                       }
{       Copyright (C) 2023 fzam.6dvdy@slmail.me    }
{                                                       }
{*******************************************************}

unit inMtoModalGenImp;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, inMtoFrmBase, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters,
  dxSkinsCore, dxSkinBlue, frxClass, frxDBSet, StdCtrls, cxButtons, DB,
  DBClient, cxControls, cxContainer, cxEdit, cxTextEdit, cxLabel, frxExportPDF,
  ExtCtrls, ComCtrls, dxCore, cxDateUtils, cxMaskEdit, cxDropDownEdit,
  cxCalendar, frxDesgn, cxGroupBox, cxRadioGroup, frxExportBaseDialog,
  frxExportXLSX, MemDS, DBAccess, Uni, UniDataConn,
  inLibGlobalVar, inMtoPrincipal2, inMtoModalGenImpEle, cxStyles, dxSkinsForm,
  cxClasses, cxLocalization, Vcl.Menus;
type
  TfrmPrint = class(TfrmBase)
    pnl1: TPanel;
    btnPDF: TcxButton;
    btnImprimir: TcxButton;
    btnVistaPreliminar: TcxButton;
    btnSalir: TcxButton;
    frxrprt1: TfrxReport;
    frxpdfxprtPedWeb: TfrxPDFExport;
    btnEditar: TcxButton;
    frxlsxprtExcel: TfrxXLSXExport;
    btnExcel: TcxButton;
    unqryPerfiles: TUniQuery;
    dsPerfiles: TDataSource;
    frxdsgnr1: TfrxDesigner;
    frxReportOrigen: TfrxReport;
    procedure btnImprimirClick(Sender: TObject);
    procedure btnSalirClick(Sender: TObject);
    procedure btnPDFClick(Sender: TObject);
    //procedure btn5Click(Sender: TObject);
    procedure btnVistaPreliminarClick(Sender: TObject);
    //procedure rbRangoFechasClick(Sender: TObject);
    //procedure rbActualClick(Sender: TObject);
    //procedure frxpdfxprtPedWebBeforeExport(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnExcelClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    function frxdsgnr1SaveReport(Report: TfrxReport; SaveAs: Boolean): Boolean;
  private
    sElegido:String;

    { Private declarations }
  public
    procedure CargarFormatos(form:TfrmMtoModalGenImpEle);
    procedure DeleteForm(sElegido:String;form:TfrmMtoModalGenImpEle);
    { Public declarations }
    procedure preparar_consulta; virtual; abstract;
    procedure Consultar_Formularios;
  end;

var
  frmPrint: TfrmPrint;

implementation

uses
  inMtoModalGenImpSave, inLibUser;

{$R *.dfm}

procedure TfrmPrint.btnEditarClick(Sender: TObject);
begin
  inherited;
  Preparar_consulta;
  Self.Hide;
  Consultar_Formularios;
  frxrprt1.PrepareReport(True);
  frxrprt1.DesignReport();
  Self.Show;
end;

procedure TfrmPrint.btnExcelClick(Sender: TObject);
begin
  inherited;
  Preparar_consulta;
  Self.Hide;
  Consultar_Formularios;
  frxrprt1.PrepareReport(True);
  frxrprt1.Export(frxlsxprtExcel);
  Self.Show;
end;

procedure TfrmPrint.btnImprimirClick(Sender: TObject);
begin
  Preparar_consulta;
  Self.Hide;
  Consultar_Formularios;
  frxrprt1.PrepareReport(True);
  frxrprt1.Print;
  Self.Show;
end;

procedure TfrmPrint.btnSalirClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmPrint.btnPDFClick(Sender: TObject);
begin
  Preparar_consulta;
  Self.Hide;
  Consultar_Formularios;
  frxrprt1.PrepareReport(True);
  frxrprt1.Export(frxpdfxprtPedWeb);
  Self.Show;
end;

procedure TfrmPrint.btnVistaPreliminarClick(Sender: TObject);
begin
  Preparar_consulta;
  Self.Hide;
  Consultar_Formularios;
  frxrprt1.ShowReport;
  Self.Show;
end;

procedure TfrmPrint.CargarFormatos(form:TfrmMtoModalGenImpEle);
begin
   with unqryPerfiles do
  begin
    Refresh;
    if (unqryPerfiles.RecordCount > 0) then
    begin
      First;
      Form.lstFormatos.Clear;
      while not Eof do
      begin
        form.lstFormatos.AddItem(FieldByName('VALUE_PERFILES').AsString, nil);
        Next;
      end;
      form.lstFormatos.ItemIndex := 0;
    end;
  end;
end;

procedure TfrmPrint.Consultar_Formularios;
var
  form:TfrmMtoModalGenImpEle;
  sDescripcion:string;
  memStream:TMemoryStream;
begin
  with unqryPerfiles do
  begin
      form := TfrmMtoModalGenImpEle.Create(Self);
      CargarFormatos(form);
      form.ShowModal;
      sElegido := form.sElegido;
      if form.sFicha = 'S' then
      begin
        //guarda el formato
         sDescripcion := form.lstFormatos.items[form.lstFormatos.ItemIndex ];
        try
          memStream:=TMemoryStream.Create;
          unqryPerfiles.Locate('VALUE_PERFILES',sDescripcion, []);
          TBlobField(unqryPerfiles.FieldByName('VALUE_BLOB_PERFILES')).
                                                        SaveToStream(memStream);
          memStream.Position:=0;
          frxrprt1.LoadFromStream(memStream);
        finally
          memStream.Free;
        end;
      end
      else if (form.sFicha = 'O') then
      begin
        frxrprt1.AssignAll(frxReportOrigen);
      end;
      FreeAndNil(form);
    end;
  end;

procedure TfrmPrint.DeleteForm(sElegido: String; form:TfrmMtoModalGenImpEle);
var
  unqrySol:TUniQuery;
  sUserProp:string;
  iButtonSel:Integer;
begin
  unqrySol := TUniQuery.Create(nil);
  unqrySol.Connection := oConn;
  unqrySol.SQL.Text := 'SELECT USUARIO_GRUPO_PERFILES ' +
                       '  FROM fza_usuarios_perfiles ' +
                       ' WHERE KEY_PERFILES = :NombreReport ' +
                       '   AND VALUE_PERFILES = :Descripcion ';
  unqrySol.ParamByName('NombreReport').AsString := Self.Name;
  unqrySol.ParamByName('Descripcion').AsString := sElegido;
  unqrySol.Open;
  sUserProp := unqrySol.FindField('USUARIO_GRUPO_PERFILES').AsString;
  if ((inLibGlobalVar.orootGroup <> 'S') or
      (oUser <> sUserProp) or
      (oGroup <> sUserProp)) then
    ShowMessage('No tiene privilegios suficientes para efectuar la operaci�n')
  else
  begin
  iButtonSel := MessageDlg('�Est� seguro de borrar el formato?',
                                    mtCustom,[mbYes,mbNo], 0);
  if (iButtonSel = mrYes) then
  begin
    unqrySol.SQL.Text := 'DELETE  ' +
                         '  FROM fza_usuarios_perfiles ' +
                         ' WHERE KEY_PERFILES = :NombreReport ' +
                         '   AND VALUE_PERFILES = :Descripcion ';
    unqrySol.ParamByName('NombreReport').AsString := Self.Name;
    unqrySol.ParamByName('Descripcion').AsString := sElegido;

    unqrySol.Execute;
  end;
    FreeAndNil(unqrySol);
    CargarFormatos(form);
  end;
end;

procedure TfrmPrint.FormCreate(Sender: TObject);
begin
  inherited;
  Self.Position := poScreenCenter;
  unqryPerfiles.ParamByName('FormName').AsString := Self.Name;
  unqryPerfiles.ParamByName('Usuario').AsString := oUser;
  unqryPerfiles.ParamByName('Grupo').AsString := oGroup;
  unqryPerfiles.ParamByName('Todos').AsString := oAll;
  unqryPerfiles.Open;
end;

function TfrmPrint.frxdsgnr1SaveReport(Report: TfrxReport;
  SaveAs: Boolean): Boolean;
var
  memStream:TMemoryStream;
  formulario: TfrmModalGenImpSave;
  bGuardar : Boolean;
  sDescripcion, sPermisos : string;
begin
  bGuardar := False;
  formulario := TfrmModalGenImpSave.Create(Application);
  formulario.edtNombreOrigen.Text := Self.Name;
  formulario.edtDescripcion.Text := sElegido;
  formulario.ShowModal;
  if (formulario.sFicha = 'S') then
  begin
    bGuardar := True;
    sDescripcion := formulario.edtDescripcion.Text;
    sPermisos := formulario.cbbPermisos.Text;
  end;
  FreeAndNil(formulario);
  if bGuardar then
  begin
    try
      memStream:=TMemoryStream.Create;
      frxrprt1.SaveToStream(memStream);
      memStream.Position:=0;
      if unqryPerfiles.Locate('VALUE_PERFILES',sDescripcion, []) then
      begin
        if ( Application.MessageBox( 'El informe ya existe. ' +
                                    '�Desea reemplazar el informe?',
                                    'Mensaje Advertencia',
                                    MB_YESNO ) = ID_YES ) then
          unqryPerfiles.Edit
        else
          bGuardar := False;
      end
      else
        unqryPerfiles.Insert;
      if (bGuardar) then
      begin
        unqryPerfiles.FieldByName('USUARIO_GRUPO_PERFILES').AsString :=
                                                                      sPermisos;
        unqryPerfiles.FieldByName('KEY_PERFILES').AsString := Self.Name;
        unqryPerfiles.FieldByName('SUBKEY_PERFILES').AsString := frxrprt1.Name +
                                                             '_' + sDescripcion;
        unqryPerfiles.FieldByName('VALUE_PERFILES').AsString := sDescripcion;
        unqryPerfiles.FieldByName('INSTANTEALTA').AsDateTime := Now;
        unqryPerfiles.FieldByName('USUARIOMODIF').AsString := oUser;
        unqryPerfiles.FieldByName('USUARIOALTA').AsString := oUser;
        TBlobField(unqryPerfiles.FieldByName('VALUE_BLOB_PERFILES')).
                                                      LoadFromStream(memStream);
        //https://forums.devart.com/viewtopic.php?t=19115
        unqryPerfiles.Post;
        Result := True;
      end
      else
        Result := False;
    finally
      memStream.Free;
      //https://forum.fast-report.com/en/categories/fastreport-vcl-6
    end;
  end;
end;
end.
