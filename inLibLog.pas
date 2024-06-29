{*******************************************************}
{                                                       }
{       FactuZam                                        }
{                                                       }
{       Copyright (C) 2023 fzam.6dvdy@slmail.me         }
{                                                       }
{*******************************************************}
unit inLibLog;

interface

uses
  System.SysUtils, System.Classes, System.IOUtils,
  inLibDir;

procedure InitializeLog;
procedure FinalizeLog;
procedure LogInfo(const AMessage: string); overload;
procedure LogInfo(const AMessage: string; sUser: String); overload;
procedure LogWarning(const AMessage: string);
procedure LogError(const AMessage: string);

implementation

var
  LogFile: TextFile;
  LogFileName: string;

procedure WriteToLog(const AMessage: string);
begin
  if (TTextRec(LogFile).Mode <> fmClosed) then
  begin
    WriteLn(LogFile,
            FormatDateTime('yyyy-mm-dd hh:nn:ss.zzz', Now) + ' - ' + AMessage);
    Flush(LogFile);
  end;
end;

procedure InitializeLog;
begin
  LogFileName := TPath.Combine(GetLogFolder, 'LOG_fzam_' +
                               FormatDateTime('dd_mm_yyyy', Now) + '.log');
  AssignFile(LogFile, LogFileName);
  if FileExists(LogFileName) then
    Append(LogFile)
  else
    Rewrite(LogFile);
  WriteToLog('Logging initialized successfully');
end;

procedure FinalizeLog;
begin
  if (TTextRec(LogFile).Mode <> fmClosed) then
  begin
    WriteToLog('Logging finalized');
    CloseFile(LogFile);
  end;
end;

procedure LogInfo(const AMessage: string);
begin
  WriteToLog('INFO: ' + AMessage);
end;

procedure LogInfo(const AMessage: string; sUser: String);
begin
  WriteToLog('INFO: ' + AMessage + ' User: ' + sUser);
end;

procedure LogWarning(const AMessage: string);
begin
  WriteToLog('WARNING: ' + AMessage);
end;

procedure LogError(const AMessage: string);
begin
  WriteToLog('ERROR: ' + AMessage);
end;

initialization
  InitializeLog;

finalization
  FinalizeLog;

end.
