inherited dmContadores: TdmContadores
  inherited unqryTablaG: TUniQuery
    Connection = dmConn.conUni
    SQL.Strings = (
      'SELECT *  '
      'FROM vi_contadores'
      '')
    Left = 24
  end
end
