{*******************************************************}
{                                                       }
{       FactuZam                                        }
{                                                       }
{       Copyright (C) 2023 fzam.6dvdy@slmail.me    }
{                                                       }
{*******************************************************}

unit inMtoModalGenImpEle;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, inMtoFrmBase, dxSkinsForm, cxClasses,
  cxContainer, cxEdit, cxLookAndFeels, cxLocalization, Vcl.ExtCtrls, cxGraphics,
  cxControls, cxLookAndFeelPainters, cxCustomListBox, cxListBox, Vcl.Menus,
  Vcl.StdCtrls, cxButtons, dxCore, cxStyles;

type
  TfrmMtoModalGenImpEle = class(TfrmBase)
    pnl1: TPanel;
    pnl2: TPanel;
    lstFormatos: TcxListBox;
    btnUsarOriginal: TcxButton;
    btnSelectFormato: TcxButton;
    btnDeleteFormato: TcxButton;
    btnSalir: TcxButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnSelectFormatoClick(Sender: TObject);
    procedure btnUsarOriginalClick(Sender: TObject);
    procedure btnDeleteFormatoClick(Sender: TObject);
    procedure btnSalirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
      sFicha:string;
      sElegido:String;
  end;

var
  frmMtoModalGenImpEle: TfrmMtoModalGenImpEle;

implementation

uses
  inMtoModalGenImp;

{$R *.dfm}

procedure TfrmMtoModalGenImpEle.btnDeleteFormatoClick(Sender: TObject);
begin
  inherited;
  sElegido := lstFormatos.Items[lstFormatos.ItemIndex];
  (Self.Owner as TfrmPrint).DeleteForm(sElegido, Self);
  sFicha := 'D';
end;

procedure TfrmMtoModalGenImpEle.btnSalirClick(Sender: TObject);
begin
  inherited;
  sFicha := 'E';
  sElegido := '';
  PostMessage(Handle, WM_CLOSE, 0, 0);
end;

procedure TfrmMtoModalGenImpEle.btnSelectFormatoClick(Sender: TObject);
begin
  inherited;
  sElegido := lstFormatos.Items[lstFormatos.ItemIndex];
  sFicha := 'S';
  PostMessage(Handle, WM_CLOSE, 0, 0);
end;

procedure TfrmMtoModalGenImpEle.btnUsarOriginalClick(Sender: TObject);
begin
  inherited;
  sElegido := 'Predeterminado';
  sFicha:= 'O';
  PostMessage(Handle, WM_CLOSE, 0, 0);
end;

procedure TfrmMtoModalGenImpEle.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
end;

procedure TfrmMtoModalGenImpEle.FormCreate(Sender: TObject);
begin
  inherited;
  Self.Position := poScreenCenter;
end;

end.
