{*******************************************************}
{                                                       }
{       FactuZam                                        }
{                                                       }
{       Copyright (C) 2023 fzam.6dvdy@slmail.me    }
{                                                       }
{*******************************************************}

unit UniDataIvas;

interface

uses
  System.SysUtils, System.Classes, UniDataGen, Data.DB, MemDS, DBAccess, Uni,
   inLibUser, UniDataConn;

type
  TdmIvas = class(TdmBase)
    unstrdprcContador: TUniStoredProc;
    unqryZonasIVA: TUniQuery;
    dsZonas: TDataSource;
    procedure unqryTablaGBeforePost(DataSet: TDataSet);
    procedure DataModuleCreate(Sender: TObject);
    procedure unqryTablaGAfterInsert(DataSet: TDataSet);
  private
    { Private declarations }
  public
    procedure GetCodigoAutoIva;
  end;

//var
//  dmIvas: TdmIvas;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses inLibtb, inLibGlobalVar;

{$R *.dfm}


procedure TdmIvas.unqryTablaGAfterInsert(DataSet: TDataSet);
begin
  inherited;
  unqryTablaG.FindField('CODIGO_IVA').AsString := '0';
end;

procedure TdmIvas.unqryTablaGBeforePost(DataSet: TDataSet);
var
  sCodigo, sDescripcion, sCodigoIVA:String;
  bError : Boolean;
  unqrySol: TUniQuery;
  bSinErrores, bFechaFinNul, bFechaIniNul:Boolean;
  dtFechaIni, dtFechaFin:TDateTime;
begin
  inherited;
  bError := False;
  with unqryTablaG do
  begin
    sCodigo := Trim(FindField('CODIGO_IVA').AsString);
    if ((sCodigo = '') or (SimbolosProhibidos(sCodigo))) then
    begin
      raise ERangeError.CreateFmt('%s no es un valor de registro válido ' +
                                                  'para el campo Código de IVA',
                                                                     [sCodigo]);
      bError := True;
    end;
    if (not(bError)) then
    begin
      with unqryTablaG do
      begin
        if (State = dsEdit) then
          sCodigoIVA := FindField('CODIGO_IVA').AsString
        else
          sCodigoIVA := '';
        if (not(bError)) then
        begin
          unqrySol := TUniQuery.Create(nil);
          unqrySol.Connection := oConn;
          unqrySol.SQL.Text := 'SELECT * ' +
                               '  FROM vi_ivas ' +
                               ' WHERE GRUPO_ZONA_IVA = :GRUPO_ZONA_IVA';
          if (sCodigoIVA <> '') then
            unqrySol.SQL.Text := unqrySol.SQL.Text +
                                 ' AND CODIGO_IVA <> ' +
                                 sCodigoIVA;
          unqrySol.ParamByName('GRUPO_ZONA_IVA').AsString :=
                                     FindField('GRUPO_ZONA_IVA').AsString;
          unqrySol.Open;
        end;
        if ((not(bError)) and  not(ExistePeriodoUnico(
                                                   unqrySol,
                                                   FindField('FECHA_DESDE_IVA'),
                                                   FindField('FECHA_HASTA_IVA')
                                                   )
                                  )
           ) then
        begin
          raise ERangeError.CreateFmt('Error de Rango en las fechas. ' +
                                 'Error en la fecha.' + 'O se han establecido'+
                                 ' dos periodos activos en el mismo periodo' +
                                 ' para la zona %s',
                                  [FindField('DESCRIPCION_ZONA_IVA').AsString]);
          bError := True;
        end;
      end;
      if (assigned(unqrySol)) then
      begin
        unqrySol.Close;
        FreeAndNil(unqrySol);
      end;
    end;
  end;
  if bError then
    Abort
  else
    GetCodigoAutoIva;
end;

procedure TdmIvas.DataModuleCreate(Sender: TObject);
begin
  inherited;
  unstrdprcContador.Connection := oConn;;
  unqryZonasIVA.Connection := oConn;
  unqryZonasIVA.Open;
end;

procedure TdmIvas.GetCodigoAutoIva;
begin
  if unqryTablaG.FindField('CODIGO_IVA').AsString = '0' then
  begin
    with unstrdprcContador do
    begin
      Params.Clear;
      Params.CreateParam(ftString, 'ptipodoc', ptInput);
      Params.CreateParam(ftInteger, 'pcont', ptOutput);
      Params.CreateParam(ftInteger, 'pUSUARIO_MODIF', ptInput);
      ParamByName('pUSUARIO_MODIF').AsString := oUser;
      ParamByName('ptipodoc').AsString :=  'IV';
      ExecProc;
      unqryTablaG.FindField('CODIGO_IVA').AsString :=
                                                  ParamByName('pcont').AsString;
    end;
  end;
end;

end.
