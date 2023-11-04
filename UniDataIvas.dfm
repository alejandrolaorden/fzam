inherited dmIvas: TdmIvas
  OldCreateOrder = True
  Height = 159
  Width = 267
  inherited unqryTablaG: TUniQuery
    SQLInsert.Strings = (
      'INSERT INTO fza_ivas'
      
        '  (CODIGO_IVA, GRUPO_ZONA_IVA, DESCRIPCION_ZONA_IVA, PORCENEXENT' +
        'O_IVA, PORCENEXENTO_RE_IVA, PORCENNORMAL_IVA, PORCENNORMAL_RE_IV' +
        'A, PORCENREDUCIDO_IVA, PORCENREDUCIDO_RE_IVA, PORCENSUPERREDUCID' +
        'O_IVA, PORCENSUPERREDUCIDO_RE_IVA, FECHA_DESDE_IVA, FECHA_HASTA_' +
        'IVA, INSTANTEMODIF, INSTANTEALTA, USUARIOALTA, USUARIOMODIF)'
      'VALUES'
      
        '  (:CODIGO_IVA, :GRUPO_ZONA_IVA, :DESCRIPCION_ZONA_IVA, :PORCENE' +
        'XENTO_IVA, :PORCENEXENTO_RE_IVA, :PORCENNORMAL_IVA, :PORCENNORMA' +
        'L_RE_IVA, :PORCENREDUCIDO_IVA, :PORCENREDUCIDO_RE_IVA, :PORCENSU' +
        'PERREDUCIDO_IVA, :PORCENSUPERREDUCIDO_RE_IVA, :FECHA_DESDE_IVA, ' +
        ':FECHA_HASTA_IVA, :INSTANTEMODIF, :INSTANTEALTA, :USUARIOALTA, :' +
        'USUARIOMODIF)')
    SQLDelete.Strings = (
      'DELETE FROM fza_ivas'
      'WHERE'
      '  CODIGO_IVA = :Old_CODIGO_IVA')
    SQLUpdate.Strings = (
      'UPDATE fza_ivas'
      'SET'
      '  CODIGO_IVA = :CODIGO_IVA, '
      '  GRUPO_ZONA_IVA = :GRUPO_ZONA_IVA, '
      '  DESCRIPCION_ZONA_IVA = :DESCRIPCION_ZONA_IVA, '
      '  PORCENEXENTO_IVA = :PORCENEXENTO_IVA, '
      '  PORCENEXENTO_RE_IVA = :PORCENEXENTO_RE_IVA, '
      '  PORCENNORMAL_IVA = :PORCENNORMAL_IVA, '
      '  PORCENNORMAL_RE_IVA = :PORCENNORMAL_RE_IVA, '
      '  PORCENREDUCIDO_IVA = :PORCENREDUCIDO_IVA, '
      '  PORCENREDUCIDO_RE_IVA = :PORCENREDUCIDO_RE_IVA, '
      '  PORCENSUPERREDUCIDO_IVA = :PORCENSUPERREDUCIDO_IVA, '
      '  PORCENSUPERREDUCIDO_RE_IVA = :PORCENSUPERREDUCIDO_RE_IVA, '
      '  FECHA_DESDE_IVA = :FECHA_DESDE_IVA, '
      '  FECHA_HASTA_IVA = :FECHA_HASTA_IVA, '
      '  INSTANTEMODIF = :INSTANTEMODIF, '
      '  INSTANTEALTA = :INSTANTEALTA, '
      '  USUARIOALTA = :USUARIOALTA, '
      '  USUARIOMODIF = :USUARIOMODIF'
      'WHERE'
      '  CODIGO_IVA = :Old_CODIGO_IVA')
    SQLLock.Strings = (
      'SELECT * FROM fza_ivas'
      'WHERE'
      '  CODIGO_IVA = :Old_CODIGO_IVA'
      'FOR UPDATE')
    SQLRefresh.Strings = (
      'SELECT CODIGO_IVA, '
      '       GRUPO_ZONA_IVA, '
      '       DESCRIPCION_ZONA_IVA, '
      '       PORCENEXENTO_IVA, '
      '       PORCENEXENTO_RE_IVA, '
      '       PORCENNORMAL_IVA, '
      '       PORCENNORMAL_RE_IVA, '
      '       PORCENREDUCIDO_IVA, '
      '       PORCENREDUCIDO_RE_IVA, '
      '       PORCENSUPERREDUCIDO_IVA, '
      '       PORCENSUPERREDUCIDO_RE_IVA, '
      '       FECHA_DESDE_IVA, '
      '       FECHA_HASTA_IVA, '
      '       INSTANTEMODIF, '
      '       INSTANTEALTA, '
      '       USUARIOALTA, '
      '       USUARIOMODIF '
      '  FROM fza_ivas'
      ' WHERE CODIGO_IVA = :CODIGO_IVA')
    SQLRecCount.Strings = (
      'SELECT COUNT(*) FROM fza_ivas')
    Connection = dmConn.conUni
    SQL.Strings = (
      'select * from vi_ivas')
    AutoCalcFields = False
    AfterInsert = unqryTablaGAfterInsert
  end
  object unstrdprcContador: TUniStoredProc
    Connection = dmConn.conUni
    Left = 8
    Top = 84
    StoredProcIsQuery = True
  end
  object unqryZonasIVA: TUniQuery
    Connection = dmConn.conUni
    SQL.Strings = (
      'select GRUPO_ZONA_IVA, DESCRIPCION_ZONA_IVA from fza_ivas_grupos')
    AutoCalcFields = False
    AfterInsert = unqryTablaGAfterInsert
    BeforePost = unqryTablaGBeforePost
    Left = 192
    Top = 24
  end
  object dsZonas: TDataSource
    DataSet = unqryZonasIVA
    Left = 192
    Top = 88
  end
end
