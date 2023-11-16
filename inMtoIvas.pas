{*******************************************************}
{                                                       }
{       FactuZam                                        }
{                                                       }
{       Copyright (C) 2023 fzam.6dvdy@slmail.me    }
{                                                       }
{*******************************************************}

unit inMtoIvas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, inMtoGen, dxSkinsCore,
  dxSkinsDefaultPainters, dxBarBuiltInMenu, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxEdit, cxNavigator, dxDateRanges, Data.DB, cxDBData,
  cxContainer, Vcl.Menus, dxSkinsForm, cxClasses, cxLocalization, Vcl.StdCtrls,
  cxButtons, cxDBNavigator, Vcl.Buttons, dxBevel, cxLabel, cxTextEdit,
  cxGridLevel, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, cxPC, Vcl.ExtCtrls, UniDataIvas, cxSpinEdit,
  cxCalendar, cxDBExtLookupComboBox, cxDBLookupComboBox, dxScrollbarAnnotations,
  cxBlobEdit, dxCore, cxRadioGroup, cxCheckBox,
  JvComponentBase, JvEnterTab;

type
  TfrmMtoIvas = class(TfrmMtoGen)
    cxGrdDBTabPrinCODIGO_IVA: TcxGridDBColumn;
    cxGrdDBTabPrinGRUPO_ZONA_IVA: TcxGridDBColumn;
    cxGrdDBTabPrinDESCRIPCION_ZONA_IVA: TcxGridDBColumn;
    cxGrdDBTabPrinPORCENEXENTO_IVA: TcxGridDBColumn;
    cxGrdDBTabPrinPORCENEXENTO_RE_IVA: TcxGridDBColumn;
    cxGrdDBTabPrinPORCENNORMAL_IVA: TcxGridDBColumn;
    cxGrdDBTabPrinPORCENNORMAL_RE_IVA: TcxGridDBColumn;
    cxGrdDBTabPrinPORCENREDUCIDO_IVA: TcxGridDBColumn;
    cxGrdDBTabPrinPORCENREDUCIDO_RE_IVA: TcxGridDBColumn;
    cxGrdDBTabPrinPORCENSUPERREDUCIDO_IVA: TcxGridDBColumn;
    cxGrdDBTabPrinPORCENSUPERREDUCIDO_RE_IVA: TcxGridDBColumn;
    cxGrdDBTabPrinFECHA_DESDE_IVA: TcxGridDBColumn;
    cxGrdDBTabPrinFECHA_HASTA_IVA: TcxGridDBColumn;
    cxGrdDBTabPrinINSTANTEMODIF: TcxGridDBColumn;
    cxGrdDBTabPrinINSTANTEALTA: TcxGridDBColumn;
    cxGrdDBTabPrinUSUARIOALTA: TcxGridDBColumn;
    cxGrdDBTabPrinUSUARIOMODIF: TcxGridDBColumn;
    cxGrdDBTabPrinESAPLICA_RE_ZONA_IVA: TcxGridDBColumn;
    cxGrdDBTabPrinESIVAAGRICOLA_ZONA_IVA: TcxGridDBColumn;
    cxGrdDBTabPrinESDEFAULT_ZONA_IVA: TcxGridDBColumn;
    cxGrdDBTabPrinESIRPF_IMP_INCL_ZONA_IVA: TcxGridDBColumn;
    cxGrdDBTabPrinPALABRA_REPORTS_ZONA_IVA: TcxGridDBColumn;
    procedure cxgrdbclmnGrdDBTabPrinGRUPO_ZONA_IVAPropertiesChange(
      Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dsTablaGStateChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  public
    procedure CrearTablaPrincipal; override;
end;

var
  frmMtoIvas: TfrmMtoIvas;
  dmmIvas : TdmIvas;

implementation

uses
  inLibWin;

{$R *.dfm}

procedure ForceReferenceToClass(C: TClass); begin end;

procedure TfrmMtoIvas.CrearTablaPrincipal;
begin
  inherited;
  dmmIvas := TdmIvas.Create(Self);
  (cxGrdDBTabPrinGRUPO_ZONA_IVA.Properties as
                     TcxLookupComboBoxProperties).ListSource := dmmIvas.dsZonas;
  pkFieldName := 'CODIGO_IVA';
end;

procedure TfrmMtoIvas.cxgrdbclmnGrdDBTabPrinGRUPO_ZONA_IVAPropertiesChange(
  Sender: TObject);
begin
  inherited;
  //copio la descripcion de Zona a la sig columna
  //dsTablaG.DataSet.FieldByName('DESCRIPCION_ZONA_IVA').AsString :=
  //           dmmIVAS.unqryZonasIVA.FieldByName('DESCRIPCION_ZONA_IVA').AsString;
end;

procedure TfrmMtoIvas.dsTablaGStateChange(Sender: TObject);
begin
  inherited;
    if (dsTablaG.State = dsInsert) then
      cxGrdDBTabPrinCODIGO_IVA.Options.Editing := True
    else
      cxGrdDBTabPrinCODIGO_IVA.Options.Editing := False;
end;

procedure TfrmMtoIvas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  FreeAndNil(dmmIvas);
end;

initialization
  ForceReferenceToClass(TfrmMtoIvas);

end.
