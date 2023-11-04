{*******************************************************}
{                                                       }
{       FactuZam                                        }
{                                                       }
{       Copyright (C) 2023 Alejandro Laorden Hidalgo    }
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
  dxBarBuiltInMenu, cxPC, cxCustomListBox, cxCheckListBox, cxDBCheckListBox;

type
  TfrmModalGenFilter = class(TfrmBase)
    pnl1: TPanel;
    btnGuardar: TcxButton;
    btnCancelar: TcxButton;
    pnl2: TPanel;
    pcFiltros: TcxPageControl;
    tsProveedores: TcxTabSheet;
    tsFamilias: TcxTabSheet;
    tsTarifas: TcxTabSheet;
    tsArticulos: TcxTabSheet;
    tsVentas: TcxTabSheet;
    lst1: TcxDBCheckListBox;
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
  Self.Position := poScreenCenter;
end;

end.
