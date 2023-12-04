inherited dmEmpresas: TdmEmpresas
  Height = 168
  Width = 970
  inherited unqryTablaG: TUniQuery
    SQLInsert.Strings = (
      'INSERT INTO fza_empresas'
      
        '  (CODIGO_EMPRESA, ORDEN_EMPRESA, ACTIVO_EMPRESA, RAZONSOCIAL_EM' +
        'PRESA, NIF_EMPRESA, MOVIL_EMPRESA, EMAIL_EMPRESA, DIRECCION1_EMP' +
        'RESA, DIRECCION2_EMPRESA, CPOSTAL_EMPRESA, POBLACION_EMPRESA, PR' +
        'OVINCIA_EMPRESA, PAIS_EMPRESA, GRUPO_ZONA_IVA_EMPRESA, ESRETENCI' +
        'ONES_EMPRESA, ESREGIMENESPECIALAGRICOLA_EMPRESA, SERIE_CONTADOR_' +
        'EMPRESA, TEXTO_LEGAL_FACTURA_EMPRESA, INSTANTEMODIF, INSTANTEALT' +
        'A, USUARIOALTA, USUARIOMODIF)'
      'VALUES'
      
        '  (:CODIGO_EMPRESA, :ORDEN_EMPRESA, :ACTIVO_EMPRESA, :RAZONSOCIA' +
        'L_EMPRESA, :NIF_EMPRESA, :MOVIL_EMPRESA, :EMAIL_EMPRESA, :DIRECC' +
        'ION1_EMPRESA, :DIRECCION2_EMPRESA, :CPOSTAL_EMPRESA, :POBLACION_' +
        'EMPRESA, :PROVINCIA_EMPRESA, :PAIS_EMPRESA, :GRUPO_ZONA_IVA_EMPR' +
        'ESA, :ESRETENCIONES_EMPRESA, :ESREGIMENESPECIALAGRICOLA_EMPRESA,' +
        ' :SERIE_CONTADOR_EMPRESA, :TEXTO_LEGAL_FACTURA_EMPRESA, :INSTANT' +
        'EMODIF, :INSTANTEALTA, :USUARIOALTA, :USUARIOMODIF)')
    SQLDelete.Strings = (
      'DELETE FROM fza_empresas'
      'WHERE'
      '  CODIGO_EMPRESA = :Old_CODIGO_EMPRESA')
    SQLUpdate.Strings = (
      'UPDATE fza_empresas'
      'SET'
      
        '  CODIGO_EMPRESA = :CODIGO_EMPRESA, ORDEN_EMPRESA = :ORDEN_EMPRE' +
        'SA, ACTIVO_EMPRESA = :ACTIVO_EMPRESA, RAZONSOCIAL_EMPRESA = :RAZ' +
        'ONSOCIAL_EMPRESA, NIF_EMPRESA = :NIF_EMPRESA, MOVIL_EMPRESA = :M' +
        'OVIL_EMPRESA, EMAIL_EMPRESA = :EMAIL_EMPRESA, DIRECCION1_EMPRESA' +
        ' = :DIRECCION1_EMPRESA, DIRECCION2_EMPRESA = :DIRECCION2_EMPRESA' +
        ', CPOSTAL_EMPRESA = :CPOSTAL_EMPRESA, POBLACION_EMPRESA = :POBLA' +
        'CION_EMPRESA, PROVINCIA_EMPRESA = :PROVINCIA_EMPRESA, PAIS_EMPRE' +
        'SA = :PAIS_EMPRESA, GRUPO_ZONA_IVA_EMPRESA = :GRUPO_ZONA_IVA_EMP' +
        'RESA, ESRETENCIONES_EMPRESA = :ESRETENCIONES_EMPRESA, ESREGIMENE' +
        'SPECIALAGRICOLA_EMPRESA = :ESREGIMENESPECIALAGRICOLA_EMPRESA, SE' +
        'RIE_CONTADOR_EMPRESA = :SERIE_CONTADOR_EMPRESA, TEXTO_LEGAL_FACT' +
        'URA_EMPRESA = :TEXTO_LEGAL_FACTURA_EMPRESA, INSTANTEMODIF = :INS' +
        'TANTEMODIF, INSTANTEALTA = :INSTANTEALTA, USUARIOALTA = :USUARIO' +
        'ALTA, USUARIOMODIF = :USUARIOMODIF'
      'WHERE'
      '  CODIGO_EMPRESA = :Old_CODIGO_EMPRESA')
    SQLLock.Strings = (
      'SELECT * FROM fza_empresas'
      'WHERE'
      '  CODIGO_EMPRESA = :Old_CODIGO_EMPRESA'
      'FOR UPDATE')
    SQLRefresh.Strings = (
      
        'SELECT CODIGO_EMPRESA, ORDEN_EMPRESA, ACTIVO_EMPRESA, RAZONSOCIA' +
        'L_EMPRESA, NIF_EMPRESA, MOVIL_EMPRESA, EMAIL_EMPRESA, DIRECCION1' +
        '_EMPRESA, DIRECCION2_EMPRESA, CPOSTAL_EMPRESA, POBLACION_EMPRESA' +
        ', PROVINCIA_EMPRESA, PAIS_EMPRESA, GRUPO_ZONA_IVA_EMPRESA, ESRET' +
        'ENCIONES_EMPRESA, ESREGIMENESPECIALAGRICOLA_EMPRESA, SERIE_CONTA' +
        'DOR_EMPRESA, TEXTO_LEGAL_FACTURA_EMPRESA, INSTANTEMODIF, INSTANT' +
        'EALTA, USUARIOALTA, USUARIOMODIF FROM fza_empresas'
      'WHERE'
      '  CODIGO_EMPRESA = :CODIGO_EMPRESA')
    SQLRecCount.Strings = (
      'SELECT COUNT(*) FROM fza_empresas')
    Connection = dmConn.conUni
    SQL.Strings = (
      'SELECT *  '
      '  FROM vi_empresas '
      ' ORDER BY orden_empresa')
    AfterInsert = unqryTablaGAfterInsert
    BeforeDelete = unqryTablaGBeforeDelete
    AfterDelete = unqryTablaGAfterDelete
  end
  inherited unqryPerfiles: TUniQuery
    SQL.Strings = (
      'select *'
      'from fza_usuarios_perfiles'
      'where (KEY_PERFILES = '#39'dmEmpresas'#39' '
      'OR KEY_PERFILES='#39'frmMtoEmpresas'#39')')
  end
  object unstrdprcContador: TUniStoredProc
    StoredProcName = 'PRC_GET_NEXT_CONT'
    SQL.Strings = (
      
        'CALL PRC_GET_NEXT_CONT(:pTipoDoc, :pUSUARIO_MODIF, @pcont); SELE' +
        'CT CAST(@pcont AS SIGNED) AS '#39'@pcont'#39)
    Connection = dmConn.conUni
    Left = 8
    Top = 84
    ParamData = <
      item
        DataType = ftWideString
        Name = 'pTipoDoc'
        ParamType = ptInput
        Size = 2
        Value = nil
      end
      item
        DataType = ftWideString
        Name = 'pUSUARIO_MODIF'
        ParamType = ptInput
        Size = 100
        Value = nil
      end
      item
        DataType = ftInteger
        Name = 'pcont'
        ParamType = ptOutput
        Value = nil
      end>
    CommandStoredProcName = 'PRC_GET_NEXT_CONT'
  end
  object unqryRetenciones: TUniQuery
    SQLInsert.Strings = (
      'INSERT INTO fza_empresas_retenciones'
      
        '  (CODIGO_RETENCION, CODIGO_EMPRESA_RETENCION, PORCENRETENCION_R' +
        'ETENCION, FECHA_DESDE_RETENCION, FECHA_HASTA_RETENCION, INSTANTE' +
        'MODIF, INSTANTEALTA, USUARIOALTA, USUARIOMODIF)'
      'VALUES'
      
        '  (:CODIGO_RETENCION, :CODIGO_EMPRESA_RETENCION, :PORCENRETENCIO' +
        'N_RETENCION, :FECHA_DESDE_RETENCION, :FECHA_HASTA_RETENCION, :IN' +
        'STANTEMODIF, :INSTANTEALTA, :USUARIOALTA, :USUARIOMODIF)')
    SQLDelete.Strings = (
      'DELETE FROM fza_empresas_retenciones'
      'WHERE'
      '  CODIGO_RETENCION = :Old_CODIGO_RETENCION')
    SQLUpdate.Strings = (
      'UPDATE fza_empresas_retenciones'
      'SET'
      
        '  CODIGO_RETENCION = :CODIGO_RETENCION, CODIGO_EMPRESA_RETENCION' +
        ' = :CODIGO_EMPRESA_RETENCION, PORCENRETENCION_RETENCION = :PORCE' +
        'NRETENCION_RETENCION, FECHA_DESDE_RETENCION = :FECHA_DESDE_RETEN' +
        'CION, FECHA_HASTA_RETENCION = :FECHA_HASTA_RETENCION, INSTANTEMO' +
        'DIF = :INSTANTEMODIF, INSTANTEALTA = :INSTANTEALTA, USUARIOALTA ' +
        '= :USUARIOALTA, USUARIOMODIF = :USUARIOMODIF'
      'WHERE'
      '  CODIGO_RETENCION = :Old_CODIGO_RETENCION')
    SQLLock.Strings = (
      'SELECT * FROM fza_empresas_retenciones'
      'WHERE'
      '  CODIGO_RETENCION = :Old_CODIGO_RETENCION'
      'FOR UPDATE')
    SQLRefresh.Strings = (
      
        'SELECT CODIGO_RETENCION, CODIGO_EMPRESA_RETENCION, PORCENRETENCI' +
        'ON_RETENCION, FECHA_DESDE_RETENCION, FECHA_HASTA_RETENCION, INST' +
        'ANTEMODIF, INSTANTEALTA, USUARIOALTA, USUARIOMODIF FROM fza_empr' +
        'esas_retenciones'
      'WHERE'
      '  CODIGO_RETENCION = :CODIGO_RETENCION')
    SQLRecCount.Strings = (
      'SELECT COUNT(*) FROM fza_empresas_retenciones')
    Connection = dmConn.conUni
    SQL.Strings = (
      'SELECT * '
      'FROM vi_empresas_retenciones'
      'WHERE CODIGO_EMPRESA_RETENCION = :CODIGO_EMPRESA')
    MasterFields = 'CODIGO_EMPRESA'
    DetailFields = 'CODIGO_EMPRESA_RETENCION'
    RefreshOptions = [roAfterUpdate]
    BeforeInsert = unqryRetencionesBeforeInsert
    AfterInsert = unqryRetencionesAfterInsert
    BeforePost = unqryRetencionesBeforePost
    Left = 176
    Top = 24
    ParamData = <
      item
        DataType = ftWideString
        Name = 'CODIGO_EMPRESA'
        ParamType = ptInput
        Value = '007'
      end>
  end
  object dsRetenciones: TDataSource
    DataSet = unqryRetenciones
    Left = 176
    Top = 80
  end
  object unqryIvas: TUniQuery
    Connection = dmConn.conUni
    SQL.Strings = (
      'SELECT * '
      'FROM VI_IVAS_GRUPOS'
      '')
    DetailFields = 'GRUPO_ZONA_IVA'
    AfterInsert = unqryRetencionesAfterInsert
    BeforePost = unqryRetencionesBeforePost
    Left = 384
    Top = 24
  end
  object dsIvas: TDataSource
    DataSet = unqryIvas
    Left = 384
    Top = 80
  end
  object dsFacturasEmpresas: TDataSource
    DataSet = unqryFacturasEmpresas
    Left = 480
    Top = 80
  end
  object unqryFacturasEmpresas: TUniQuery
    SQLInsert.Strings = (
      'INSERT INTO fza_historia'
      
        '  (ID, CODIGO_ARTICULO, DESCRIPCION_ARTICULO, CODIGO_CLIENTE, PR' +
        'ECIOVENTA_ARTICULO, FECHA, ZONA, DESCRIPCION_HISTORIA, NRO_FACTU' +
        'RA, LINEA_LINEA, ODONTOLOGO, SERIE_FACTURA)'
      'VALUES'
      
        '  (:ID, :CODIGO_ARTICULO, :DESCRIPCION_ARTICULO, :CODIGO_CLIENTE' +
        ', :PRECIOVENTA_ARTICULO, :FECHA, :ZONA, :DESCRIPCION_HISTORIA, :' +
        'NRO_FACTURA, :LINEA_LINEA, :ODONTOLOGO, :SERIE_FACTURA)')
    SQLDelete.Strings = (
      'DELETE FROM fza_historia'
      'WHERE'
      '  ID = :Old_ID')
    SQLUpdate.Strings = (
      'UPDATE fza_historia'
      'SET'
      
        '  ID = :ID, CODIGO_ARTICULO = :CODIGO_ARTICULO, DESCRIPCION_ARTI' +
        'CULO = :DESCRIPCION_ARTICULO, CODIGO_CLIENTE = :CODIGO_CLIENTE, ' +
        'PRECIOVENTA_ARTICULO = :PRECIOVENTA_ARTICULO, FECHA = :FECHA, ZO' +
        'NA = :ZONA, DESCRIPCION_HISTORIA = :DESCRIPCION_HISTORIA, NRO_FA' +
        'CTURA = :NRO_FACTURA, LINEA_LINEA = :LINEA_LINEA, ODONTOLOGO = :' +
        'ODONTOLOGO, SERIE_FACTURA = :SERIE_FACTURA'
      'WHERE'
      '  ID = :Old_ID')
    SQLLock.Strings = (
      'SELECT * FROM fza_historia'
      'WHERE'
      '  ID = :Old_ID'
      'FOR UPDATE')
    SQLRefresh.Strings = (
      
        'SELECT ID, CODIGO_ARTICULO, DESCRIPCION_ARTICULO, CODIGO_CLIENTE' +
        ', PRECIOVENTA_ARTICULO, FECHA, ZONA, DESCRIPCION_HISTORIA, NRO_F' +
        'ACTURA, LINEA_LINEA, ODONTOLOGO, SERIE_FACTURA FROM fza_historia'
      'WHERE'
      '  ID = :ID')
    SQLRecCount.Strings = (
      'SELECT COUNT(*) FROM fza_historia')
    Connection = dmConn.conUni
    SQL.Strings = (
      'select * from vi_fac_busquedas')
    MasterFields = 'CODIGO_EMPRESA'
    DetailFields = 'CODIGO_EMPRESA_FACTURA'
    ReadOnly = True
    Active = True
    Left = 480
    Top = 24
    ParamData = <
      item
        DataType = ftWideString
        Name = 'CODIGO_EMPRESA'
        ParamType = ptInput
        Value = '007'
      end>
  end
  object dsFacturasLineasEmpresas: TDataSource
    DataSet = unqryFacturasLineasEmpresas
    Left = 625
    Top = 80
  end
  object unqryFacturasLineasEmpresas: TUniQuery
    SQLInsert.Strings = (
      'INSERT INTO fza_historia'
      
        '  (ID, CODIGO_ARTICULO, DESCRIPCION_ARTICULO, CODIGO_CLIENTE, PR' +
        'ECIOVENTA_ARTICULO, FECHA, ZONA, DESCRIPCION_HISTORIA, NRO_FACTU' +
        'RA, LINEA_LINEA, ODONTOLOGO, SERIE_FACTURA)'
      'VALUES'
      
        '  (:ID, :CODIGO_ARTICULO, :DESCRIPCION_ARTICULO, :CODIGO_CLIENTE' +
        ', :PRECIOVENTA_ARTICULO, :FECHA, :ZONA, :DESCRIPCION_HISTORIA, :' +
        'NRO_FACTURA, :LINEA_LINEA, :ODONTOLOGO, :SERIE_FACTURA)')
    SQLDelete.Strings = (
      'DELETE FROM fza_historia'
      'WHERE'
      '  ID = :Old_ID')
    SQLUpdate.Strings = (
      'UPDATE fza_historia'
      'SET'
      
        '  ID = :ID, CODIGO_ARTICULO = :CODIGO_ARTICULO, DESCRIPCION_ARTI' +
        'CULO = :DESCRIPCION_ARTICULO, CODIGO_CLIENTE = :CODIGO_CLIENTE, ' +
        'PRECIOVENTA_ARTICULO = :PRECIOVENTA_ARTICULO, FECHA = :FECHA, ZO' +
        'NA = :ZONA, DESCRIPCION_HISTORIA = :DESCRIPCION_HISTORIA, NRO_FA' +
        'CTURA = :NRO_FACTURA, LINEA_LINEA = :LINEA_LINEA, ODONTOLOGO = :' +
        'ODONTOLOGO, SERIE_FACTURA = :SERIE_FACTURA'
      'WHERE'
      '  ID = :Old_ID')
    SQLLock.Strings = (
      'SELECT * FROM fza_historia'
      'WHERE'
      '  ID = :Old_ID'
      'FOR UPDATE')
    SQLRefresh.Strings = (
      
        'SELECT ID, CODIGO_ARTICULO, DESCRIPCION_ARTICULO, CODIGO_CLIENTE' +
        ', PRECIOVENTA_ARTICULO, FECHA, ZONA, DESCRIPCION_HISTORIA, NRO_F' +
        'ACTURA, LINEA_LINEA, ODONTOLOGO, SERIE_FACTURA FROM fza_historia'
      'WHERE'
      '  ID = :ID')
    SQLRecCount.Strings = (
      'SELECT COUNT(*) FROM fza_historia')
    Connection = dmConn.conUni
    SQL.Strings = (
      'select *'
      'from vi_fac_lin_busquedas l'
      'inner join vi_fac_busquedas f'
      'on l.NRO_FACTURA_LINEA = F.NRO_FACTURA'
      'AND l.SERIE_FACTURA_LINEA = F.SERIE_FACTURA'
      '')
    MasterFields = 'CODIGO_EMPRESA'
    DetailFields = 'CODIGO_EMPRESA_FACTURA'
    ReadOnly = True
    Left = 625
    Top = 24
    ParamData = <
      item
        DataType = ftWideString
        Name = 'CODIGO_EMPRESA'
        ParamType = ptInput
        Value = '1'
      end>
  end
  object unqrySeries: TUniQuery
    SQLInsert.Strings = (
      'INSERT INTO fza_empresas_series'
      
        '  (CODIGO_SERIE, CODIGO_EMPRESA_SERIE, SERIE_SERIE, FECHA_DESDE_' +
        'SERIE, FECHA_HASTA_SERIE, INSTANTEMODIF, INSTANTEALTA, USUARIOAL' +
        'TA, USUARIOMODIF)'
      'VALUES'
      
        '  (:CODIGO_SERIE, :CODIGO_EMPRESA_SERIE, :SERIE_SERIE, :FECHA_DE' +
        'SDE_SERIE, :FECHA_HASTA_SERIE, :INSTANTEMODIF, :INSTANTEALTA, :U' +
        'SUARIOALTA, :USUARIOMODIF)')
    SQLDelete.Strings = (
      'DELETE FROM fza_empresas_series'
      'WHERE'
      '  CODIGO_SERIE = :Old_CODIGO_SERIE')
    SQLUpdate.Strings = (
      'UPDATE fza_empresas_series'
      'SET'
      
        '  CODIGO_SERIE = :CODIGO_SERIE, CODIGO_EMPRESA_SERIE = :CODIGO_E' +
        'MPRESA_SERIE, SERIE_SERIE = :SERIE_SERIE, FECHA_DESDE_SERIE = :F' +
        'ECHA_DESDE_SERIE, FECHA_HASTA_SERIE = :FECHA_HASTA_SERIE, INSTAN' +
        'TEMODIF = :INSTANTEMODIF, INSTANTEALTA = :INSTANTEALTA, USUARIOA' +
        'LTA = :USUARIOALTA, USUARIOMODIF = :USUARIOMODIF'
      'WHERE'
      '  CODIGO_SERIE = :Old_CODIGO_SERIE')
    SQLLock.Strings = (
      'SELECT * FROM fza_empresas_series'
      'WHERE'
      '  CODIGO_SERIE = :Old_CODIGO_SERIE'
      'FOR UPDATE')
    SQLRefresh.Strings = (
      
        'SELECT CODIGO_SERIE, CODIGO_EMPRESA_SERIE, SERIE_SERIE, FECHA_DE' +
        'SDE_SERIE, FECHA_HASTA_SERIE, INSTANTEMODIF, INSTANTEALTA, USUAR' +
        'IOALTA, USUARIOMODIF FROM fza_empresas_series'
      'WHERE'
      '  CODIGO_SERIE = :CODIGO_SERIE')
    SQLRecCount.Strings = (
      'SELECT COUNT(*) FROM fza_empresas_series')
    Connection = dmConn.conUni
    SQL.Strings = (
      'SELECT * '
      'FROM vi_empresas_series'
      'WHERE CODIGO_EMPRESA_SERIE = :CODIGO_EMPRESA')
    MasterFields = 'CODIGO_EMPRESA'
    DetailFields = 'CODIGO_EMPRESA_SERIE'
    RefreshOptions = [roAfterUpdate]
    BeforeInsert = unqryRetencionesBeforeInsert
    AfterInsert = unqrySeriesAfterInsert
    BeforePost = unqrySeriesBeforePost
    Left = 272
    Top = 24
    ParamData = <
      item
        DataType = ftWideString
        Name = 'CODIGO_EMPRESA'
        ParamType = ptInput
        Value = '007'
      end>
  end
  object dsSeries: TDataSource
    DataSet = unqrySeries
    Left = 272
    Top = 80
  end
end
