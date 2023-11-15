{*******************************************************}
{                                                       }
{       FactuZam                                        }
{                                                       }
{       Copyright (C) 2023 fzam.6dvdy@slmail.me    }
{                                                       }
{*******************************************************}

unit inLibLog;

interface

uses
  inMtoPrincipal2, Uni, inlibDir, Sysutils, inLibGlobalVar, Forms;
type
  TTipoLog = (tlInformativo, tlAdvertencia, tlCritical);
procedure Log(Conn: TUniConnection;
              sUser: string;
              sMessage: string;
              Sender:TObject = nil;
              tlTipo: TTipoLog = tlInformativo;
              sClassErrorLog: string = '');

implementation

procedure Log(Conn: TUniConnection;
              sUser: string;
              sMessage: string;
              Sender:TObject = nil;
              tlTipo: TTipoLog = tlInformativo;
              sClassErrorLog: string = '');
var
  sFileName, sMensaje: string;
  txtF: TextFile;
  unqryLog: TUniQuery;
begin
  if not(Conn.Connected) or (Sender = nil)
  then
  begin
    sMensaje := Ord(tlTipo).ToString + ' ' + sClassErrorLog + ' ' +
      FormatDateTime('"día:"dd/mm/yyyy " hora:" hh:mm:ss:zzz " - "',
      Now) + 'Usuario: ' + sUser + ' Mensaje: ' + sMessage;
    sFileName := ExtractFilePath(GetLogFolder) + 'LOG_' +
      FormatDateTime('mmdd', Now) + '.log';
    AssignFile(txtF, sFileName);
    {$I-}
    Append(txtF);
    if IOResult <> 0
    then
      Rewrite(txtF);
    {$I+}
    if IOResult = 0
    then
    begin
      Writeln(txtF, sMensaje);
      CloseFile(txtF);
    end;
  end
  else
  begin
    unqryLog := TUniQuery.Create(nil);
    unqryLog.Connection := Conn;
    unqryLog.SQL.Text := 'SELECT * FROM fza_log where FECHAHORA_LOG = 0';
    unqryLog.Active := True;
    unqryLog.Insert;
    unqryLog.FieldByName('FECHAHORA_MACHINE_LOG').AsDateTime := Now;
    unqryLog.FieldByName('USUARIO_LOG').AsString := oUser + '/' + oGroup +
      '/' + orootGroup;
    unqryLog.FieldByName('TIPO_MENSAJE_LOG').AsString :=
                                                       Ord(tlTipo).ToString;
    unqryLog.FieldByName('MENSAJE_LOG').AsString := sMessage;
    if sClassErrorLog <> ''
    then
      unqryLog.FieldByName('CLASS_ERROR_LOG').AsString := sClassErrorLog;
    if Sender <> nil then
      unqryLog.FieldByName('FORM_LOG').AsString := (Sender as TForm).Name;
    unqryLog.Post;
    FreeAndNil(unqryLog);
  end;
end;
end.
