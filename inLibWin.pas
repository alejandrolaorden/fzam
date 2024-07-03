{*******************************************************}
{                                                       }
{       FactuZam                                        }
{                                                       }
{       Copyright (C) 2023 fzam.6dvdy@slmail.me    }
{                                                       }
{*******************************************************}

unit inLibWin;

interface

uses
   Classes, Windows, Forms, sysutils, jpeg, idhttp, Menus, Controls,
   Vcl.Dialogs, ShellAPI, System.Rtti, System.TypInfo, System.Variants,
   System.StrUtils, inLibUser, cxLabel, cxPC, cxDBEdit, cxButtons, Uni,
   cxGroupBox, cxRadioGroup, Vcl.Buttons, inlibGlobalVar,
   System.Win.Registry, Winapi.Messages,
   system.math,IdGlobal, IdHash, IdHashMessageDigest, System.IOUtils;

//  function IsOpenMDI(sName: String; Owner : TComponent):boolean; overload;
//  function IsOpenMDI(sName: String; Owner : TComponent;
//                                        var Found:TComponent):boolean; overload;
//  function FindMDIChildOpen(const AParentForm: TForm;
//                            const AMDIChildClass: TFormClass;
//                            const AMDICaption : string): TForm;
  function EncontrarObjeto(oControl:TComponent;
                           sBusquedaTipo:String):TObject; overload;
  function EncontrarObjeto(oControl:TComponent;
                           sBusquedaTipo:String;
                           sNameObject:String):TObject; overload;
  procedure CargarCaptions(oControl:TComponent;
                           Sender:TComponent;
                           sUser:String = 'Todos');
  procedure SetLabelForm(oControl:TComponent;
                         var oPerfilDic : TProfileDicc );
  procedure GrabarPerfilDatam(dmmModule:TDataModule;
                              Sender:TComponent;
                              sUser:string = 'Todos');
  function GetVolumeID(DriveChar: Char): String;
  function FindFormOwner(oSender: TObject):TComponent;
  procedure SetDateTime(Year, Month, Day, Hour, Minu, Sec, MSec: Word);
  procedure GetImageURL(sUrl: String;
                        var memStream: TMemoryStream);
  procedure ExecuteAndWait(const aCommando: string);
  procedure LoadSQLFromProfile(dmmModule:TDataModule;
                               var oPerfilDic:TProfileDicc);
  function sMD5(const texto:string):string;
  function EncuentraPagina(pc: TcxPageControl;
                           sName:string):integer;
  function DarkModeIsEnabled:Boolean;
  function GetComputerName: string;
  function GetProgramPath: string;
  function GetWindowsUserName: string;
  function GetWindowsVersion: string;

implementation

//  procedure ShowMto<T>(Owner: TComponent; sOdon: String); overload;

function GetComputerName: string;
var
  Buffer: array[0..MAX_COMPUTERNAME_LENGTH] of Char;
  Size: DWORD;
begin
  Size := MAX_COMPUTERNAME_LENGTH + 1;
  if Winapi.Windows.GetComputerName(Buffer, Size) then
    Result := Buffer
  else
    Result := 'Unknown';
end;

function GetWindowsUserName: string;
var
  Buffer: array[0..255] of Char;
  Size: DWORD;
begin
  Size := 256;
  if Winapi.Windows.GetUserName(Buffer, Size) then
    Result := Buffer
  else
    Result := 'Unknown';
end;

function GetProgramPath: string;
begin
  Result := ExtractFilePath(ParamStr(0));
end;

function GetWindowsVersion: string;
var
  Reg: TRegistry;
begin
  Reg := TRegistry.Create(KEY_READ);
  try
    Reg.RootKey := HKEY_LOCAL_MACHINE;
    if Reg.OpenKey('SOFTWARE\Microsoft\Windows NT\CurrentVersion', False) then
    begin
      Result := Reg.ReadString('ProductName');
      if Reg.ValueExists('DisplayVersion') then
        Result := Result + ' ' + Reg.ReadString('DisplayVersion')
      else if Reg.ValueExists('ReleaseId') then
        Result := Result + ' ' + Reg.ReadString('ReleaseId');
    end
    else
      Result := 'Unknown';
  finally
    Reg.Free;
  end;
end;


function DarkModeIsEnabled: boolean;
{$IFDEF MSWINDOWS}
const
  TheKey   = 'Software\Microsoft\Windows\CurrentVersion\Themes\Personalize\';
  TheValue = 'AppsUseLightTheme';
var
  Reg: TRegistry;
{$ENDIF}
begin

  Result := False;  // There is no dark side - the Jedi are victorious!

// This relies on a registry setting only available on MS Windows
// If the developer has somehow managed to get to this point then tell
// them not to do this!
{$IFNDEF MSWINDOWS}
{$MESSAGE WARN '"DarkModeIsEnabled" will only work on MS Windows targets'}
{$ELSE}
  Reg    := TRegistry.Create(KEY_READ);
  try
    Reg.RootKey := HKEY_CURRENT_USER;
    if Reg.KeyExists(TheKey) then
      if Reg.OpenKey(TheKey, False) then
      try
        if Reg.ValueExists(TheValue) then
          Result := Reg.ReadInteger(TheValue) = 0;
      finally
        Reg.CloseKey;
      end;
  finally
    Reg.Free;
  end;
{$ENDIF}
end;


function EncuentraPagina(pc: TcxPageControl;
                           sName:string):integer; overload;
Var
//   AComponent: TComponent;
   aIndex, I: Integer;
   IsFound : Boolean;
begin
  aIndex:=-1;
  I := 0;
  IsFound := False;
  while ((I < pc.PageCount) and not(IsFound)) do
  begin
    if pc.Pages[I].Caption = sName then
    begin
      isFound := True;
      aIndex := I;
    end;
    I := I + 1;
  end;
  Result := aIndex;
end;

function sMD5(const texto:string):string;
var
  idmd5 : TIdHashMessageDigest5;
begin
  idmd5 := TIdHashMessageDigest5.Create;
  try
    Result := idmd5.HashStringAsHex(String(UTF8Encode(texto)));
  finally
    idmd5.Free;
  end;
end;

procedure LoadSQLFromProfile(dmmModule:TDataModule;
                             var oPerfilDic:TProfileDicc);
var
  oControl:TComponent;
  i:Integer;
begin
  oControl := dmmModule as TComponent;
  for i := 0 to oControl.ComponentCount - 1 do
    if ( Pos('unqry', oControl.Components[i].Name) > 0  ) then
      (oControl.Components[i] as TUniQuery).SQL.Text :=
           GetPerfilValueTextDef(oPerfilDic,
                                 (oControl.Components[i] as TUniQuery).Name,
                                 (oControl.Components[i] as TUniQuery).SQL.Text)
    else
      if ( Pos('unstrdprc', oControl.Components[i].Name) > 0 )  then
        (oControl.Components[i] as TUniStoredProc).StoredProcName :=
                     GetPerfilValueTextDef(oPerfilDic,
                     (oControl.Components[i] as TUniStoredProc).Name,
                     (oControl.Components[i] as TUniStoredProc).StoredProcName);
end;

procedure ExecuteAndWait(const aCommando: string);
var
  tmpStartupInfo: TStartupInfo;
  tmpProcessInformation: TProcessInformation;
  tmpProgram: String;
begin
  tmpProgram := trim(aCommando);
  FillChar(tmpStartupInfo, SizeOf(tmpStartupInfo), 0);
  with tmpStartupInfo do
  begin
    cb := SizeOf(TStartupInfo);
    wShowWindow := SW_HIDE;
  end;
  if CreateProcess(nil, pchar(tmpProgram), nil, nil, true, CREATE_NO_WINDOW,
    nil, nil, tmpStartupInfo, tmpProcessInformation) then
  begin
    // loop every 10 ms
    while WaitForSingleObject(tmpProcessInformation.hProcess, 10) > 0 do
    begin
      Application.ProcessMessages;
    end;
    CloseHandle(tmpProcessInformation.hProcess);
    CloseHandle(tmpProcessInformation.hThread);
  end
  else
  begin
    RaiseLastOSError;
  end;
end;

procedure SetDateTime(Year, Month, Day, Hour, Minu, Sec, MSec: Word);
var
  NewDateTime: TSystemTime;
begin
  FillChar(NewDateTime, SizeOf(NewDateTime), #0);
  NewDateTime.wYear := Year;
  NewDateTime.wMonth := Month;
  NewDateTime.wDay := Day;
  NewDateTime.wHour := Hour;
  NewDateTime.wMinute := Minu;
  NewDateTime.wSecond := Sec;
  NewDateTime.wMilliseconds := MSec;
  SetLocalTime(NewDateTime);
end;

function GetVolumeID(DriveChar: Char): String;
var
   MaxFileNameLength, VolFlags, SerNum: DWord;
begin
   if GetVolumeInformation(PChar(DriveChar + ':\'), nil, 0,
      @SerNum, MaxFileNameLength, VolFlags, nil, 0)
   then
   begin
     Result := IntToHex(SerNum,8);
     Insert('-', Result, 5);
   end
   else
       Result := '';
end;

function FindFormOwner(oSender: TObject):TComponent;
begin
  Result := nil;
  while not oSender.InheritsFrom(TForm) do
    oSender := TObject((oSender as TComponent).Owner);
  if Assigned(oSender) then
    Result := (oSender as Tcomponent);
end;

//function IsOpenMDI(sName: String; Owner : TComponent):boolean; overload;
//var
//  i       : Integer;
//  bfound  : boolean;
//begin
//  bfound := false;
//    for i:= 0 to (Owner as TfrmOpenApp).MDIChildCount - 1 do
//      if (Owner as TfrmOpenApp).MDIChildren[i].Name = sName then
//      begin
//        bFound := true;
//        (Owner as TfrmOpenApp).MDIChildren[i].BringToFront  ;
//      end;
//  Result := bFound;
//end;
//
//function IsOpenMDI(sName: String; Owner : TComponent;
//                                        var Found:TComponent):boolean; overload;
//var
//  i       : Integer;
//  bfound  : boolean;
//begin
//  bfound := false;
//  i := 0;
//  while (not(bfound) and (i < (Owner as TfrmOpenApp).MDIChildCount - 1))  do
//  begin
//    if (Owner as TfrmOpenApp).MDIChildren[i].Name = sName then
//    begin
//      bFound := true;
//      (Owner as TfrmOpenApp).MDIChildren[i].BringToFront  ;
//      Found := (Owner as TfrmOpenApp).MDIChildren[i];
//    end;
//    i := i + 1;
//  end;
//  Result := bFound;
//end;
//
//function FindMDIChildOpen(const AParentForm: TForm;
//                          const AMDIChildClass: TFormClass;
//                          const AMDICaption : string): TForm;
//var
//  i: Integer;
//  Child: TForm;
//  bfound:boolean;
//begin
//  Result := nil;
//  bfound := false;
//  i := Pred(AParentForm.MDIChildCount);
//  if (i >  0) then
//    while (i >= 0) and not(bfound) do
//    begin
//      Child := AParentForm.MDIChildren[i];
//      if Child.InheritsFrom(AMDIChildClass) and
//         (Child.Name = AMDICaption) then
//      begin
//        Result := Child;
//        bfound := true;
//      end;
//      i := i - 1;
//    end
//    else
//      Result := nil;
//end;

function EncontrarObjeto(oControl:TComponent; sBusquedaTipo:String):TObject; overload;
var
  i:Integer;
begin
  Result := nil;
  for i := 0 to oControl.ComponentCount - 1 do
    if oControl.Components[i].ClassName = sBusquedaTipo then
      Result := oControl.Components[i];
end;

procedure GrabarPerfilDatam(dmmModule:TDataModule;
                            Sender:TComponent;
                            sUser:string = 'Todos');
var
  oControl:TComponent;
  i:Integer;
begin
  oControl := dmmModule as TComponent;
  for i := 0 to oControl.ComponentCount - 1 do
    if ( Pos('unqry', oControl.Components[i].Name) > 0  ) then
      odmPerfiles.GrabarPerfil(sUser, dmmModule.Name,
                                  (oControl.Components[i] as TUniQuery).Name,
                                  'SQL',
                                  (oControl.Components[i] as TUniQuery).SQL.Text)
    else
      if ( Pos('unstrdprc', oControl.Components[i].Name) > 0 )  then
        odmPerfiles.GrabarPerfil(sUser, dmmModule.Name,
                       (oControl.Components[i] as TUniStoredProc).Name,
                       'Procedure',
                       (oControl.Components[i] as TUniStoredProc).StoredProcName);
end;

procedure SetLabelForm(oControl:TComponent; var oPerfilDic : TProfileDicc);
var sName, sCompName:string;
    i:Integer;
    oCon:TComponent;
begin
  sName := oControl.Name;
  for i := 0 to oControl.ComponentCount - 1 do
  begin
    oCon := oControl.Components[i];
    sCompName := oCon.Name;
    if StartsText('lbl', sCompName)  then
    begin                       //son los �nicos label que no se deben renombrar
      if (oCon is TcxLabel) and
         not SameText((oCon as TcxLabel).Caption, 'lblTablaOrigen') and
         not SameText((oCon as TcxLabel).Caption, 'lblEditMode')
            then
      begin
       (oCon as TcxLabel).Caption :=   GetPerfilSubKeyValueDef(oPerfilDic,
                                                sCompName,
                                                'Caption',
                                                (oCon as TcxLabel).Caption);
      end
        else
        begin
        sleep(0);
        {$IFDEF DEBUG}
          ShowMessage(oCon.ClassName + ' is not TcxLabel');
        {$ENDIF }
        end;
    end;
    if StartsText('ts', sCompName) then
    begin

      if (oCon is TcxTabSheet) then
      begin
        (oCon as TcxTabSheet).Caption :=   GetPerfilSubKeyValueDef(oPerfilDic,
                                              sCompName,
                                              'Caption',
                                              (oCon as TcxTabSheet).Caption);
      end
      else
      begin
        sleep(0);
        {$IFDEF DEBUG}
          ShowMessage(oCon.ClassName + ' is not tcxTabSheet ');
        {$ENDIF }
      end;
    end;
    if StartsText('chk', sCompName) then
    begin
      if (oCon is TcxDBCheckBox) then
      begin
      (oCon as TcxDBCheckBox).Caption :=   GetPerfilSubKeyValueDef(oPerfilDic,
                                             sCompName,
                                             'Caption',
                                             (oCon as TcxDBCheckBox).Caption);
      end
      else
      begin
        sleep(0);
        {$IFDEF DEBUG}
          ShowMessage(oCon.ClassName + ' is not TcxDBCheckBox');
        {$ENDIF }
      end;
    end;
    if StartsText('btn', sCompName) then
    begin
      if oCon is TcxButton then
      begin
      (oCon as TcxButton).Caption :=   GetPerfilSubKeyValueDef(oPerfilDic,
                                            sCompName,
                                            'Caption',
                                            (oCon as TcxButton).Caption);
      end
      else
        begin
          sleep(0);
          {$IFDEF DEBUG}
            ShowMessage(oCon.ClassName + ' is not TcxButton');
          {$ENDIF }
        end;
    end;
    if StartsText('grp', sCompName) then
    begin
      if oCon is TcxGroupBox then
      begin
      (oCon as TcxGroupBox).Caption :=   GetPerfilSubKeyValueDef(oPerfilDic,
                                            sCompName,
                                            'Caption',
                                            (oCon as TcxGroupBox).Caption);
      end
      else
        begin
          sleep(0);
          {$IFDEF DEBUG}
            ShowMessage(oCon.ClassName + ' is not TcxGroupBox');
          {$ENDIF }
        end;
    end;
    if StartsText('rg', sCompName) then
    begin
      if oCon is TcxDBRadioGroup then
      begin
      (oCon as TcxDBRadioGroup).Caption :=   GetPerfilSubKeyValueDef(oPerfilDic,
                                            sCompName,
                                            'Caption',
                                            (oCon as TcxDBRadioGroup).Caption);
      end
      else
        begin
          sleep(0);
          {$IFDEF DEBUG}
            ShowMessage(oCon.ClassName + ' is not TcxDBRadioGroup');
          {$ENDIF }
        end;
    end;
    if StartsText('sb', sCompName) then
    begin
      if oCon is TSpeedButton then
      begin
      (oCon as TSpeedButton).Caption :=   GetPerfilSubKeyValueDef(oPerfilDic,
                                            sCompName,
                                            'Caption',
                                            (oCon as TSpeedButton).Caption);
      end
      else
        begin
          sleep(0);
          {$IFDEF DEBUG}
            ShowMessage(oCon.ClassName + ' is not TSpeedButton');
          {$ENDIF }
        end;
    end;
    if StartsText('rb', sCompName) then
    begin
      if oCon is TcxRadioButton then
      begin
      (oCon as TcxRadioButton).Caption :=   GetPerfilSubKeyValueDef(oPerfilDic,
                                            sCompName,
                                            'Caption',
                                            (oCon as TcxRadioButton).Caption);
      end
      else
        begin
          sleep(0);
          {$IFDEF DEBUG}
            ShowMessage(oCon.ClassName + ' is not TcxRadioButton');
          {$ENDIF }
        end;
    end;
  end;
end;

procedure CargarCaptions(oControl:TComponent;
                         Sender:TComponent;
                         sUser:String = 'Todos');
    function GetComponentPropertyValue(Component: TComponent;
                                       APropName: string): string;
    var
      I,X: Integer;
      Count, Size: Integer;
      PropList: PPropList;
      PropInfo: PPropInfo;
      PropTypeInf : PTypeInfo;
      SetList : TStrings;
      SetName,SetVal : string;
    begin
      Count := GetPropList(Component.ClassInfo, tkAny, nil);
      Size  := Count * SizeOf(Pointer);
      GetMem(PropList, Size);
      try
        Count := GetPropList(Component.ClassInfo, tkAny, PropList);
        for I := 0 to Count -1 do
        begin
         PropTypeInf := PropList^[I]^.PropType^;
         PropInfo := PropList^[I];
          if not (PropInfo^.PropType^.Kind = tkMethod) then
          begin
            if SameText(String(PropInfo^.Name), APropName) then
            begin

              if (PropInfo^.PropType^.Kind = tkSet) then
              begin
                SetList := TStringList.Create;
                try
                  SetList.CommaText :=
                                System.Variants.VarToStr(GetPropValue(Component,
                                                       String(PropInfo^.Name)));
                  for X := 0 to 255 do
                  begin
                    SetName :=
                       GetSetElementName(GetTypeData(PropTypeInf)^.CompType^,X);
                    if ContainsStr(SetName,'UITypes') then break;
                    SetVal := SetName + ' = ' +
                            IfThen(SetList.IndexOf(SetName)<>-1,'True','False');
                    if Result = '' then
                      Result := SetVal else
                      Result := Result + ', ' + SetVal;
                  end;

                finally
                  SetList.Free;
                end;
              end else
                Result := System.Variants.VarToStr(GetPropValue(Component,
                                                   String(PropInfo^.Name)));
              Exit;
            end;
          end;
        end;
      finally
        FreeMem(PropList);
      end;
    end;
var
  i:Integer;
  sValue, sCompName, sName:string;
begin
  sName := oControl.Name;
  for i := 0 to oControl.ComponentCount - 1 do
  begin
    sCompName := oControl.Components[i].Name;
    if (StartsText('lbl', sCompName) Or
        StartsText('rb', sCompName)  Or
        StartsText('rg', sCompName)  Or
        StartsText('ts', sCompNAme) Or
        StartsText('chk', sCompName) Or
        StartsText('btn', sCompName)) then
    begin
      sValue := GetComponentPropertyValue(oControl.Components[i], 'Caption');
      if (sValue <> '') then
        odmPerfiles.GrabarPerfil(sUser, sName, sCompName + '_Caption', sValue );
      sValue := '';
    end;
  end;
end;

function EncontrarObjeto(oControl:TComponent;
                         sBusquedaTipo:String;
                         sNameObject:STring):TObject; overload;
var
  i:Integer;

begin
  Result := nil;
  for i := 0 to oControl.ComponentCount - 1 do
    if oControl.Components[i].ClassName = sBusquedaTipo then
      if oControl.Components[i].Name = sNameObject then
        Result := oControl.Components[i];
end;

procedure GetImageURL(sUrl: String; var memStream: TMemoryStream);
var
  strStream: String;

  //jpegimg: TJPEGImage;
  idhttp1 : Tidhttp;
begin
  idhttp1 := Tidhttp.Create(nil);
  try
   strStream :=  idhttp1.Get(sUrl);

  except
    Raise Exception.Create('La imagen no existe');
    Exit;
  end;
  memStream := TMemoryStream.Create;
  //jpegimg   := TJPEGImage.Create;
  try
    //memStream.CopyFrom(strStream, );
    memStream.Write(strStream[1], Length(strStream));
    memStream.Position := 0;
    //.Picture.Assign(jpegimg);
  finally
    //memStream.Free;
    //jpegimg.Free;
    idhttp1.Free;
  end;
end;

// This example shows how you can encrypt strings
// using special security string.
// You can decode data only if you know security string.
// I suppose, there is no chance to hack security string, using any analyse algorythms.
// Every time you call this function, you will
// have a new result even if all params are constant
// NOTE: Don`t forget to call "Randomize" proc before using this functions.

const
  Codes64 = '0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz+/';

  // you must use this function to generate special
  // security string, which is used in main encode/decode routines.
  // NOTE: you must generate the security string only once and then use it in encode/decode functions.

function GeneratePWDSecurityString: string;
var
  i, x: integer;
  s1, s2: string;
begin
  s1 := Codes64;
  s2 := '';
  for i := 0 to 15 do
  begin
    x  := Random(Length(s1));
    x  := Length(s1) - x;
    s2 := s2 + s1[x];
    s1 := Copy(s1, 1,x - 1) + Copy(s1, x + 1,Length(s1));
  end;
  Result := s2;
end;

// this function generate random string using
// any characters from "CHARS" string and length
// of "COUNT" - it will be used in encode routine
// to add "noise" into your encoded data.

function MakeRNDString(Chars: string; Count: Integer): string;
var
  i, x: integer;
begin
  Result := '';
  for i := 0 to Count - 1 do
  begin
    x := Length(chars) - Random(Length(chars));
    Result := Result + chars[x];
    chars := Copy(chars, 1,x - 1) + Copy(chars, x + 1,Length(chars));
  end;
end;

end.

