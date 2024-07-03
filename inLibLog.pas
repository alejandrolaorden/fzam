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
  System.SysUtils, System.Classes, System.IOUtils, inLibGlobalVar,
  inLibDir, Windows,
  System.TypInfo, System.Zip, System.Generics.Collections;

const
  DEFAULT_LOG_RETENTION = 10;

type
  TLogType = (ltInfo, ltWarning, ltError, ltSQL);
  TLogFlags = set of TLogType;
  TLog = class
  private
    FLogFile: TextFile;
    FLogFileName: string;
    FLogFlags: TLogFlags;
    FInstanceID: string;
    FLogRetention: Integer;
    procedure WriteToLog(const AMessage: string; ALogType: TLogType);
    procedure WriteInitialInfo;
    function GenerateInstanceID: string;
    procedure RotateLogs;
  public
    constructor Create(ALogRetention: Integer = DEFAULT_LOG_RETENTION);
    destructor Destroy; override;
    procedure LogInfo(const AMessage: string); overload;
    procedure LogWarning(const AMessage: string);
    procedure LogError(const AMessage: string);
    procedure LogSQL(const ASQL: string);
    procedure EnableLogType(ALogType: TLogType);
    procedure DisableLogType(ALogType: TLogType);
    function IsLogTypeEnabled(ALogType: TLogType): Boolean;
    property InstanceID: string read FInstanceID;
  end;
var
  Log: TLog;
implementation

uses
  System.DateUtils, inLibWin;

{ TLog }

constructor TLog.Create(ALogRetention: Integer = DEFAULT_LOG_RETENTION);
var
  IsNewFile: Boolean;
begin
  inherited Create;
  FInstanceID := GenerateInstanceID;
  FLogRetention := ALogRetention;
  FLogFileName := TPath.Combine(GetLogFolder, 'LOG_fzam_' +
                                FormatDateTime('dd_mm_yyyy', Now) + '.log');
  IsNewFile := not FileExists(FLogFileName);
  AssignFile(FLogFile, FLogFileName);
  if IsNewFile then
    Rewrite(FLogFile)
  else
    Append(FLogFile);
  FLogFlags := [ltInfo, ltWarning, ltError]; // SQL logging desactivado por defecto
  if IsNewFile then
    WriteInitialInfo;
  WriteToLog('Logging session started.', ltInfo);
  RotateLogs;
end;

function TLog.GenerateInstanceID: string;
var
  GUID: TGUID;
begin
  if (CreateGUID(GUID) = S_OK) then
    Result := GUIDToString(GUID)
  else
    Result := IntToStr(DateTimeToUnix(Now, False)) + IntToStr(GetTickCount);
end;

destructor TLog.Destroy;
begin
  if (TTextRec(FLogFile).Mode <> fmClosed) then
  begin
    WriteToLog('Logging session ended.', ltInfo);
    CloseFile(FLogFile);
  end;
  inherited;
end;

procedure TLog.WriteToLog(const AMessage: string; ALogType: TLogType);
begin
  if (TTextRec(FLogFile).Mode <> fmClosed) and (ALogType in FLogFlags) then
  begin
    WriteLn(FLogFile,
            Format('%s - [Instance: %s] %s - %s',
                   [FormatDateTime('yyyy-mm-dd hh:nn:ss.zzz', Now),
                    FInstanceID,
                    AMessage,
                    GetEnumName(TypeInfo(TLogType), Ord(ALogType))]));
    Flush(FLogFile);
  end;
end;

procedure TLog.WriteInitialInfo;
begin
  WriteLn(FLogFile, '-------- New Log File --------');
  WriteLn(FLogFile, 'Date: ' + FormatDateTime('yyyy-mm-dd hh:nn:ss', Now));
  WriteLn(FLogFile, 'Computer Name: ' + GetComputerName);
  WriteLn(FLogFile, 'Windows User: ' + GetWindowsUserName);
  WriteLn(FLogFile, 'Windows Version: ' + GetWindowsVersion);
  WriteLn(FLogFile, 'Program Path: ' + GetProgramPath);
  WriteLn(FLogFile, 'Log Folder: ' + GetLogFolder);
  WriteLn(FLogFile, '-------------------------------');
  Flush(FLogFile);
end;
procedure TLog.LogInfo(const AMessage: string);
begin
  WriteToLog('INFO: ' + AMessage, ltInfo);
end;

procedure TLog.LogWarning(const AMessage: string);
begin
  WriteToLog('WARNING: ' + AMessage, ltWarning);
end;

procedure TLog.LogError(const AMessage: string);
begin
  WriteToLog('ERROR: ' + AMessage, ltError);
end;

procedure TLog.LogSQL(const ASQL: string);
var
  SQLOneLine: string;
begin
  SQLOneLine := StringReplace(ASQL, sLineBreak, ' ', [rfReplaceAll]);
  SQLOneLine := Trim(SQLOneLine);
  WriteToLog('SQL: ' + SQLOneLine, ltSQL);
end;

procedure TLog.EnableLogType(ALogType: TLogType);
begin
  Include(FLogFlags, ALogType);
end;

procedure TLog.DisableLogType(ALogType: TLogType);
begin
  Exclude(FLogFlags, ALogType);
end;

function TLog.IsLogTypeEnabled(ALogType: TLogType): Boolean;
begin
  Result := ALogType in FLogFlags;
end;

procedure TLog.RotateLogs;
var
  LogFiles: TArray<string>;
  ArchiveFolder: string;
  ZipFileName: string;
  Zip: TZipFile;
  I: Integer;
begin
  ArchiveFolder := TPath.Combine(GetLogFolder, 'archive');
  if not TDirectory.Exists(ArchiveFolder) then
    TDirectory.CreateDirectory(ArchiveFolder);
  LogFiles := TDirectory.GetFiles(GetLogFolder, '*.log');
  if Length(LogFiles) > FLogRetention then
  begin
    TArray.Sort<string>(LogFiles);
    ZipFileName := TPath.Combine(ArchiveFolder, 'Logs_' +
                               FormatDateTime('yyyymmdd_hhnnss', Now) + '.zip');
    Zip := TZipFile.Create;
    try
      Zip.Open(ZipFileName, zmWrite);
      for I := 0 to Length(LogFiles) - FLogRetention - 1 do
      begin
        Zip.Add(LogFiles[I], ExtractFileName(LogFiles[I]));
        TFile.Delete(LogFiles[I]);
      end;
    finally
      Zip.Close;
      FreeAndNil(Zip);
    end;
  end;
end;

initialization
  Log := TLog.Create;
finalization
  Log.Free;
end.
