{*******************************************************}
{                                                       }
{       FactuZam                                        }
{                                                       }
{       Copyright (C) 2023 Alejandro Laorden Hidalgo    }
{                                                       }
{*******************************************************}

unit inLibGlobalVar;

interface

uses Uni,
     UniDataPerfiles,
     UniDataConn, cxMemo, inMtoPrincipal2;

var
  odmPerfiles:TdmPerfiles;
  oConn      :TUniConnection;
  odmConn    :TdmConn;
  oMemoSQL   :TcxMemo;
  ofrmMto2   :TfrmOpenApp2;
  oUser      :String;
  oGroup     :String;
  orootGroup :String;
  oAppName   :String;
  oVersion   :String;
  oAll       :string;

implementation

initialization
  oAppName         := 'Fzam';
  oVersion         := '1.0.0.14112023a';
  oUser            := 'No definido';
  oGroup           := 'No definido';
  orootGroup       := 'N';
  odmPerfiles      := nil;
  odmConn          := nil;
  oConn            := nil;
  oAll             := 'Todos';
end.
