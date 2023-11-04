{*******************************************************}
{                                                       }
{       FactuZam                                        }
{                                                       }
{       Copyright (C) 2023 Alejandro Laorden Hidalgo    }
{                                                       }
{*******************************************************}

unit inMtoContadores;

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
  cxGridDBTableView, cxGrid, cxPC, Vcl.ExtCtrls, UniDataContadores, cxCheckBox,
  cxSpinEdit, cxBlobEdit, dxScrollbarAnnotations, dxCore, cxRadioGroup,
  inMtoPrincipal2, Vcl.AppEvnts, JvComponentBase, JvEnterTab;

type
  TfrmMtoContadores = class(TfrmMtoGen)
    cxgrdbclmnGrdDBTabPrinTIPODOC_CONTADOR: TcxGridDBColumn;
    cxgrdbclmnGrdDBTabPrinSERIE_CONTADOR: TcxGridDBColumn;
    cxgrdbclmnGrdDBTabPrinCONTADOR_CONTADOR: TcxGridDBColumn;
    cxgrdbclmnGrdDBTabPrinDEFAULT_CONTADOR: TcxGridDBColumn;
    cxgrdbclmnGrdDBTabPrinINSTANTEMODIF: TcxGridDBColumn;
    cxgrdbclmnGrdDBTabPrinINSTANTEALTA: TcxGridDBColumn;
    cxgrdbclmnGrdDBTabPrinUSUARIOALTA: TcxGridDBColumn;
    cxgrdbclmnGrdDBTabPrinUSUARIOMODIF: TcxGridDBColumn;
    cxGrdDBTabPrinNUMDIGIT_CONTADOR: TcxGridDBColumn;
    cxGrdDBTabPrinACTIVO_CONTADOR: TcxGridDBColumn;
  private
    { Private declarations }
  public
    procedure CrearTablaPrincipal; override;
  end;

var
  frmMtoContadores: TfrmMtoContadores;
  dmmContadores:TdmContadores;

implementation

uses
  inLibWin;

{$R *.dfm}

procedure ForceReferenceToClass(C: TClass); begin end;

{ TfrmMtoContadores }

procedure TfrmMtoContadores.CrearTablaPrincipal;
begin
  inherited;
  dmmContadores := TdmContadores.Create(Self);
  pkFieldName := '`TIPODOC_CONTADOR;SERIE_CONTADOR;EMPRESA_CONTADOR';
end;

initialization
  ForceReferenceToClass(TfrmMtoContadores);
end.
