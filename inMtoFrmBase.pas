{*******************************************************}
{                                                       }
{       FactuZam                                        }
{                                                       }
{       Copyright (C) 2023 Alejandro Laorden Hidalgo    }
{                                                       }
{*******************************************************}

unit inMtoFrmBase;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxClasses, cxLocalization, cxContainer,
  cxEdit, dxSkinsCore, dxSkinsDefaultPainters, cxLookAndFeels, dxSkinsForm,
  dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinDarkRoom,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinHighContrast, dxSkinMetropolis, dxSkinMetropolisDark,
  dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver,
  dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinSeven, dxSkinSevenClassic, dxSkinSharp,
  dxSkinSharpPlus, dxSkinSpringTime, dxSkinTheAsphaltWorld, dxSkinVS2010,
  dxSkinWhiteprint, dxSkinStardust, dxSkinSummer2008,
  dxSkinValentine, dxSkinXmas2008Blue, dxSkinscxPCPainter, dxCore, cxStyles,
  dxSkinBasic, dxSkinCaramel, dxSkinCoffee, dxSkinDarkSide, dxSkinGlassOceans,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinOffice2016Colorful, dxSkinOffice2016Dark, dxSkinOffice2019Black,
  dxSkinOffice2019Colorful, dxSkinOffice2019DarkGray, dxSkinOffice2019White,
  dxSkinPumpkin, dxSkinSilver, dxSkinTheBezier, dxSkinVisualStudio2013Blue,
  dxSkinVisualStudio2013Dark, dxSkinVisualStudio2013Light;

type
  TfrmBase = class(TForm)
    Localizer1: TcxLocalizer;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmBase: TfrmBase;

implementation

{$R *.dfm}
{$R CXLOCALIZATION.res}

procedure TfrmBase.FormCreate(Sender: TObject);
begin
  Localizer1.Locale := 1034;
  Localizer1.Active := True;
end;

{
C�mo heredar un form sin haber pasado por File New Others Inheritance.....
Primero poniendo en la definici�n de la clase, a�adiendo el unit a uses y luego
TFormOtherType = class(InheritedFormType)
y despu�s pasando por el dfm coomo se explica a continuaci�n

https://stackoverflow.com/questions/70742195/
                                    how-to-make-an-old-form-inherit-from-another


Open dfm file in some other text editor and replace object with inherited

object FrmMyForm : TFrmMyForm

to

inherited FrmMyForm : TFrmMyForm

However, Delphi has issues with opening such forms
if they don't belong to the same project. For instance,
if you have base form declared in a package and you are
using it to inherit forms in application or another package.

If you have problem opening such forms, make sure that you first
open base form and then inherited.
}
end.
