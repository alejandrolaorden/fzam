﻿{*******************************************************}
{                                                       }
{       FactuZam                                        }
{                                                       }
{       Copyright (C) 2023 fzam.6dvdy@slmail.me    }
{                                                       }
{*******************************************************}

unit UniDataClientes;

interface

uses
  System.SysUtils, System.Classes, UniDataGen, Data.DB, MemDS, DBAccess,
  inMtoPrincipal2, Uni, inLibUser, UniDataConn, inLibWin, Forms, Windows,
  Datasnap.DBClient, Datasnap.Provider, frxClass, frxDBSet;

type
  TdmClientes = class(TdmBase)
    unstrdprcContador: TUniStoredProc;
    dsFormasPago: TDataSource;
    unqryFormaPago: TUniQuery;
    dsTarifas: TDataSource;
    unqryTarifas: TUniQuery;
    dsFacturasClientes: TDataSource;
    unqryFacturasClientes: TUniQuery;
    dsFacturasLineasClientes: TDataSource;
    unqryFacturasLineasClientes: TUniQuery;
    cdsEtiquetas: TClientDataSet;
    dtstprvEtiquetas: TDataSetProvider;
    unqryCliPrint: TUniQuery;
    dsEtiquetas: TDataSource;
    fxdsEtiquetas: TfrxDBDataset;
    procedure unqryTablaGAfterInsert(DataSet: TDataSet);
    procedure unqryTablaGBeforePost(DataSet: TDataSet);
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
    procedure unqryTablaGBeforeDelete(DataSet: TDataSet);
  private
    { Private declarations }
  public
    procedure GetCodigoAutoCliente;
    procedure CrearDataSetEtiquetas(iNroEspaciosBlanco: Integer;
                                    sCodCli:String);
  end;

//var
//  dmClientes2: TdmClientes;

implementation

uses
  inMtoClientes, inLibGlobalVar;

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure ForceReferenceToClass(C: TClass); begin end;

procedure TdmClientes.CrearDataSetEtiquetas(iNroEspaciosBlanco: Integer;
                                            sCodCli:String);
var
  i:Integer;
begin
  unqryCliPrint.Connection := oConn;
  unqryCliPrint.SQL.Text := ' SELECT * ' +
                            ' from vi_clientes ' +
                            ' where CODIGO_CLIENTE = :CODIGO';
  unqryCliPrint.ParamByName('CODIGO').AsString := sCodCli;
  unqryCliPrint.Open;
  cdsEtiquetas.Data := dtstprvEtiquetas.Data;
  cdsEtiquetas.ReadOnly := False;
  cdsEtiquetas.Active := True;
  cdsEtiquetas.First;
  cdsEtiquetas.DisableControls;
  cdsEtiquetas.DisableConstraints;
  fxdsEtiquetas.UpdateBounds;
  //cdsEtiquetas.IndexDefs.Clear;
  for i := 0 to (cdsEtiquetas.Fieldcount-1) do
  begin
    cdsEtiquetas.fields[i].ReadOnly := false;
    cdsEtiquetas.Fields[i].Required := false;
    cdsEtiquetas.FieldDefs[i].Attributes := [];
  end;
  for i := 1 to iNroEspaciosBlanco do
  begin
    cdsEtiquetas.Insert;
    cdsEtiquetas.FieldByName('CODIGO_CLIENTE').AsString := '0';
    cdsEtiquetas.FieldByName('RAZONSOCIAL_CLIENTE').AsString := '';
    cdsEtiquetas.FieldByName('INSTANTEMODIF').AsString := '';
    cdsEtiquetas.FieldByName('INSTANTEALTA').AsString := '';
    cdsEtiquetas.FieldByName('USUARIOMODIF').AsString := '';
    cdsEtiquetas.FieldByName('USUARIOALTA').AsString := '';
    cdsEtiquetas.Post;
  end;
end;

procedure TdmClientes.DataModuleCreate(Sender: TObject);
begin
  inherited;
  unstrdprcContador.Connection := oConn;
  unqryFormaPago.Connection := oConn;
  unqryPerfiles.Connection := oConn;
  unqryTarifas.Connection := oConn;
  unqryFacturasClientes.Connection := oConn;
  unqryFacturasLineasClientes.Connection := oConn;
  unqryFacturasClientes.MasterSource :=
                                       (Self.Owner as TfrmMtoClientes).dsTablaG;
  unqryFacturasLineasClientes.MasterSource :=
                                       (Self.Owner as TfrmMtoClientes).dsTablaG;
  unqryFacturasClientes.Open;
  unqryFacturasLineasClientes.Open;
  unqryTarifas.Open;
  unqryFormaPago.Open;
end;

procedure TdmClientes.DataModuleDestroy(Sender: TObject);
begin
  inherited;
  //unqryTiposIVA.Close;
  unqryPerfiles.Close;
  unqryFormaPago.Close;
  unqryTarifas.Close;
  unqryFacturasClientes.Close;
  unqryFacturasLineasClientes.Close;
end;

procedure TdmClientes.GetCodigoAutoCliente;
begin
  if (unqryTablaG.FindField('CODIGO_CLIENTE').AsString = '0') then
  begin
    with unstrdprcContador do
    begin
      Params.Clear;
      Params.CreateParam(ftString, 'ptipodoc', ptInput);
      Params.CreateParam(ftInteger, 'pcont', ptOutput);
      Params.CreateParam(ftInteger, 'pUSUARIO_MODIF', ptInput);
      ParamByName('pUSUARIO_MODIF').AsString := oUser;
      ParamByName('ptipodoc').AsString :=  'CL';
      ExecProc;
      unqryTablaG.FindField('CODIGO_CLIENTE').AsString :=
                                                  ParamByName('pcont').AsString;
    end;
  end;
  if (unqryTablaG.FindField('ORDEN_CLIENTE').AsString = '0') then
  begin
    with unstrdprcContador do
    begin
      Params.Clear;
      Params.CreateParam(ftString, 'ptipodoc', ptInput);
      Params.CreateParam(ftInteger, 'pcont', ptOutput);
      Params.CreateParam(ftInteger, 'pUSUARIO_MODIF', ptInput);
      ParamByName('pUSUARIO_MODIF').AsString := oUser;
      ParamByName('ptipodoc').AsString :=  'CO';
      ExecProc;
      unqryTablaG.FindField('ORDEN_CLIENTE').AsString :=
                                                  ParamByName('pcont').AsString;
    end;
  end;
end;

procedure TdmClientes.unqryTablaGAfterInsert(DataSet: TDataSet);
var
  unqryFormaPagoDef:TUniQuery;
  unqryTarifaDef:TUniQuery;
begin
  inherited;
  unqryTablaG.FindField('CODIGO_CLIENTE').AsString := '0';
  unqryTablaG.FindField('ORDEN_CLIENTE').AsString := '0';
  unqryTablaG.FindField('ACTIVO_CLIENTE').AsString := 'S';
  unqryTablaG.FindField('ESIVA_RECARGO_CLIENTE').AsString := 'N';
  unqryTablaG.FindField('ESRETENCIONES_CLIENTE').AsString := 'N';
  unqryTablaG.FindField('ESIVA_EXENTO_CLIENTE').AsString := 'N';
  unqryTablaG.FindField('ESREGIMENESPECIALAGRICOLA_CLIENTE').AsString := 'N';
  unqryTablaG.FindField('ESINTRACOMUNITARIO_CLIENTE').AsString := 'N';
  unqryFormaPagoDef := TUniQuery.Create(Self);
  unqryFormaPagoDef.Connection := oConn;
  unqryFormaPagoDef.SQL.Text := 'SELECT CODIGO_FORMAPAGO ' +
                                '  FROM fza_formapago ' +
                                ' WHERE ESDEFAULT_FORMAPAGO = ''S'' ' +
                                ' LIMIT 1;';
  unqryFormaPagoDef.Open;
  unqryTablaG.FindField('CODIGO_FORMA_PAGO_CLIENTE').AsString :=
                                           unqryFormaPagoDef.Fields[0].AsString;
  unqryFormaPagoDef.Close;
  FreeAndNil(unqryFormaPagoDef);
  unqryTarifaDef := TUniQuery.Create(Self);
  unqryTarifaDef.Connection := oConn;
  unqryTarifaDef.SQL.Text :=    'SELECT CODIGO_TARIFA ' +
                                '  FROM fza_tarifas ' +
                                ' WHERE ESDEFAULT_TARIFA = ''S'' ' +
                                ' LIMIT 1;';
  unqryTarifaDef.Open;
  unqryTablaG.FindField('TARIFA_ARTICULO_CLIENTE').AsString :=
                                           unqryTarifaDef.Fields[0].AsString;
  unqryTarifaDef.Close;
  FreeAndNil(unqryTarifaDef);
end;

procedure TdmClientes.unqryTablaGBeforeDelete(DataSet: TDataSet);
begin
  inherited;
  if (unqryFacturasClientes.RecordCount > 0) then
    if not ( Application.MessageBox( 'El cliente tiene facturas emitidas, ' +
                                   ' ¿Desea realmente borrar el registro?',
                                   'Mensaje Advertencia',
                                   MB_YESNO ) = ID_YES ) then
      Abort;
end;

procedure TdmClientes.unqryTablaGBeforePost(DataSet: TDataSet);
begin
  inherited;
  (* if ((unqryRetenciones.State = dsInsert) or
      (unqryRetenciones.State = dsEdit)) then
         unqryRetenciones.Post; *)
  with unqryTablaG do
  begin
    if (Trim(FindField('RAZONSOCIAL_CLIENTE').AsString) = '') then
    begin
      raise ERangeError.CreateFmt('%s no es un valor válido ' +
                                        'para el campo Razón Social de Cliente',
               [FindField('RAZONSOCIAL_CLIENTE').AsString]);
        Abort;
    end
    else
      GetCodigoAutoCliente;
  end;
end;
initialization
  ForceReferenceToClass(TdmClientes);
end.
