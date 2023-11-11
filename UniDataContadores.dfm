inherited dmContadores: TdmContadores
  OldCreateOrder = True
  inherited unqryTablaG: TUniQuery
    Connection = dmConn.conUni
    SQL.Strings = (
      'SELECT *  '
      'FROM vi_contadores'
      '')
    Active = True
    Left = 24
  end
end
