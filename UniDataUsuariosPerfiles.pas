{*******************************************************}
{                                                       }
{       FactuZam                                        }
{                                                       }
{       Copyright (C) 2023 Alejandro Laorden Hidalgo    }
{                                                       }
{*******************************************************}

unit UniDataUsuariosPerfiles;

interface

uses
  System.SysUtils, System.Classes, UniDataGen, Data.DB, MemDS, DBAccess, Uni,
  inLibUser, UniDataConn;

type
  TdmUsuariosPerfiles = class(TdmBase)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmUsuariosPerfiles: TdmUsuariosPerfiles;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses inMtoUsuariosPerfiles;

{$R *.dfm}



end.
