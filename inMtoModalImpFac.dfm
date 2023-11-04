inherited frmPrintFac: TfrmPrintFac
  Caption = 'Imprimir Factura'
  ClientHeight = 278
  ClientWidth = 444
  Position = poMainFormCenter
  ExplicitWidth = 450
  ExplicitHeight = 307
  PixelsPerInch = 96
  TextHeight = 19
  inherited pnl1: TPanel
    Left = 290
    Width = 154
    Height = 278
    ExplicitLeft = 290
    ExplicitWidth = 154
    ExplicitHeight = 278
    inherited btnPDF: TcxButton
      Left = 11
      ExplicitLeft = 11
    end
    inherited btnImprimir: TcxButton
      Left = 11
      ExplicitLeft = 11
    end
    inherited btnVistaPreliminar: TcxButton
      Left = 11
      ExplicitLeft = 11
    end
    inherited btnSalir: TcxButton
      Top = 252
      Width = 152
      ExplicitTop = 252
      ExplicitWidth = 152
    end
    inherited btnEditar: TcxButton
      Left = 11
      ExplicitLeft = 11
    end
    inherited btnExcel: TcxButton
      Left = 11
      ExplicitLeft = 11
    end
  end
  object edtNroFac: TcxTextEdit [1]
    Left = 72
    Top = 24
    Enabled = False
    TabOrder = 1
    Width = 137
  end
  object lblcxlbl1: TcxLabel [2]
    Left = 8
    Top = 4
    Caption = 'Factura N'#250'mero'
  end
  object edtSerie: TcxTextEdit [3]
    Left = 8
    Top = 24
    Enabled = False
    TabOrder = 3
    Width = 41
  end
  object cxrdgrp1: TcxRadioGroup [4]
    Left = 8
    Top = 56
    Caption = 'Opciones'
    Properties.Items = <>
    TabOrder = 4
    Height = 137
    Width = 269
    object rbActual: TcxRadioButton
      Left = 8
      Top = 24
      Width = 223
      Height = 17
      Caption = 'Imprimir Factura actual'
      Checked = True
      TabOrder = 0
      TabStop = True
      OnClick = rbActualClick
    end
    object rbRangoFechas: TcxRadioButton
      Left = 8
      Top = 48
      Width = 258
      Height = 17
      Caption = 'Imprimir Rango de Facturas'
      Enabled = False
      TabOrder = 1
      OnClick = rbRangoFechasClick
    end
    object dedDesde: TcxDateEdit
      Left = 63
      Top = 72
      Enabled = False
      TabOrder = 2
      Width = 121
    end
    object dedHasta: TcxDateEdit
      Left = 63
      Top = 104
      Enabled = False
      TabOrder = 4
      Width = 121
    end
    object lblcxlbl2: TcxLabel
      Left = 7
      Top = 77
      Caption = 'Desde'
      Enabled = False
    end
    object lblcxlbl3: TcxLabel
      Left = 12
      Top = 105
      Caption = 'Hasta'
      Enabled = False
    end
  end
  inherited Localizer1: TcxLocalizer
    Left = 120
    Top = 200
  end
  inherited frxrprt1: TfrxReport
    ReportOptions.LastChange = 45065.596828229170000000
    ScriptText.Strings = (
      'procedure RetencionTotalOnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  if <Facturas."TOTAL_RETENCION_FACTURA"> <> 0 then'
      '  begin'
      '    RetencionTotal.Visible := True;'
      '    Retencion.Visible:= True;'
      '  end'
      '  else'
      '  begin'
      '    RetencionTotal.Visible := False;'
      '    Retencion.Visible := False;'
      '  end;'
      'end;'
      ''
      'procedure ImpuestosTotalOnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  if <Facturas."TOTAL_IMPUESTOS_FACTURA"> <> 0 then'
      '  begin'
      '    ImpuestosTotal.Visible := True;'
      '    Impuestos.Visible:= True;'
      '  end'
      '  else'
      '  begin'
      '    ImpuestosTotal.Visible := False;'
      '    Impuestos.Visible := False;'
      '  end;'
      'end;'
      ''
      'procedure BaseImponibleNOnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  if <Facturas."TOTAL_BASEI_IVAN_FACTURA"> <> 0 then'
      '  begin'
      '    BaseImponibleN.Visible := True;'
      '    FacturasTOTAL_IVAN_FACTURA.Visible := True;'
      '    FacturasPORCEN_IVAN_FACTURA.Visible:= True;'
      '    FacturasPORCEN_REN_FACTURA.Visible := True;'
      '    FacturasTOTAL_REN_FACTURA.Visible := True;'
      '  end'
      '  else'
      '  begin'
      '    BaseImponibleN.Visible := False;'
      '    FacturasTOTAL_IVAN_FACTURA.Visible := False;'
      '    FacturasPORCEN_IVAN_FACTURA.Visible:= False;'
      '    FacturasPORCEN_REN_FACTURA.Visible := False;'
      '    FacturasTOTAL_REN_FACTURA.Visible := False;'
      '  end;'
      'end;'
      ''
      'procedure BaseImponibleROnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  if <Facturas."TOTAL_BASEI_IVAR_FACTURA"> <> 0 then'
      '  begin'
      '    BaseImponibleR.Visible := True;'
      '    FacturasTOTAL_IVAR_FACTURA.Visible := True;'
      '    FacturasPORCEN_IVAR_FACTURA.Visible:= True;'
      '    FacturasPORCEN_RER_FACTURA.Visible := True;'
      '    FacturasTOTAL_RER_FACTURA1.Visible := True;'
      '  end'
      '  else'
      '  begin'
      '    BaseImponibleR.Visible := False;'
      '    FacturasTOTAL_IVAR_FACTURA.Visible := False;'
      '    FacturasPORCEN_IVAR_FACTURA.Visible:= False;'
      '    FacturasPORCEN_RER_FACTURA.Visible := False;'
      '    FacturasTOTAL_RER_FACTURA1.Visible := False;'
      '  end;'
      'end;'
      ''
      'procedure BaseImponibleSOnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  if <Facturas."TOTAL_BASEI_IVAS_FACTURA"> <> 0 then'
      '  begin'
      '    BaseImponibleS.Visible := True;'
      '    FacturasTOTAL_IVAS_FACTURA.Visible := True;'
      '    FacturasPORCEN_IVAS_FACTURA.Visible:= True;'
      '    FacturasPORCEN_RES_FACTURA.Visible := True;'
      '    FacturasTOTAL_RES_FACTURA1.Visible := True;'
      '  end'
      '  else'
      '  begin'
      '    BaseImponibleS.Visible := False;'
      '    FacturasTOTAL_IVAS_FACTURA.Visible := False;'
      '    FacturasPORCEN_IVAS_FACTURA.Visible:= False;'
      '    FacturasPORCEN_RES_FACTURA.Visible := False;'
      '    FacturasTOTAL_RES_FACTURA1.Visible := False;'
      '  end;'
      'end;'
      ''
      'procedure BaseImponibleEOnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '    if <Facturas."TOTAL_BASEI_IVAE_FACTURA"> <> 0 then'
      '  begin'
      '    BaseImponibleE.Visible := True;'
      '    FacturasTOTAL_IVAE_FACTURA.Visible := True;'
      '    FacturasPORCEN_IVAE_FACTURA.Visible:= True;'
      '    FacturasPORCEN_REE_FACTURA.Visible := True;'
      '    FacturasTOTAL_REE_FACTURA.Visible := True;'
      '  end'
      '  else'
      '  begin'
      '    BaseImponibleE.Visible := False;'
      '    FacturasTOTAL_IVAE_FACTURA.Visible := False;'
      '    FacturasPORCEN_IVAE_FACTURA.Visible:= False;'
      '    FacturasPORCEN_REE_FACTURA.Visible := False;'
      '    FacturasTOTAL_REE_FACTURA.Visible := False;'
      '  end;'
      
        '  if (<Facturas."TOTAL_BASEI_IVAE_FACTURA"> = <Facturas."TOTAL_B' +
        'ASES_FACTURA">) then'
      '  begin'
      '    CajaIVA.Visible := False;'
      '    CajaTitulosIVA.Visible := False;'
      '    BaseImponibleE.Visible := False;'
      '    TituloPorcenCajaIVA.Visible := False;'
      '    FacturasPORCEN_IVAE_FACTURA.Visible := False;'
      '    FacturasTOTAL_IVAE_FACTURA.Visible := False;'
      '    BaseImponibleCajaIVA.Visible := False;'
      '    TituloTotalCajaIVA.Visible := False;'
      '  end;'
      'end;'
      ''
      
        'procedure FacturasTOTAL_REN_FACTURAOnBeforePrint(Sender: TfrxCom' +
        'ponent);'
      'begin'
      '  if <Facturas."TOTAL_REN_FACTURA"> <> 0 then'
      '  begin'
      '    FacturasPORCEN_REN_FACTURA.Visible := True;'
      '    FacturasTOTAL_REN_FACTURA.Visible := True;'
      '  end'
      '  else'
      '  begin'
      '    FacturasPORCEN_REN_FACTURA.Visible := False;'
      '    FacturasTOTAL_REN_FACTURA.Visible := False;'
      '  end;'
      'end;'
      ''
      
        'procedure FacturasTOTAL_RER_FACTURAOnBeforePrint(Sender: TfrxCom' +
        'ponent);'
      'begin'
      '  if <Facturas."TOTAL_RER_FACTURA"> <> 0 then'
      '  begin'
      '    FacturasPORCEN_RER_FACTURA.Visible := True;'
      '    FacturasTOTAL_RER_FACTURA1.Visible := True;'
      '  end'
      '  else'
      '  begin'
      '    FacturasPORCEN_RER_FACTURA.Visible := False;'
      '    FacturasTOTAL_RER_FACTURA1.Visible := False;'
      '  end;'
      ''
      'end;'
      ''
      
        'procedure FacturasTOTAL_RES_FACTURAOnBeforePrint(Sender: TfrxCom' +
        'ponent);'
      'begin'
      '  if <Facturas."TOTAL_RES_FACTURA"> <> 0 then'
      '  begin'
      '    FacturasPORCEN_RES_FACTURA.Visible := True;'
      '    FacturasTOTAL_RES_FACTURA.Visible := True;'
      '  end'
      '  else'
      '  begin'
      '    FacturasPORCEN_RES_FACTURA.Visible := False;'
      '    FacturasTOTAL_RES_FACTURA1.Visible := False;'
      '  end;'
      ''
      'end;'
      ''
      
        'procedure FacturasTOTAL_REE_FACTURAOnBeforePrint(Sender: TfrxCom' +
        'ponent);'
      'begin'
      '    if <Facturas."TOTAL_REE_FACTURA"> <> 0 then'
      '  begin'
      '    FacturasPORCEN_REE_FACTURA.Visible := True;'
      '    FacturasTOTAL_REE_FACTURA.Visible := True;'
      '  end'
      '  else'
      '  begin'
      '    FacturasPORCEN_REE_FACTURA.Visible := False;'
      '    FacturasTOTAL_REE_FACTURA.Visible := False;'
      '  end;'
      ''
      'end;'
      ''
      'procedure RetencionPorcOnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  If (( <Facturas."TOTAL_REE_FACTURA"> +'
      '        <Facturas."TOTAL_RES_FACTURA"> +'
      '        <Facturas."TOTAL_RER_FACTURA"> +'
      '        <Facturas."TOTAL_REN_FACTURA"> ) = 0) then'
      '  begin'
      '    RetencionPorc.Visible := False;'
      '    RetencionTot.Visible := False;'
      '  end'
      '  else'
      '  begin'
      '    RetencionPorc.Visible := True;'
      '    RetencionTot.Visible := True;'
      '  end;'
      'end;'
      ''
      'procedure PageFooter1OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '   Engine.CurY := (20.5 * fr1cm);  '
      'end;'
      ''
      'procedure DetailData1OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  If (<Facturas."ESFECHADEENTREGA_FACTURA"> <> '#39'S'#39') then'
      '   begin              '
      
        '    // LineasFacturasDESCRIPCION_ARTICULO_FACTURA_LINEA.Width :=' +
        ' 76;                                                            ' +
        '                        '
      
        '    LineasFacturasFECHA_ENTREGA_FACTURA_LINEA.Visible := False; ' +
        '                                             '
      '  end'
      '  else            '
      '  begin              '
      
        '    // LineasFacturasDESCRIPCION_ARTICULO_FACTURA_LINEA.Width :=' +
        ' 98;        '
      
        '    LineasFacturasFECHA_ENTREGA_FACTURA_LINEA.Visible := True;  ' +
        '                                          '
      '  end;  '
      'end;'
      
        'procedure FechaEntregaTittleOnBeforePrint(Sender: TfrxComponent)' +
        ';'
      'begin'
      '  If (<Facturas."ESFECHADEENTREGA_FACTURA"> <> '#39'S'#39') then'
      '    FechaEntregaTittle.Visible := False'
      '  else'
      '    FechaEntregaTittle.Visible := True;                 '
      'end;'
      ''
      'begin                          '
      'end.')
    Left = 336
    Top = 176
    Datasets = <
      item
        DataSet = dmFacturas.fxdsPrintFac
        DataSetName = 'Facturas'
      end
      item
        DataSet = dmFacturas.fxdstPrintLinFac
        DataSetName = 'Lineas Facturas'
      end>
    Variables = <>
    Style = <>
    inherited Data: TfrxDataPage
      object FacturasTOTAL_RER_FACTURA: TfrxMemoView
        IndexTag = 1
        AllowVectorExport = True
        Left = 398.409710000000000000
        Top = 504.031540000000000000
        Width = 64.252010000000000000
        Height = 18.897650000000000000
        OnBeforePrint = 'FacturasTOTAL_RER_FACTURAOnBeforePrint'
        DataField = 'TOTAL_RER_FACTURA'
        DisplayFormat.DecimalSeparator = ','
        DisplayFormat.FormatStr = '%2.3m'
        DisplayFormat.Kind = fkNumeric
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        Frame.Typ = []
        HAlign = haRight
        Memo.UTF8W = (
          '[Facturas."TOTAL_RER_FACTURA"]')
        ParentFont = False
      end
      object FacturasTOTAL_RES_FACTURA: TfrxMemoView
        IndexTag = 1
        AllowVectorExport = True
        Left = 398.409710000000000000
        Top = 530.488250000000000000
        Width = 64.252010000000000000
        Height = 18.897650000000000000
        OnBeforePrint = 'FacturasTOTAL_RES_FACTURAOnBeforePrint'
        DataField = 'TOTAL_RES_FACTURA'
        DisplayFormat.DecimalSeparator = ','
        DisplayFormat.FormatStr = '%2.3m'
        DisplayFormat.Kind = fkNumeric
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        Frame.Typ = []
        HAlign = haRight
        Memo.UTF8W = (
          '[Facturas."TOTAL_RES_FACTURA"]')
        ParentFont = False
      end
    end
    inherited Page1: TfrxReportPage
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Frame.Typ = []
        Height = 351.496290000000000000
        Top = 18.897650000000000000
        Width = 755.906000000000000000
        DataSet = dmFacturas.fxdsPrintFac
        DataSetName = 'Facturas'
        RowCount = 0
        object Memo1: TfrxMemoView
          AllowVectorExport = True
          Left = 332.598640000000000000
          Top = 3.779530000000000000
          Width = 90.708720000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'FACTURA')
          ParentFont = False
        end
        object Memo2: TfrxMemoView
          AllowVectorExport = True
          Left = 16.677180000000000000
          Top = 170.078850000000000000
          Width = 355.275820000000000000
          Height = 136.063080000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          AllowVectorExport = True
          Left = 389.291590000000000000
          Top = 170.078850000000000000
          Width = 355.275820000000000000
          Height = 136.063080000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          ParentFont = False
        end
        object FacturasRAZONSOCIAL_EMPRESA_FACTURA: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 18.897650000000000000
          Top = 173.858380000000000000
          Width = 340.157700000000000000
          Height = 18.897650000000000000
          DataField = 'RAZONSOCIAL_EMPRESA_FACTURA'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[Facturas."RAZONSOCIAL_EMPRESA_FACTURA"]')
          ParentFont = False
        end
        object FacturasDIRECCION1_EMPRESA_FACTURA: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 18.897650000000000000
          Top = 196.535560000000000000
          Width = 340.157700000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            
              '[Facturas."DIRECCION1_EMPRESA_FACTURA"] [Facturas."DIRECCION2_EM' +
              'PRESA_FACTURA"]')
          ParentFont = False
          Formats = <
            item
            end
            item
            end>
        end
        object FacturasCPOSTAL_EMPRESA_FACTURA: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 18.897650000000000000
          Top = 217.889920000000000000
          Width = 340.157700000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            
              '[Facturas."CPOSTAL_EMPRESA_FACTURA"]   [Facturas."POBLACION_EMPR' +
              'ESA_FACTURA"]')
          ParentFont = False
        end
        object FacturasPROVINCIA_EMPRESA_FACTURA: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 18.897650000000000000
          Top = 240.567100000000000000
          Width = 340.157700000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '( [Facturas."PROVINCIA_EMPRESA_FACTURA"] )')
          ParentFont = False
        end
        object FacturasMOVIL_EMPRESA_FACTURA: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 18.897650000000000000
          Top = 263.244280000000000000
          Width = 117.165430000000000000
          Height = 18.897650000000000000
          DataField = 'MOVIL_EMPRESA_FACTURA'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[Facturas."MOVIL_EMPRESA_FACTURA"]')
          ParentFont = False
        end
        object FacturasEMAIL_EMPRESA_FACTURA: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 143.622140000000000000
          Top = 263.244280000000000000
          Width = 215.433210000000000000
          Height = 18.897650000000000000
          DataField = 'EMAIL_EMPRESA_FACTURA'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[Facturas."EMAIL_EMPRESA_FACTURA"]')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          AllowVectorExport = True
          Left = 22.677180000000000000
          Top = 139.842610000000000000
          Width = 52.913420000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            'Emisor')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          AllowVectorExport = True
          Left = 668.976810000000000000
          Top = 139.842610000000000000
          Width = 75.590600000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            'Receptor')
          ParentFont = False
        end
        object FacturasRAZONSOCIAL_CLIENTE_FACTURA: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 402.071120000000000000
          Top = 173.858380000000000000
          Width = 347.716760000000000000
          Height = 18.897650000000000000
          DataField = 'RAZONSOCIAL_CLIENTE_FACTURA'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[Facturas."RAZONSOCIAL_CLIENTE_FACTURA"]')
          ParentFont = False
        end
        object FacturasDIRECCION1_EMPRESA_FACTURA1: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 401.850650000000000000
          Top = 197.315090000000000000
          Width = 347.716760000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            
              '[Facturas."DIRECCION1_CLIENTE_FACTURA"] [Facturas."DIRECCION2_CL' +
              'IENTE_FACTURA"]')
          ParentFont = False
        end
        object FacturasCPOSTAL_CLIENTE_FACTURA: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 402.071120000000000000
          Top = 215.433210000000000000
          Width = 302.362400000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            
              '[Facturas."CPOSTAL_CLIENTE_FACTURA"]   [Facturas."POBLACION_CLIE' +
              'NTE_FACTURA"]')
          ParentFont = False
        end
        object FacturasPROVINCIA_EMPRESA_FACTURA1: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 402.071120000000000000
          Top = 234.330860000000000000
          Width = 347.716760000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '( [Facturas."PROVINCIA_CLIENTE_FACTURA"] )')
          ParentFont = False
        end
        object FacturasPAIS_CLIENTE_FACTURA: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 574.488560000000000000
          Top = 257.008040000000000000
          Width = 166.299320000000000000
          Height = 18.897650000000000000
          DataField = 'PAIS_CLIENTE_FACTURA'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[Facturas."PAIS_CLIENTE_FACTURA"]')
          ParentFont = False
        end
        object FacturasMOVIL_CLIENTE_FACTURA: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 402.071120000000000000
          Top = 275.905690000000000000
          Width = 128.504020000000000000
          Height = 18.897650000000000000
          DataField = 'MOVIL_CLIENTE_FACTURA'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[Facturas."MOVIL_CLIENTE_FACTURA"]')
          ParentFont = False
        end
        object FacturasEMAIL_CLIENTE_FACTURA: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 536.693260000000000000
          Top = 275.905690000000000000
          Width = 204.094620000000000000
          Height = 18.897650000000000000
          DataField = 'EMAIL_CLIENTE_FACTURA'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[Facturas."EMAIL_CLIENTE_FACTURA"]')
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          AllowVectorExport = True
          Left = 22.677180000000000000
          Top = 52.913420000000000000
          Width = 238.110390000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Fecha: [Facturas."FECHA_FACTURA"]')
          ParentFont = False
        end
        object FacturasNRO_FACTURA: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 22.677180000000000000
          Top = 83.149660000000000000
          Width = 238.110390000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            
              'N'#250'mero de Factura: [Facturas."SERIE_FACTURA"].[Facturas."NRO_FAC' +
              'TURA"]')
          ParentFont = False
          Formats = <
            item
            end
            item
            end>
        end
        object Memo7: TfrxMemoView
          AllowVectorExport = True
          Left = 22.677180000000000000
          Top = 325.039580000000000000
          Width = 729.449290000000000000
          Height = 26.456710000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          ParentFont = False
        end
        object Memo8: TfrxMemoView
          AllowVectorExport = True
          Left = 26.897650000000000000
          Top = 328.819110000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Descripci'#243'n')
          ParentFont = False
        end
        object Memo9: TfrxMemoView
          AllowVectorExport = True
          Left = 653.858690000000000000
          Top = 328.819110000000000000
          Width = 143.622140000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Total')
          ParentFont = False
        end
        object Memo10: TfrxMemoView
          AllowVectorExport = True
          Left = 398.953000000000000000
          Top = 328.819110000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Ctd')
          ParentFont = False
        end
        object Memo11: TfrxMemoView
          AllowVectorExport = True
          Left = 485.323130000000000000
          Top = 328.819110000000000000
          Width = 83.149660000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Precio')
          ParentFont = False
        end
        object TituloIvaColumna: TfrxMemoView
          AllowVectorExport = True
          Left = 582.047620000000000000
          Top = 328.819110000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '% [Facturas."PALABRA_REPORTS_ZONA_IVA_FACTURA"]')
          ParentFont = False
        end
        object FechaEntregaTittle: TfrxMemoView
          AllowVectorExport = True
          Left = 315.244280000000000000
          Top = 328.819110000000000000
          Width = 90.708720000000000000
          Height = 18.897650000000000000
          OnBeforePrint = 'FechaEntregaTittleOnBeforePrint'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Fecha Entrega')
          ParentFont = False
        end
      end
      object DetailData1: TfrxDetailData
        FillType = ftBrush
        Frame.Typ = []
        Height = 26.456710000000000000
        Top = 393.071120000000000000
        Width = 755.906000000000000000
        OnBeforePrint = 'DetailData1OnBeforePrint'
        DataSet = dmFacturas.fxdstPrintLinFac
        DataSetName = 'Lineas Facturas'
        RowCount = 0
        object LineasFacturasTOTAL_LINEA: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 653.858690000000000000
          Top = 4.338590000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[Lineas Facturas."TOTAL_FACTURA_LINEA"]')
          ParentFont = False
        end
        object LineasFacturasCANTIDAD_FACTURA_LINEA: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 398.953000000000000000
          Top = 3.779530000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            
              '[Lineas Facturas."CANTIDAD_FACTURA_LINEA"] [Lineas Facturas."TIP' +
              'O_CANTIDAD_ARTICULO_FACTURA_LINEA"]')
          ParentFont = False
          Formats = <
            item
            end
            item
            end>
        end
        object LineasFacturasPRECIOVENTA_SIVA_ARTICULO_FACTURA_LINEA: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 489.102660000000000000
          Top = 3.779530000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataField = 'PRECIOVENTA_SIVA_ARTICULO_FACTURA_LINEA'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = []
          Memo.UTF8W = (
            '[Lineas Facturas."PRECIOVENTA_SIVA_ARTICULO_FACTURA_LINEA"]')
        end
        object LineasFacturasPORCEN_IVA_FACTURA_LINEA: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 582.047620000000000000
          Top = 3.779530000000000000
          Width = 56.692950000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%g %'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = []
          Memo.UTF8W = (
            '[Lineas Facturas."PORCEN_IVA_FACTURA_LINEA"]%')
        end
        object LineasFacturasFECHA_ENTREGA_FACTURA_LINEA: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 315.244280000000000000
          Top = 3.779530000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataField = 'FECHA_ENTREGA_FACTURA_LINEA'
          DataSet = dmFacturas.fxdstPrintLinFac
          DataSetName = 'Lineas Facturas'
          DisplayFormat.FormatStr = 'dd/mm/yyyy'
          DisplayFormat.Kind = fkDateTime
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[Lineas Facturas."FECHA_ENTREGA_FACTURA_LINEA"]')
          ParentFont = False
        end
        object LineasFacturasDESCRIPCION_ARTICULO_FACTURA_LINEA: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 22.677180000000000000
          Top = 3.779530000000000000
          Width = 287.244280000000000000
          Height = 18.897650000000000000
          DataField = 'DESCRIPCION_ARTICULO_FACTURA_LINEA'
          DataSet = dmFacturas.fxdstPrintLinFac
          DataSetName = 'Lineas Facturas'
          Frame.Typ = []
          Memo.UTF8W = (
            '[Lineas Facturas."DESCRIPCION_ARTICULO_FACTURA_LINEA"]')
        end
      end
      object Memo19: TfrxMemoView
        AllowVectorExport = True
        Left = 876.850974650000000000
        Top = 619.842920000000000000
        Width = 79.370130000000000000
        Height = 18.897650000000000000
        DisplayFormat.DecimalSeparator = ','
        DisplayFormat.FormatStr = '%2.2m'
        DisplayFormat.Kind = fkNumeric
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        Frame.Typ = []
        HAlign = haRight
        Memo.UTF8W = (
          '[Facturas."TOTAL_LIQUIDO_FACTURA"]')
        ParentFont = False
      end
      object Memo21: TfrxMemoView
        IndexTag = 1
        AllowVectorExport = True
        Left = 876.850974650000000000
        Top = 582.047620000000000000
        Width = 79.370130000000000000
        Height = 18.897650000000000000
        OnBeforePrint = 'RetencionTotalOnBeforePrint'
        DisplayFormat.DecimalSeparator = ','
        DisplayFormat.FormatStr = '%2.2m'
        DisplayFormat.Kind = fkNumeric
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        Frame.Typ = []
        HAlign = haRight
        Memo.UTF8W = (
          '[<Facturas."TOTAL_RETENCION_FACTURA"> * (-1)]')
        ParentFont = False
      end
      object Memo23: TfrxMemoView
        AllowVectorExport = True
        Left = 877.969094650000000000
        Top = 553.701145000000000000
        Width = 79.370130000000000000
        Height = 18.897650000000000000
        OnBeforePrint = 'ImpuestosTotalOnBeforePrint'
        DisplayFormat.DecimalSeparator = ','
        DisplayFormat.FormatStr = '%2.2m'
        DisplayFormat.Kind = fkNumeric
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        Frame.Typ = []
        HAlign = haRight
        Memo.UTF8W = (
          '[Facturas."TOTAL_IMPUESTOS_FACTURA"]')
        ParentFont = False
      end
      object Memo25: TfrxMemoView
        AllowVectorExport = True
        Left = 877.969094650000000000
        Top = 525.354670000000000000
        Width = 79.370130000000000000
        Height = 18.897650000000000000
        OnBeforePrint = 'ImpuestosTotalOnBeforePrint'
        DisplayFormat.DecimalSeparator = ','
        DisplayFormat.FormatStr = '%2.2m'
        DisplayFormat.Kind = fkNumeric
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        Frame.Typ = []
        HAlign = haRight
        Memo.UTF8W = (
          '[Facturas."TOTAL_BASES_FACTURA"]')
        ParentFont = False
      end
      object PageFooter1: TfrxPageFooter
        FillType = ftBrush
        Frame.Typ = []
        Height = 257.008040000000000000
        Top = 480.000310000000000000
        Width = 755.906000000000000000
        OnBeforePrint = 'PageFooter1OnBeforePrint'
        object CajaIVA: TfrxMemoView
          AllowVectorExport = True
          Left = 22.677194650000000000
          Top = 3.779530000000000000
          Width = 468.661720000000000000
          Height = 143.622140000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          ParentFont = False
        end
        object CajaTitulosIVA: TfrxMemoView
          AllowVectorExport = True
          Left = 22.677180000000000000
          Top = 3.779530000000000000
          Width = 468.661417320000000000
          Height = 26.456710000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          ParentFont = False
        end
        object Memo13: TfrxMemoView
          AllowVectorExport = True
          Left = 653.858704650000000000
          Top = 132.283550000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[Facturas."TOTAL_LIQUIDO_FACTURA"]')
          ParentFont = False
        end
        object Retencion: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 512.897974650000000000
          Top = 94.488250000000000000
          Width = 143.622140000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%g'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            'Retenci'#243'n IRPF [Facturas."PORCEN_RETENCION_FACTURA"]%')
          ParentFont = False
        end
        object RetencionTotal: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 653.858704650000000000
          Top = 94.488250000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          OnBeforePrint = 'RetencionTotalOnBeforePrint'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[<Facturas."TOTAL_RETENCION_FACTURA"> * (-1)]')
          ParentFont = False
        end
        object Memo14: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 512.897974650000000000
          Top = 132.283550000000000000
          Width = 143.622140000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%g'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            'Total Factura')
          ParentFont = False
        end
        object ImpuestosTotal: TfrxMemoView
          AllowVectorExport = True
          Left = 654.976824650000000000
          Top = 66.141775000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          OnBeforePrint = 'ImpuestosTotalOnBeforePrint'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[Facturas."TOTAL_IMPUESTOS_FACTURA"]')
          ParentFont = False
        end
        object Impuestos: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 514.016094650000000000
          Top = 66.141775000000000000
          Width = 143.622140000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%g'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            'Total Impuestos')
          ParentFont = False
        end
        object TotalBases: TfrxMemoView
          AllowVectorExport = True
          Left = 654.976824650000000000
          Top = 37.795300000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          OnBeforePrint = 'ImpuestosTotalOnBeforePrint'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[Facturas."TOTAL_BASES_FACTURA"]')
          ParentFont = False
        end
        object Memo17: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 514.016094650000000000
          Top = 37.795300000000000000
          Width = 143.622140000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%g'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            'Total Base Imponible')
          ParentFont = False
        end
        object BaseImponibleN: TfrxMemoView
          AllowVectorExport = True
          Left = 30.236254650000000000
          Top = 34.015770000000000000
          Width = 90.708720000000000000
          Height = 15.118120000000000000
          OnBeforePrint = 'BaseImponibleNOnBeforePrint'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.3m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[Facturas."TOTAL_BASEI_IVAN_FACTURA"]')
          ParentFont = False
        end
        object BaseImponibleCajaIVA: TfrxMemoView
          AllowVectorExport = True
          Left = 30.236254650000000000
          Top = 7.559060000000000000
          Width = 102.047310000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Base Imponible')
          ParentFont = False
        end
        object BaseImponibleE: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 26.456724650000000000
          Top = 113.385900000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          OnBeforePrint = 'BaseImponibleEOnBeforePrint'
          DataField = 'TOTAL_BASEI_IVAE_FACTURA'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.3m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[Facturas."TOTAL_BASEI_IVAE_FACTURA"]')
          ParentFont = False
        end
        object TituloPorcenCajaIVA: TfrxMemoView
          AllowVectorExport = True
          Left = 151.181214650000000000
          Top = 7.559060000000000000
          Width = 68.031540000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '% [Facturas."PALABRA_REPORTS_ZONA_IVA_FACTURA"]')
          ParentFont = False
        end
        object TituloTotalCajaIVA: TfrxMemoView
          AllowVectorExport = True
          Left = 226.771814650000000000
          Top = 7.559060000000000000
          Width = 86.929190000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Total [Facturas."PALABRA_REPORTS_ZONA_IVA_FACTURA"]')
          ParentFont = False
        end
        object RetencionPorc: TfrxMemoView
          AllowVectorExport = True
          Left = 317.480534650000000000
          Top = 7.559060000000000000
          Width = 71.811070000000000000
          Height = 15.118120000000000000
          OnBeforePrint = 'RetencionPorcOnBeforePrint'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '% R.E.')
          ParentFont = False
        end
        object RetencionTot: TfrxMemoView
          AllowVectorExport = True
          Left = 398.409724650000000000
          Top = 7.559060000000000000
          Width = 71.811070000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Total R.E.')
          ParentFont = False
        end
        object FacturasTOTAL_IVAN_FACTURA: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 226.771814650000000000
          Top = 34.015770000000000000
          Width = 56.692950000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.3m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[Facturas."TOTAL_IVAN_FACTURA"]')
          ParentFont = False
        end
        object FacturasPORCEN_IVAN_FACTURA: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 151.181214650000000000
          Top = 34.015770000000000000
          Width = 56.692950000000000000
          Height = 18.897650000000000000
          DisplayFormat.FormatStr = '%g'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[Facturas."PORCEN_IVAN_FACTURA"]%')
          ParentFont = False
        end
        object FacturasPORCEN_IVAR_FACTURA: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 151.181214650000000000
          Top = 60.472480000000000000
          Width = 56.692950000000000000
          Height = 18.897650000000000000
          DisplayFormat.FormatStr = '%g'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[Facturas."PORCEN_IVAR_FACTURA"]%')
          ParentFont = False
        end
        object FacturasPORCEN_IVAS_FACTURA: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 151.181214650000000000
          Top = 86.929190000000000000
          Width = 56.692950000000000000
          Height = 18.897650000000000000
          DisplayFormat.FormatStr = '%g'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[Facturas."PORCEN_IVAS_FACTURA"]%')
          ParentFont = False
        end
        object FacturasPORCEN_IVAE_FACTURA: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 151.181214650000000000
          Top = 113.385900000000000000
          Width = 56.692950000000000000
          Height = 18.897650000000000000
          DisplayFormat.FormatStr = '%g'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[Facturas."PORCEN_IVAE_FACTURA"]%')
          ParentFont = False
        end
        object FacturasTOTAL_IVAR_FACTURA: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 226.771814650000000000
          Top = 60.472480000000000000
          Width = 56.692950000000000000
          Height = 18.897650000000000000
          DataField = 'TOTAL_IVAR_FACTURA'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.3m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[Facturas."TOTAL_IVAR_FACTURA"]')
          ParentFont = False
        end
        object FacturasTOTAL_IVAS_FACTURA: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 226.771814650000000000
          Top = 86.929190000000000000
          Width = 56.692950000000000000
          Height = 18.897650000000000000
          DataField = 'TOTAL_IVAS_FACTURA'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.3m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[Facturas."TOTAL_IVAS_FACTURA"]')
          ParentFont = False
        end
        object FacturasTOTAL_IVAE_FACTURA: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 226.771814650000000000
          Top = 113.385900000000000000
          Width = 56.692950000000000000
          Height = 18.897650000000000000
          DataField = 'TOTAL_IVAE_FACTURA'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.3m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[Facturas."TOTAL_IVAE_FACTURA"]')
          ParentFont = False
        end
        object FacturasPORCEN_REN_FACTURA: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 317.480534650000000000
          Top = 34.015770000000000000
          Width = 56.692950000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%g'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[Facturas."PORCEN_REN_FACTURA"]%')
          ParentFont = False
        end
        object FacturasPORCEN_RER_FACTURA: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 317.480534650000000000
          Top = 60.472480000000000000
          Width = 56.692950000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%g'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[Facturas."PORCEN_RER_FACTURA"]%')
          ParentFont = False
        end
        object FacturasPORCEN_REE_FACTURA: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 317.480534650000000000
          Top = 113.385900000000000000
          Width = 56.692950000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%g'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[Facturas."PORCEN_REE_FACTURA"]%')
          ParentFont = False
        end
        object FacturasPORCEN_RES_FACTURA: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 317.480534650000000000
          Top = 86.929190000000000000
          Width = 52.913420000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%g'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[Facturas."PORCEN_RES_FACTURA"]%')
          ParentFont = False
        end
        object FacturasTOTAL_REN_FACTURA: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 398.409724650000000000
          Top = 34.015770000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          OnBeforePrint = 'FacturasTOTAL_REN_FACTURAOnBeforePrint'
          DataField = 'TOTAL_REN_FACTURA'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.3m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[Facturas."TOTAL_REN_FACTURA"]')
          ParentFont = False
        end
        object FacturasTOTAL_REE_FACTURA: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 398.409724650000000000
          Top = 113.385900000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          OnBeforePrint = 'FacturasTOTAL_REE_FACTURAOnBeforePrint'
          DataField = 'TOTAL_REE_FACTURA'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.3m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[Facturas."TOTAL_REE_FACTURA"]')
          ParentFont = False
        end
        object BaseImponibleR: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 26.456724650000000000
          Top = 60.472480000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          OnBeforePrint = 'BaseImponibleROnBeforePrint'
          DataField = 'TOTAL_BASEI_IVAR_FACTURA'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.3m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[Facturas."TOTAL_BASEI_IVAR_FACTURA"]')
          ParentFont = False
        end
        object BaseImponibleS: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 26.456724650000000000
          Top = 86.929190000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          OnBeforePrint = 'BaseImponibleSOnBeforePrint'
          DataField = 'TOTAL_BASEI_IVAS_FACTURA'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.3m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[Facturas."TOTAL_BASEI_IVAS_FACTURA"]')
          ParentFont = False
        end
        object FacturasTOTAL_RER_FACTURA1: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 394.630194650000000000
          Top = 60.472480000000000000
          Width = 68.031540000000000000
          Height = 18.897650000000000000
          DataField = 'TOTAL_RER_FACTURA'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.3m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[Facturas."TOTAL_RER_FACTURA"]')
          ParentFont = False
        end
        object FacturasTOTAL_RES_FACTURA1: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 394.630194650000000000
          Top = 86.929190000000000000
          Width = 68.031540000000000000
          Height = 18.897650000000000000
          DataField = 'TOTAL_RES_FACTURA'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.3m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[Facturas."TOTAL_RES_FACTURA"]')
          ParentFont = False
        end
        object FacturasCOMENTARIOS_FACTURA: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 23.677194650000000000
          Top = 178.401670000000000000
          Width = 710.551640000000000000
          Height = 30.236240000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            
              '[VarToStr(<Facturas."TEXTO_LEGAL_FACTURA_CLIENTE_FACTURA">)+'#39'  '#39 +
              '+'
            
              ' VarToStr(<Facturas."TEXTO_LEGAL_FACTURA_EMPRESA_FACTURA">) +'#39'  ' +
              #39'+'
            ' VarToStr(<Facturas."COMENTARIOS_FACTURA">)]')
          ParentFont = False
        end
        object Memo15: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 26.456724650000000000
          Top = 154.960730000000000000
          Width = 706.772110000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Forma de Pago: [Facturas."DESCRIPCION_FORMAPAGO"]')
          ParentFont = False
        end
      end
    end
  end
  inherited frxpdfxprtPedWeb: TfrxPDFExport
    CreationTime = 0.000000000000000000
    Left = 232
    Top = 200
  end
  inherited frxlsxprtExcel: TfrxXLSXExport
    CreationTime = 44864.742612013890000000
    Left = 400
    Top = 192
  end
  inherited unqryPerfiles: TUniQuery
    Left = 8
    Top = 200
  end
  inherited dsPerfiles: TDataSource
    Left = 64
    Top = 200
  end
  inherited frxdsgnr1: TfrxDesigner
    Left = 184
    Top = 208
  end
  inherited frxReportOrigen: TfrxReport
    ReportOptions.LastChange = 45230.829662789350000000
    ScriptText.Strings = (
      'procedure RetencionTotalOnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  if <Facturas."TOTAL_RETENCION_FACTURA"> <> 0 then'
      '  begin'
      '    RetencionTotal.Visible := True;'
      '    Retencion.Visible:= True;'
      '  end'
      '  else'
      '  begin'
      '    RetencionTotal.Visible := False;'
      '    Retencion.Visible := False;'
      '  end;'
      'end;'
      ''
      'procedure ImpuestosTotalOnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  if <Facturas."TOTAL_IMPUESTOS_FACTURA"> <> 0 then'
      '  begin'
      '    ImpuestosTotal.Visible := True;'
      '    Impuestos.Visible:= True;'
      '  end'
      '  else'
      '  begin'
      '    ImpuestosTotal.Visible := False;'
      '    Impuestos.Visible := False;'
      '  end;'
      'end;'
      ''
      'procedure BaseImponibleNOnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  if <Facturas."TOTAL_BASEI_IVAN_FACTURA"> <> 0 then'
      '  begin'
      '    BaseImponibleN.Visible := True;'
      '    FacturasTOTAL_IVAN_FACTURA.Visible := True;'
      '    FacturasPORCEN_IVAN_FACTURA.Visible:= True;'
      '    FacturasPORCEN_REN_FACTURA.Visible := True;'
      '    FacturasTOTAL_REN_FACTURA.Visible := True;'
      '  end'
      '  else'
      '  begin'
      '    BaseImponibleN.Visible := False;'
      '    FacturasTOTAL_IVAN_FACTURA.Visible := False;'
      '    FacturasPORCEN_IVAN_FACTURA.Visible:= False;'
      '    FacturasPORCEN_REN_FACTURA.Visible := False;'
      '    FacturasTOTAL_REN_FACTURA.Visible := False;'
      '  end;'
      'end;'
      ''
      'procedure BaseImponibleROnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  if <Facturas."TOTAL_BASEI_IVAR_FACTURA"> <> 0 then'
      '  begin'
      '    BaseImponibleR.Visible := True;'
      '    FacturasTOTAL_IVAR_FACTURA.Visible := True;'
      '    FacturasPORCEN_IVAR_FACTURA.Visible:= True;'
      '    FacturasPORCEN_RER_FACTURA.Visible := True;'
      '    FacturasTOTAL_RER_FACTURA1.Visible := True;'
      '  end'
      '  else'
      '  begin'
      '    BaseImponibleR.Visible := False;'
      '    FacturasTOTAL_IVAR_FACTURA.Visible := False;'
      '    FacturasPORCEN_IVAR_FACTURA.Visible:= False;'
      '    FacturasPORCEN_RER_FACTURA.Visible := False;'
      '    FacturasTOTAL_RER_FACTURA1.Visible := False;'
      '  end;'
      'end;'
      ''
      'procedure BaseImponibleSOnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  if <Facturas."TOTAL_BASEI_IVAS_FACTURA"> <> 0 then'
      '  begin'
      '    BaseImponibleS.Visible := True;'
      '    FacturasTOTAL_IVAS_FACTURA.Visible := True;'
      '    FacturasPORCEN_IVAS_FACTURA.Visible:= True;'
      '    FacturasPORCEN_RES_FACTURA.Visible := True;'
      '    FacturasTOTAL_RES_FACTURA1.Visible := True;'
      '  end'
      '  else'
      '  begin'
      '    BaseImponibleS.Visible := False;'
      '    FacturasTOTAL_IVAS_FACTURA.Visible := False;'
      '    FacturasPORCEN_IVAS_FACTURA.Visible:= False;'
      '    FacturasPORCEN_RES_FACTURA.Visible := False;'
      '    FacturasTOTAL_RES_FACTURA1.Visible := False;'
      '  end;'
      'end;'
      ''
      'procedure BaseImponibleEOnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '    if <Facturas."TOTAL_BASEI_IVAE_FACTURA"> <> 0 then'
      '  begin'
      '    BaseImponibleE.Visible := True;'
      '    FacturasTOTAL_IVAE_FACTURA.Visible := True;'
      '    FacturasPORCEN_IVAE_FACTURA.Visible:= True;'
      '    FacturasPORCEN_REE_FACTURA.Visible := True;'
      '    FacturasTOTAL_REE_FACTURA.Visible := True;'
      '  end'
      '  else'
      '  begin'
      '    BaseImponibleE.Visible := False;'
      '    FacturasTOTAL_IVAE_FACTURA.Visible := False;'
      '    FacturasPORCEN_IVAE_FACTURA.Visible:= False;'
      '    FacturasPORCEN_REE_FACTURA.Visible := False;'
      '    FacturasTOTAL_REE_FACTURA.Visible := False;'
      '  end;'
      
        '  if (<Facturas."TOTAL_BASEI_IVAE_FACTURA"> = <Facturas."TOTAL_B' +
        'ASES_FACTURA">) then'
      '  begin'
      '    CajaIVA.Visible := False;'
      '    CajaTitulosIVA.Visible := False;'
      '    BaseImponibleE.Visible := False;'
      '    TituloPorcenCajaIVA.Visible := False;'
      '    FacturasPORCEN_IVAE_FACTURA.Visible := False;'
      '    FacturasTOTAL_IVAE_FACTURA.Visible := False;'
      '    BaseImponibleCajaIVA.Visible := False;'
      '    TituloTotalCajaIVA.Visible := False;'
      '  end;'
      'end;'
      ''
      
        'procedure FacturasTOTAL_REN_FACTURAOnBeforePrint(Sender: TfrxCom' +
        'ponent);'
      'begin'
      '  if <Facturas."TOTAL_REN_FACTURA"> <> 0 then'
      '  begin'
      '    FacturasPORCEN_REN_FACTURA.Visible := True;'
      '    FacturasTOTAL_REN_FACTURA.Visible := True;'
      '  end'
      '  else'
      '  begin'
      '    FacturasPORCEN_REN_FACTURA.Visible := False;'
      '    FacturasTOTAL_REN_FACTURA.Visible := False;'
      '  end;'
      'end;'
      ''
      
        'procedure FacturasTOTAL_RER_FACTURAOnBeforePrint(Sender: TfrxCom' +
        'ponent);'
      'begin'
      '  if <Facturas."TOTAL_RER_FACTURA"> <> 0 then'
      '  begin'
      '    FacturasPORCEN_RER_FACTURA.Visible := True;'
      '    FacturasTOTAL_RER_FACTURA1.Visible := True;'
      '  end'
      '  else'
      '  begin'
      '    FacturasPORCEN_RER_FACTURA.Visible := False;'
      '    FacturasTOTAL_RER_FACTURA1.Visible := False;'
      '  end;'
      ''
      'end;'
      ''
      
        'procedure FacturasTOTAL_RES_FACTURAOnBeforePrint(Sender: TfrxCom' +
        'ponent);'
      'begin'
      '  if <Facturas."TOTAL_RES_FACTURA"> <> 0 then'
      '  begin'
      '    FacturasPORCEN_RES_FACTURA.Visible := True;'
      '    FacturasTOTAL_RES_FACTURA.Visible := True;'
      '  end'
      '  else'
      '  begin'
      '    FacturasPORCEN_RES_FACTURA.Visible := False;'
      '    FacturasTOTAL_RES_FACTURA1.Visible := False;'
      '  end;'
      ''
      'end;'
      ''
      
        'procedure FacturasTOTAL_REE_FACTURAOnBeforePrint(Sender: TfrxCom' +
        'ponent);'
      'begin'
      '    if <Facturas."TOTAL_REE_FACTURA"> <> 0 then'
      '  begin'
      '    FacturasPORCEN_REE_FACTURA.Visible := True;'
      '    FacturasTOTAL_REE_FACTURA.Visible := True;'
      '  end'
      '  else'
      '  begin'
      '    FacturasPORCEN_REE_FACTURA.Visible := False;'
      '    FacturasTOTAL_REE_FACTURA.Visible := False;'
      '  end;'
      ''
      'end;'
      ''
      'procedure RetencionPorcOnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  If (( <Facturas."TOTAL_REE_FACTURA"> +'
      '        <Facturas."TOTAL_RES_FACTURA"> +'
      '        <Facturas."TOTAL_RER_FACTURA"> +'
      '        <Facturas."TOTAL_REN_FACTURA"> ) = 0) then'
      '  begin'
      '    RetencionPorc.Visible := False;'
      '    RetencionTot.Visible := False;'
      '  end'
      '  else'
      '  begin'
      '    RetencionPorc.Visible := True;'
      '    RetencionTot.Visible := True;'
      '  end;'
      'end;'
      ''
      'procedure PageFooter1OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '   Engine.CurY := (20.5 * fr1cm);'
      'end;'
      ''
      'procedure DetailData1OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  If (<Facturas."ESFECHADEENTREGA_FACTURA"> <> '#39'S'#39') then'
      '   begin'
      
        '    // LineasFacturasDESCRIPCION_ARTICULO_FACTURA_LINEA.Width :=' +
        ' 76;'
      '    LineasFacturasFECHA_ENTREGA_FACTURA_LINEA.Visible := False;'
      '  end'
      '  else'
      '  begin'
      
        '    // LineasFacturasDESCRIPCION_ARTICULO_FACTURA_LINEA.Width :=' +
        ' 98;'
      '    LineasFacturasFECHA_ENTREGA_FACTURA_LINEA.Visible := True;'
      '  end;'
      'end;'
      
        'procedure FechaEntregaTittleOnBeforePrint(Sender: TfrxComponent)' +
        ';'
      'begin'
      '  If (<Facturas."ESFECHADEENTREGA_FACTURA"> <> '#39'S'#39') then'
      '    FechaEntregaTittle.Visible := False'
      '  else'
      '    FechaEntregaTittle.Visible := True;'
      'end;'
      ''
      'begin'
      'end.')
    Left = 288
    Top = 192
    Datasets = <
      item
        DataSet = dmFacturas.fxdsPrintFac
        DataSetName = 'Facturas'
      end
      item
        DataSet = dmFacturas.fxdstPrintLinFac
        DataSetName = 'Lineas Facturas'
      end>
    Variables = <>
    Style = <>
    inherited Data: TfrxDataPage
      object FacturasTOTAL_RER_FACTURA: TfrxMemoView
        IndexTag = 1
        AllowVectorExport = True
        Left = 398.409710000000000000
        Top = 504.031540000000000000
        Width = 64.252010000000000000
        Height = 18.897650000000000000
        OnBeforePrint = 'FacturasTOTAL_RER_FACTURAOnBeforePrint'
        DataField = 'TOTAL_RER_FACTURA'
        DisplayFormat.DecimalSeparator = ','
        DisplayFormat.FormatStr = '%2.3m'
        DisplayFormat.Kind = fkNumeric
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        Frame.Typ = []
        HAlign = haRight
        Memo.UTF8W = (
          '[Facturas."TOTAL_RER_FACTURA"]')
        ParentFont = False
      end
      object FacturasTOTAL_RES_FACTURA: TfrxMemoView
        IndexTag = 1
        AllowVectorExport = True
        Left = 398.409710000000000000
        Top = 530.488250000000000000
        Width = 64.252010000000000000
        Height = 18.897650000000000000
        OnBeforePrint = 'FacturasTOTAL_RES_FACTURAOnBeforePrint'
        DataField = 'TOTAL_RES_FACTURA'
        DisplayFormat.DecimalSeparator = ','
        DisplayFormat.FormatStr = '%2.3m'
        DisplayFormat.Kind = fkNumeric
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        Frame.Typ = []
        HAlign = haRight
        Memo.UTF8W = (
          '[Facturas."TOTAL_RES_FACTURA"]')
        ParentFont = False
      end
    end
    inherited Page1: TfrxReportPage
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Frame.Typ = []
        Height = 393.071120000000000000
        Top = 18.897650000000000000
        Width = 755.906000000000000000
        DataSet = dmFacturas.fxdsPrintFac
        DataSetName = 'Facturas'
        RowCount = 0
        object Memo1: TfrxMemoView
          AllowVectorExport = True
          Left = 332.598640000000000000
          Top = 30.236240000000000000
          Width = 90.708720000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'FACTURA')
          ParentFont = False
        end
        object Memo2: TfrxMemoView
          AllowVectorExport = True
          Left = 16.677180000000000000
          Top = 173.858380000000000000
          Width = 355.275820000000000000
          Height = 154.960730000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          AllowVectorExport = True
          Left = 389.291590000000000000
          Top = 173.858380000000000000
          Width = 355.275820000000000000
          Height = 154.960730000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          ParentFont = False
        end
        object FacturasRAZONSOCIAL_EMPRESA_FACTURA: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 22.677180000000000000
          Top = 177.637910000000000000
          Width = 340.157700000000000000
          Height = 18.897650000000000000
          DataField = 'RAZONSOCIAL_EMPRESA_FACTURA'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[Facturas."RAZONSOCIAL_EMPRESA_FACTURA"]')
          ParentFont = False
        end
        object FacturasDIRECCION1_EMPRESA_FACTURA: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 22.677180000000000000
          Top = 200.315090000000000000
          Width = 340.157700000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            
              '[Facturas."DIRECCION1_EMPRESA_FACTURA"] [Facturas."DIRECCION2_EM' +
              'PRESA_FACTURA"]')
          ParentFont = False
          Formats = <
            item
            end
            item
            end>
        end
        object FacturasCPOSTAL_EMPRESA_FACTURA: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 22.677180000000000000
          Top = 221.669450000000000000
          Width = 340.157700000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            
              '[Facturas."CPOSTAL_EMPRESA_FACTURA"]   [Facturas."POBLACION_EMPR' +
              'ESA_FACTURA"]')
          ParentFont = False
        end
        object FacturasPROVINCIA_EMPRESA_FACTURA: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 22.677180000000000000
          Top = 244.346630000000000000
          Width = 340.157700000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '( [Facturas."PROVINCIA_EMPRESA_FACTURA"] )')
          ParentFont = False
        end
        object FacturasMOVIL_EMPRESA_FACTURA: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 22.677180000000000000
          Top = 267.023810000000000000
          Width = 117.165430000000000000
          Height = 18.897650000000000000
          DataField = 'MOVIL_EMPRESA_FACTURA'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[Facturas."MOVIL_EMPRESA_FACTURA"]')
          ParentFont = False
        end
        object FacturasEMAIL_EMPRESA_FACTURA: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 143.622140000000000000
          Top = 267.023810000000000000
          Width = 215.433210000000000000
          Height = 18.897650000000000000
          DataField = 'EMAIL_EMPRESA_FACTURA'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[Facturas."EMAIL_EMPRESA_FACTURA"]')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          AllowVectorExport = True
          Left = 22.677180000000000000
          Top = 143.622140000000000000
          Width = 52.913420000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            'Emisor')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          AllowVectorExport = True
          Left = 668.976810000000000000
          Top = 143.622140000000000000
          Width = 75.590600000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            'Receptor')
          ParentFont = False
        end
        object FacturasRAZONSOCIAL_CLIENTE_FACTURA: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 402.071120000000000000
          Top = 177.637910000000000000
          Width = 347.716760000000000000
          Height = 18.897650000000000000
          DataField = 'RAZONSOCIAL_CLIENTE_FACTURA'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[Facturas."RAZONSOCIAL_CLIENTE_FACTURA"]')
          ParentFont = False
        end
        object FacturasDIRECCION1_EMPRESA_FACTURA1: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 401.850650000000000000
          Top = 201.094620000000000000
          Width = 347.716760000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            
              '[Facturas."DIRECCION1_CLIENTE_FACTURA"] [Facturas."DIRECCION2_CL' +
              'IENTE_FACTURA"]')
          ParentFont = False
        end
        object FacturasCPOSTAL_CLIENTE_FACTURA: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 402.071120000000000000
          Top = 219.212740000000000000
          Width = 302.362400000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            
              '[Facturas."CPOSTAL_CLIENTE_FACTURA"]   [Facturas."POBLACION_CLIE' +
              'NTE_FACTURA"]')
          ParentFont = False
        end
        object FacturasPROVINCIA_EMPRESA_FACTURA1: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 402.071120000000000000
          Top = 238.110390000000000000
          Width = 347.716760000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '( [Facturas."PROVINCIA_CLIENTE_FACTURA"] )')
          ParentFont = False
        end
        object FacturasPAIS_CLIENTE_FACTURA: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 574.488560000000000000
          Top = 260.787570000000000000
          Width = 166.299320000000000000
          Height = 18.897650000000000000
          DataField = 'PAIS_CLIENTE_FACTURA'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[Facturas."PAIS_CLIENTE_FACTURA"]')
          ParentFont = False
        end
        object FacturasMOVIL_CLIENTE_FACTURA: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 402.071120000000000000
          Top = 279.685220000000000000
          Width = 128.504020000000000000
          Height = 18.897650000000000000
          DataField = 'MOVIL_CLIENTE_FACTURA'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[Facturas."MOVIL_CLIENTE_FACTURA"]')
          ParentFont = False
        end
        object FacturasEMAIL_CLIENTE_FACTURA: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 536.693260000000000000
          Top = 279.685220000000000000
          Width = 204.094620000000000000
          Height = 18.897650000000000000
          DataField = 'EMAIL_CLIENTE_FACTURA'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[Facturas."EMAIL_CLIENTE_FACTURA"]')
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          AllowVectorExport = True
          Left = 22.677180000000000000
          Top = 56.692950000000000000
          Width = 238.110390000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Fecha: [Facturas."FECHA_FACTURA"]')
          ParentFont = False
        end
        object FacturasNRO_FACTURA: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 22.677180000000000000
          Top = 86.929190000000000000
          Width = 238.110390000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            
              'N'#250'mero de Factura: [Facturas."SERIE_FACTURA"].[Facturas."NRO_FAC' +
              'TURA"]')
          ParentFont = False
          Formats = <
            item
            end
            item
            end>
        end
        object Memo7: TfrxMemoView
          AllowVectorExport = True
          Left = 22.677180000000000000
          Top = 351.496290000000000000
          Width = 729.449290000000000000
          Height = 26.456710000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          ParentFont = False
        end
        object Memo8: TfrxMemoView
          AllowVectorExport = True
          Left = 26.897650000000000000
          Top = 355.275820000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Descripci'#243'n')
          ParentFont = False
        end
        object Memo9: TfrxMemoView
          AllowVectorExport = True
          Left = 653.858690000000000000
          Top = 355.275820000000000000
          Width = 143.622140000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Total')
          ParentFont = False
        end
        object Memo10: TfrxMemoView
          AllowVectorExport = True
          Left = 398.953000000000000000
          Top = 355.275820000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Ctd')
          ParentFont = False
        end
        object Memo11: TfrxMemoView
          AllowVectorExport = True
          Left = 485.323130000000000000
          Top = 355.275820000000000000
          Width = 83.149660000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Precio')
          ParentFont = False
        end
        object TituloIvaColumna: TfrxMemoView
          AllowVectorExport = True
          Left = 582.047620000000000000
          Top = 355.275820000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '% [Facturas."PALABRA_REPORTS_ZONA_IVA_FACTURA"]')
          ParentFont = False
        end
        object FechaEntregaTittle: TfrxMemoView
          AllowVectorExport = True
          Left = 315.244280000000000000
          Top = 355.275820000000000000
          Width = 90.708720000000000000
          Height = 18.897650000000000000
          OnBeforePrint = 'FechaEntregaTittleOnBeforePrint'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Fecha Entrega')
          ParentFont = False
        end
        object FacturasNIF_CLIENTE_FACTURA: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 464.882190000000000000
          Top = 302.362400000000000000
          Width = 272.126160000000000000
          Height = 18.897650000000000000
          DataField = 'NIF_CLIENTE_FACTURA'
          DataSet = dmFacturas.fxdsPrintFac
          DataSetName = 'Facturas'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[Facturas."NIF_CLIENTE_FACTURA"]')
          ParentFont = False
        end
        object FacturasNIF_EMPRESA_FACTURA: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 22.677180000000000000
          Top = 302.362400000000000000
          Width = 275.905690000000000000
          Height = 18.897650000000000000
          DataField = 'NIF_EMPRESA_FACTURA'
          DataSet = dmFacturas.fxdsPrintFac
          DataSetName = 'Facturas'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[Facturas."NIF_EMPRESA_FACTURA"]')
          ParentFont = False
        end
      end
      object DetailData1: TfrxDetailData
        FillType = ftBrush
        Frame.Typ = []
        Height = 26.456710000000000000
        Top = 434.645950000000000000
        Width = 755.906000000000000000
        OnBeforePrint = 'DetailData1OnBeforePrint'
        DataSet = dmFacturas.fxdstPrintLinFac
        DataSetName = 'Lineas Facturas'
        RowCount = 0
        object LineasFacturasTOTAL_LINEA: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 653.858690000000000000
          Top = 4.338590000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[Lineas Facturas."TOTAL_FACTURA_LINEA"]')
          ParentFont = False
        end
        object LineasFacturasCANTIDAD_FACTURA_LINEA: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 398.953000000000000000
          Top = 3.779530000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            
              '[Lineas Facturas."CANTIDAD_FACTURA_LINEA"] [Lineas Facturas."TIP' +
              'O_CANTIDAD_ARTICULO_FACTURA_LINEA"]')
          ParentFont = False
          Formats = <
            item
            end
            item
            end>
        end
        object LineasFacturasPRECIOVENTA_SIVA_ARTICULO_FACTURA_LINEA: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 489.102660000000000000
          Top = 3.779530000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataField = 'PRECIOVENTA_SIVA_ARTICULO_FACTURA_LINEA'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = []
          Memo.UTF8W = (
            '[Lineas Facturas."PRECIOVENTA_SIVA_ARTICULO_FACTURA_LINEA"]')
        end
        object LineasFacturasPORCEN_IVA_FACTURA_LINEA: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 582.047620000000000000
          Top = 3.779530000000000000
          Width = 56.692950000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%g %'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = []
          Memo.UTF8W = (
            '[Lineas Facturas."PORCEN_IVA_FACTURA_LINEA"]%')
        end
        object LineasFacturasFECHA_ENTREGA_FACTURA_LINEA: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 315.244280000000000000
          Top = 3.779530000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataField = 'FECHA_ENTREGA_FACTURA_LINEA'
          DataSet = dmFacturas.fxdstPrintLinFac
          DataSetName = 'Lineas Facturas'
          DisplayFormat.FormatStr = 'dd/mm/yyyy'
          DisplayFormat.Kind = fkDateTime
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[Lineas Facturas."FECHA_ENTREGA_FACTURA_LINEA"]')
          ParentFont = False
        end
        object LineasFacturasDESCRIPCION_ARTICULO_FACTURA_LINEA: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 22.677180000000000000
          Top = 3.779530000000000000
          Width = 287.244280000000000000
          Height = 18.897650000000000000
          DataField = 'DESCRIPCION_ARTICULO_FACTURA_LINEA'
          DataSet = dmFacturas.fxdstPrintLinFac
          DataSetName = 'Lineas Facturas'
          Frame.Typ = []
          Memo.UTF8W = (
            '[Lineas Facturas."DESCRIPCION_ARTICULO_FACTURA_LINEA"]')
        end
      end
      object Memo19: TfrxMemoView
        AllowVectorExport = True
        Left = 876.850974650000000000
        Top = 619.842920000000000000
        Width = 79.370130000000000000
        Height = 18.897650000000000000
        DisplayFormat.DecimalSeparator = ','
        DisplayFormat.FormatStr = '%2.2m'
        DisplayFormat.Kind = fkNumeric
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        Frame.Typ = []
        HAlign = haRight
        Memo.UTF8W = (
          '[Facturas."TOTAL_LIQUIDO_FACTURA"]')
        ParentFont = False
      end
      object Memo21: TfrxMemoView
        IndexTag = 1
        AllowVectorExport = True
        Left = 876.850974650000000000
        Top = 582.047620000000000000
        Width = 79.370130000000000000
        Height = 18.897650000000000000
        OnBeforePrint = 'RetencionTotalOnBeforePrint'
        DisplayFormat.DecimalSeparator = ','
        DisplayFormat.FormatStr = '%2.2m'
        DisplayFormat.Kind = fkNumeric
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        Frame.Typ = []
        HAlign = haRight
        Memo.UTF8W = (
          '[<Facturas."TOTAL_RETENCION_FACTURA"> * (-1)]')
        ParentFont = False
      end
      object Memo23: TfrxMemoView
        AllowVectorExport = True
        Left = 877.969094650000000000
        Top = 553.701145000000000000
        Width = 79.370130000000000000
        Height = 18.897650000000000000
        OnBeforePrint = 'ImpuestosTotalOnBeforePrint'
        DisplayFormat.DecimalSeparator = ','
        DisplayFormat.FormatStr = '%2.2m'
        DisplayFormat.Kind = fkNumeric
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        Frame.Typ = []
        HAlign = haRight
        Memo.UTF8W = (
          '[Facturas."TOTAL_IMPUESTOS_FACTURA"]')
        ParentFont = False
      end
      object Memo25: TfrxMemoView
        AllowVectorExport = True
        Left = 877.969094650000000000
        Top = 525.354670000000000000
        Width = 79.370130000000000000
        Height = 18.897650000000000000
        OnBeforePrint = 'ImpuestosTotalOnBeforePrint'
        DisplayFormat.DecimalSeparator = ','
        DisplayFormat.FormatStr = '%2.2m'
        DisplayFormat.Kind = fkNumeric
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        Frame.Typ = []
        HAlign = haRight
        Memo.UTF8W = (
          '[Facturas."TOTAL_BASES_FACTURA"]')
        ParentFont = False
      end
      object PageFooter1: TfrxPageFooter
        FillType = ftBrush
        Frame.Typ = []
        Height = 257.008040000000000000
        Top = 521.575140000000000000
        Width = 755.906000000000000000
        OnBeforePrint = 'PageFooter1OnBeforePrint'
        object CajaIVA: TfrxMemoView
          AllowVectorExport = True
          Left = 22.677194650000000000
          Top = 3.779530000000000000
          Width = 468.661720000000000000
          Height = 143.622140000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          ParentFont = False
        end
        object CajaTitulosIVA: TfrxMemoView
          AllowVectorExport = True
          Left = 22.677180000000000000
          Top = 3.779530000000000000
          Width = 468.661417320000000000
          Height = 26.456710000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          ParentFont = False
        end
        object Memo13: TfrxMemoView
          AllowVectorExport = True
          Left = 653.858704650000000000
          Top = 132.283550000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[Facturas."TOTAL_LIQUIDO_FACTURA"]')
          ParentFont = False
        end
        object Retencion: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 512.897974650000000000
          Top = 94.488250000000000000
          Width = 143.622140000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%g'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            'Retenci'#243'n IRPF [Facturas."PORCEN_RETENCION_FACTURA"]%')
          ParentFont = False
        end
        object RetencionTotal: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 653.858704650000000000
          Top = 94.488250000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          OnBeforePrint = 'RetencionTotalOnBeforePrint'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[<Facturas."TOTAL_RETENCION_FACTURA"> * (-1)]')
          ParentFont = False
        end
        object Memo14: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 512.897974650000000000
          Top = 132.283550000000000000
          Width = 143.622140000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%g'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            'Total Factura')
          ParentFont = False
        end
        object ImpuestosTotal: TfrxMemoView
          AllowVectorExport = True
          Left = 654.976824650000000000
          Top = 66.141775000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          OnBeforePrint = 'ImpuestosTotalOnBeforePrint'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[Facturas."TOTAL_IMPUESTOS_FACTURA"]')
          ParentFont = False
        end
        object Impuestos: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 514.016094650000000000
          Top = 66.141775000000000000
          Width = 143.622140000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%g'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            'Total Impuestos')
          ParentFont = False
        end
        object TotalBases: TfrxMemoView
          AllowVectorExport = True
          Left = 654.976824650000000000
          Top = 37.795300000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          OnBeforePrint = 'ImpuestosTotalOnBeforePrint'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[Facturas."TOTAL_BASES_FACTURA"]')
          ParentFont = False
        end
        object Memo17: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 514.016094650000000000
          Top = 37.795300000000000000
          Width = 143.622140000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%g'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            'Total Base Imponible')
          ParentFont = False
        end
        object BaseImponibleN: TfrxMemoView
          AllowVectorExport = True
          Left = 30.236254650000000000
          Top = 34.015770000000000000
          Width = 90.708720000000000000
          Height = 15.118120000000000000
          OnBeforePrint = 'BaseImponibleNOnBeforePrint'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.3m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[Facturas."TOTAL_BASEI_IVAN_FACTURA"]')
          ParentFont = False
        end
        object BaseImponibleCajaIVA: TfrxMemoView
          AllowVectorExport = True
          Left = 30.236254650000000000
          Top = 7.559060000000000000
          Width = 102.047310000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Base Imponible')
          ParentFont = False
        end
        object BaseImponibleE: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 26.456724650000000000
          Top = 113.385900000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          OnBeforePrint = 'BaseImponibleEOnBeforePrint'
          DataField = 'TOTAL_BASEI_IVAE_FACTURA'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.3m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[Facturas."TOTAL_BASEI_IVAE_FACTURA"]')
          ParentFont = False
        end
        object TituloPorcenCajaIVA: TfrxMemoView
          AllowVectorExport = True
          Left = 151.181214650000000000
          Top = 7.559060000000000000
          Width = 68.031540000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '% [Facturas."PALABRA_REPORTS_ZONA_IVA_FACTURA"]')
          ParentFont = False
        end
        object TituloTotalCajaIVA: TfrxMemoView
          AllowVectorExport = True
          Left = 226.771814650000000000
          Top = 7.559060000000000000
          Width = 86.929190000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Total [Facturas."PALABRA_REPORTS_ZONA_IVA_FACTURA"]')
          ParentFont = False
        end
        object RetencionPorc: TfrxMemoView
          AllowVectorExport = True
          Left = 317.480534650000000000
          Top = 7.559060000000000000
          Width = 71.811070000000000000
          Height = 15.118120000000000000
          OnBeforePrint = 'RetencionPorcOnBeforePrint'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '% R.E.')
          ParentFont = False
        end
        object RetencionTot: TfrxMemoView
          AllowVectorExport = True
          Left = 398.409724650000000000
          Top = 7.559060000000000000
          Width = 71.811070000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Total R.E.')
          ParentFont = False
        end
        object FacturasTOTAL_IVAN_FACTURA: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 226.771814650000000000
          Top = 34.015770000000000000
          Width = 56.692950000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.3m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[Facturas."TOTAL_IVAN_FACTURA"]')
          ParentFont = False
        end
        object FacturasPORCEN_IVAN_FACTURA: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 151.181214650000000000
          Top = 34.015770000000000000
          Width = 56.692950000000000000
          Height = 18.897650000000000000
          DisplayFormat.FormatStr = '%g'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[Facturas."PORCEN_IVAN_FACTURA"]%')
          ParentFont = False
        end
        object FacturasPORCEN_IVAR_FACTURA: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 151.181214650000000000
          Top = 60.472480000000000000
          Width = 56.692950000000000000
          Height = 18.897650000000000000
          DisplayFormat.FormatStr = '%g'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[Facturas."PORCEN_IVAR_FACTURA"]%')
          ParentFont = False
        end
        object FacturasPORCEN_IVAS_FACTURA: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 151.181214650000000000
          Top = 86.929190000000000000
          Width = 56.692950000000000000
          Height = 18.897650000000000000
          DisplayFormat.FormatStr = '%g'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[Facturas."PORCEN_IVAS_FACTURA"]%')
          ParentFont = False
        end
        object FacturasPORCEN_IVAE_FACTURA: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 151.181214650000000000
          Top = 113.385900000000000000
          Width = 56.692950000000000000
          Height = 18.897650000000000000
          DisplayFormat.FormatStr = '%g'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[Facturas."PORCEN_IVAE_FACTURA"]%')
          ParentFont = False
        end
        object FacturasTOTAL_IVAR_FACTURA: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 226.771814650000000000
          Top = 60.472480000000000000
          Width = 56.692950000000000000
          Height = 18.897650000000000000
          DataField = 'TOTAL_IVAR_FACTURA'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.3m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[Facturas."TOTAL_IVAR_FACTURA"]')
          ParentFont = False
        end
        object FacturasTOTAL_IVAS_FACTURA: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 226.771814650000000000
          Top = 86.929190000000000000
          Width = 56.692950000000000000
          Height = 18.897650000000000000
          DataField = 'TOTAL_IVAS_FACTURA'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.3m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[Facturas."TOTAL_IVAS_FACTURA"]')
          ParentFont = False
        end
        object FacturasTOTAL_IVAE_FACTURA: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 226.771814650000000000
          Top = 113.385900000000000000
          Width = 56.692950000000000000
          Height = 18.897650000000000000
          DataField = 'TOTAL_IVAE_FACTURA'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.3m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[Facturas."TOTAL_IVAE_FACTURA"]')
          ParentFont = False
        end
        object FacturasPORCEN_REN_FACTURA: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 317.480534650000000000
          Top = 34.015770000000000000
          Width = 56.692950000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%g'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[Facturas."PORCEN_REN_FACTURA"]%')
          ParentFont = False
        end
        object FacturasPORCEN_RER_FACTURA: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 317.480534650000000000
          Top = 60.472480000000000000
          Width = 56.692950000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%g'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[Facturas."PORCEN_RER_FACTURA"]%')
          ParentFont = False
        end
        object FacturasPORCEN_REE_FACTURA: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 317.480534650000000000
          Top = 113.385900000000000000
          Width = 56.692950000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%g'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[Facturas."PORCEN_REE_FACTURA"]%')
          ParentFont = False
        end
        object FacturasPORCEN_RES_FACTURA: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 317.480534650000000000
          Top = 86.929190000000000000
          Width = 52.913420000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%g'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[Facturas."PORCEN_RES_FACTURA"]%')
          ParentFont = False
        end
        object FacturasTOTAL_REN_FACTURA: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 398.409724650000000000
          Top = 34.015770000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          OnBeforePrint = 'FacturasTOTAL_REN_FACTURAOnBeforePrint'
          DataField = 'TOTAL_REN_FACTURA'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.3m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[Facturas."TOTAL_REN_FACTURA"]')
          ParentFont = False
        end
        object FacturasTOTAL_REE_FACTURA: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 398.409724650000000000
          Top = 113.385900000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          OnBeforePrint = 'FacturasTOTAL_REE_FACTURAOnBeforePrint'
          DataField = 'TOTAL_REE_FACTURA'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.3m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[Facturas."TOTAL_REE_FACTURA"]')
          ParentFont = False
        end
        object BaseImponibleR: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 26.456724650000000000
          Top = 60.472480000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          OnBeforePrint = 'BaseImponibleROnBeforePrint'
          DataField = 'TOTAL_BASEI_IVAR_FACTURA'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.3m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[Facturas."TOTAL_BASEI_IVAR_FACTURA"]')
          ParentFont = False
        end
        object BaseImponibleS: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 26.456724650000000000
          Top = 86.929190000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          OnBeforePrint = 'BaseImponibleSOnBeforePrint'
          DataField = 'TOTAL_BASEI_IVAS_FACTURA'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.3m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[Facturas."TOTAL_BASEI_IVAS_FACTURA"]')
          ParentFont = False
        end
        object FacturasTOTAL_RER_FACTURA1: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 394.630194650000000000
          Top = 60.472480000000000000
          Width = 68.031540000000000000
          Height = 18.897650000000000000
          DataField = 'TOTAL_RER_FACTURA'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.3m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[Facturas."TOTAL_RER_FACTURA"]')
          ParentFont = False
        end
        object FacturasTOTAL_RES_FACTURA1: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 394.630194650000000000
          Top = 86.929190000000000000
          Width = 68.031540000000000000
          Height = 18.897650000000000000
          DataField = 'TOTAL_RES_FACTURA'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.3m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[Facturas."TOTAL_RES_FACTURA"]')
          ParentFont = False
        end
        object FacturasCOMENTARIOS_FACTURA: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 23.677194650000000000
          Top = 178.401670000000000000
          Width = 710.551640000000000000
          Height = 30.236240000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            
              '[VarToStr(<Facturas."TEXTO_LEGAL_FACTURA_CLIENTE_FACTURA">)+'#39'  '#39 +
              '+'
            
              ' VarToStr(<Facturas."TEXTO_LEGAL_FACTURA_EMPRESA_FACTURA">) +'#39'  ' +
              #39'+'
            ' VarToStr(<Facturas."COMENTARIOS_FACTURA">)]')
          ParentFont = False
        end
        object Memo15: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 26.456724650000000000
          Top = 154.960730000000000000
          Width = 706.772110000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Forma de Pago: [Facturas."DESCRIPCION_FORMAPAGO"]')
          ParentFont = False
        end
      end
    end
  end
end
