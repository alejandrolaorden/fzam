inherited frmGenFacRec: TfrmGenFacRec
  Left = 516
  Top = 286
  HorzScrollBar.Visible = False
  BorderStyle = bsSingle
  Caption = 'Duplicar/Abonar Factura'
  ClientHeight = 302
  ClientWidth = 399
  FormStyle = fsStayOnTop
  Position = poMainFormCenter
  Scaled = False
  ExplicitWidth = 405
  ExplicitHeight = 331
  PixelsPerInch = 96
  TextHeight = 19
  object cxlbl1: TcxLabel [0]
    Left = 9
    Top = 4
    Caption = 'Factura Origen N'#250'mero'
  end
  object edtNumFacOrigen: TcxTextEdit [1]
    Left = 135
    Top = 28
    Enabled = False
    TabOrder = 3
    Width = 129
  end
  object pnl1: TPanel [2]
    Left = 284
    Top = 0
    Width = 115
    Height = 302
    Align = alRight
    TabOrder = 0
    object btn3: TcxButton
      Left = 0
      Top = 274
      Width = 115
      Height = 25
      Caption = 'Salir'
      TabOrder = 1
      OnClick = btn3Click
    end
    object btnGenerar: TcxButton
      Left = 0
      Top = 251
      Width = 115
      Height = 25
      Caption = 'Generar'
      TabOrder = 0
      OnClick = btnGenerarClick
    end
  end
  object chkAbonar: TcxCheckBox [3]
    Left = 16
    Top = 58
    Caption = 'Generar Factura de  Abono'
    TabOrder = 4
    OnClick = chkAbonarClick
  end
  object cxgrpbx1: TcxGroupBox [4]
    Left = -2
    Top = 232
    Caption = 'Factura Generada'
    TabOrder = 10
    Height = 67
    Width = 287
    object edtNumFacAbono: TcxTextEdit
      Left = 72
      Top = 24
      Enabled = False
      TabOrder = 1
      Width = 129
    end
    object edtSerieFacAbono: TcxTextEdit
      Left = 24
      Top = 24
      Enabled = False
      TabOrder = 0
      Width = 41
    end
  end
  object edtSerieOrigen: TcxTextEdit [5]
    Left = 8
    Top = 28
    Enabled = False
    TabOrder = 2
    Width = 114
  end
  object chkDuplicar: TcxCheckBox [6]
    Left = 16
    Top = 82
    Caption = 'Duplicar Factura'
    TabOrder = 5
    OnClick = chkDuplicarClick
  end
  object cxlbl8: TcxLabel [7]
    Left = 9
    Top = 111
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Caption = 'Serie Factura Destino'
  end
  object cmbSerieFactura: TcxLookupComboBox [8]
    Left = 16
    Top = 135
    Properties.KeyFieldNames = 'SERIE_CONTADOR'
    Properties.ListColumns = <
      item
        FieldName = 'SERIE_CONTADOR'
      end>
    Properties.ListOptions.ShowHeader = False
    Properties.ReadOnly = False
    TabOrder = 6
    Width = 145
  end
  object cxlbl2: TcxLabel [9]
    Left = 9
    Top = 166
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Caption = 'Fecha Factura Destino'
  end
  object dtFecha: TcxDateEdit [10]
    Left = 16
    Top = 193
    TabOrder = 7
    Width = 121
  end
end
