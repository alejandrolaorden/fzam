unit inLibFacturas;

interface

uses Uni, System.StrUtils, System.SysUtils;

const
//linea de factura
  fnrofaclin:string = 'NRO_FACTURA_LINEA';
  fserielin:string = 'SERIE_FACTURA_LINEA';
  fnrolin:string = 'LINEA_FACTURA_LINEA';
  fcodart:string = 'CODIGO_ARTICULO_FACTURA_LINEA';
  fcodfam:string = 'CODIGO_FAMILIA_FACTURA_LINEA';
  fnomfam:string = 'NOMBRE_FAMILIA_FACTURA_LINEA';
  ffechentr:string = 'FECHA_ENTREGA_FACTURA_LINEA';
  ftipocant:string = 'TIPO_CANTIDAD_ARTICULO_FACTURA_LINEA';
  fimpcl:string = 'ESIMP_INCL_TARIFA_FACTURA_LINEA';
  ftipiva:string = 'TIPOIVA_ARTICULO_FACTURA_LINEA';
  fdescripcion:string = 'DESCRIPCION_ARTICULO_FACTURA_LINEA';
  fcodtariflin:string = 'CODIGO_TARIFA_FACTURA_LINEA';
  fcant:string = 'CANTIDAD_FACTURA_LINEA';
  fpreciosal:string = 'PRECIOSALIDA_FACTURA_LINEA';
  fpordto:string = 'PORCEN_DTO_FACTURA_LINEA';
  fdto:string = 'PRECIO_DTO_FACTURA_LINEA';
  fpresiva:string = 'PRECIOVENTA_SIVA_ARTICULO_FACTURA_LINEA';
  fporiva:string = 'PORCEN_IVA_FACTURA_LINEA';
  fpreciva:string = 'PRECIOVENTA_CIVA_ARTICULO_FACTURA_LINEA';
  ftotciva:string = 'TOTAL_FACTURA_LINEA';
  ftotsiva:string = 'TOTAL_FACTURASIVA_LINEA';
//factura
  ffechfac:string = 'FECHA_FACTURA';
  fnrofac:string = 'NRO_FACTURA';
  fseriefac:string = 'SERIE_FACTURA';
  fcodemp:string = 'CODIGO_EMPRESA_FACTURA';
  fcodcli:string = 'CODIGO_CLIENTE_FACTURA';
  fporivan:string = 'PORCEN_IVAN_FACTURA';
  ftotivan:string = 'TOTAL_IVAN_FACTURA';
  fporren:string = 'PORCEN_REN_FACTURA';
  ftotren:string = 'TOTAL_REN_FACTURA';
  ftotbasen:string = 'TOTAL_BASEI_IVAN_FACTURA';
  fporivar:string = 'PORCEN_IVAR_FACTURA';
  ftotivar:string = 'TOTAL_IVAR_FACTURA';
  fporrer:string = 'PORCEN_RER_FACTURA';
  ftotrer:string = 'TOTAL_RER_FACTURA';
  ftotbaser:string = 'TOTAL_BASEI_IVAR_FACTURA';
  fporivas:string = 'PORCEN_IVAS_FACTURA';
  ftotivas:string = 'TOTAL_IVAS_FACTURA';
  fporres:string = 'PORCEN_RES_FACTURA';
  ftotres:string = 'TOTAL_RES_FACTURA';
  ftotbases:string = 'TOTAL_BASEI_IVAS_FACTURA';
  fporivae:string = 'PORCEN_IVAE_FACTURA';
  ftotivae:string = 'TOTAL_IVAE_FACTURA';
  fporree:string = 'PORCEN_REE_FACTURA';
  ftotree:string = 'TOTAL_REE_FACTURA';
  ftotbasee:string = 'TOTAL_BASEI_IVAE_FACTURA';
  ftotallifac:string = 'TOTAL_LIQUIDO_FACTURA';
  fporirpf:string = 'PORCEN_RETENCION_FACTURA';
  ftotirpf:string = 'TOTAL_RETENCION_FACTURA';
  ftotimp:string = 'TOTAL_IMPUESTOS_FACTURA';
  ftotbasefac:string = 'TOTAL_BASES_FACTURA';

type

  TLinFac=class
  private
    _unqryLin:TUniQuery;
    _unqryFac:TUniQuery;
    _sImpcl:string;
    _sTipIva:string;
    _dPrecioSal:currency;
    _dPorDto:currency;
    _dDto:currency;
    _dPreSiva:currency;
    _dPreCiva:currency;
    _dPoriva:currency;
    _dCant:currency;
    _dTotCiva:currency;
    _dTotSiva:currency;

    _dPorIvaN:currency;
    _dPorIvaR:currency;
    _dPorIvaS:currency;
    _dPorIvaE:currency;

    function GetPrecioSal: Currency;
    procedure SetPrecioSal(const Value: Currency);
    function GetPorDto: Currency;
    procedure SetPorDto(const Value: Currency);
    function GetDto: Currency;
    procedure SetDto(const Value: Currency);
    function GetPreSiva: Currency;
    procedure SetPreSiva(const Value: Currency);
    function GetPreCiva: Currency;
    procedure SetPreCiva(const Value: Currency);
    function GetCant: Currency;
    procedure SetCant(const Value: Currency);
    function GetPorIva: Currency;
    procedure SetPorIva(const Value: Currency);
    function GetTotCiva: Currency;
    procedure SetTotCiva(const Value: Currency);
    function GetTotSiva: Currency;
    procedure SetTotSiva(const Value: Currency);
    function GetImpcl: String;
    procedure SetImpcl(const Value: String);
    function GetTipoIVa: String;
    procedure SetTipoIva(const Value: String);
  public
    Property PrecioSal:Currency read GetPrecioSal write SetPrecioSal;
    Property PorDto:Currency read GetPorDto write SetPorDto;
    Property Dto:Currency read GetDto write SetDto;
    Property PorIva:Currency read GetPorIva write SetPorIva;
    Property TipoIva:String read GetTipoIVa write SetTipoIva;
    Property PreSiva:Currency read GetPreSiva write SetPreSiva;
    Property PreCiva:Currency read GetPreCiva write SetPreCiva;
    Property Cant:Currency read GetCant write SetCant;
    Property TotCiva:Currency read GetTotCiva write SetTotCiva;
    Property TotSiva:Currency read GetTotSiva write SetTotSiva;
    Property Impcl:String read GetImpcl write SetImpcl;
 public
   constructor Create(unqryLin:TUniQuery); overload;
   constructor Create(unqryLin, unqryFac:TUniQuery); overload;
   Destructor  Destroy; override;
   procedure CopyToDataSetLin;
   procedure CopyToDataSetFac;
   procedure CopyToObjectLin;
   procedure CopyToObjectFac;
   procedure SetInit(unqryLin:TUniQuery);
   procedure CalcularLinea;
  end;
implementation

{ TLinFac }

procedure TLinFac.CalcularLinea;
begin
  if (SameText(_sImpcl, 'S')) then
  begin
    _dPreSiva := _dPreCiva  / (1 + _dPorIva/100);
    _dTotSiva := _dPreSiva * _dCant;
    _dTotCiva := _dPreCiva * _dCant;
    if (_dPrecioSal <> 0) then
    begin
      _dDto := _dPrecioSal  - _dPreCiva;
      _dPorDto := (_dDto / _dPrecioSal)*100;
    end;
  end
  else
  begin
    _dPreCiva := _dPreSiva * (1 + _dPorIva/100);
    _dTotCiva := _dPreCiva * _dCant;
    _dTotSiva := _dPreSiva * _dCant;
    if (_dPrecioSal <> 0) then
    begin
      _dDto := _dPrecioSal  - _dPreSiva;
      _dPorDto := (_dDto / _dPrecioSal)*100;
    end;
  end;
end;

procedure TLinFac.CopyToDataSetFac;
begin
  with _unqryFac do
  begin
  //de momento nada
  end;
end;

procedure TLinFac.CopyToDataSetLin;
begin
  with _unqryLin do
  begin
    FieldByName(fcant).AsFloat := _dCant;
    FieldByName(fpreciosal).AsFloat := _dPrecioSal;
    FieldByName(fPorDto).AsFloat := _dPorDto;
    FieldByName(fDto).AsFloat := _dDto;
    FieldByName(fPreSiva).AsFloat := _dPreSiva;
    FieldByName(fPreCiva).AsFloat := _dPreCiva;
    FieldByName(fPorIva).AsFloat := _dPorIVa;
    FieldByName(fTotCiva).AsFloat := _dTotCiva;
    FieldByName(fTotSiva).AsFloat := _dTotSiva;
    FieldByName(fImpcl).AsString := _sImpcl;
    FieldByName(fTipIVa).AsString := _sTipIva;
  end;
end;

procedure TLinFac.CopyToObjectFac;
begin
  with _unqryFac do
  begin
    _dPorIvaN := FieldByName(fPorIvaN).AsFloat;
    _dPorIvaR := FieldByName(fPorIVAR).AsFloat;
    _dPorIvaS := FieldByName(fPorIVAS).AsFloat;
    _dPorIVAE := FieldByNAme(fPorIVAE).AsFloat;
  end;
end;

procedure TLinFac.CopyToObjectLin;
begin
  with _unqryLin do
  begin
    _dCant :=      FieldByName(fcant).AsFloat;
    _dPrecioSal := FieldByName(fpreciosal).AsFloat;
    _dPorDto :=    FieldByName(fPorDto).AsFloat ;
    _dDto :=       FieldByName(fDto).AsFloat;
    _dPreSiva :=   FieldByName(fPreSiva).AsFloat;
    _dPreCiva :=   FieldByName(fPreCiva).AsFloat;
    _dPorIVa :=    FieldByName(fPorIva).AsFloat;
    _dTotCiva :=   FieldByName(fTotCiva).AsFloat;
    _dTotSiva :=   FieldByName(fTotSiva).AsFloat;
    _sImpcl :=     FieldByName(fImpcl).AsString;
    _sTipIVA :=    FieldByName(fTipIva).AsString;
  end;
end;

constructor TLinFac.Create(unqryLin: TUniQuery);
begin
  _unqryLin := unqryLin;
  Self.CopyToObjectLin;
end;


constructor TLinFac.Create(unqryLin, unqryFac: TUniQuery);
begin
  _unqryLin := unqryLin;
  _unqryFac := unqryFac;
  Self.CopyToObjectLin;
  Self.CopyToObjectFac;
end;

destructor TLinFac.Destroy;
begin
  Self.CalcularLinea;
  Self.CopyToDataSetLin;
  inherited;
end;

function TLinFac.GetCant: Currency;
begin
  Result := _dCant;
end;

function TLinFac.GetDto: Currency;
begin
  Result := _dDto;
end;

function TLinFac.GetImpcl: String;
begin
  Result := _sImpcl;
end;

function TLinFac.GetPorDto: Currency;
begin
  Result := _dPorDto;
end;

function TLinFac.GetPorIva: Currency;
begin
  Result := _dPorIva;
end;

function TLinFac.GetPrecioSal: Currency;
begin
  Result := _dPrecioSal;
end;

function TLinFac.GetPreCiva: Currency;
begin
  Result := _dPreCiva;
end;

function TLinFac.GetPreSiva: Currency;
begin
  Result := _dPreSiva;
end;

function TLinFac.GetTipoIVa: String;
begin
  Result := _sTipIva;
end;

function TLinFac.GetTotCiva: Currency;
begin
  Result := _dTotCiva;
end;

function TLinFac.GetTotSiva: Currency;
begin
  Result := _dTotSiva;
end;

procedure TLinFac.SetCant(const Value: Currency);
begin
  _dCant := Value;
  _dTotSiva := _dCant * _dPreSiva;
  _dTotCiva := _dCant * _dPreCiva;
end;

procedure TLinFac.SetDto(const Value: Currency);
begin
  _dDto := Value;
  if (_dPrecioSal <> 0) then
  begin
    _dPorDto := (_dDto / _dPrecioSal)*100;
    Self.PrecioSal := _dPrecioSal;
  end;
end;

procedure TLinFac.SetPorDto(const Value: Currency);
begin
  _dPorDto := Value;
  Self.Dto := _dPrecioSal*(_dPorDto / 100);
end;

procedure TLinFac.SetPorIva(const Value: Currency);
begin
  _dPorIVa := Value;
end;

procedure TLinFac.SetPrecioSal(const Value: Currency);
var
  dPrecioFinal:Currency;
begin
  _dPrecioSal := Value;
  if (_dPrecioSal <> 0) then
  begin
    dPrecioFinal := _dPrecioSal - _dDto;
    if SameText(Impcl,'S') then
    begin
      Self.PreCiva := dPrecioFinal;
    end
    else
    begin
      Self.PreSiva := dPrecioFinal;
    end;
  end;
end;

procedure TLinFac.SetPreCiva(const Value: Currency);
begin
  _dPreCiva := Value;
end;

procedure TLinFac.SetPreSiva(const Value: Currency);
begin
  _dPreSiva := Value;
end;

procedure TLinFac.SetTipoIva(const Value: String);
var
  dPorcen:Currency;
begin
  _sTipIVa := Value;
  dPorcen := 0;
  with _unqryFac do
  begin
    case IndexStr(_sTipIVA, ['N', 'R', 'S', 'E']) of
      0: dPorcen := FindField('PORCEN_IVAN_FACTURA').AsCurrency;
      1: dPorcen := FindField('PORCEN_IVAR_FACTURA').AsCurrency;
      2: dPorcen := FindField('PORCEN_IVAS_FACTURA').AsCurrency;
      3: dPorcen := FindField('PORCEN_IVAE_FACTURA').AsCurrency;
    end;
  end;
  Self.PorIva := dPorcen;
end;

procedure TLinFac.SetTotCiva(const Value: Currency);
begin
  _dTotCiva := Value;
end;

procedure TLinFac.SetTotSiva(const Value: Currency);
begin
  _dTotSiva := Value;
end;

procedure TLinFac.SetImpcl(const Value: String);
begin
  _sImpcl := Value;
end;

procedure TLinFac.SetInit(unqryLin: TUniQuery);
begin
  _unqryLin := unqryLin;
end;

end.
