inherited dmContadores: TdmContadores
  OldCreateOrder = True
  inherited unqryTablaG: TUniQuery
    Connection = dmConn.conUni
    SQL.Strings = (
      'SELECT *  '
      'FROM fza_contadores'
      '')
    Left = 24
  end
end
