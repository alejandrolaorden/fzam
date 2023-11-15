{*******************************************************}
{                                                       }
{       FactuZam                                        }
{                                                       }
{       Copyright (C) 2023 fzam.6dvdy@slmail.me    }
{                                                       }
{*******************************************************}

unit inMtoIvasGrupos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, inMtoPrincipal2,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, inMtoGen, dxSkinsCore,
  dxSkinsDefaultPainters, dxBarBuiltInMenu, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxEdit, cxNavigator, dxDateRanges, Data.DB, cxDBData,
  cxContainer, Vcl.Menus, dxSkinsForm, cxClasses, cxLocalization, Vcl.StdCtrls,
  cxButtons, cxDBNavigator, Vcl.Buttons, dxBevel, cxLabel, cxTextEdit,
  cxGridLevel, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, cxPC, Vcl.ExtCtrls, UniDataIvasGrupos, cxSpinEdit,
  cxCalendar, cxCheckBox, cxBlobEdit, dxScrollbarAnnotations, dxCore,
  cxRadioGroup, Vcl.AppEvnts, JvComponentBase, JvEnterTab;

type
  TfrmMtoIvasGrupos = class(TfrmMtoGen)
    cxgrdbclmnGrdDBTabPrinGRUPO_ZONA_IVA: TcxGridDBColumn;
    cxgrdbclmnGrdDBTabPrinDESCRIPCION_ZONA_IVA: TcxGridDBColumn;
    cxgrdbclmnGrdDBTabPrinAPLICA_RE_ZONA_IVA: TcxGridDBColumn;
    cxgrdbclmnGrdDBTabPrinDEFAULT_ZONA_IVA: TcxGridDBColumn;
    cxGrdDBTabPrinIRPF_IMP_INCL_ZONA_IVA: TcxGridDBColumn;
    cxGrdDBTabPrinESIVAAGRICOLA_ZONA_IVA: TcxGridDBColumn;
    cxGrdDBTabPrinPALABRA_REPORTS_ZONA_IVA: TcxGridDBColumn;
    procedure FormDestroy(Sender: TObject);
    procedure dsTablaGStateChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  public
    procedure CrearTablaPrincipal; override;
end;

var
  frmMtoIvasGrupos: TfrmMtoIvasGrupos;
  dmmIvasGrupos : TdmIvasGrupos;

implementation

uses
  inLibWin;

{$R *.dfm}

procedure ForceReferenceToClass(C: TClass); begin end;

procedure TfrmMtoIvasGrupos.CrearTablaPrincipal;
begin
  inherited;
  dmmIvasGrupos := TdmIvasGrupos.Create(Self);
    pkFieldName := 'GRUPO_ZONA_IVA';
end;

procedure TfrmMtoIvasGrupos.dsTablaGStateChange(Sender: TObject);
begin
  inherited;
  if (dsTablaG.State = dsInsert) then
    cxgrdbclmnGrdDBTabPrinGRUPO_ZONA_IVA.Properties.ReadOnly := False
  else
  begin
    cxgrdbclmnGrdDBTabPrinGRUPO_ZONA_IVA.Properties.ReadOnly := True;
  end;
end;

procedure TfrmMtoIvasGrupos.FormDestroy(Sender: TObject);
begin
  inherited;
  FreeAndNil(dmmIvasGrupos);
end;

initialization
  ForceReferenceToClass(TfrmMtoIvasGrupos);
end.
