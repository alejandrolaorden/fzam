{*******************************************************}
{                                                       }
{       FactuZam                                        }
{                                                       }
{       Copyright (C) 2023 fzam.6dvdy@slmail.me    }
{                                                       }
{*******************************************************}

unit UniDataFacturas;

interface

uses
  SysUtils, Classes,  DB,
   inMtoPrincipal2, DBClient, Provider, frxClass, frxDBSet, inLibUser,
   System.StrUtils, Windows, Dialogs, System.Variants, MemDS, DBAccess, Uni,
   UniDataGen;

type
  TdmFacturas = class(TdmBase)
    dsLinFac: TDataSource;
    dsFacPrint: TDataSource;
    dsLinFacPrint: TDataSource;
    dsSeries: TDataSource;
    fxdsPrintFac: TfrxDBDataset;
    fxdstPrintLinFac: TfrxDBDataset;
    unqryFacPrint: TUniQuery;
    unqryLinFacPrint: TUniQuery;
    unqrySeries: TUniQuery;
    unqryCliDataFac: TUniQuery;
    unqryArtDataLinFac: TUniQuery;
    unqryLinFac: TUniQuery;
    unstrdprcCrearFacturaAbono: TUniStoredProc;
    unstrdprcDuplicarFactura: TUniStoredProc;
    unstrdprcGetContador: TUniStoredProc;
    unstrdprcCrearCliente: TUniStoredProc;
    unstrdprcGetDataArticulo: TUniStoredProc;
    unstrdprcGetDataCliente: TUniStoredProc;
    dsFormasPago: TDataSource;
    unqryFormaPago: TUniQuery;
    dsRecibos: TDataSource;
    unqryRecibos: TUniQuery;
    dsRecibosPrint: TDataSource;
    fxdsRecibos: TfrxDBDataset;
    unqryRecibosPrint: TUniQuery;
    unstrdprcGetRecibos: TUniStoredProc;
    unqryIvas: TUniQuery;
    dsIvas: TDataSource;
    unqryEmpDataFac: TUniQuery;
    unstdCrearEmpresa: TUniStoredProc;
    dsTarifas: TDataSource;
    unqryTarifas: TUniQuery;
    unstdGetContadorLinea: TUniStoredProc;
    unstdCalcularFactura: TUniStoredProc;
    dsSeriesEditCombo: TDataSource;
    unqrySeriesEditCombo: TUniQuery;
    unstrdprcGetContadorFactura: TUniStoredProc;
    unqryIvasTipos: TUniQuery;
    dsIvasTipos: TDataSource;
    dsFactura: TDataSource;
    unqryCabIVA: TUniQuery;
    dsCabIVA: TDataSource;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
    procedure zqryLinFacBeforeInsert(DataSet: TDataSet);
    procedure zqryFacBeforePost(DataSet: TDataSet);
    procedure zqryLinFacAfterPost(DataSet: TDataSet);
    procedure unqryFacAfterPost(DataSet: TDataSet);
    procedure unqryTablaGAfterInsert(DataSet: TDataSet);
    procedure unqryLinFacAfterInsert(DataSet: TDataSet);
    procedure unqryLinFacBeforePost(DataSet: TDataSet);
    procedure unqryTablaGBeforeDelete(DataSet: TDataSet);
    procedure unqryLinFacAfterDelete(DataSet: TDataSet);
public
    procedure GetCodigoAutoFactura;
    procedure GetCodigoAutoCliente;
    procedure GetCodigoAutoEmpresa;
    procedure CrearCliente;
    procedure CrearEmpresa;
    procedure CalcularLinea;
    procedure CalcularRetencionesEmpresa;
    procedure CrearTablaSeries(sEmpresa, sCliente:string; dtFecha:TDateTime);
    procedure CopiarEmpresaaFactura(DataSet:TDataSet);
    procedure CopiarClienteaFactura(DataSet:TDataSet);
    procedure CopiarArticuloaLinea(DataSet:TDataSet);
    function FormaPagoDefault:String;
    function TarifaDefault:string;
    function BuscarCliente(s: string):Boolean;
    procedure AsignarIVA(s:string; unqryT:TUniQuery);
    function GetCodigoGrupoIVAAGricola:Integer;
    function GetUserEmpresaDef:String;
    procedure CalcularFactura;
    function GetTipoIVA(sTipoIVA:string):Integer;
  end;
//var
//  dmFacturas: TdmFacturas;

implementation

uses
  inMtoFacturas, inLibGlobalVar, inLibtb;

{$R *.dfm}

procedure ForceReferenceToClass(C: TClass); begin end;

function TdmFacturas.GetUserEmpresaDef:String;
var
  unqrySol:TUniQuery;
  sResul : String;
begin
  sResul := '';
  if ( ((unqryTablaG.State = dsEdit) or
        (unqryTablaG.State = dsInsert))
     ) then
  begin
    unqrySol := TUniQuery.Create(Self);
    with unqrySol do
    begin
      Connection := oConn;
      SQL.Text := 'SELECT EMPRESADEF_USUARIO ' +
                  '  FROM fza_usuarios ' +
                  ' WHERE USUARIO_USUARIO = :Usuario ';
      ParamByName('Usuario').AsString := oUser;
      Open;
      if RecordCount <> 0 then
      begin
        sResul := FieldByName('EMPRESADEF_USUARIO').AsString;
      end;
      Close;
      FreeAndNil(unqrySol);
    end;
  end;
  Result := sResul;
end;

procedure TdmFacturas.CrearTablaSeries(sEmpresa,
                                       sCliente:string;
                                       dtFecha:TDateTime);
var
  unqrySol:TUniQuery;
begin
  unqrySol := TUniQuery.Create(Self);
  with unqrySol do
  begin
    Connection := inLibGlobalVar.oConn;
    SQL.Text := 'DROP TABLE IF EXISTS tmpfac_comboseries ';
    Execute;
    SQL.Text := 'CREATE TEMPORARY TABLE tmpfac_comboseries       ' +
                'SELECT SERIE_CONTADOR_CLIENTE AS SERIE_CONTADOR ' +
                '  FROM vi_clientes                              ' +
                ' WHERE SERIE_CONTADOR_CLIENTE IS NOT NULL       ' +
                '   AND CODIGO_CLIENTE = :CLIENTE                ' +
                ' UNION                                          ' +
                'SELECT SERIE_SERIE AS SERIE_CONTADOR            ' +
                '  FROM vi_empresas_series                       ' +
                ' WHERE CODIGO_EMPRESA_SERIE = :EMPRESA          ' +
                '   AND (FECHA_DESDE_SERIE <= :FECHA             ' +
                '        AND (FECHA_HASTA_SERIE >= :FECHA        ' +
                '             OR FECHA_HASTA_SERIE IS NULL ))    ' +
                ' UNION                                          ' +
                'SELECT SERIE_CONTADOR AS SERIE_CONTADOR         ' +
                '  FROM vi_contadores                            ' +
                ' WHERE ACTIVO_CONTADOR =' + QuotedStr('S') +
                '   AND EMPRESA_CONTADOR = :EMPRESA     ';
    Params.ParamByName('EMPRESA').AsSTring := sEmpresa;
    Params.ParamByName('FECHA').AsDateTime := dtFecha;
    Params.ParamByName('CLIENTE').AsString := sCliente;
    Execute;
    FreeAndNil(unqrySol);
    if unqrySeriesEditCombo.Active then
      unqrySeriesEditCombo.Close;
    unqrySeriesEditCombo.Open;
  end;
end;

procedure TdmFacturas.AsignarIVA(s:string; unqryT:TUniQuery);
var
  unqrySol:TUniQuery;
begin
  if ( (s <> '') ) then
  begin
    unqrySol := TUniQuery.Create(Self);
    with unqrySol do
    begin
      Connection := inLibGlobalVar.oConn;
      SQL.Text :=  'SELECT * FROM vi_ivas ' +
                   ' WHERE GRUPO_ZONA_IVA = :grupo ' +
                   '   AND FECHA_DESDE_IVA <= :fecha_ini ' +
                   '   AND (    FECHA_HASTA_IVA >= :fecha_fin ' +
                   '         OR FECHA_HASTA_IVA IS NULL)';
      ParamByName('grupo').AsString := s;
      ParamByName('fecha_ini').AsDateTime :=
                              unqryT.FieldByName('FECHA_FACTURA').AsDateTime;
      ParamByName('fecha_fin').AsDateTime :=
                              unqryT.FieldByName('FECHA_FACTURA').AsDateTime;
      Open;
      if (unqrySol.RecordCount > 0) then
      begin
         unqryT.FindField('PORCEN_IVAN_FACTURA').AsString :=
                              FieldByName('PORCENNORMAL_IVA').AsString;
         unqryT.FindField('PORCEN_REN_FACTURA').AsString :=
                              FieldByName('PORCENNORMAL_RE_IVA').AsString;
         unqryT.FindField('PORCEN_IVAR_FACTURA').AsString :=
                              FieldByName('PORCENREDUCIDO_IVA').AsString;
         unqryT.FindField('PORCEN_RER_FACTURA').AsString :=
                              FieldByName('PORCENREDUCIDO_RE_IVA').AsString;
         unqryT.FindField('PORCEN_IVAS_FACTURA').AsString :=
                              FieldByName('PORCENSUPERREDUCIDO_IVA').AsString;
         unqryT.FindField('PORCEN_RES_FACTURA').AsString :=
                             FieldByName('PORCENSUPERREDUCIDO_RE_IVA').AsString;
         unqryT.FindField('PORCEN_IVAE_FACTURA').AsString :=
                              FieldByName('PORCENEXENTO_IVA').AsString;
         unqryT.FindField('PORCEN_REE_FACTURA').AsString :=
                              FieldByName('PORCENEXENTO_RE_IVA').AsString;
         unqryT.FindField('ESIRPF_IMP_INCL_ZONA_IVA_FACTURA').AsString :=
                              FieldByName('ESIRPF_IMP_INCL_ZONA_IVA').AsString;
         unqryT.FindField('ESAPLICA_RE_ZONA_IVA_FACTURA').AsString :=
                              FieldByName('ESAPLICA_RE_ZONA_IVA').AsString;
         unqryT.FindField('CODIGO_IVA_FACTURA').AsString :=
                              FieldByName('CODIGO_IVA').AsString;
         unqryT.FindField('ESIVAAGRICOLA_ZONA_IVA_FACTURA').AsString :=
                              FieldByName('ESIVAAGRICOLA_ZONA_IVA').AsString;
         unqryT.FindField('PALABRA_REPORTS_ZONA_IVA_FACTURA').AsString :=
                              FieldByName('PALABRA_REPORTS_ZONA_IVA').AsString;
         Close;
         FreeAndNil(unqrySol);
      end;
    end;
  end;
end;

function TdmFacturas.BuscarCliente(s: string):Boolean;
var
  unqrySol:TUniQuery;
begin
  unqrySol := TUniQuery.Create(Self);
  unqrySol.Connection := inLibGlobalVar.oConn;
  unqrySol.SQL.Text := 'SELECT * FROM fza_clientes ' +
                       ' WHERE CODIGO_CLIENTE = :cliente';
  unqrySol.ParamByName('cliente').AsString := s;
  unqrySol.Open;
  if unqrySol.RecordCount = 0 then
  begin
    Result := False;
  end
  else
  begin
    CopiarClienteaFactura(unqrySol);
    Result := True;
  end;
  unqrySol.Close;
  FreeAndNil(unqrySol);
end;

procedure TdmFacturas.CalcularFactura;
begin
  with unstdCalcularFactura do
  begin
   ParamByName('pSERIE_FACTURA').AsString :=
      unqryTablaG.FieldByName('SERIE_FACTURA').AsString;
   ParamByName('pNRO_FACTURA').AsString :=
      unqryTablaG.FieldByName('NRO_FACTURA').AsString;
   ExecProc;
  end;
end;

procedure TdmFacturas.CalcularLinea;
begin
  with dsLinFac.DataSet do
  begin
    if ((State = dsInsert) or
        (State = dsEdit)) then
    begin
      FindField('TOTAL_FACTURA_LINEA').AsCurrency :=
                                FindField('CANTIDAD_FACTURA_LINEA').AsCurrency *
                FindField('PRECIOVENTA_CIVA_ARTICULO_FACTURA_LINEA').AsCurrency;
    end;
  end;
end;

procedure TdmFacturas.CalcularRetencionesEmpresa;
var
  unqrySol:TUniQuery;
begin
  with unqryTablaG do
  begin
    unqrySol := TUniQuery.Create(Self);
    unqrySol.Connection := inLibGlobalVar.oConn;
    unqrySol.SQL.Text := 'SELECT * '+
                         '  FROM fza_empresas_retenciones ' +
                         ' WHERE CODIGO_EMPRESA_RETENCION = :empresa ' +
                         '   AND FECHA_DESDE_RETENCION <= :fecha ' +
                         '   AND (    FECHA_HASTA_RETENCION >= :fecha ' +
                         '         OR FECHA_HASTA_RETENCION IS NULL)' +
                         ' LIMIT 1';
    unqrySol.ParamByName('empresa').AsString :=
                                   FindField('CODIGO_EMPRESA_FACTURA').AsString;
    unqrySol.ParamByName('fecha').AsDateTime :=
                                        FieldByName('FECHA_FACTURA').AsDateTime;
    unqrySol.Open;
    if (unqrySol.RecordCount = 0) then
      Sleep(0)
    else
      if (FindField('PORCEN_RETENCION_FACTURA').AsFloat = 0) then
        FindField('PORCEN_RETENCION_FACTURA').AsFloat :=
                        unqrySol.FindField('PORCENRETENCION_RETENCION').AsFloat;
    unqrySol.Close;
    FreeAndNil(unqrySol);
  end;
end;

procedure TdmFacturas.CopiarArticuloaLinea(DataSet: TDataSet);
var
  sPpTipoIVA:string;
  fPorcen:Currency;
  iPorcen:Integer;
begin
  with dsLinFac.Dataset do
  begin
     if ( (dsLinFac.DataSet.State <> dsEdit) and
          (dsLinFac.DataSet.State <> dsInsert)
        ) then
       dsLinFac.DataSet.Edit;
     FindField('CODIGO_ARTICULO_FACTURA_LINEA').AsString :=
                         DataSet.FindField('CODIGO_ARTICULO').AsString;
     FindField('TIPO_CANTIDAD_ARTICULO_FACTURA_LINEA').AsString :=
                         DataSet.FindField('TIPO_CANTIDAD_ARTICULO').AsString;
     FindField('DESCRIPCION_ARTICULO_FACTURA_LINEA').AsString :=
                         DataSet.FindField('DESCRIPCION_ARTICULO').AsString;
     FindField('TIPOIVA_ARTICULO_FACTURA_LINEA').AsString :=
                         DataSet.FindField('TIPOIVA_ARTICULO').AsString;
     sPpTipoIVA :=  DataSet.FindField('TIPOIVA_ARTICULO').AsString;
     iPorcen := 0;
      case IndexStr(sPpTipoIVA, ['N', 'R', 'S', 'E']) of
         0: iPorcen := unqryTablaG.FindField('PORCEN_IVAN_FACTURA').AsInteger;
         1: iPorcen := unqryTablaG.FindField('PORCEN_IVAR_FACTURA').AsInteger;
         2: iPorcen := unqryTablaG.FindField('PORCEN_IVAS_FACTURA').AsInteger;
         3: iPorcen := unqryTablaG.FindField('PORCEN_IVAE_FACTURA').AsInteger;
      end;
     fPorcen := iPorcen / 100;
     FindField('ESIMP_INCL_TARIFA_FACTURA_LINEA').AsString :=
            unqryTablaG.FindField('ESIMP_INCL_TARIFA_CLIENTE_FACTURA').AsString;

     if  DataSet.FindField('ESIMP_INCL_TARIFA').AsString = 'S' then
     begin
       FindField('PRECIOVENTA_CIVA_ARTICULO_FACTURA_LINEA').AsString :=
                         DataSet.FindField('PRECIOFINAL_TARIFA').AsString;
       FindField('PRECIOVENTA_SIVA_ARTICULO_FACTURA_LINEA').AsFloat :=
             (DataSet.FindField('PRECIOFINAL_TARIFA').AsFloat / (1+ (fPorcen)));
     end
     else
     begin
       FindField('PRECIOVENTA_SIVA_ARTICULO_FACTURA_LINEA').AsString :=
                               DataSet.FindField('PRECIOFINAL_TARIFA').AsString;
       FindField('PRECIOVENTA_CIVA_ARTICULO_FACTURA_LINEA').AsFloat :=
              (DataSet.FindField('PRECIOFINAL_TARIFA').AsFloat * (1 + fPorcen));
     end;
     CalcularLinea;
  end;
end;

procedure TdmFacturas.CopiarClienteaFactura(DataSet:TDataSet);
begin
    with unqryTablaG do
  begin
    if ((State <> dsEdit) and (State <> dsInsert)) then
      Edit;
    FindField('CODIGO_CLIENTE_FACTURA').AsString :=
                   DataSet.FindField('CODIGO_CLIENTE').AsString;
    FindField('RAZONSOCIAL_CLIENTE_FACTURA').AsString :=
                   DataSet.FindField('RAZONSOCIAL_CLIENTE').AsString;
    FindField('NIF_CLIENTE_FACTURA').AsString :=
                   DataSet.FindField('NIF_CLIENTE').AsString;
    FindField('MOVIL_CLIENTE_FACTURA').AsString :=
                   DataSet.FindField('MOVIL_CLIENTE').AsString;
    FindField('EMAIL_CLIENTE_FACTURA').AsString :=
                   DataSet.FindField('EMAIL_CLIENTE').AsString;
    FindField('DIRECCION1_CLIENTE_FACTURA').AsString :=
                   DataSet.FindField('DIRECCION1_CLIENTE').AsString;
    FindField('DIRECCION2_CLIENTE_FACTURA').AsString :=
                   DataSet.FindField('DIRECCION2_CLIENTE').AsString;
    FindField('POBLACION_CLIENTE_FACTURA').AsString :=
                   DataSet.FindField('POBLACION_CLIENTE').AsString;
    FindField('PROVINCIA_CLIENTE_FACTURA').AsString :=
                   DataSet.FindField('PROVINCIA_CLIENTE').AsString;
    FindField('CPOSTAL_CLIENTE_FACTURA').AsString :=
                   DataSet.FindField('CPOSTAL_CLIENTE').AsString;
    FindField('PAIS_CLIENTE_FACTURA').AsString :=
                   DataSet.FindField('PAIS_CLIENTE').AsString;
    FindField('ESIVA_RECARGO_CLIENTE_FACTURA').AsString :=
                   DataSet.FindField('ESIVA_RECARGO_CLIENTE').AsString;
    FindField('ESIVA_EXENTO_CLIENTE_FACTURA').AsString :=
                   DataSet.FindField('ESIVA_EXENTO_CLIENTE').AsString;
    FindField('ESREGIMENESPECIALAGRICOLA_CLIENTE_FACTURA').AsString :=
                DataSet.FindField('ESREGIMENESPECIALAGRICOLA_CLIENTE').AsString;
    FindField('ESRETENCIONES_CLIENTE_FACTURA').AsString :=
                   DataSet.FindField('ESRETENCIONES_CLIENTE').AsString;
    FindField('ESINTRACOMUNITARIO_CLIENTE_FACTURA').AsString :=
                   DataSet.FindField('ESINTRACOMUNITARIO_CLIENTE').AsString;
    if ( DataSet.FindField('CODIGO_FORMA_PAGO_CLIENTE').AsString <> '' ) then
    begin
      FindField('FORMA_PAGO_FACTURA').AsString :=
                   DataSet.FindField('CODIGO_FORMA_PAGO_CLIENTE').AsString;
    end
    else
      FindField('FORMA_PAGO_FACTURA').AsString := FormapagoDefault;
    if (unqryTablaG.State = dsInsert) then
    begin
      if ( (DataSet.FieldByName('TARIFA_ARTICULO_CLIENTE').AsString <> '') or
           (DataSet.FieldByName('TARIFA_ARTICULO_CLIENTE').IsNull)
      ) then
      begin
        FindField('TARIFA_ARTICULO_CLIENTE_FACTURA').AsString :=
                        DataSet.FindField('TARIFA_ARTICULO_CLIENTE').AsString;
      end
      else
        FindField('TARIFA_ARTICULO_CLIENTE_FACTURA').AsString := TarifaDefault;
      if (FindField('TARIFA_ARTICULO_CLIENTE_FACTURA').AsString <> '') then
      begin
        unqryTarifas.Locate('CODIGO_TARIFA',
                  FindField('TARIFA_ARTICULO_CLIENTE_FACTURA').AsString, [] );
        FindField('ESIMP_INCL_TARIFA_CLIENTE_FACTURA').AsString :=
                           unqryTarifas.FindField('ESIMP_INCL_TARIFA').ASString;
      end;
    end;
    if (FindField('ESRETENCIONES_CLIENTE_FACTURA').AsString <> 'S') then
      unqryTablaG.FindField('PORCEN_RETENCION_FACTURA').AsFloat := 0;
    if (State = dsInsert) then
      (Self.Owner as TfrmMtoFacturas).ActualizarComboSeries;
  end;
end;

procedure TdmFacturas.CopiarEmpresaaFactura(DataSet:TDataSet);
begin
  with unqryTablaG do
  begin
      if ((State <> dsEdit) and (State <> dsInsert)) then
        Edit;
      FindField('CODIGO_EMPRESA_FACTURA').AsString :=
                     Dataset.FindField('CODIGO_EMPRESA').AsString;
      FindField('RAZONSOCIAL_EMPRESA_FACTURA').AsString :=
                     DataSet.FindField('RAZONSOCIAL_EMPRESA').AsString;
      FindField('NIF_EMPRESA_FACTURA').AsString :=
                     DataSet.FindField('NIF_EMPRESA').AsString;
      FindField('MOVIL_EMPRESA_FACTURA').AsString :=
                     DataSet.FindField('MOVIL_EMPRESA').AsString;
      FindField('EMAIL_EMPRESA_FACTURA').AsString :=
                     DataSet.FindField('EMAIL_EMPRESA').AsString;
      FindField('DIRECCION1_EMPRESA_FACTURA').AsString :=
                     DataSet.FindField('DIRECCION1_EMPRESA').AsString;
      FindField('DIRECCION2_EMPRESA_FACTURA').AsString :=
                     DataSet.FindField('DIRECCION2_EMPRESA').AsString;
      FindField('POBLACION_EMPRESA_FACTURA').AsString :=
                     DataSet.FindField('POBLACION_EMPRESA').AsString;
      FindField('PROVINCIA_EMPRESA_FACTURA').AsString :=
                     DataSet.FindField('PROVINCIA_EMPRESA').AsString;
      FindField('CPOSTAL_EMPRESA_FACTURA').AsString :=
                     DataSet.FindField('CPOSTAL_EMPRESA').AsString;
      FindField('PAIS_EMPRESA_FACTURA').AsString :=
                     DataSet.FindField('PAIS_EMPRESA').AsString;
      FindField('GRUPO_ZONA_IVA_EMPRESA_FACTURA').AsString :=
                     DataSet.FindField('GRUPO_ZONA_IVA_EMPRESA').AsString;
      FindField('ESRETENCIONES_EMPRESA_FACTURA').AsString :=
                     DataSet.FindField('ESRETENCIONES_EMPRESA').AsString;
      FindField('ESREGIMENESPECIALAGRICOLA_EMPRESA_FACTURA').AsString :=
                DataSet.FindField('ESREGIMENESPECIALAGRICOLA_EMPRESA').AsString;
      FindField('TEXTO_LEGAL_FACTURA_EMPRESA_FACTURA').AsString :=
                      DataSet.FindField('TEXTO_LEGAL_FACTURA_EMPRESA').AsString;
      if (DataSet.FindField('ESRETENCIONES_EMPRESA').AsString = 'S') then
      begin
        CalcularRetencionesEmpresa;
      end;
     if (State = dsInsert) then
       (Self.Owner as TfrmMtoFacturas).ActualizarComboSeries;
   end;
end;

procedure TdmFacturas.CrearCliente;
begin
    with unstrdprcCrearCliente do
    begin
      ParamByName('pCODIGO_CLIENTE').AsString :=
                    unqryTablaG.FieldByName('CODIGO_CLIENTE_FACTURA').AsString;
      ParamByName('pRAZONSOCIAL_CLIENTE').AsString :=
                unqryTablaG.FieldByName('RAZONSOCIAL_CLIENTE_FACTURA').AsString;
      ParamByName('pNIF_CLIENTE').AsString :=
                    unqryTablaG.FieldByName('NIF_CLIENTE_FACTURA').AsString;
      ParamByName('pMOVIL_CLIENTE').AsString :=
                      unqryTablaG.FieldByName('MOVIL_CLIENTE_FACTURA').AsString;
      ParamByName('pEMAIL_CLIENTE').AsString :=
                      unqryTablaG.FieldByName('EMAIL_CLIENTE_FACTURA').AsString;
      ParamByName('pDIRECCION1_CLIENTE').AsString :=
                 unqryTablaG.FieldByName('DIRECCION1_CLIENTE_FACTURA').AsString;
      ParamByName('pDIRECCION2_CLIENTE').AsString :=
                 unqryTablaG.FieldByName('DIRECCION2_CLIENTE_FACTURA').AsString;
      ParamByName('pPOBLACION_CLIENTE').AsString :=
                  unqryTablaG.FieldByName('POBLACION_CLIENTE_FACTURA').AsString;
      ParamByName('pPROVINCIA_CLIENTE').AsString :=
                  unqryTablaG.FieldByName('PROVINCIA_CLIENTE_FACTURA').AsString;
      ParamByName('pCPOSTAL_CLIENTE').AsString :=
                    unqryTablaG.FieldByName('CPOSTAL_CLIENTE_FACTURA').AsString;
      ParamByName('pPAIS_CLIENTE').AsString :=
                       unqryTablaG.FieldByName('PAIS_CLIENTE_FACTURA').AsString;
      ParamByName('pESINTRACOMUNITARIO_CLIENTE').AsString :=
         unqryTablaG.FieldByName('ESINTRACOMUNITARIO_CLIENTE_FACTURA').AsString;
      ParamByName('pESIVA_EXENTO_CLIENTE').AsString :=
               unqryTablaG.FieldByName('ESIVA_EXENTO_CLIENTE_FACTURA').AsString;
      ParamByName('pESRETENCIONES_CLIENTE').AsString :=
              unqryTablaG.FieldByName('ESRETENCIONES_CLIENTE_FACTURA').AsString;
      ParamByName('pESIVA_RECARGO_CLIENTE').AsString :=
              unqryTablaG.FieldByName('ESIVA_RECARGO_CLIENTE_FACTURA').AsString;
      ParamByName('pESREGIMENESPECIALAGRICOLA_CLIENTE').AsString :=
  unqryTablaG.FieldByName('ESREGIMENESPECIALAGRICOLA_CLIENTE_FACTURA').AsString;
      ParamByName('pTARIFA_ARTICULO_CLIENTE').AsString :=
            unqryTablaG.FieldByName('TARIFA_ARTICULO_CLIENTE_FACTURA').AsString;
      ParamByName('pUSUARIO').AsString := oUser;
      ParamByName('pINSTANTEMODIF').AsDateTime := Now;
    end;
    unstrdprcCrearCliente.ExecProc;
end;

procedure TdmFacturas.CrearEmpresa;
begin
    with unstdCrearEmpresa do
    begin
      ParamByName('pCODIGO_EMPRESA').AsString :=
                     unqryTablaG.FieldByName('CODIGO_EMPRESA_FACTURA').AsString;
      ParamByName('pRAZONSOCIAL_EMPRESA').AsString :=
                unqryTablaG.FieldByName('RAZONSOCIAL_EMPRESA_FACTURA').AsString;
      ParamByName('pNIF_EMPRESA').AsString :=
                        unqryTablaG.FieldByName('NIF_EMPRESA_FACTURA').AsString;
      ParamByName('pMOVIL_EMPRESA').AsString :=
                      unqryTablaG.FieldByName('MOVIL_EMPRESA_FACTURA').AsString;
      ParamByName('pEMAIL_EMPRESA').AsString :=
                      unqryTablaG.FieldByName('EMAIL_EMPRESA_FACTURA').AsString;
      ParamByName('pDIRECCION1_EMPRESA').AsString :=
                 unqryTablaG.FieldByName('DIRECCION1_EMPRESA_FACTURA').AsString;
      ParamByName('pDIRECCION2_EMPRESA').AsString :=
                 unqryTablaG.FieldByName('DIRECCION2_EMPRESA_FACTURA').AsString;
      ParamByName('pPOBLACION_EMPRESA').AsString :=
                  unqryTablaG.FieldByName('POBLACION_EMPRESA_FACTURA').AsString;
      ParamByName('pPROVINCIA_EMPRESA').AsString :=
                  unqryTablaG.FieldByName('PROVINCIA_EMPRESA_FACTURA').AsString;
      ParamByName('pCPOSTAL_EMPRESA').AsString :=
                    unqryTablaG.FieldByName('CPOSTAL_EMPRESA_FACTURA').AsString;
      ParamByName('pPAIS_EMPRESA').AsString :=
                       unqryTablaG.FieldByName('PAIS_EMPRESA_FACTURA').AsString;
      ParamByName('pRETENCIONES_EMPRESA').AsString :=
              unqryTablaG.FieldByName('ESRETENCIONES_EMPRESA_FACTURA').AsString;
      ParamByName('pREGIMENESPECIALAGRICOLA_EMPRESA').AsString :=
  unqryTablaG.FieldByName('ESREGIMENESPECIALAGRICOLA_EMPRESA_FACTURA').AsString;
      ParamByName('pGRUPO_ZONA_IVA_EMPRESA').AsString :=
             unqryTablaG.FieldByName('GRUPO_ZONA_IVA_EMPRESA_FACTURA').AsString;
      ParamByName('pUSUARIO').AsString := oUser;
      ParamByName('pINSTANTEMODIF').AsDateTime := Now;
    end;
    unstdCrearEmpresa.ExecProc;
end;

procedure TdmFacturas.DataModuleCreate(Sender: TObject);
begin
  inherited;
  unqryPerfiles.Connection := inLibGlobalVar.oConn;
  unqryTablaG.Connection := inLibGlobalVar.oConn;
  unqryLinFac.Connection := inLibGlobalVar.oConn;
  unqrySeries.Connection := inLibGlobalVar.oConn;
  unqryIvas.Connection := inLibGlobalVar.oConn;
  unqryRecibos.Connection := inLibGlobalVar.oConn;
  unqryEmpDataFac.Connection := inLibGlobalVar.oConn;
  unqryCliDataFac.Connection := inLibGlobalVar.oConn;
  unqryArtDataLinFac.Connection := inLibGlobalVar.oConn;
  unqryTarifas.Connection := inLibGlobalVar.oConn;
  unstrdprcCrearCliente.Connection := inLibGlobalVar.oConn;
  unstdCrearEmpresa.Connection := inLibGlobalVar.oConn;
  unqryFormaPago.Connection := inLibGlobalVar.oConn;
  unstrdprcGetContadorFactura.Connection := inLibGlobalVar.oConn;
  unstrdprcGetContador.Connection := inLibGlobalVar.oConn;
  unstdGetContadorLinea.Connection := inLibGlobalVar.oConn;
  unstdCalcularFactura.Connection := inLibGlobalVar.oConn;
  unstrdprcGetDataCliente.Connection := inLibGlobalVar.oConn;
  unstrdprcGetRecibos.Connection := inLibGlobalVar.oConn;
  unqryRecibosPrint.Connection := inLibGlobalVar.oConn;
  unqrySeriesEditCombo.Connection := inLibGlobalVar.oConn;
  unqryIvasTipos.Connection := inLibGlobalVar.oConn;
  unqryCabIVA.Connection := inlibGlobalVar.oConn;
  unqryCabIVA.MasterSource := (Self.Owner as TfrmMtoFacturas).dsTablaG;
  unqryLinfac.MasterSource := (Self.Owner as TfrmMtoFacturas).dsTablaG;
  unqryRecibos.MasterSource := (Self.Owner as TfrmMtoFacturas).dsTablaG;
  unqryCabIVA.Open;
  unqryIvasTipos.Open;
  unqryLinFac.Open;
  unqrySeries.Open;
  unqryIvas.Open;
  unqryFormaPago.Open;
  unqryTarifas.Open;
  unqryRecibos.Open;
end;

procedure TdmFacturas.DataModuleDestroy(Sender: TObject);
begin
  inherited;
  unqryLinFac.Close;
  unqryIvas.Close;
  unqryTarifas.Close;
  unqrySeries.Close;
  unqryFormaPago.Close;
  unqryPerfiles.Close;
  unqryRecibos.Close;
  unqrySeriesEditCombo.Close;
  unqryCabIVA.Close;
end;

function TdmFacturas.FormaPagoDefault: String;
var
  sFormaPago: string;
   LocateSuccess: Boolean;
begin
  LocateSuccess := unqryFormaPago.Locate('ESDEFAULT_FORMAPAGO', 'S', []);
  sFormaPago := unqryFormaPago.FindField('CODIGO_FORMAPAGO').AsString;
  if LocateSuccess then
    Result := sFormaPago
  else
    Result := '';
end;

function TdmFacturas.GetCodigoGrupoIVAAGricola: Integer;
var
  qryIVAAG : TUniQuery;
  iResul:Integer;
begin
  qryIVAAG := TUniQuery.Create(Self);
  with qryIVAAG do
  begin
    Connection := inLibGlobalVar.oConn;
        SQL.Text := 'SELECT GRUPO_ZONA_IVA ' +
                    '  FROM vi_ivas_empresa ' +
                    ' WHERE ESIVAAGRICOLA_ZONA_IVA = ' + QuotedStr('S') +
                    '   AND CODIGO_EMPRESA = :pEMPRESA ' +
							     	'	  AND FECHA_DESDE_IVA <= :pFECHA '     +
							      '	  AND (FECHA_HASTA_IVA IS NULL  '   +
							     	'	      OR FECHA_HASTA_IVA > :pFECHA)'+
                    ' LIMIT 1;'  ;
        ParamByName('pFECHA').AsDateTime :=
                            unqryTablaG.FieldByName('FECHA_FACTURA').AsDateTime;
        ParamByName('pEMPRESA').AsString :=
                     unqryTablaG.FieldByName('CODIGO_EMPRESA_FACTURA').AsString;
    Open;
    if (qryIVAAG.RecordCount > 0) then
      iResul := Fields[0].AsInteger
    else
    begin
        Close;
        SQL.Text := 'SELECT GRUPO_ZONA_IVA ' +
                    '  FROM vi_ivas_empresa ' +
                    ' WHERE ESIVAAGRICOLA_ZONA_IVA = ' + QuotedStr('S') +
                    '   AND ESDEFAULT_ZONA_IVA = ' + QuotedStr('S') +
							      '  	AND FECHA_DESDE_IVA <= :pFECHA '     +
							      '		AND ( FECHA_HASTA_IVA IS NULL  '   +
								    '		       OR FECHA_HASTA_IVA > :pFECHA)'+
                    ' LIMIT 1;'  ;
        ParamByName('pFECHA').AsDateTime :=
                            unqryTablaG.FieldByName('FECHA_FACTURA').AsDateTime;
       Open;
       iResul := Fields[0].AsInteger;
    end;
    Close;
    FreeAndNil(qryIVAAG);
  end;
  Result := iResul;
end;

function TdmFacturas.GetTipoIVA(sTipoIVA: string): Integer;
var
  iPorcen:Integer;
begin
  with dmmFacturas.unqryTablaG do
  begin
  case IndexStr(sTipoIVA, ['N', 'R', 'S', 'E']) of
    0: iPorcen := FindField('PORCEN_IVAN_FACTURA').AsInteger;
    1: iPorcen := FindField('PORCEN_IVAR_FACTURA').AsInteger;
    2: iPorcen := FindField('PORCEN_IVAS_FACTURA').AsInteger;
    3: iPorcen := FindField('PORCEN_IVAE_FACTURA').AsInteger;
    else
    begin
      ShowMessage('Tipo de Iva incorrecto');
      iPorcen := unqryLinFac.FindField('PORCEN_IVAN_FACTURA').AsInteger;
      unqryLinFac.FindField('TIPOIVA_ARTICULO_FACTURA_LINEA').AsString := 'N';
    end;
  end;
  end;
  Result := iPorcen;
end;

procedure TdmFacturas.GetCodigoAutoFactura;
begin
  if (unqryTablaG.FindField('NRO_FACTURA').AsString = '0') then
  begin
    with unstrdprcGetContadorFactura do
    begin
      Params.Clear;
      Params.CreateParam(ftString, 'pserie', ptInput);
      Params.CreateParam(ftString, 'ptipodoc', ptInput);
      Params.CreateParam(ftString, 'pcont', ptOutput);
      Params.CreateParam(ftString, 'pEMPRESA_CONTADOR', ptInput);
      Params.CreateParam(ftString, 'pUSUARIOMODIF', ptInput);
      ParamByName('pserie').AsString :=
                                unqryTablaG.FindField('SERIE_FACTURA').AsString;
      ParamByName('ptipodoc').AsString :=  'FC';
      ParamByName('pUSUARIOMODIF').AsString := oUser;
      ParamByName('pEMPRESA_CONTADOR').AsString :=
                       unqryTablaG.FindField('CODIGO_EMPRESA_FACTURA').AsString;
      ExecProc;
      unqryTablaG.FindField('NRO_FACTURA').AsString :=
                                                  ParamByName('pcont').AsString;
    end;
  end;
end;

procedure TdmFacturas.GetCodigoAutoCliente;
begin
  if (unqryTablaG.FindField('CODIGO_CLIENTE_FACTURA').AsString = '0') then
  begin
    //bEsNuevoCliente := True;
    with unstrdprcGetContador do
    begin
      Params.Clear;
      Params.CreateParam(ftString, 'ptipodoc', ptInput);
      Params.CreateParam(ftInteger, 'pcont', ptOutput);
      Params.CreateParam(ftString, 'pUSUARIOMODIF', ptInput);
      ParamByName('pUSUARIOMODIF').AsString := oUser;
      ParamByName('ptipodoc').AsString :=  'CL';
      ExecProc;
      unqryTablaG.FindField('CODIGO_CLIENTE_FACTURA').AsString :=
                                                  ParamByName('pcont').AsString;
    end;
  end;
end;

function TdmFacturas.TarifaDefault: string;
begin
  unqryTarifas.Locate('DEFAULT_TARIFA', 'S', []);
  Result := unqryFormaPago.FindField('CODIGO_TARIFA').AsString;
end;

procedure TdmFacturas.GetCodigoAutoEmpresa;
begin
  if unqryTablaG.FindField('CODIGO_EMPRESA_FACTURA').AsString = '0' then
  begin
    with unstrdprcGetContador do
    begin
      Params.Clear;
      Params.CreateParam(ftString, 'ptipodoc', ptInput);
      Params.CreateParam(ftInteger, 'pcont', ptOutput);
      Params.CreateParam(ftString, 'pUSUARIOMODIF', ptInput);
      ParamByName('ptipodoc').AsString :=  'EM';
      ParamByName('pUSUARIOMODIF').AsString := oUser;
      ExecProc;
      unqryTablaG.FindField('CODIGO_EMPRESA_FACTURA').AsString :=
                                                  ParamByName('pcont').AsString;
    end;
  end;
end;

procedure TdmFacturas.unqryFacAfterPost(DataSet: TDataSet);
begin
  CalcularFactura;
  unqryTablaG.Refresh;
  unqryLinFac.Refresh;
end;

procedure TdmFacturas.unqryLinFacAfterDelete(DataSet: TDataSet);
begin
  inherited;
  CalcularLinea;
  unqryTablaG.Refresh;
end;

procedure TdmFacturas.unqryLinFacAfterInsert(DataSet: TDataSet);
begin
  inherited;
  with unqryLinFac do
  begin
    FieldByName('CANTIDAD_FACTURA_LINEA').AsString := '1';
    FieldByName('TIPO_CANTIDAD_ARTICULO_FACTURA_LINEA').AsString := 'Uds.';
    FieldByName('TOTAL_FACTURA_LINEA').AsString := '0';
    FieldByName('TIPOIVA_ARTICULO_FACTURA_LINEA').AsString := 'N';
    FindField('PORCEN_IVA_FACTURA_LINEA').AsInteger := GetTipoIVA('N');
    FieldByName('ESIMP_INCL_TARIFA_FACTURA_LINEA').AsString :=
         unqryTablaG.FieldByName('ESIMP_INCL_TARIFA_CLIENTE_FACTURA').AsString;
    FindField('LINEA_FACTURA_LINEA').AsString := '0';
   end;
end;

procedure TdmFacturas.unqryLinFacBeforePost(DataSet: TDataSet);
var
  sTipoIVA:String;
begin
  inherited;
  with unqryLinFac do
  begin
    sTipoIVA := FieldByName('TIPOIVA_ARTICULO_FACTURA_LINEA').AsString;
    if SameText('Normal', sTipoIVA) then
      FieldByName('TIPOIVA_ARTICULO_FACTURA_LINEA').AsString := 'N'
    else
      if SameText('Reducido', sTipoIVA) then
        FieldByName('TIPOIVA_ARTICULO_FACTURA_LINEA').AsString := 'R';
    if SameText('SuperReducido', sTipoIVA) then
      FieldByName('TIPOIVA_ARTICULO_FACTURA_LINEA').AsString := 'S'
    else
      if SameText('Exento', sTipoIVA) then
        FieldByName('TIPOIVA_ARTICULO_FACTURA_LINEA').AsString := 'E';
    if (FieldByName('DESCRIPCION_ARTICULO_FACTURA_LINEA').AsString = '') then
    begin
      raise EDatabaseError.CreateFmt('Descripci�n de la linea de factura ' +
                                                                  ' vac�a.',[]);
      Abort;
    end;
    if (FindField('LINEA_FACTURA_LINEA').AsString  = '0') then
    begin
      unstdGetContadorLinea.ParamByName('pnumfac').AsString :=
                                unqryTablaG.FieldByName('NRO_FACTURA').AsString;
      unstdGetContadorLinea.ParamByName('pserie').AsString :=
                              unqryTablaG.FieldByName('SERIE_FACTURA').AsString;
      unstdGetContadorLinea.ExecProc;
      FindField('LINEA_FACTURA_LINEA').AsString :=
                           unstdGetContadorLinea.ParamByName('presul').AsString;
    end;
  end;
  CalcularLinea;
  oDmConn.ActualizarUserTimeModif(DataSet);
end;

procedure TdmFacturas.unqryTablaGBeforeDelete(DataSet: TDataSet);
  var
  qryBorrarLineas : TUniQuery;
  qryBorrarRecibos: TUniquery;
begin
  qryBorrarLineas := TUniQuery.Create(Self);
  with qryBorrarLineas do
  begin
    Connection := inLibGlobalVar.oConn;
    SQL.Text := 'DELETE ' +
                '  FROM fza_facturas_lineas ' +
                ' WHERE SERIE_FACTURA_LINEA = :serie ' +
                '   AND NRO_FACTURA_LINEA   = :nrofactura';
    Params.Clear;
    Params.CreateParam(ftString, 'serie', ptInput);
    Params.CreateParam(ftString, 'nrofactura', ptInput);
    Params.ParamByName('serie').AsString :=
                              unqryTablaG.FieldByName('SERIE_FACTURA').AsString;
    Params.ParamByName('nrofactura').AsString :=
                                unqryTablaG.FieldByName('NRO_FACTURA').AsString;
    ExecSQL;
    Free;
  end;
  qryBorrarRecibos := TUniQuery.Create(Self);
  with qryBorrarRecibos do
  begin
    Connection := inLibGlobalVar.oConn;
    SQL.Text := 'DELETE ' +
                '  FROM fza_recibos ' +
                ' WHERE SERIE_FACTURA_RECIBO = :serie ' +
                '   AND NRO_FACTURA_RECIBO  = :nrofactura';
    Params.Clear;
    Params.CreateParam(ftString, 'serie', ptInput);
    Params.CreateParam(ftString, 'nrofactura', ptInput);
    Params.ParamByName('serie').AsString :=
                              unqryTablaG.FieldByName('SERIE_FACTURA').AsString;
    Params.ParamByName('nrofactura').AsString :=
                                unqryTablaG.FieldByName('NRO_FACTURA').AsString;
    ExecSQL;
    Free;
  end;
end;

procedure TdmFacturas.unqryTablaGAfterInsert(DataSet: TDataSet);
begin
  inherited;
  with unqryTablaG do
  begin
    FieldByName('NRO_FACTURA').ASSTRING := '0';
    FieldByName('CODIGO_CLIENTE_FACTURA').AsString := '0';
    FieldByName('CODIGO_EMPRESA_FACTURA').AsString := '0';
    FieldByName('TARIFA_ARTICULO_CLIENTE_FACTURA').AsString := '0';
    FieldByName('ESIMP_INCL_TARIFA_CLIENTE_FACTURA').AsString := 'S';
    FieldByName('FECHA_FACTURA').AsDateTime := Trunc(Now);
    FieldByName('FORMA_PAGO_FACTURA').AsString := FormaPagoDefault;
    FieldByName('ESREGIMENESPECIALAGRICOLA_EMPRESA_FACTURA').AsString := 'N';
    FieldByName('ESIVA_EXENTO_CLIENTE_FACTURA').AsString := 'N';
    FieldByName('ESIVA_RECARGO_CLIENTE_FACTURA').AsString := 'N';
    FieldByName('ESRETENCIONES_CLIENTE_FACTURA').AsString := 'N';
    FieldByName('ESAPLICA_RE_ZONA_IVA_FACTURA').AsString := 'N';
    FieldByName('ESINTRACOMUNITARIO_CLIENTE_FACTURA').AsString := 'N';
    FieldByName('ESREGIMENESPECIALAGRICOLA_CLIENTE_FACTURA').AsString := 'N';
    FieldByName('ESCREARARTICULOS_FACTURA').AsString := 'N';
    FieldByName('ESDESCRIPCIONES_AMP_FACTURA').AsString := 'N';
    FieldByName('ESFECHADEENTREGA_FACTURA').AsString := 'N';
    FieldByName('ESFECHADEENTREGA_FACTURA').AsString := 'N';
    FieldByName('ESVENTA_ACTIVO_FIJO_FACTURA').AsString := 'N';
    (Self.Owner AS TfrmMtoFacturas).sbNuevaFacturaClick(Self.Owner);
  end;
end;

procedure TdmFacturas.zqryLinFacBeforeInsert(DataSet: TDataSet);
begin
  if ((unqryTablaG.State = dsInsert) or (unqryTablaG.State = dsEdit)) then
      unqryTablaG.Post;
end;

procedure TdmFacturas.zqryLinFacAfterPost(DataSet: TDataSet);
begin
  CalcularFactura;
  unqryLinFac.Refresh; //command out of sync // mensaje raro
  unqryTablaG.Refresh; //command out of sync // mensaje extra�o
end;

procedure TdmFacturas.zqryFacBeforePost(DataSet: TDataSet);
var
  ISError:Boolean;
  frmFac:TfrmMtoFacturas;
begin
  inherited;
  IsError := False;
  frmFac := (Owner as TfrmMtoFacturas);
  with unqryTablaG do
  begin
    if (ExisteSerieEmpresa(FieldByName('SERIE_FACTURA').AsString,
                          FieldByName('CODIGO_EMPRESA_FACTURA').AsString,
                          'FC')) and
       (IsError = False) then
    begin
      ShowMessage('Esta serie es usada por otra empresa.' +
                  ' Debe cambiar la serie ');
      frmFac.pcCab.ActivePage := frmFac.tsCabecera;
      frmFac.cbbSerieFactura.SetFocus;
      IsError := True;
    end;
    if (FieldByName('RAZONSOCIAL_CLIENTE_FACTURA').AsString = '') and
       (IsError = False) then
    begin
      ShowMessage('Debe escribir la raz�n social del' +
                                                     ' cliente a facturar ');
      frmFac.pcCab.ActivePage := frmFac.tsDatosCliente;
      frmFac.txtRAZONSOCIAL_CLIENTE_FACTURA.SetFocus;
      IsError := True;
    end;
    if (FieldByName('RAZONSOCIAL_EMPRESA_FACTURA').AsSTring = '') and
       (IsError = False) then
    begin
      ShowMessage('Debe escribir la raz�n social de ' +
                  ' la empresa a facturar ');
      frmFac.pcCab.ActivePage := frmFac.tsEmpresa;
      frmFac.txtRAZONSOCIAL_EMPRESA_FACTURA.SetFocus;
      IsError := True;
    end;
    if (FieldByName('SERIE_FACTURA').AsString = '') and
       (IsError = False) then
    begin
      ShowMessage('Debe seleccionar una serie para facturar ');
      frmFac.pcCab.ActivePage := frmFac.tsCabecera;
      frmFac.cbbSerieFactura.SetFocus;
      IsError := True;
    end;
    if IsError then
    begin
      raise Exception.Create('No se ha grabado la cabecera de la factura');
      Abort;
    end
    else
      if ((State = dsEdit) or (State = dsInsert)) then
      begin
        if (FieldByName('NRO_FACTURA').AsString = '0') then
          GetCodigoAutoFactura;
        if (FieldByName('CODIGO_CLIENTE_FACTURA').AsString = '0') then
          GetCodigoAutoCliente;
        if (FieldByName('CODIGO_EMPRESA_FACTURA').AsString = '0') then
          GetCodigoAutoEmpresa;
        odmConn.ActualizarUserTimeModif(DataSet);
      end;
  end;
end;

initialization
  ForceReferenceToClass(TdmFacturas);
end.
