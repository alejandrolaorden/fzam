inherited frmPrintCliEti: TfrmPrintCliEti
  Caption = 'Impresi'#243'n de Etiquetas'
  ClientHeight = 298
  ClientWidth = 397
  ExplicitWidth = 409
  TextHeight = 19
  inherited pnl1: TPanel
    Left = 253
    Height = 298
    ExplicitLeft = 249
  end
  object cxRadioGroup1: TcxRadioGroup [1]
    Left = 8
    Top = 136
    Caption = 'Opciones'
    Properties.Items = <>
    TabOrder = 1
    Height = 137
    Width = 219
    object cxlbl2: TcxLabel
      Left = 16
      Top = 22
      Caption = 'Dejar espacios en blanco antes de imprimir etiqueta'
      Properties.WordWrap = True
      Width = 154
    end
  end
  object speDejarBlancos: TcxSpinEdit [2]
    Left = 24
    Top = 225
    TabOrder = 2
    Width = 121
  end
  object edtCodCli: TcxTextEdit [3]
    Left = 106
    Top = 71
    TabOrder = 3
    Width = 121
  end
  object cxLabel1: TcxLabel [4]
    Left = 21
    Top = 48
    Caption = 'C'#243'digo de Cliente: '
  end
  inherited frxrprt1: TfrxReport
    Left = 8
    Top = 256
    Datasets = <>
    Variables = <>
    Style = <>
  end
  inherited frxlsxprtExcel: TfrxXLSXExport
    Left = 160
    Top = 256
  end
  inherited unqryPerfiles: TUniQuery
    Left = 264
    Top = 256
  end
  inherited dsPerfiles: TDataSource
    Left = 264
    Top = 200
  end
  inherited frxReportOrigen: TfrxReport
    ReportOptions.Author = ''
    ReportOptions.LastChange = 45280.511098078700000000
    ScriptText.Strings = (
      'begin'
      'end.')
    Left = 64
    Top = 256
    Datasets = <
      item
        DataSet = dmClientes.fxdsEtiquetas
        DataSetName = 'Etiquetas'
      end>
    Variables = <>
    Style = <>
    inherited Page1: TfrxReportPage
      LeftMargin = 0.000000000000000000
      RightMargin = 0.000000000000000000
      TopMargin = 3.400000000000000000
      BottomMargin = 3.400000000000000000
      Columns = 2
      ColumnWidth = 105.000000000000000000
      ColumnPositions.Strings = (
        '0'
        '105')
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 109.606299210000000000
        Top = 18.897650000000000000
        Width = 396.850650000000000000
        DataSet = dmClientes.fxdsEtiquetas
        DataSetName = 'Etiquetas'
        RowCount = 0
        object FacturasRAZONSOCIAL_CLIENTE: TfrxMemoView
          AllowVectorExport = True
          Left = 26.456710000000000000
          Top = 15.118120000000000000
          Width = 362.834880000000000000
          Height = 18.897650000000000000
          DataField = 'RAZONSOCIAL_CLIENTE'
          DataSet = dmClientes.fxdsEtiquetas
          DataSetName = 'Etiquetas'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[Etiquetas."RAZONSOCIAL_CLIENTE"]')
          ParentFont = False
        end
        object FacturasDIRECCION1_CLIENTE_FACTURA: TfrxMemoView
          AllowVectorExport = True
          Left = 26.456710000000000000
          Top = 35.015770000000000000
          Width = 366.614410000000000000
          Height = 18.897650000000000000
          DataField = 'DIRECCION1_CLIENTE'
          DataSet = dmClientes.fxdsEtiquetas
          DataSetName = 'Etiquetas'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[Etiquetas."DIRECCION1_CLIENTE"]')
          ParentFont = False
        end
        object FacturasCPOSTAL_CLIENTE_FACTURA: TfrxMemoView
          AllowVectorExport = True
          Left = 26.456710000000000000
          Top = 53.913420000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataField = 'CPOSTAL_CLIENTE'
          DataSet = dmClientes.fxdsEtiquetas
          DataSetName = 'Etiquetas'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[Etiquetas."CPOSTAL_CLIENTE"]')
          ParentFont = False
        end
        object POBLACION_CLIENTE_FACTURA: TfrxMemoView
          AllowVectorExport = True
          Left = 79.149660000000000000
          Top = 53.913420000000000000
          Width = 279.685220000000000000
          Height = 18.897650000000000000
          DataField = 'POBLACION_CLIENTE'
          DataSet = dmClientes.fxdsEtiquetas
          DataSetName = 'Etiquetas'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[Etiquetas."POBLACION_CLIENTE"]')
          ParentFont = False
        end
        object PROVINCIA_CLIENTE: TfrxMemoView
          AllowVectorExport = True
          Left = 26.456710000000000000
          Top = 76.590600000000000000
          Width = 366.614410000000000000
          Height = 18.897650000000000000
          DataField = 'PROVINCIA_CLIENTE'
          DataSet = dmClientes.fxdsEtiquetas
          DataSetName = 'Etiquetas'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[Etiquetas."PROVINCIA_CLIENTE"]')
          ParentFont = False
        end
      end
    end
  end
end
