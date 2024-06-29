﻿{*******************************************************}
{                                                       }
{       FactuZam                                        }
{                                                       }
{       Copyright (C) 2023 fzam.6dvdy@slmail.me    }
{                                                       }
{*******************************************************}

unit inMtoModalGenFilter;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  inMtoFrmBase, dxSkinsForm, cxClasses, cxContainer, cxEdit, cxLookAndFeels,
  cxLocalization, cxGraphics, cxControls, cxLookAndFeelPainters, cxLabel,
  cxTextEdit, Vcl.Menus, Vcl.StdCtrls, cxButtons, dxCore, Vcl.ExtCtrls,
  dxBarBuiltInMenu, cxPC, cxCustomListBox, cxCheckListBox, cxDBCheckListBox,
  cxListBox, cxDBEdit, UniDataGenFilter, JvComponentBase, JvEnterTab, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxNavigator, dxDateRanges,
  dxScrollbarAnnotations, Data.DB, cxDBData, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGridLevel, cxGridCustomView, cxGrid,
  cxTL, cxMaskEdit, cxTLdxBarBuiltInMenu, cxInplaceContainer, cxDBTL, cxTLData;

type
  TfrmModalGenFilter = class(TfrmBase)
    pnl1: TPanel;
    btnGuardar: TcxButton;
    btnCancelar: TcxButton;
    JvEnterAsTab1: TJvEnterAsTab;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    pnl2: TPanel;
    pcFiltros: TcxPageControl;
    tsEmpresas: TcxTabSheet;
    tsFamilias: TcxTabSheet;
    cxDBListBox2: TcxDBListBox;
    tsTarifas: TcxTabSheet;
    cxDBListBox3: TcxDBListBox;
    tsArticulos: TcxTabSheet;
    tsVentas: TcxTabSheet;
    tvEmp: TcxGridDBTableView;
    lvEmp: TcxGridLevel;
    grdEmp: TcxGrid;
    tvEmpCODIGO_EMPRESA: TcxGridDBColumn;
    tvEmpRAZONSOCIAL_EMPRESA: TcxGridDBColumn;
    tvEmpNIF_EMPRESA: TcxGridDBColumn;
    tvEmpMOVIL_EMPRESA: TcxGridDBColumn;
    tvEmpEMAIL_EMPRESA: TcxGridDBColumn;
    tvEmpDIRECCION1_EMPRESA: TcxGridDBColumn;
    tvEmpDIRECCION2_EMPRESA: TcxGridDBColumn;
    tvEmpCPOSTAL_EMPRESA: TcxGridDBColumn;
    tvEmpPOBLACION_EMPRESA: TcxGridDBColumn;
    tvEmpPROVINCIA_EMPRESA: TcxGridDBColumn;
    tvEmpPAIS_EMPRESA: TcxGridDBColumn;
    tvEmpSERIE_CONTADOR_EMPRESA: TcxGridDBColumn;
    tvEmpGRUPO_ZONA_IVA_EMPRESA: TcxGridDBColumn;
    tvEmpESRETENCIONES_EMPRESA: TcxGridDBColumn;
    tvEmpESREGIMENESPECIALAGRICOLA_EMPRESA: TcxGridDBColumn;
    tvEmpTEXTO_LEGAL_FACTURA_EMPRESA: TcxGridDBColumn;
    cxDBTreeList1: TcxDBTreeList;
    cxDBTreeList1cxDBTreeListColumn1: TcxDBTreeListColumn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnGuardarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    sFicha:string;
  end;

var
  frmModalGenFilter: TfrmModalGenFilter;
  dmmDataGen:TdmGenFilter;

implementation

{$R *.dfm}

procedure TfrmModalGenFilter.btnCancelarClick(Sender: TObject);
begin
  inherited;
  PostMessage(Handle, WM_CLOSE, 0, 0);
end;

procedure TfrmModalGenFilter.btnGuardarClick(Sender: TObject);
begin
  inherited;
//  if (edtPassword.Text <> edtPasswordCon.Text) then
//  begin
//    ShowMessage('Los passwords no coinciden');
//  end
//  else
//  begin
//    sFicha := 'S';
//    PostMessage(Handle, WM_CLOSE, 0, 0);
//  end;
end;

procedure TfrmModalGenFilter.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
end;

procedure TfrmModalGenFilter.FormCreate(Sender: TObject);
begin
  inherited;
  dmmDataGen := TdmGenFilter.Create(Self);
  //lstEmpresas.DataBinding.DataSource := dmmDataGen.dsEmpresas;
  Self.Position := poScreenCenter;
end;

end.
