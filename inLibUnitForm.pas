{*******************************************************}
{                                                       }
{       FactuZam                                        }
{                                                       }
{       Copyright (C) 2023 Alejandro Laorden Hidalgo    }
{                                                       }
{*******************************************************}

unit inLibUnitForm;

interface

uses
  System.Generics.Defaults, System.Generics.Collections, System.Contnrs,
  Classes, Windows, Forms, Menus, Controls, Uni,   System.SysUtils,
  System.StrUtils, inLibUser, Vcl.Buttons, Types;

type

 TfzaForm = class
   private
     FCall:string;
     FCaption:string;
     FUnitForm:string;
     FMenuItem:string;
     FShortCut:string;
     FmnMenuItem:TMenuItem;
     function GetCall:string;
     procedure SetCall(Value:string);
     function GetCaption:string;
     procedure SetCaption(Value:string);
     function GetUnitForm:string;
     procedure SetUnitForm(Value:string);
     function GetMenuItem:string;
     procedure SetMenuItem(Value:string);
     function GetShortCut:string;
     procedure SetShortCut(Value:string);
     function GetmnMenuItem:TMenuItem;
     procedure SetmnMenuItem(Value:TMenuItem);
   public
     constructor Create(pCall,
                        pCaption,
                        pMenuItem,
                        pUnitForm,
                        pShortCut:string;
                        pOwn:TComponent);
     Property Call   : string read GetCall write SetCall;
     Property Caption   : string read GetCaption write SetCaption;
     Property UnitForm   : string read GetUnitForm write SetUnitForm;
     Property MenuItem   : string read GetMenuItem write SetMenuItem;
     Property mnMenuItem   : TMenuItem read GetmnMenuItem write SetmnMenuItem;
     Property ShortCut     : string read GetShortCut write SetShortCut;
   private
 end;

 TfzaWinF = class(TObject)
 private
   FList:TObjectList<TfzaForm>;
   FOwner:TComponent;
 public
   constructor Create(Owner:TComponent);
   procedure Charge(nConn:TUniConnection);
   function GetElement(sCall:string):TfzaForm;
   function GetShortCutListOrd:TList<integer>;
   function GetShortCutListString:string;
 end;


implementation

uses inMtoPrincipal2;

{ TfzaForm }

constructor TfzaForm.Create(pCall,
                            pCaption,
                            pMenuItem,
                            pUnitForm,
                            pShortCut: string;
                            pOwn:TComponent  );
var
  frmOpen2:TfrmOpenApp2;
begin
  FCall := pCall;
  FCaption := pCaption;
  FUnitForm := pUnitForm;
  FMenuItem := pMenuITem;
  FShortCut := pShortCut;
  frmOpen2 := (pOwn as TfrmOpenApp2);
  FmnMenuItem := (frmOpen2.FindComponent(FMenuITem) as TMenuItem);
end;

function TfzaForm.GetCall: string;
begin
  Result := FCall;
end;

function TfzaForm.GetCaption: string;
begin
  Result := FCaption;
end;

function TfzaForm.GetMenuItem: string;
begin
  Result := FMenuItem;
end;

function TfzaForm.GetmnMenuItem: TMenuItem;
begin
  Result := FmnMenuItem;
end;

function TfzaForm.GetShortCut: string;
begin
  Result := FShortCut;
end;

function TfzaForm.GetUnitForm: string;
begin
  Result := FUnitForm;
end;

procedure TfzaForm.SetCall(Value: string);
begin
  FCall := Value;
end;

procedure TfzaForm.SetCaption(Value: string);
begin
  Fcaption := Value;
end;

procedure TfzaForm.SetMenuItem(Value: string);
begin
  FMenuItem := Value;
end;

procedure TfzaForm.SetmnMenuItem(Value: TMenuItem);
begin
  FmnMenuItem := Value;
end;

procedure TfzaForm.SetShortCut(Value: string);
begin
  FShortCut := Value;
end;

procedure TfzaForm.SetUnitForm(Value: string);
begin
  FUnitForm := Value;
end;

{ TfzaWinF }

procedure TfzaWinF.Charge(nConn: TUniConnection);
var
  qrySol: TUniQuery;
  ozaForm:TfzaForm;
begin
  qrySol := TUniQuery.Create(nil);
  qrySol.Connection := nConn;
  qrySol.SQL.Text := 'SELECT * FROM fza_winforms';
  qrySol.Open;
  while not qrySol.Eof  do
  begin
    With qrySol do
    begin
      ozaForm := TfzaForm.Create(FieldByName('CALL_WINF').AsString,
                                 FieldByName('CAPTION_WINF').AsString,
                                 FieldByName('MENUITEM_WINF').AsString,
                                 FieldByName('UNITF_WINF').AsString,
                                 FieldByName('SHORTCUT_WINF').AsString,
                                 Self.FOwner);
    end;
    FList.Add(ozaForm);
    qrySol.Next;
  end;
  qrySol.Close;
  qrySol.Free;
end;

constructor TfzaWinF.Create(Owner:TComponent);
begin
  FList := TObjectList<TfzaForm>.Create;
  FOwner := Owner;
end;

function TfzaWinF.GetElement(sCall: string): TfzaForm;
var
  ofzaForm:TfzaForm;
begin
  for ofzaForm in FList do
  begin
    if ofzaForm.Call = sCall then
    begin
      Result := ofzaForm;
      Exit;
    end
    else
      Result := nil;
  end;
end;

function TfzaWinF.GetShortCutListOrd: TList<Integer>;
var
  aList:TList<Integer>;
  ofzaForm:TfzaForm;
begin
  aList := TList<Integer>.Create;
  for ofzaForm in FList do
  begin
    if (Length(ofzaForm.ShortCut) = 1) then
      aList.Add(Ord(ofzaForm.ShortCut[1]));
  end;
  Result := aList;
end;

function TfzaWinF.GetShortCutListString: string;
var
  sList:string;
  ofzaForm:TfzaForm;
begin
  sList := '';
  for ofzaForm in FList do
  begin
    if (Length(ofzaForm.ShortCut) = 1) then
      sList := sList + ofzaForm.ShortCut[1] + ' ';
  end;
  Result := sList;
end;

end.
