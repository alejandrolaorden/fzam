inherited dmClientes: TdmClientes
  Height = 296
  Width = 866
  inherited unqryTablaG: TUniQuery
    Connection = dmConn.conUni
    SQL.Strings = (
      'select * from vi_clientes')
    Active = True
    AfterInsert = unqryTablaGAfterInsert
    BeforeDelete = unqryTablaGBeforeDelete
    Left = 56
    Top = 32
  end
  inherited unqryPerfiles: TUniQuery
    SQL.Strings = (
      'select *'
      'from fza_usuarios_perfiles'
      'where KEY_PERFILES = '#39'Nothing'#39)
    Left = 144
    Top = 32
  end
  inherited dsPerfiles: TDataSource
    Left = 144
    Top = 88
  end
  object unstrdprcContador: TUniStoredProc
    StoredProcName = 'PRC_GET_NEXT_CONT'
    SQL.Strings = (
      
        'CALL PRC_GET_NEXT_CONT(:pTipoDoc, :pUSUARIO_MODIF, @pcont); SELE' +
        'CT @pcont AS '#39'@pcont'#39)
    Connection = dmConn.conUni
    Left = 56
    Top = 92
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
        DataType = ftWideString
        Name = 'pcont'
        ParamType = ptOutput
        Size = 20
        Value = nil
      end>
    CommandStoredProcName = 'PRC_GET_NEXT_CONT'
  end
  object dsFormasPago: TDataSource
    DataSet = unqryFormaPago
    Left = 224
    Top = 32
  end
  object unqryFormaPago: TUniQuery
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
      'select * from vi_formapago'
      '')
    ReadOnly = True
    Left = 224
    Top = 96
  end
  object dsTarifas: TDataSource
    DataSet = unqryTarifas
    Left = 320
    Top = 32
  end
  object unqryTarifas: TUniQuery
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
      'select * from vi_tarifas'
      '')
    ReadOnly = True
    Left = 320
    Top = 96
  end
  object dsFacturasClientes: TDataSource
    DataSet = unqryFacturasClientes
    Left = 408
    Top = 32
  end
  object unqryFacturasClientes: TUniQuery
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
    MasterFields = 'CODIGO_CLIENTE'
    DetailFields = 'CODIGO_CLIENTE_FACTURA'
    ReadOnly = True
    Active = True
    Left = 408
    Top = 96
  end
  object dsFacturasLineasClientes: TDataSource
    DataSet = unqryFacturasLineasClientes
    Left = 544
    Top = 32
  end
  object unqryFacturasLineasClientes: TUniQuery
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
    MasterFields = 'CODIGO_CLIENTE'
    DetailFields = 'CODIGO_CLIENTE_FACTURA'
    ReadOnly = True
    Left = 544
    Top = 96
    ParamData = <
      item
        DataType = ftWideString
        Name = 'CODIGO_CLIENTE'
        ParamType = ptInput
        Value = 'AGRICULTOR'
      end>
  end
  object cdsEtiquetas: TClientDataSet
    Aggregates = <>
    AutoCalcFields = False
    Params = <>
    Left = 800
    Top = 24
  end
  object dtstprvEtiquetas: TDataSetProvider
    DataSet = unqryCliPrint
    Constraints = False
    Options = []
    Left = 800
    Top = 96
  end
  object unqryCliPrint: TUniQuery
    Connection = dmConn.conUni
    SQL.Strings = (
      'select * from vi_clientes')
    Active = True
    BeforeInsert = unqryTablaGBeforeInsert
    AfterInsert = unqryTablaGAfterInsert
    BeforePost = unqryTablaGBeforePost
    BeforeDelete = unqryTablaGBeforeDelete
    Left = 712
    Top = 32
  end
  object dsEtiquetas: TDataSource
    DataSet = unqryCliPrint
    Left = 800
    Top = 168
  end
  object fxdsEtiquetas: TfrxDBDataset
    Description = 'Etiquetas'
    UserName = 'Etiquetas'
    CloseDataSource = False
    FieldAliases.Strings = (
      'CODIGO_CLIENTE=CODIGO_CLIENTE'
      'ORDEN_CLIENTE=ORDEN_CLIENTE'
      'ACTIVO_CLIENTE=ACTIVO_CLIENTE'
      'RAZONSOCIAL_CLIENTE=RAZONSOCIAL_CLIENTE'
      'NIF_CLIENTE=NIF_CLIENTE'
      'MOVIL_CLIENTE=MOVIL_CLIENTE'
      'EMAIL_CLIENTE=EMAIL_CLIENTE'
      'DIRECCION1_CLIENTE=DIRECCION1_CLIENTE'
      'DIRECCION2_CLIENTE=DIRECCION2_CLIENTE'
      'POBLACION_CLIENTE=POBLACION_CLIENTE'
      'PROVINCIA_CLIENTE=PROVINCIA_CLIENTE'
      'CPOSTAL_CLIENTE=CPOSTAL_CLIENTE'
      'PAIS_CLIENTE=PAIS_CLIENTE'
      'OBSERVACIONES_CLIENTE=OBSERVACIONES_CLIENTE'
      'REFERENCIA_CLIENTE=REFERENCIA_CLIENTE'
      'CONTACTO_CLIENTE=CONTACTO_CLIENTE'
      'TELEFONO_CONTACTO_CLIENTE=TELEFONO_CONTACTO_CLIENTE'
      'TELEFONO_CLIENTE=TELEFONO_CLIENTE'
      'IBAN_CLIENTE=IBAN_CLIENTE'
      'ESIVA_RECARGO_CLIENTE=ESIVA_RECARGO_CLIENTE'
      'ESRETENCIONES_CLIENTE=ESRETENCIONES_CLIENTE'
      'ESIVA_EXENTO_CLIENTE=ESIVA_EXENTO_CLIENTE'
      'ESINTRACOMUNITARIO_CLIENTE=ESINTRACOMUNITARIO_CLIENTE'
      
        'ESREGIMENESPECIALAGRICOLA_CLIENTE=ESREGIMENESPECIALAGRICOLA_CLIE' +
        'NTE'
      'CODIGO_FORMA_PAGO_CLIENTE=CODIGO_FORMA_PAGO_CLIENTE'
      'TARIFA_ARTICULO_CLIENTE=TARIFA_ARTICULO_CLIENTE'
      'SERIE_CONTADOR_CLIENTE=SERIE_CONTADOR_CLIENTE'
      'TEXTO_LEGAL_FACTURA_CLIENTE=TEXTO_LEGAL_FACTURA_CLIENTE'
      'INSTANTEMODIF=INSTANTEMODIF'
      'INSTANTEALTA=INSTANTEALTA'
      'USUARIOALTA=USUARIOALTA'
      'USUARIOMODIF=USUARIOMODIF')
    DataSet = cdsEtiquetas
    BCDToCurrency = False
    DataSetOptions = []
    Left = 800
    Top = 232
  end
end
