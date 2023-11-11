{*******************************************************}
{                                                       }
{       FactuZam                                        }
{                                                       }
{       Copyright (C) 2023 Alejandro Laorden Hidalgo    }
{                                                       }
{*******************************************************}

unit inMtoGrupos;

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
  cxGridDBTableView, cxGrid, cxPC, Vcl.ExtCtrls, UniDataGrupos, cxCheckBox,
  cxSpinEdit, cxDBEdit, cxCalendar, dxScrollbarAnnotations, cxBlobEdit, dxCore,
  cxRadioGroup, Vcl.AppEvnts, JvComponentBase, JvEnterTab;

type
  TfrmMtoGrupos = class(TfrmMtoGen)
    cxGrdDBTabPrinGRUPO_USUARIO: TcxGridDBColumn;
    cxGrdDBTabPrinESGRUPOADMINISTRADOR: TcxGridDBColumn;
    Panel1: TPanel;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    cxDBTextEdit1: TcxDBTextEdit;
    cxDBCheckBox1: TcxDBCheckBox;
    cxgrdUsuarios: TcxGrid;
    tvUsuarios: TcxGridDBTableView;
    cxgrdlvlUsuarios: TcxGridLevel;
    tvUsuariosUSUARIO_USUARIO: TcxGridDBColumn;
    tvUsuariosGRUPO_USUARIO: TcxGridDBColumn;
    tvUsuariosEMPRESADEF_USUARIO: TcxGridDBColumn;
    tvUsuariosULTIMOLOGIN_USUARIO: TcxGridDBColumn;
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    procedure CrearTablaPrincipal; override;
  end;

var
  frmMtoGrupos: TfrmMtoGrupos;
  dmmGrupos:TdmGrupos;

implementation

uses
  inLibWin;

{$R *.dfm}

procedure ForceReferenceToClass(C: TClass); begin end;

{ TfrmMtoGrupos }

procedure TfrmMtoGrupos.CrearTablaPrincipal;
begin
  inherited;
  dmmGrupos := TdmGrupos.Create(Self);
  dsTablaG.DataSet := dmmGrupos.unqryTablaG;
  tvUsuarios.DataController.DataSource := dmmGrupos.dsUsuariosGrupo;
  pkFieldName := 'GRUPO_USUARIO';
end;

procedure TfrmMtoGrupos.FormDestroy(Sender: TObject);
begin
  inherited;
  FreeAndNil(dmmGrupos);
end;

initialization
  ForceReferenceToClass(TfrmMtoGrupos);
end.
