{*******************************************************}
{                                                       }
{       FactuZam                                        }
{                                                       }
{       Copyright (C) 2023 fzam.6dvdy@slmail.me    }
{                                                       }
{*******************************************************}

unit UniDataUsuarios;

interface

uses
  System.SysUtils, System.Classes, UniDataGen, Data.DB, MemDS, DBAccess, Uni,
  inLibUser, UniDataConn, Vcl.Dialogs;

type
  TdmUsuarios = class(TdmBase)
    unqryGrupos: TUniQuery;
    dsGrupos: TDataSource;
    unqryEmpresas: TUniQuery;
    dsEmpresas: TDataSource;
    procedure unqryTablaGBeforePost(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmUsuarios: TdmUsuarios;

implementation

uses
  inLibtb;

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TdmUsuarios.unqryTablaGBeforePost(DataSet: TDataSet);
var
  sUsuario:string;
  bError:Boolean;
begin
  inherited;
  bError := False;
  with unqryTablaG do
  begin
    sUsuario := Trim(FindField('USUARIO_USUARIO').AsString);
    if ((sUsuario = '') or not(SimbolosProhibidos(sUsuario))) then
    begin
      ShowMessageFmt('%s no es un valor de registro válido ' +
                     'para el campo Usuario',[sUsuario]);
      bError := True;
    end;
    if bError then
      Abort;
  end;
end;

end.
