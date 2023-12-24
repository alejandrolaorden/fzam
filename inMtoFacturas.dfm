inherited frmMtoFacturas: TfrmMtoFacturas
  Margins.Left = 0
  Margins.Top = 0
  Margins.Right = 0
  Margins.Bottom = 0
  BorderIcons = []
  Caption = #186
  ClientHeight = 844
  ClientWidth = 1231
  Scaled = False
  ExplicitWidth = 1231
  ExplicitHeight = 844
  TextHeight = 19
  object Shape6: TShape [0]
    Left = 76
    Top = 79
    Width = 533
    Height = 50
    Brush.Style = bsClear
  end
  inherited pButtonPage: TPanel
    Width = 1087
    Height = 844
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    ParentColor = True
    TabOrder = 0
    ExplicitWidth = 1087
    ExplicitHeight = 844
    inherited pcPantalla: TcxPageControl
      Width = 1087
      Height = 804
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      TabOrder = 1
      Properties.ActivePage = tsFicha
      ExplicitWidth = 1087
      ExplicitHeight = 804
      ClientRectBottom = 798
      ClientRectRight = 1081
      inherited tsLista: TcxTabSheet
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        ExplicitLeft = 3
        ExplicitTop = 32
        ExplicitWidth = 1078
        ExplicitHeight = 766
        inherited cxGrdPrincipal: TcxGrid
          Width = 1078
          Height = 766
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          ExplicitWidth = 1078
          ExplicitHeight = 766
          inherited cxGrdDBTabPrin: TcxGridDBTableView
            object cxgrdbclmnGrdDBTabPrinCODIGO_EMPRESA_FACTURA: TcxGridDBColumn
              Caption = 'C'#243'digo Empresa'
              DataBinding.FieldName = 'CODIGO_EMPRESA_FACTURA'
              DataBinding.IsNullValueType = True
              Width = 171
            end
            object cxgrdbclmnGrdDBTabPrinNRO_FACTURA: TcxGridDBColumn
              Caption = 'Nro Factura'
              DataBinding.FieldName = 'NRO_FACTURA'
              DataBinding.IsNullValueType = True
              Width = 113
            end
            object cxgrdbclmnGrdDBTabPrinSERIE_FACTURA: TcxGridDBColumn
              Caption = 'Serie'
              DataBinding.FieldName = 'SERIE_FACTURA'
              DataBinding.IsNullValueType = True
              Width = 65
            end
            object cxgrdbclmnGrdDBTabPrinFECHA_FACTURA: TcxGridDBColumn
              Caption = 'Fecha'
              DataBinding.FieldName = 'FECHA_FACTURA'
              DataBinding.IsNullValueType = True
              PropertiesClassName = 'TcxDateEditProperties'
              Width = 124
            end
            object cxgrdbclmnGrdDBTabPrinTOTAL_LIQUIDO_FACTURA: TcxGridDBColumn
              Caption = 'Total Liquido'
              DataBinding.FieldName = 'TOTAL_LIQUIDO_FACTURA'
              DataBinding.IsNullValueType = True
              PropertiesClassName = 'TcxCurrencyEditProperties'
              Width = 157
            end
            object cxgrdbclmnGrdDBTabPrinCODIGO_CLIENTE_FACTURA: TcxGridDBColumn
              Caption = 'C'#243'digo Cliente'
              DataBinding.FieldName = 'CODIGO_CLIENTE_FACTURA'
              DataBinding.IsNullValueType = True
              Width = 155
            end
            object cxgrdbclmnGrdDBTabPrinRAZONSOCIAL_CLIENTE_FACTURA: TcxGridDBColumn
              Caption = 'Raz'#243'n Social'
              DataBinding.FieldName = 'RAZONSOCIAL_CLIENTE_FACTURA'
              DataBinding.IsNullValueType = True
              Width = 289
            end
            object cxgrdbclmnGrdDBTabPrinCODIGO_ZONA_IVA_CLIENTE: TcxGridDBColumn
              Caption = 'C'#243'digo IVA'
              DataBinding.FieldName = 'CODIGO_ZONA_IVA_CLIENTE'
              DataBinding.IsNullValueType = True
              Width = 112
            end
            object cxgrdbclmnGrdDBTabPrinNIF_CLIENTE_FACTURA: TcxGridDBColumn
              Caption = 'Nif'
              DataBinding.FieldName = 'NIF_CLIENTE_FACTURA'
              DataBinding.IsNullValueType = True
              Width = 134
            end
            object cxgrdbclmnGrdDBTabPrinMOVIL_CLIENTE_FACTURA: TcxGridDBColumn
              Caption = 'M'#243'vil'
              DataBinding.FieldName = 'MOVIL_CLIENTE_FACTURA'
              DataBinding.IsNullValueType = True
              PropertiesClassName = 'TcxTextEditProperties'
              Width = 150
            end
            object cxgrdbclmnGrdDBTabPrinEMAIL_CLIENTE_FACTURA: TcxGridDBColumn
              Caption = 'Email'
              DataBinding.FieldName = 'EMAIL_CLIENTE_FACTURA'
              DataBinding.IsNullValueType = True
              Width = 146
            end
            object cxgrdbclmnGrdDBTabPrinDIRECCION1_CLIENTE_FACTURA: TcxGridDBColumn
              Caption = 'Direcci'#243'n 1'
              DataBinding.FieldName = 'DIRECCION1_CLIENTE_FACTURA'
              DataBinding.IsNullValueType = True
              Width = 181
            end
            object cxgrdbclmnGrdDBTabPrinDIRECCION2_CLIENTE_FACTURA: TcxGridDBColumn
              Caption = 'Direcci'#243'n 2'
              DataBinding.FieldName = 'DIRECCION2_CLIENTE_FACTURA'
              DataBinding.IsNullValueType = True
              Width = 181
            end
            object cxgrdbclmnGrdDBTabPrinCPOSTAL_CLIENTE_FACTURA: TcxGridDBColumn
              Caption = 'C'#243'digo Postal'
              DataBinding.FieldName = 'CPOSTAL_CLIENTE_FACTURA'
              DataBinding.IsNullValueType = True
              Width = 135
            end
            object cxgrdbclmnGrdDBTabPrinPOBLACION_CLIENTE_FACTURA: TcxGridDBColumn
              Caption = 'Poblaci'#243'n'
              DataBinding.FieldName = 'POBLACION_CLIENTE_FACTURA'
              DataBinding.IsNullValueType = True
              Width = 177
            end
            object cxgrdbclmnGrdDBTabPrinPROVINCIA_CLIENTE_FACTURA: TcxGridDBColumn
              Caption = 'Provincia'
              DataBinding.FieldName = 'PROVINCIA_CLIENTE_FACTURA'
              DataBinding.IsNullValueType = True
              Width = 173
            end
            object cxgrdbclmnGrdDBTabPrinPAIS_CLIENTE_FACTURA: TcxGridDBColumn
              Caption = 'Pais'
              DataBinding.FieldName = 'PAIS_CLIENTE_FACTURA'
              DataBinding.IsNullValueType = True
              Width = 137
            end
            object cxgrdbclmnGrdDBTabPrinFORMA_PAGO_FACTURA: TcxGridDBColumn
              Caption = 'Forma Pago'
              DataBinding.FieldName = 'FORMA_PAGO_FACTURA'
              DataBinding.IsNullValueType = True
              Width = 143
            end
            object cxgrdbclmnGrdDBTabPrinDESCRIPCION_FORMAPAGO: TcxGridDBColumn
              Caption = 'Descripci'#243'n Forma de Pago'
              DataBinding.FieldName = 'DESCRIPCION_FORMAPAGO'
              DataBinding.IsNullValueType = True
              Width = 256
            end
            object cxgrdbclmnGrdDBTabPrinRAZONSOCIAL_EMPRESA_FACTURA: TcxGridDBColumn
              Caption = 'Raz'#243'n Social Empresa'
              DataBinding.FieldName = 'RAZONSOCIAL_EMPRESA_FACTURA'
              DataBinding.IsNullValueType = True
              Width = 187
            end
            object cxgrdbclmnGrdDBTabPrinNIF_EMPRESA_FACTURA: TcxGridDBColumn
              Caption = 'Nif Empresa'
              DataBinding.FieldName = 'NIF_EMPRESA_FACTURA'
              DataBinding.IsNullValueType = True
              Width = 121
            end
            object cxgrdbclmnGrdDBTabPrinMOVIL_EMPRESA_FACTURA: TcxGridDBColumn
              Caption = 'Tel'#233'fono Empresa'
              DataBinding.FieldName = 'MOVIL_EMPRESA_FACTURA'
              DataBinding.IsNullValueType = True
              Width = 167
            end
            object cxgrdbclmnGrdDBTabPrinEMAIL_EMPRESA_FACTURA: TcxGridDBColumn
              Caption = 'Email Empresa'
              DataBinding.FieldName = 'EMAIL_EMPRESA_FACTURA'
              DataBinding.IsNullValueType = True
              Width = 138
            end
            object cxgrdbclmnGrdDBTabPrinDIRECCION1_EMPRESA_FACTURA: TcxGridDBColumn
              Caption = 'Direcci'#243'n Empresa'
              DataBinding.FieldName = 'DIRECCION1_EMPRESA_FACTURA'
              DataBinding.IsNullValueType = True
              Width = 161
            end
            object cxgrdbclmnGrdDBTabPrinDIRECCION2_EMPRESA_FACTURA: TcxGridDBColumn
              Caption = 'Direcci'#243'n Secundaria Empresa'
              DataBinding.FieldName = 'DIRECCION2_EMPRESA_FACTURA'
              DataBinding.IsNullValueType = True
              Width = 277
            end
            object cxgrdbclmnGrdDBTabPrinPOBLACION_EMPRESA_FACTURA: TcxGridDBColumn
              Caption = 'Poblaci'#243'n Empresa'
              DataBinding.FieldName = 'POBLACION_EMPRESA_FACTURA'
              DataBinding.IsNullValueType = True
              Width = 180
            end
            object cxgrdbclmnGrdDBTabPrinPROVINCIA_EMPRESA_FACTURA: TcxGridDBColumn
              Caption = 'Provincia Empresa'
              DataBinding.FieldName = 'PROVINCIA_EMPRESA_FACTURA'
              DataBinding.IsNullValueType = True
              Width = 174
            end
            object cxgrdbclmnGrdDBTabPrinPAIS_EMPRESA_FACTURA: TcxGridDBColumn
              Caption = 'Pa'#237's Empresa Factura'
              DataBinding.FieldName = 'PAIS_EMPRESA_FACTURA'
              DataBinding.IsNullValueType = True
              Width = 179
            end
            object cxgrdbclmnGrdDBTabPrinCPOSTAL_EMPRESA_FACTURA: TcxGridDBColumn
              Caption = 'C'#243'digo Postal Empresa'
              DataBinding.FieldName = 'CPOSTAL_EMPRESA_FACTURA'
              DataBinding.IsNullValueType = True
              Width = 197
            end
            object cxgrdbclmnGrdDBTabPrinRETENCIONES_EMPRESA_FACTURA: TcxGridDBColumn
              Caption = 'Tiene Retenciones Empresa'
              DataBinding.FieldName = 'ESRETENCIONES_EMPRESA_FACTURA'
              DataBinding.IsNullValueType = True
              PropertiesClassName = 'TcxCheckBoxProperties'
              Properties.ValueChecked = 'S'
              Properties.ValueUnchecked = 'N'
              Width = 231
            end
            object cxgrdbclmnGrdDBTabPrinIVA_RECARGO_CLIENTE_FACTURA: TcxGridDBColumn
              Caption = 'Tiene RE cliente'
              DataBinding.FieldName = 'ESIVA_RECARGO_CLIENTE_FACTURA'
              DataBinding.IsNullValueType = True
              PropertiesClassName = 'TcxCheckBoxProperties'
              Properties.ValueChecked = 'S'
              Properties.ValueUnchecked = 'N'
              Width = 136
            end
            object cxgrdbclmnGrdDBTabPrinPORCEN_IVAN_FACTURA: TcxGridDBColumn
              Caption = '% IVA Normal'
              DataBinding.FieldName = 'PORCEN_IVAN_FACTURA'
              DataBinding.IsNullValueType = True
              PropertiesClassName = 'TcxSpinEditProperties'
              Properties.AssignedValues.MinValue = True
              Properties.DisplayFormat = '0.00 %'
              Properties.EditFormat = '0.00 %'
              Properties.Increment = 0.100000000000000000
              Properties.LargeIncrement = 1.000000000000000000
              Properties.MaxValue = 100.000000000000000000
              Properties.ValueType = vtInt
              Width = 116
            end
            object cxgrdbclmnGrdDBTabPrinTOTAL_IVAN_FACTURA: TcxGridDBColumn
              Caption = 'Total IVA Normal'
              DataBinding.FieldName = 'TOTAL_IVAN_FACTURA'
              DataBinding.IsNullValueType = True
              PropertiesClassName = 'TcxCurrencyEditProperties'
              Width = 159
            end
            object cxgrdbclmnGrdDBTabPrinPORCEN_REN_FACTURA: TcxGridDBColumn
              Caption = '% RE IVA Normal'
              DataBinding.FieldName = 'PORCEN_REN_FACTURA'
              DataBinding.IsNullValueType = True
              PropertiesClassName = 'TcxSpinEditProperties'
              Properties.AssignedValues.MinValue = True
              Properties.DisplayFormat = '0.00 %'
              Properties.EditFormat = '0.00 %'
              Properties.Increment = 0.100000000000000000
              Properties.LargeIncrement = 1.000000000000000000
              Properties.MaxValue = 100.000000000000000000
              Properties.ValueType = vtInt
              Width = 141
            end
            object cxgrdbclmnGrdDBTabPrinTOTAL_REN_FACTURA: TcxGridDBColumn
              Caption = 'Total RE Normal'
              DataBinding.FieldName = 'TOTAL_REN_FACTURA'
              DataBinding.IsNullValueType = True
              PropertiesClassName = 'TcxCurrencyEditProperties'
              Width = 139
            end
            object cxgrdbclmnGrdDBTabPrinTOTAL_BASEI_IVAN_FACTURA: TcxGridDBColumn
              Caption = 'Total Base Imponible Normal'
              DataBinding.FieldName = 'TOTAL_BASEI_IVAN_FACTURA'
              DataBinding.IsNullValueType = True
              PropertiesClassName = 'TcxCurrencyEditProperties'
              Width = 264
            end
            object cxgrdbclmnGrdDBTabPrinPORCEN_IVAR_FACTURA: TcxGridDBColumn
              Caption = '% IVA Reducido'
              DataBinding.FieldName = 'PORCEN_IVAR_FACTURA'
              DataBinding.IsNullValueType = True
              PropertiesClassName = 'TcxSpinEditProperties'
              Properties.AssignedValues.MinValue = True
              Properties.DisplayFormat = '0.00 %'
              Properties.EditFormat = '0.00 %'
              Properties.Increment = 0.100000000000000000
              Properties.LargeIncrement = 1.000000000000000000
              Properties.MaxValue = 100.000000000000000000
              Properties.ValueType = vtInt
              Width = 145
            end
            object cxgrdbclmnGrdDBTabPrinTOTAL_IVAR_FACTURA: TcxGridDBColumn
              Caption = 'Total IVA Normal'
              DataBinding.FieldName = 'TOTAL_IVAR_FACTURA'
              DataBinding.IsNullValueType = True
              PropertiesClassName = 'TcxCurrencyEditProperties'
              Width = 164
            end
            object cxgrdbclmnGrdDBTabPrinPORCEN_RER_FACTURA: TcxGridDBColumn
              Caption = '% RE Reducido'
              DataBinding.FieldName = 'PORCEN_RER_FACTURA'
              DataBinding.IsNullValueType = True
              PropertiesClassName = 'TcxSpinEditProperties'
              Properties.AssignedValues.MinValue = True
              Properties.DisplayFormat = '0.00 %'
              Properties.EditFormat = '0.00 %'
              Properties.Increment = 0.100000000000000000
              Properties.LargeIncrement = 1.000000000000000000
              Properties.MaxValue = 100.000000000000000000
              Properties.ValueType = vtInt
              Width = 145
            end
            object cxgrdbclmnGrdDBTabPrinTOTAL_RER_FACTURA: TcxGridDBColumn
              Caption = 'Total RE Reducido'
              DataBinding.FieldName = 'TOTAL_RER_FACTURA'
              DataBinding.IsNullValueType = True
              PropertiesClassName = 'TcxCurrencyEditProperties'
              Width = 172
            end
            object cxgrdbclmnGrdDBTabPrinTOTAL_BASEI_IVAR_FACTURA: TcxGridDBColumn
              Caption = 'Total Base Imponible Reducido'
              DataBinding.FieldName = 'TOTAL_BASEI_IVAR_FACTURA'
              DataBinding.IsNullValueType = True
              PropertiesClassName = 'TcxCurrencyEditProperties'
              Width = 284
            end
            object cxgrdbclmnGrdDBTabPrinPORCEN_IVAS_FACTURA: TcxGridDBColumn
              Caption = '% IVA SuperReducido'
              DataBinding.FieldName = 'PORCEN_IVAS_FACTURA'
              DataBinding.IsNullValueType = True
              PropertiesClassName = 'TcxSpinEditProperties'
              Properties.AssignedValues.MinValue = True
              Properties.DisplayFormat = '0.00 %'
              Properties.EditFormat = '0.00 %'
              Properties.Increment = 0.100000000000000000
              Properties.LargeIncrement = 1.000000000000000000
              Properties.MaxValue = 100.000000000000000000
              Properties.ValueType = vtInt
              Width = 198
            end
            object cxgrdbclmnGrdDBTabPrinTOTAL_IVAS_FACTURA: TcxGridDBColumn
              Caption = 'Total IVA SuperReducido'
              DataBinding.FieldName = 'TOTAL_IVAS_FACTURA'
              DataBinding.IsNullValueType = True
              PropertiesClassName = 'TcxCurrencyEditProperties'
              Width = 232
            end
            object cxgrdbclmnGrdDBTabPrinPORCEN_RES_FACTURA: TcxGridDBColumn
              Caption = '% RE SuperReducido'
              DataBinding.FieldName = 'PORCEN_RES_FACTURA'
              DataBinding.IsNullValueType = True
              PropertiesClassName = 'TcxSpinEditProperties'
              Properties.AssignedValues.MinValue = True
              Properties.DisplayFormat = '0.00 %'
              Properties.EditFormat = '0.00 %'
              Properties.Increment = 0.100000000000000000
              Properties.LargeIncrement = 1.000000000000000000
              Properties.MaxValue = 100.000000000000000000
              Properties.ValueType = vtInt
              Width = 200
            end
            object cxgrdbclmnGrdDBTabPrinTOTAL_RES_FACTURA: TcxGridDBColumn
              Caption = 'Total RE SuperReducido'
              DataBinding.FieldName = 'TOTAL_RES_FACTURA'
              DataBinding.IsNullValueType = True
              PropertiesClassName = 'TcxCurrencyEditProperties'
              Width = 212
            end
            object cxgrdbclmnGrdDBTabPrinTOTAL_BASEI_IVAS_FACTURA: TcxGridDBColumn
              Caption = 'Total BI SuperReducido'
              DataBinding.FieldName = 'TOTAL_BASEI_IVAS_FACTURA'
              DataBinding.IsNullValueType = True
              PropertiesClassName = 'TcxCurrencyEditProperties'
              Width = 242
            end
            object cxgrdbclmnGrdDBTabPrinPORCEN_IVAE_FACTURA: TcxGridDBColumn
              Caption = '% IVA Exento'
              DataBinding.FieldName = 'PORCEN_IVAE_FACTURA'
              DataBinding.IsNullValueType = True
              PropertiesClassName = 'TcxSpinEditProperties'
              Properties.AssignedValues.MinValue = True
              Properties.DisplayFormat = '0.00 %'
              Properties.EditFormat = '0.00 %'
              Properties.Increment = 0.100000000000000000
              Properties.LargeIncrement = 1.000000000000000000
              Properties.MaxValue = 100.000000000000000000
              Properties.ValueType = vtInt
              Width = 123
            end
            object cxgrdbclmnGrdDBTabPrinTOTAL_IVAE_FACTURA: TcxGridDBColumn
              Caption = 'Total Exento'
              DataBinding.FieldName = 'TOTAL_IVAE_FACTURA'
              DataBinding.IsNullValueType = True
              PropertiesClassName = 'TcxCurrencyEditProperties'
              Width = 116
            end
            object cxgrdbclmnGrdDBTabPrinPORCEN_REE_FACTURA: TcxGridDBColumn
              Caption = '% RE Exento'
              DataBinding.FieldName = 'PORCEN_REE_FACTURA'
              DataBinding.IsNullValueType = True
              PropertiesClassName = 'TcxSpinEditProperties'
              Properties.AssignedValues.MinValue = True
              Properties.DisplayFormat = '0.00 %'
              Properties.EditFormat = '0.00 %'
              Properties.Increment = 0.100000000000000000
              Properties.LargeIncrement = 1.000000000000000000
              Properties.MaxValue = 100.000000000000000000
              Properties.ValueType = vtInt
              Width = 109
            end
            object cxgrdbclmnGrdDBTabPrinTOTAL_REE_FACTURA: TcxGridDBColumn
              Caption = 'Total RE Exento'
              DataBinding.FieldName = 'TOTAL_REE_FACTURA'
              DataBinding.IsNullValueType = True
              PropertiesClassName = 'TcxCurrencyEditProperties'
              Width = 143
            end
            object cxgrdbclmnGrdDBTabPrinTOTAL_BASEI_IVAE_FACTURA: TcxGridDBColumn
              Caption = 'Total BI Exento'
              DataBinding.FieldName = 'TOTAL_BASEI_IVAE_FACTURA'
              DataBinding.IsNullValueType = True
              PropertiesClassName = 'TcxCurrencyEditProperties'
              Width = 148
            end
            object cxgrdbclmnGrdDBTabPrinPORCEN_RETENCION_FACTURA: TcxGridDBColumn
              Caption = '% Retenci'#243'n'
              DataBinding.FieldName = 'PORCEN_RETENCION_FACTURA'
              DataBinding.IsNullValueType = True
              PropertiesClassName = 'TcxSpinEditProperties'
              Properties.AssignedValues.MinValue = True
              Properties.DisplayFormat = '0.00 %'
              Properties.EditFormat = '0.00 %'
              Properties.Increment = 0.100000000000000000
              Properties.LargeIncrement = 1.000000000000000000
              Properties.MaxValue = 100.000000000000000000
              Properties.ValueType = vtInt
              Width = 115
            end
            object cxgrdbclmnGrdDBTabPrinTOTAL_RETENCION_FACTURA: TcxGridDBColumn
              Caption = 'Total Retenci'#243'n'
              DataBinding.FieldName = 'TOTAL_RETENCION_FACTURA'
              DataBinding.IsNullValueType = True
              PropertiesClassName = 'TcxCurrencyEditProperties'
              Width = 147
            end
            object cxgrdbclmnGrdDBTabPrinNRO_FACTURA_ABONO_FACTURA: TcxGridDBColumn
              Caption = 'Nro Factura Abono'
              DataBinding.FieldName = 'NRO_FACTURA_ABONO_FACTURA'
              DataBinding.IsNullValueType = True
              Visible = False
              Width = 170
            end
            object cxgrdbclmnGrdDBTabPrinSERIE_FACTURA_ABONO_FACTURA: TcxGridDBColumn
              Caption = 'Serie Factura Abono'
              DataBinding.FieldName = 'SERIE_FACTURA_ABONO_FACTURA'
              DataBinding.IsNullValueType = True
              Visible = False
              Width = 194
            end
            object cxgrdbclmnGrdDBTabPrinDOCUMENTO_FACTURA: TcxGridDBColumn
              DataBinding.FieldName = 'DOCUMENTO_FACTURA'
              DataBinding.IsNullValueType = True
              Visible = False
            end
            object cxgrdbclmnGrdDBTabPrinCOMENTARIOS_FACTURA: TcxGridDBColumn
              Caption = 'Comentarios Factura'
              DataBinding.FieldName = 'COMENTARIOS_FACTURA'
              DataBinding.IsNullValueType = True
              Visible = False
              Width = 213
            end
            object cxgrdbclmnGrdDBTabPrinTEXTO_LEGAL_FACTURA_EMPRESA_FACTURA: TcxGridDBColumn
              Caption = 'Texto Legal Empresa'
              DataBinding.FieldName = 'TEXTO_LEGAL_FACTURA_EMPRESA_FACTURA'
              DataBinding.IsNullValueType = True
              Visible = False
              Width = 685
            end
            object cxgrdbclmnGrdDBTabPrinTEXTO_LEGAL_FACTURA_CLIENTE_FACTURA: TcxGridDBColumn
              Caption = 'Texto legal Cliente en Factura'
              DataBinding.FieldName = 'TEXTO_LEGAL_FACTURA_CLIENTE_FACTURA'
              DataBinding.IsNullValueType = True
              Visible = False
              Width = 376
            end
            object cxgrdbclmnGrdDBTabPrinINSTANTEMODIF: TcxGridDBColumn
              DataBinding.FieldName = 'INSTANTEMODIF'
              DataBinding.IsNullValueType = True
              Visible = False
            end
            object cxgrdbclmnGrdDBTabPrinINSTANTEALTA: TcxGridDBColumn
              DataBinding.FieldName = 'INSTANTEALTA'
              DataBinding.IsNullValueType = True
              Visible = False
            end
            object cxgrdbclmnGrdDBTabPrinUSUARIOALTA: TcxGridDBColumn
              DataBinding.FieldName = 'USUARIOALTA'
              DataBinding.IsNullValueType = True
              Visible = False
            end
            object cxgrdbclmnGrdDBTabPrinUSUARIOMODIF: TcxGridDBColumn
              DataBinding.FieldName = 'USUARIOMODIF'
              DataBinding.IsNullValueType = True
              Visible = False
              Width = 146
            end
            object cxGrdDBTabPrinGRUPO_IVA_EMPRESA_FACTURA: TcxGridDBColumn
              DataBinding.FieldName = 'GRUPO_IVA_EMPRESA_FACTURA'
              DataBinding.IsNullValueType = True
              Visible = False
            end
            object cxGrdDBTabPrinESIVA_EXENTO_CLIENTE_FACTURA: TcxGridDBColumn
              Caption = 'Factura Exenta IVA'
              DataBinding.FieldName = 'ESIVA_EXENTO_CLIENTE_FACTURA'
              DataBinding.IsNullValueType = True
              PropertiesClassName = 'TcxCheckBoxProperties'
              Properties.ValueChecked = 'S'
              Properties.ValueUnchecked = 'N'
              Width = 163
            end
            object cxGrdDBTabPrinESRETENCIONES_CLIENTE_FACTURA: TcxGridDBColumn
              Caption = 'Cliente tiene IRPF'
              DataBinding.FieldName = 'ESRETENCIONES_CLIENTE_FACTURA'
              DataBinding.IsNullValueType = True
              PropertiesClassName = 'TcxCheckBoxProperties'
              Properties.ValueChecked = 'S'
              Properties.ValueUnchecked = 'N'
              Width = 160
            end
            object cxGrdDBTabPrinESINTRACOMUNITARIO_CLIENTE_FACTURA: TcxGridDBColumn
              Caption = 'Intracomunitario'
              DataBinding.FieldName = 'ESINTRACOMUNITARIO_CLIENTE_FACTURA'
              DataBinding.IsNullValueType = True
              PropertiesClassName = 'TcxCheckBoxProperties'
              Properties.ValueChecked = 'S'
              Properties.ValueUnchecked = 'N'
              Width = 159
            end
            object cxGrdDBTabPrinTARIFA_ARTICULO_CLIENTE_FACTURA: TcxGridDBColumn
              Caption = 'C'#243'digo Tarifa Art'#237'culos'
              DataBinding.FieldName = 'TARIFA_ARTICULO_CLIENTE_FACTURA'
              DataBinding.IsNullValueType = True
              Width = 200
            end
            object cxGrdDBTabPrinPALABRA_REPORTS_ZONA_IVA_FACTURA: TcxGridDBColumn
              Caption = 'Palabra IVA'
              DataBinding.FieldName = 'PALABRA_REPORTS_ZONA_IVA_FACTURA'
              DataBinding.IsNullValueType = True
              Visible = False
              Width = 106
            end
            object cxGrdDBTabPrinCODIGO_IVA_FACTURA: TcxGridDBColumn
              Caption = 'C'#243'digo IVA Factura'
              DataBinding.FieldName = 'CODIGO_IVA_FACTURA'
              DataBinding.IsNullValueType = True
              Visible = False
              Width = 186
            end
            object cxGrdDBTabPrinVENTA_ACTIVO_FIJO_FACTURA: TcxGridDBColumn
              Caption = 'Es Venta Activo Fijo (REAGP)'
              DataBinding.FieldName = 'VENTA_ACTIVO_FIJO_FACTURA'
              DataBinding.IsNullValueType = True
              PropertiesClassName = 'TcxCheckBoxProperties'
              Properties.ValueChecked = 'S'
              Properties.ValueUnchecked = 'N'
              Visible = False
              Width = 265
            end
            object cxGrdDBTabPrinTOTAL_BASES_FACTURA: TcxGridDBColumn
              Caption = 'Total Bases Imponibles'
              DataBinding.FieldName = 'TOTAL_BASES_FACTURA'
              DataBinding.IsNullValueType = True
              PropertiesClassName = 'TcxCurrencyEditProperties'
              Width = 199
            end
            object cxGrdDBTabPrinTOTAL_IMPUESTOS_FACTURA: TcxGridDBColumn
              Caption = 'Total Impuestos'
              DataBinding.FieldName = 'TOTAL_IMPUESTOS_FACTURA'
              DataBinding.IsNullValueType = True
              PropertiesClassName = 'TcxCurrencyEditProperties'
              Width = 146
            end
            object cxGrdDBTabPrinCONTADOR_LINEAS_FACTURA: TcxGridDBColumn
              Caption = 'Ult Nro Linea Factura'
              DataBinding.FieldName = 'CONTADOR_LINEAS_FACTURA'
              DataBinding.IsNullValueType = True
              Visible = False
              Width = 183
            end
            object cxgrdbclmnGrdDBTabPrinESRETENCIONES_EMPRESA_FACTURA: TcxGridDBColumn
              Caption = 'Empresa tiene IRPF'
              DataBinding.FieldName = 'ESRETENCIONES_EMPRESA_FACTURA'
              DataBinding.IsNullValueType = True
              PropertiesClassName = 'TcxCheckBoxProperties'
              Properties.ValueChecked = 'S'
              Properties.ValueUnchecked = 'N'
              Visible = False
              Width = 172
            end
            object cxgrdbclmnGrdDBTabPrinGRUPO_ZONA_IVA_EMPRESA_FACTURA: TcxGridDBColumn
              Caption = 'Zona IVA Empresa'
              DataBinding.FieldName = 'GRUPO_ZONA_IVA_EMPRESA_FACTURA'
              DataBinding.IsNullValueType = True
              Visible = False
              Width = 164
            end
            object cxgrdbclmnGrdDBTabPrinESREGIMENESPECIALAGRICOLA_EMPRESA_FACTURA: TcxGridDBColumn
              Caption = 'Empresa es REAGP'
              DataBinding.FieldName = 'ESREGIMENESPECIALAGRICOLA_EMPRESA_FACTURA'
              DataBinding.IsNullValueType = True
              PropertiesClassName = 'TcxCheckBoxProperties'
              Properties.ValueChecked = 'S'
              Properties.ValueUnchecked = 'N'
              Width = 166
            end
            object cxgrdbclmnGrdDBTabPrinESIVA_RECARGO_CLIENTE_FACTURA: TcxGridDBColumn
              Caption = 'Cliente tiene RE'
              DataBinding.FieldName = 'ESIVA_RECARGO_CLIENTE_FACTURA'
              DataBinding.IsNullValueType = True
              PropertiesClassName = 'TcxCheckBoxProperties'
              Properties.ValueChecked = 'S'
              Properties.ValueUnchecked = 'N'
              Width = 156
            end
            object cxgrdbclmnGrdDBTabPrinESIMP_INCL_TARIFA_CLIENTE_FACTURA: TcxGridDBColumn
              Caption = 'Precios Tarifa con Impuestos'
              DataBinding.FieldName = 'ESIMP_INCL_TARIFA_CLIENTE_FACTURA'
              DataBinding.IsNullValueType = True
              Visible = False
              Width = 263
            end
            object cxgrdbclmnGrdDBTabPrinESIRPF_IMP_INCL_ZONA_IVA_FACTURA: TcxGridDBColumn
              Caption = 'IRPF con Imp Incl (REAGP)'
              DataBinding.FieldName = 'ESIRPF_IMP_INCL_ZONA_IVA_FACTURA'
              DataBinding.IsNullValueType = True
              PropertiesClassName = 'TcxCheckBoxProperties'
              Properties.ValueChecked = 'S'
              Properties.ValueUnchecked = 'N'
              Visible = False
            end
            object cxgrdbclmnGrdDBTabPrinESAPLICA_RE_ZONA_IVA_FACTURA: TcxGridDBColumn
              Caption = 'Tiene RE'
              DataBinding.FieldName = 'ESAPLICA_RE_ZONA_IVA_FACTURA'
              DataBinding.IsNullValueType = True
              PropertiesClassName = 'TcxCheckBoxProperties'
              Properties.ValueChecked = 'S'
              Properties.ValueUnchecked = 'N'
              Visible = False
              Width = 96
            end
            object cxgrdbclmnGrdDBTabPrinESVENTA_ACTIVO_FIJO_FACTURA: TcxGridDBColumn
              Caption = 'Venta Activo Fijo REAGP'
              DataBinding.FieldName = 'ESVENTA_ACTIVO_FIJO_FACTURA'
              DataBinding.IsNullValueType = True
              PropertiesClassName = 'TcxCheckBoxProperties'
              Properties.ValueChecked = 'S'
              Properties.ValueUnchecked = 'N'
              Width = 216
            end
            object cxgrdbclmnGrdDBTabPrinESCREARARTICULOS_FACTURA: TcxGridDBColumn
              Caption = 'Crea Art'#237'culos'
              DataBinding.FieldName = 'ESCREARARTICULOS_FACTURA'
              DataBinding.IsNullValueType = True
              PropertiesClassName = 'TcxCheckBoxProperties'
              Properties.ValueChecked = 'S'
              Properties.ValueUnchecked = 'N'
              Visible = False
              Width = 142
            end
            object cxgrdbclmnGrdDBTabPrinESDESCRIPCIONES_AMP_FACTURA: TcxGridDBColumn
              Caption = 'Tiene Descripciones Ampliadas'
              DataBinding.FieldName = 'ESDESCRIPCIONES_AMP_FACTURA'
              DataBinding.IsNullValueType = True
              PropertiesClassName = 'TcxCheckBoxProperties'
              Properties.ValueChecked = 'S'
              Properties.ValueUnchecked = 'N'
              Visible = False
              Width = 297
            end
            object cxgrdbclmnGrdDBTabPrinESFECHADEENTREGA_FACTURA: TcxGridDBColumn
              Caption = 'Tiene Fecha de Entrega'
              DataBinding.FieldName = 'ESFECHADEENTREGA_FACTURA'
              DataBinding.IsNullValueType = True
              PropertiesClassName = 'TcxCheckBoxProperties'
              Properties.ValueChecked = 'S'
              Properties.ValueUnchecked = 'N'
              Visible = False
              Width = 226
            end
            object cxgrdbclmnGrdDBTabPrinESREGIMENESPECIALAGRICOLA_CLIENTE_FACTURA: TcxGridDBColumn
              Caption = 'Cliente es REAGP'
              DataBinding.FieldName = 'ESREGIMENESPECIALAGRICOLA_CLIENTE_FACTURA'
              DataBinding.IsNullValueType = True
              PropertiesClassName = 'TcxCheckBoxProperties'
              Properties.ValueChecked = 'S'
              Properties.ValueUnchecked = 'N'
              Visible = False
              Width = 164
            end
            object cxgrdbclmnGrdDBTabPrinESIVAAGRICOLA_ZONA_IVA_FACTURA: TcxGridDBColumn
              Caption = 'Es IVA Agricola'
              DataBinding.FieldName = 'ESIVAAGRICOLA_ZONA_IVA_FACTURA'
              DataBinding.IsNullValueType = True
              PropertiesClassName = 'TcxCheckBoxProperties'
              Properties.ValueChecked = 'S'
              Properties.ValueUnchecked = 'N'
              Visible = False
              Width = 138
            end
          end
        end
      end
      inherited tsFicha: TcxTabSheet
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        ExplicitLeft = 3
        ExplicitTop = 32
        ExplicitWidth = 1078
        ExplicitHeight = 766
        object pnl1: TPanel
          Left = 0
          Top = 321
          Width = 1078
          Height = 445
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Align = alClient
          BevelOuter = bvNone
          ParentColor = True
          TabOrder = 2
          object pcDetail: TcxPageControl
            Left = 0
            Top = 0
            Width = 1078
            Height = 445
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            Align = alClient
            TabOrder = 0
            Properties.ActivePage = tsLineasFactura
            Properties.CustomButtons.Buttons = <>
            ClientRectBottom = 439
            ClientRectLeft = 3
            ClientRectRight = 1072
            ClientRectTop = 32
            object tsLineasFactura: TcxTabSheet
              Margins.Left = 4
              Margins.Top = 4
              Margins.Right = 4
              Margins.Bottom = 4
              Caption = '&1_Lineas de Factura - '
              ImageIndex = 1
              ExplicitLeft = 0
              ExplicitTop = 0
              ExplicitWidth = 0
              ExplicitHeight = 0
              object cxgrdLineasFactura: TcxGrid
                Left = 0
                Top = 0
                Width = 889
                Height = 407
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                Align = alClient
                TabOrder = 0
                object tvLineasFactura: TcxGridDBTableView
                  OnKeyDown = tvLineasFacturaKeyDown
                  Navigator.Buttons.ConfirmDelete = True
                  Navigator.Buttons.CustomButtons = <>
                  Navigator.Visible = True
                  ScrollbarAnnotations.CustomAnnotations = <>
                  DataController.DataModeController.SmartRefresh = True
                  DataController.DataSource = dmFacturas.dsLinFac
                  DataController.Options = [dcoCaseInsensitive, dcoAssignGroupingValues, dcoAssignMasterDetailKeys, dcoSaveExpanding, dcoGroupsAlwaysExpanded, dcoInsertOnNewItemRowFocusing]
                  DataController.Summary.DefaultGroupSummaryItems = <>
                  DataController.Summary.FooterSummaryItems = <
                    item
                      Format = 'TOTAL ##,##.00 '#8364
                      Kind = skSum
                      Column = cxgrdbclmntv1TOTAL_FACTURA_LINEA
                    end
                    item
                      Format = '#,##.00'
                      Kind = skSum
                      Column = cxgrdbclmntv1CANTIDAD_FACTURA_LINEA
                    end>
                  DataController.Summary.SummaryGroups = <>
                  FixedDataRows.SeparatorColor = clBlack
                  NewItemRow.InfoText = 'Click aqu'#237' para a'#241'adir fila'
                  NewItemRow.Visible = True
                  OptionsBehavior.FocusFirstCellOnNewRecord = True
                  OptionsBehavior.GoToNextCellOnEnter = True
                  OptionsBehavior.FocusCellOnCycle = True
                  OptionsCustomize.ColumnGrouping = False
                  OptionsCustomize.DataRowFixing = True
                  OptionsData.Appending = True
                  OptionsSelection.InvertSelect = False
                  OptionsView.NoDataToDisplayInfoText = '<No hay datos a mostrar>'
                  OptionsView.Footer = True
                  OptionsView.GroupByBox = False
                  object cxgrdbclmntv1LINEA_FACTURA_LINEA: TcxGridDBColumn
                    Caption = 'Nro Linea'
                    DataBinding.FieldName = 'LINEA_FACTURA_LINEA'
                    Width = 87
                  end
                  object cxgrdbclmntv1CODIGO_ARTICULO_FACTURA_LINEA: TcxGridDBColumn
                    Caption = 'C'#243'digo Art'#237'culo'
                    DataBinding.FieldName = 'CODIGO_ARTICULO_FACTURA_LINEA'
                    PropertiesClassName = 'TcxButtonEditProperties'
                    Properties.Buttons = <
                      item
                        Default = True
                        Kind = bkEllipsis
                      end>
                    Properties.OnButtonClick = cxgrdbclmntv1CODIGO_ARTICULO_FACTURA_LINEAPropertiesButtonClick
                    Properties.OnEditValueChanged = cxgrdbclmntv1CODIGO_ARTICULO_FACTURA_LINEAPropertiesEditValueChanged
                    Width = 152
                  end
                  object dbcLineasFacturaCODIGO_FAMILIA_FACTURA_LINEA: TcxGridDBColumn
                    Caption = 'C'#243'digo Familia'
                    DataBinding.FieldName = 'CODIGO_FAMILIA_FACTURA_LINEA'
                    Width = 136
                  end
                  object dbcLineasFacturaNOMBRE_FAMILIA_FACTURA_LINEA: TcxGridDBColumn
                    Caption = 'Nombre Familia'
                    DataBinding.FieldName = 'NOMBRE_FAMILIA_FACTURA_LINEA'
                    Width = 245
                  end
                  object cmDESCRIPCION_ARTICULO_FACTURA_LINEA: TcxGridDBColumn
                    Caption = 'Descripci'#243'n'
                    DataBinding.FieldName = 'DESCRIPCION_ARTICULO_FACTURA_LINEA'
                    PropertiesClassName = 'TcxMemoProperties'
                    Properties.MaxLength = 1000
                    Properties.ScrollBars = ssBoth
                    Properties.VisibleLineCount = 3
                    MinWidth = 0
                    VisibleForEditForm = bTrue
                    Width = 300
                  end
                  object cxgrdbclmntv1CANTIDAD_FACTURA_LINEA: TcxGridDBColumn
                    Caption = 'Cantidad'
                    DataBinding.FieldName = 'CANTIDAD_FACTURA_LINEA'
                    PropertiesClassName = 'TcxSpinEditProperties'
                    Properties.OnEditValueChanged = cxgrdbclmntv1CANTIDAD_FACTURA_LINEAPropertiesEditValueChanged
                    Width = 81
                  end
                  object cxgrdbclmntv1TIPO_CANTIDAD_ARTICULO_FACTURA_LINEA: TcxGridDBColumn
                    Caption = 'Tipo de Cantidad'
                    DataBinding.FieldName = 'TIPO_CANTIDAD_ARTICULO_FACTURA_LINEA'
                    Width = 153
                  end
                  object tvLineasFacturaPRECIOSALIDA_FACTURA_LINEA: TcxGridDBColumn
                    Caption = 'Precio Salida'
                    DataBinding.FieldName = 'PRECIOSALIDA_FACTURA_LINEA'
                    PropertiesClassName = 'TcxCurrencyEditProperties'
                    Properties.OnEditValueChanged = tvLineasFacturaPRECIOSALIDA_FACTURA_LINEAPropertiesEditValueChanged
                  end
                  object tvLineasFacturaPORCEN_DTO_FACTURA_LINEA: TcxGridDBColumn
                    Caption = '% Dto'
                    DataBinding.FieldName = 'PORCEN_DTO_FACTURA_LINEA'
                    PropertiesClassName = 'TcxSpinEditProperties'
                    Properties.DisplayFormat = '0.00 %'
                    Properties.EditFormat = '0.00 %'
                    Properties.MaxValue = 100.000000000000000000
                  end
                  object tvLineasFacturaPRECIO_DTO_FACTURA_LINEA: TcxGridDBColumn
                    Caption = 'Menos Dto'
                    DataBinding.FieldName = 'PRECIO_DTO_FACTURA_LINEA'
                    PropertiesClassName = 'TcxCurrencyEditProperties'
                  end
                  object cxgrdbclmntv1PRECIOVENTA_SIVA_ARTICULO_FACTURA_LINEA: TcxGridDBColumn
                    Caption = 'Precio sin IVA'
                    DataBinding.FieldName = 'PRECIOVENTA_SIVA_ARTICULO_FACTURA_LINEA'
                    PropertiesClassName = 'TcxCurrencyEditProperties'
                    Properties.ReadOnly = False
                    Properties.OnEditValueChanged = cxgrdbclmntv1PRECIOVENTA_SIVA_ARTICULO_FACTURA_LINEAPropertiesEditValueChanged
                    Width = 127
                  end
                  object cxgrdbclmntv1IMP_INCL_TARIFA_FACTURA_LINEA: TcxGridDBColumn
                    Caption = 'ImpIncl'
                    DataBinding.FieldName = 'ESIMP_INCL_TARIFA_FACTURA_LINEA'
                    PropertiesClassName = 'TcxCheckBoxProperties'
                    Properties.ReadOnly = True
                    Properties.ValueChecked = 'S'
                    Properties.ValueUnchecked = 'N'
                    Visible = False
                    Width = 79
                  end
                  object cxgrdbclmntv1TIPOIVA_ARTICULO_FACTURA_LINEA: TcxGridDBColumn
                    Caption = 'Tipo de IVA'
                    DataBinding.FieldName = 'TIPOIVA_ARTICULO_FACTURA_LINEA'
                    PropertiesClassName = 'TcxLookupComboBoxProperties'
                    Properties.DropDownListStyle = lsFixedList
                    Properties.KeyFieldNames = 'CODIGO_ABREVIATURA_TIPO_IVA'
                    Properties.ListColumns = <
                      item
                        Caption = 'Tipo de IVA'
                        FieldName = 'NOMBRE_TIPO_IVA'
                      end>
                    Properties.ListOptions.ShowHeader = False
                    Properties.ReadOnly = False
                    Properties.OnChange = cxgrdbclmntv1TIPOIVA_ARTICULO_FACTURA_LINEAPropertiesChange
                    Width = 109
                  end
                  object cxgrdbclmntv1PORCEN_IVA_FACTURA_LINEA: TcxGridDBColumn
                    Caption = '% IVA'
                    DataBinding.FieldName = 'PORCEN_IVA_FACTURA_LINEA'
                    PropertiesClassName = 'TcxSpinEditProperties'
                    Properties.DisplayFormat = '0.00 %'
                    Properties.EditFormat = '0.00 %'
                    Properties.ReadOnly = False
                    Width = 79
                  end
                  object cxgrdbclmntv1PRECIOVENTA_CIVA_ARTICULO_FACTURA_LINEA: TcxGridDBColumn
                    Caption = 'Precio con IVA'
                    DataBinding.FieldName = 'PRECIOVENTA_CIVA_ARTICULO_FACTURA_LINEA'
                    PropertiesClassName = 'TcxCurrencyEditProperties'
                    Properties.ReadOnly = False
                    Properties.OnEditValueChanged = cxgrdbclmntv1PRECIOVENTA_CIVA_ARTICULO_FACTURA_LINEAPropertiesEditValueChanged
                    Width = 139
                  end
                  object cxgrdbclmntv1TOTAL_FACTURA_LINEA: TcxGridDBColumn
                    Caption = 'Total'
                    DataBinding.FieldName = 'TOTAL_FACTURA_LINEA'
                    PropertiesClassName = 'TcxCurrencyEditProperties'
                    Properties.ReadOnly = True
                    Width = 172
                  end
                  object dbcLineasFacturaFECHA_ENTREGA_FACTURA_LINEA: TcxGridDBColumn
                    Caption = 'Fecha Entrega'
                    DataBinding.FieldName = 'FECHA_ENTREGA_FACTURA_LINEA'
                    PropertiesClassName = 'TcxDateEditProperties'
                    Properties.DateButtons = [btnClear, btnToday]
                    Properties.DisplayFormat = 'dd/mm/yyyy'
                    Properties.EditFormat = 'dd/mm/yyyy'
                  end
                end
                object tv2: TcxGridDBBandedTableView
                  Navigator.Buttons.CustomButtons = <>
                  Navigator.Visible = True
                  ScrollbarAnnotations.CustomAnnotations = <>
                  DataController.DetailKeyFieldNames = 'AppointmentId'
                  DataController.KeyFieldNames = 'PerId'
                  DataController.MasterKeyFieldNames = 'AppointmentId'
                  DataController.Summary.DefaultGroupSummaryItems = <>
                  DataController.Summary.FooterSummaryItems = <>
                  DataController.Summary.SummaryGroups = <>
                  OptionsView.GroupByBox = False
                  Bands = <
                    item
                      Width = 958
                    end>
                  object cxgrdbndclmntv2PerId: TcxGridDBBandedColumn
                    DataBinding.FieldName = 'PerId'
                    DataBinding.IsNullValueType = True
                    Width = 37
                    Position.BandIndex = 0
                    Position.ColIndex = 0
                    Position.RowIndex = 0
                  end
                  object cxgrdbndclmntv2AppointmentId: TcxGridDBBandedColumn
                    DataBinding.FieldName = 'AppointmentId'
                    DataBinding.IsNullValueType = True
                    Width = 81
                    Position.BandIndex = 0
                    Position.ColIndex = 1
                    Position.RowIndex = 0
                  end
                  object cxgrdbndclmntv2Linea: TcxGridDBBandedColumn
                    DataBinding.FieldName = 'Linea'
                    DataBinding.IsNullValueType = True
                    Width = 44
                    Position.BandIndex = 0
                    Position.ColIndex = 2
                    Position.RowIndex = 0
                  end
                  object cxgrdbndclmntv2clave: TcxGridDBBandedColumn
                    DataBinding.FieldName = 'clave'
                    DataBinding.IsNullValueType = True
                    Width = 126
                    Position.BandIndex = 0
                    Position.ColIndex = 3
                    Position.RowIndex = 0
                  end
                  object cxgrdbndclmntv2valor: TcxGridDBBandedColumn
                    DataBinding.FieldName = 'valor'
                    DataBinding.IsNullValueType = True
                    Width = 146
                    Position.BandIndex = 0
                    Position.ColIndex = 4
                    Position.RowIndex = 0
                  end
                  object cxgrdbndclmntv2instantemodif: TcxGridDBBandedColumn
                    DataBinding.FieldName = 'instantemodif'
                    DataBinding.IsNullValueType = True
                    Width = 137
                    Position.BandIndex = 0
                    Position.ColIndex = 7
                    Position.RowIndex = 0
                  end
                  object cxgrdbndclmntv2descripcion: TcxGridDBBandedColumn
                    DataBinding.FieldName = 'descripcion'
                    DataBinding.IsNullValueType = True
                    Width = 178
                    Position.BandIndex = 0
                    Position.ColIndex = 5
                    Position.RowIndex = 0
                  end
                  object cxgrdbndclmntv2parte: TcxGridDBBandedColumn
                    DataBinding.FieldName = 'parte'
                    DataBinding.IsNullValueType = True
                    Width = 209
                    Position.BandIndex = 0
                    Position.ColIndex = 6
                    Position.RowIndex = 0
                  end
                end
                object cxgrdlvlLineasFactura: TcxGridLevel
                  GridView = tvLineasFactura
                end
              end
              object pnlRightLineas: TPanel
                Left = 889
                Top = 0
                Width = 180
                Height = 407
                Align = alRight
                BevelOuter = bvNone
                TabOrder = 1
                object chkFechaEntrega: TcxDBCheckBox
                  Left = 10
                  Top = 20
                  Caption = 'Fecha de Entrega'
                  DataBinding.DataField = 'ESFECHADEENTREGA_FACTURA'
                  DataBinding.DataSource = dsTablaG
                  Properties.ValueChecked = 'S'
                  Properties.ValueUnchecked = 'N'
                  Properties.OnChange = chkFechaEntregaPropertiesChange
                  Style.TransparentBorder = False
                  TabOrder = 0
                  Transparent = True
                end
                object chkDescripcion_ampliada: TcxDBCheckBox
                  Left = 10
                  Top = 49
                  Caption = 'Desc. Ampliada'
                  DataBinding.DataField = 'ESDESCRIPCIONES_AMP_FACTURA'
                  DataBinding.DataSource = dsTablaG
                  Properties.ValueChecked = 'S'
                  Properties.ValueUnchecked = 'N'
                  Properties.OnChange = chkDescripcion_ampliadaPropertiesChange
                  Style.TransparentBorder = False
                  TabOrder = 1
                  Transparent = True
                end
                object chkCrearArticulos: TcxDBCheckBox
                  Left = 10
                  Top = 78
                  Caption = 'Crear Art'#237'culos'
                  DataBinding.DataField = 'ESCREARARTICULOS_FACTURA'
                  DataBinding.DataSource = dsTablaG
                  Properties.ValueChecked = 'S'
                  Properties.ValueUnchecked = 'N'
                  Properties.OnChange = chkCrearArticulosPropertiesChange
                  Style.TransparentBorder = False
                  TabOrder = 2
                  Transparent = True
                  Visible = False
                end
                object btnExportarLineas: TcxButton
                  Left = 7
                  Top = 120
                  Width = 167
                  Height = 34
                  Caption = 'E&xp Excel'
                  TabOrder = 3
                  OnClick = btnExportarLineasClick
                end
                object btnIraArticulo: TcxButton
                  Left = 7
                  Top = 160
                  Width = 167
                  Height = 34
                  Caption = 'I&r a Art'#237'culo'
                  TabOrder = 4
                  OnClick = btnIraArticuloClick
                end
              end
            end
            object tsTotales: TcxTabSheet
              Margins.Left = 4
              Margins.Top = 4
              Margins.Right = 4
              Margins.Bottom = 4
              Caption = '&2_Totales'
              ImageIndex = 2
              object cxdbmskdt1: TcxDBMaskEdit
                Left = 225
                Top = 134
                DataBinding.DataField = 'PORCEN_RETENCION_FACTURA'
                DataBinding.DataSource = dsTablaG
                Properties.EditMask = '!99;1;_'
                TabOrder = 4
                Visible = False
                Width = 34
              end
              object lblTotalaPagar: TcxLabel
                Left = 105
                Top = 237
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                Caption = 'Total a pagar'
                Transparent = True
              end
              object curTotalAPagar: TcxDBCurrencyEdit
                Left = 230
                Top = 233
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                DataBinding.DataField = 'TOTAL_LIQUIDO_FACTURA'
                DataBinding.DataSource = dsTablaG
                Properties.ReadOnly = True
                TabOrder = 14
                Width = 133
              end
              object curTOTAL_LIQUIDO_FACTURA: TcxDBCurrencyEdit
                Left = 230
                Top = 184
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                DataBinding.DataField = 'TOTAL_RETENCION_FACTURA'
                DataBinding.DataSource = dsTablaG
                Properties.ReadOnly = True
                TabOrder = 7
                Width = 133
              end
              object lblTotalRetencionFactura: TcxLabel
                Left = 18
                Top = 188
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                Caption = 'Total Retenci'#243'n Factura'
                Transparent = True
              end
              object lblPorcRetencionFactura: TcxLabel
                Left = 49
                Top = 134
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                Caption = '% Retenci'#243'n Factura'
                Transparent = True
              end
              object spnRetencion: TcxDBSpinEdit
                Left = 230
                Top = 133
                DataBinding.DataField = 'PORCEN_RETENCION_FACTURA'
                DataBinding.DataSource = dsTablaG
                Properties.AssignedValues.MinValue = True
                Properties.DisplayFormat = '0.00 %'
                Properties.EditFormat = '0.00 %'
                Properties.MaxValue = 100.000000000000000000
                Properties.ReadOnly = False
                TabOrder = 5
                Width = 133
              end
              object curTOTAL_RETENCION_FACTURA: TcxDBCurrencyEdit
                Left = 230
                Top = 35
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                DataBinding.DataField = 'TOTAL_BASES_FACTURA'
                DataBinding.DataSource = dsTablaG
                Properties.DecimalPlaces = 3
                Properties.ReadOnly = True
                TabOrder = 0
                Width = 133
              end
              object lblTotalBaseImponible: TcxLabel
                Left = 38
                Top = 36
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                Caption = 'Total Base Imponible'
                Transparent = True
              end
              object curTOTAL_BASES_FACTURA: TcxDBCurrencyEdit
                Left = 230
                Top = 80
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                DataBinding.DataField = 'TOTAL_IMPUESTOS_FACTURA'
                DataBinding.DataSource = dsTablaG
                Properties.DecimalPlaces = 3
                Properties.DisplayFormat = ',0.00 '#8364';-,0.00 '#8364
                Properties.ReadOnly = True
                TabOrder = 1
                Width = 133
              end
              object lbl1TotalImpuestos: TcxLabel
                Left = 79
                Top = 81
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                Caption = 'Total Impuestos'
                Transparent = True
              end
              object chkESIRPF_IMP_INCL_ZONA_IVA_FACTURA: TcxDBCheckBox
                Left = 582
                Top = 352
                Caption = 'C'#225'lculo IRPF con impuestos (S'#243'lo REAGP)'
                DataBinding.DataField = 'ESIRPF_IMP_INCL_ZONA_IVA_FACTURA'
                DataBinding.DataSource = dsTablaG
                Properties.ValueChecked = 'S'
                Properties.ValueUnchecked = 'N'
                TabOrder = 2
                Transparent = True
              end
              object chkESVENTA_ACTIVO_FIJO_FACTURA: TcxDBCheckBox
                Left = 582
                Top = 318
                Caption = 'Venta de Activo Fijo --Maquinaria, Aperos-- (S'#243'lo REAGP)'
                DataBinding.DataField = 'ESVENTA_ACTIVO_FIJO_FACTURA'
                DataBinding.DataSource = dsTablaG
                Properties.ValueChecked = 'S'
                Properties.ValueUnchecked = 'N'
                TabOrder = 6
                Transparent = True
              end
              object lblFormadePago: TcxLabel
                Left = 91
                Top = 314
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                Caption = 'Forma de Pago'
                Transparent = True
              end
              object cbbFORMAPAGO: TcxDBLookupComboBox
                Left = 226
                Top = 310
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                DataBinding.DataField = 'FORMA_PAGO_FACTURA'
                DataBinding.DataSource = dsTablaG
                Properties.DropDownSizeable = True
                Properties.KeyFieldNames = 'CODIGO_FORMAPAGO'
                Properties.ListColumns = <
                  item
                    Caption = 'C'#243'digo'
                    MinWidth = 50
                    Width = 50
                    FieldName = 'CODIGO_FORMAPAGO'
                  end
                  item
                    Caption = 'Descripci'#243'n'
                    MinWidth = 100
                    Width = 100
                    FieldName = 'DESCRIPCION_FORMAPAGO'
                  end>
                Properties.ListOptions.CaseInsensitive = True
                TabOrder = 8
                OnKeyUp = cbbSerieFacturaKeyUp
                Width = 335
              end
              object btnGenerarRecibos: TcxButton
                Left = 225
                Top = 346
                Width = 160
                Height = 25
                Caption = 'Generar &Recibo/s'
                TabOrder = 9
                OnClick = btnGenerarRecibosClick
              end
              object GroupBox1: TGroupBox
                Left = 432
                Top = 11
                Width = 617
                Height = 294
                Caption = 'Desglose Impuestos'
                TabOrder = 16
                object Shape1: TShape
                  Left = 163
                  Top = 32
                  Width = 438
                  Height = 40
                  Brush.Style = bsClear
                end
                object Shape2: TShape
                  Left = 68
                  Top = 71
                  Width = 533
                  Height = 50
                  Brush.Style = bsClear
                end
                object Shape3: TShape
                  Left = 13
                  Top = 169
                  Width = 588
                  Height = 50
                  Brush.Style = bsClear
                end
                object Shape4: TShape
                  Left = 68
                  Top = 120
                  Width = 533
                  Height = 50
                  Brush.Style = bsClear
                end
                object Shape5: TShape
                  Left = 68
                  Top = 218
                  Width = 533
                  Height = 50
                  Brush.Style = bsClear
                end
                object lblTotRE: TcxLabel
                  Left = 504
                  Top = 40
                  Caption = 'Total R.E.'
                end
                object PorRE: TcxLabel
                  Left = 440
                  Top = 40
                  Caption = '%R.E.'
                end
                object lblTotIVA: TcxLabel
                  Left = 336
                  Top = 40
                  Caption = 'Total IVA'
                end
                object lblPorIVA: TcxLabel
                  Left = 280
                  Top = 40
                  Caption = '%IVA'
                end
                object lblBaseNeta: TcxLabel
                  Left = 176
                  Top = 40
                  Caption = 'BaseNeta'
                end
                object lblNormal: TcxLabel
                  Left = 90
                  Top = 82
                  Caption = 'Normal'
                end
                object lblReducido: TcxLabel
                  Left = 73
                  Top = 133
                  Caption = 'Reducido'
                end
                object lblSReducido: TcxLabel
                  Left = 21
                  Top = 181
                  Caption = 'S'#250'per Reducido'
                end
                object lblExento: TcxLabel
                  Left = 94
                  Top = 229
                  Caption = 'Exento'
                end
                object cxDBCurrencyEdit1: TcxDBCurrencyEdit
                  Left = 162
                  Top = 78
                  DataBinding.DataField = 'TOTAL_BASEI_IVAN_FACTURA'
                  DataBinding.DataSource = dsTablaG
                  Properties.ReadOnly = True
                  Style.BorderStyle = ebsNone
                  TabOrder = 9
                  Width = 113
                end
                object cxDBCurrencyEdit2: TcxDBCurrencyEdit
                  Left = 162
                  Top = 132
                  DataBinding.DataField = 'TOTAL_BASEI_IVAR_FACTURA'
                  DataBinding.DataSource = dsTablaG
                  Properties.ReadOnly = True
                  Style.BorderStyle = ebsNone
                  TabOrder = 10
                  Width = 113
                end
                object cxDBCurrencyEdit3: TcxDBCurrencyEdit
                  Left = 162
                  Top = 180
                  DataBinding.DataField = 'TOTAL_BASEI_IVAS_FACTURA'
                  DataBinding.DataSource = dsTablaG
                  Properties.ReadOnly = True
                  Style.BorderStyle = ebsNone
                  TabOrder = 11
                  Width = 113
                end
                object cxDBCurrencyEdit4: TcxDBCurrencyEdit
                  Left = 160
                  Top = 228
                  DataBinding.DataField = 'TOTAL_BASEI_IVAE_FACTURA'
                  DataBinding.DataSource = dsTablaG
                  Properties.ReadOnly = True
                  Style.BorderStyle = ebsNone
                  TabOrder = 12
                  Width = 115
                end
                object cxDBCurrencyEdit5: TcxDBCurrencyEdit
                  Left = 337
                  Top = 78
                  DataBinding.DataField = 'TOTAL_IVAN_FACTURA'
                  DataBinding.DataSource = dsTablaG
                  Properties.ReadOnly = True
                  Style.BorderStyle = ebsNone
                  TabOrder = 13
                  Width = 100
                end
                object cxDBCurrencyEdit6: TcxDBCurrencyEdit
                  Left = 337
                  Top = 132
                  DataBinding.DataField = 'TOTAL_IVAR_FACTURA'
                  DataBinding.DataSource = dsTablaG
                  Properties.ReadOnly = True
                  Style.BorderStyle = ebsNone
                  TabOrder = 14
                  Width = 100
                end
                object cxDBCurrencyEdit7: TcxDBCurrencyEdit
                  Left = 337
                  Top = 180
                  DataBinding.DataField = 'TOTAL_IVAS_FACTURA'
                  DataBinding.DataSource = dsTablaG
                  Properties.ReadOnly = True
                  Style.BorderStyle = ebsNone
                  TabOrder = 15
                  Width = 100
                end
                object cxDBCurrencyEdit8: TcxDBCurrencyEdit
                  Left = 337
                  Top = 228
                  DataBinding.DataField = 'TOTAL_IVAE_FACTURA'
                  DataBinding.DataSource = dsTablaG
                  Properties.ReadOnly = True
                  Style.BorderStyle = ebsNone
                  TabOrder = 16
                  Width = 100
                end
                object cxDBCurrencyEdit9: TcxDBCurrencyEdit
                  Left = 501
                  Top = 78
                  DataBinding.DataField = 'TOTAL_REN_FACTURA'
                  DataBinding.DataSource = dsTablaG
                  Properties.ReadOnly = True
                  Style.BorderStyle = ebsNone
                  TabOrder = 17
                  Width = 95
                end
                object cxDBCurrencyEdit10: TcxDBCurrencyEdit
                  Left = 501
                  Top = 132
                  DataBinding.DataField = 'TOTAL_RER_FACTURA'
                  DataBinding.DataSource = dsTablaG
                  Properties.ReadOnly = True
                  Style.BorderStyle = ebsNone
                  TabOrder = 18
                  Width = 95
                end
                object cxDBCurrencyEdit11: TcxDBCurrencyEdit
                  Left = 501
                  Top = 180
                  DataBinding.DataField = 'TOTAL_RES_FACTURA'
                  DataBinding.DataSource = dsTablaG
                  Properties.ReadOnly = True
                  Style.BorderStyle = ebsNone
                  TabOrder = 19
                  Width = 95
                end
                object cxDBCurrencyEdit12: TcxDBCurrencyEdit
                  Left = 501
                  Top = 228
                  DataBinding.DataField = 'TOTAL_REE_FACTURA'
                  DataBinding.DataSource = dsTablaG
                  Properties.ReadOnly = True
                  Style.BorderStyle = ebsNone
                  TabOrder = 20
                  Width = 95
                end
                object cxDBSpinEdit1: TcxDBSpinEdit
                  Left = 272
                  Top = 78
                  DataBinding.DataField = 'PORCEN_IVAN_FACTURA'
                  DataBinding.DataSource = dsTablaG
                  ParentColor = True
                  Properties.AssignedValues.MinValue = True
                  Properties.DisplayFormat = '0.0'
                  Properties.EditFormat = '0.0'
                  Properties.MaxValue = 100.000000000000000000
                  Properties.ReadOnly = True
                  Properties.SpinButtons.Visible = False
                  Style.BorderStyle = ebsNone
                  TabOrder = 21
                  Width = 59
                end
                object cxDBSpinEdit2: TcxDBSpinEdit
                  Left = 272
                  Top = 132
                  DataBinding.DataField = 'PORCEN_IVAR_FACTURA'
                  DataBinding.DataSource = dsTablaG
                  ParentColor = True
                  Properties.AssignedValues.MinValue = True
                  Properties.DisplayFormat = '0.0'
                  Properties.EditFormat = '0.0'
                  Properties.MaxValue = 100.000000000000000000
                  Properties.ReadOnly = True
                  Properties.SpinButtons.Visible = False
                  Style.BorderStyle = ebsNone
                  TabOrder = 22
                  Width = 64
                end
                object cxDBSpinEdit3: TcxDBSpinEdit
                  Left = 272
                  Top = 180
                  DataBinding.DataField = 'PORCEN_IVAS_FACTURA'
                  DataBinding.DataSource = dsTablaG
                  ParentColor = True
                  Properties.AssignedValues.MinValue = True
                  Properties.DisplayFormat = '0.0'
                  Properties.EditFormat = '0.0'
                  Properties.MaxValue = 100.000000000000000000
                  Properties.ReadOnly = True
                  Properties.SpinButtons.Visible = False
                  Style.BorderStyle = ebsNone
                  TabOrder = 23
                  Width = 64
                end
                object cxDBSpinEdit4: TcxDBSpinEdit
                  Left = 272
                  Top = 228
                  DataBinding.DataField = 'PORCEN_IVAE_FACTURA'
                  DataBinding.DataSource = dsTablaG
                  ParentColor = True
                  Properties.AssignedValues.MinValue = True
                  Properties.DisplayFormat = '0.0'
                  Properties.EditFormat = '0.0'
                  Properties.MaxValue = 100.000000000000000000
                  Properties.ReadOnly = True
                  Properties.SpinButtons.Visible = False
                  Style.BorderStyle = ebsNone
                  TabOrder = 24
                  Width = 64
                end
                object cxDBSpinEdit5: TcxDBSpinEdit
                  Left = 440
                  Top = 132
                  DataBinding.DataField = 'PORCEN_RER_FACTURA'
                  DataBinding.DataSource = dsTablaG
                  ParentColor = True
                  Properties.AssignedValues.MinValue = True
                  Properties.DisplayFormat = '0.00 %'
                  Properties.EditFormat = '0.00 %'
                  Properties.MaxValue = 100.000000000000000000
                  Properties.ReadOnly = True
                  Properties.SpinButtons.Visible = False
                  Style.BorderStyle = ebsNone
                  TabOrder = 25
                  Width = 63
                end
                object cxDBSpinEdit7: TcxDBSpinEdit
                  Left = 440
                  Top = 78
                  DataBinding.DataField = 'PORCEN_REN_FACTURA'
                  DataBinding.DataSource = dsTablaG
                  ParentColor = True
                  Properties.AssignedValues.MinValue = True
                  Properties.DisplayFormat = '0.00 %'
                  Properties.EditFormat = '0.00 %'
                  Properties.MaxValue = 100.000000000000000000
                  Properties.ReadOnly = True
                  Properties.SpinButtons.Visible = False
                  Style.BorderStyle = ebsNone
                  TabOrder = 26
                  Width = 63
                end
                object cxDBSpinEdit8: TcxDBSpinEdit
                  Left = 440
                  Top = 180
                  DataBinding.DataField = 'PORCEN_RES_FACTURA'
                  DataBinding.DataSource = dsTablaG
                  ParentColor = True
                  Properties.AssignedValues.MinValue = True
                  Properties.DisplayFormat = '0.00 %'
                  Properties.EditFormat = '0.00 %'
                  Properties.MaxValue = 100.000000000000000000
                  Properties.ReadOnly = True
                  Properties.SpinButtons.Visible = False
                  Style.BorderStyle = ebsNone
                  TabOrder = 27
                  Width = 63
                end
                object cxDBSpinEdit9: TcxDBSpinEdit
                  Left = 440
                  Top = 228
                  DataBinding.DataField = 'PORCEN_REE_FACTURA'
                  DataBinding.DataSource = dsTablaG
                  ParentColor = True
                  Properties.AssignedValues.MinValue = True
                  Properties.DisplayFormat = '0.00 %'
                  Properties.EditFormat = '0.00 %'
                  Properties.MaxValue = 100.000000000000000000
                  Properties.ReadOnly = True
                  Properties.SpinButtons.Visible = False
                  Style.BorderStyle = ebsNone
                  TabOrder = 28
                  Width = 63
                end
              end
            end
            object tsRecibos: TcxTabSheet
              Caption = '&3_Recibos'
              ImageIndex = 4
              ExplicitLeft = 0
              ExplicitTop = 0
              ExplicitWidth = 0
              ExplicitHeight = 0
              object pnlRightRecibos: TPanel
                Left = 916
                Top = 0
                Width = 153
                Height = 407
                Align = alRight
                BevelOuter = bvNone
                TabOrder = 1
                object btnReciboDevuelto: TcxButton
                  Left = 27
                  Top = 77
                  Width = 98
                  Height = 25
                  Caption = '&Devuelto'
                  TabOrder = 2
                end
                object btnImprimirRecibo: TcxButton
                  Left = 3
                  Top = 113
                  Width = 146
                  Height = 25
                  Caption = 'Imprimir &Recibo'
                  TabOrder = 3
                  OnClick = btnImprimirReciboClick
                end
                object btnReciboEmitido: TcxButton
                  Left = 27
                  Top = 47
                  Width = 98
                  Height = 25
                  Caption = '&Emitido'
                  TabOrder = 1
                end
                object btnReciboPagado: TcxButton
                  Left = 27
                  Top = 17
                  Width = 98
                  Height = 25
                  Caption = '&Pagado'
                  TabOrder = 0
                  OnClick = btnReciboPagadoClick
                end
                object btnExportarRecibos: TcxButton
                  Left = 3
                  Top = 152
                  Width = 146
                  Height = 32
                  Caption = 'E&xp Excel'
                  TabOrder = 4
                  OnClick = btnExportarRecibosClick
                end
              end
              object pnlBodyRecibos: TPanel
                Left = 0
                Top = 0
                Width = 916
                Height = 407
                Align = alClient
                BevelOuter = bvNone
                TabOrder = 0
                object cxgrdRecibos: TcxGrid
                  Left = 0
                  Top = 0
                  Width = 916
                  Height = 407
                  Margins.Left = 4
                  Margins.Top = 4
                  Margins.Right = 4
                  Margins.Bottom = 4
                  Align = alClient
                  TabOrder = 0
                  object tvRecibos: TcxGridDBTableView
                    OnDblClick = cxGrdDBTabPrinDblClick
                    Navigator.Buttons.ConfirmDelete = True
                    Navigator.Buttons.CustomButtons = <>
                    Navigator.Buttons.First.Hint = 'Va al primer Registro'
                    Navigator.Buttons.First.Visible = False
                    Navigator.Buttons.PriorPage.Hint = 'Va a la p'#225'gina anterior'
                    Navigator.Buttons.PriorPage.Visible = False
                    Navigator.Buttons.Prior.Hint = 'Va al Registro Anterior'
                    Navigator.Buttons.Prior.Visible = False
                    Navigator.Buttons.Next.Hint = 'Va al siguiente Registro'
                    Navigator.Buttons.Next.Visible = False
                    Navigator.Buttons.NextPage.Hint = 'Va a la p'#225'gina siguiente'
                    Navigator.Buttons.NextPage.Visible = False
                    Navigator.Buttons.Last.Hint = 'Va al '#250'ltimo registro'
                    Navigator.Buttons.Last.Visible = False
                    Navigator.Buttons.Insert.Hint = 'Inserta un nuevo Registro'
                    Navigator.Buttons.Insert.Visible = True
                    Navigator.Buttons.Delete.Hint = 'Borra el registro Activo'
                    Navigator.Buttons.Delete.Visible = True
                    Navigator.Buttons.Edit.Enabled = False
                    Navigator.Buttons.Edit.Hint = 'Edita registro Actual'
                    Navigator.Buttons.Edit.Visible = False
                    Navigator.Buttons.Post.Hint = 'Guarda Datos introducidos'
                    Navigator.Buttons.Post.Visible = True
                    Navigator.Buttons.Cancel.Hint = 'Cancela la edici'#243'n actual'
                    Navigator.Buttons.Cancel.Visible = True
                    Navigator.Buttons.Refresh.Hint = 'Refresca Datos Activos'
                    Navigator.Buttons.SaveBookmark.Enabled = False
                    Navigator.Buttons.SaveBookmark.Hint = 'Marca Registro Actual'
                    Navigator.Buttons.SaveBookmark.Visible = False
                    Navigator.Buttons.GotoBookmark.Enabled = False
                    Navigator.Buttons.GotoBookmark.Hint = 'Va al registro Marcado'
                    Navigator.Buttons.GotoBookmark.Visible = False
                    Navigator.Buttons.Filter.Hint = 'Filtro personalizado'
                    Navigator.Visible = True
                    ScrollbarAnnotations.CustomAnnotations = <>
                    DataController.Options = [dcoCaseInsensitive, dcoAssignGroupingValues, dcoAssignMasterDetailKeys, dcoSaveExpanding]
                    DataController.Summary.DefaultGroupSummaryItems = <>
                    DataController.Summary.FooterSummaryItems = <
                      item
                        Format = '##,##.00 '#8364
                        Kind = skSum
                        Column = cxgrdbclmnRecibosEUROS_RECIBO
                      end>
                    DataController.Summary.SummaryGroups = <>
                    OptionsBehavior.AlwaysShowEditor = True
                    OptionsBehavior.GoToNextCellOnEnter = True
                    OptionsBehavior.IncSearch = True
                    OptionsCustomize.ColumnHiding = True
                    OptionsData.Appending = True
                    OptionsView.Footer = True
                    OptionsView.GroupByBox = False
                    OptionsView.Indicator = True
                    object cxgrdbclmnRecibosNRO_FACTURA_RECIBO: TcxGridDBColumn
                      Caption = 'Nro Factura Recibo'
                      DataBinding.FieldName = 'NRO_FACTURA_RECIBO'
                      DataBinding.IsNullValueType = True
                      Visible = False
                      VisibleForCustomization = False
                    end
                    object cxgrdbclmnRecibosSERIE_FACTURA_RECIBO: TcxGridDBColumn
                      Caption = 'Serie Factura Recibo'
                      DataBinding.FieldName = 'SERIE_FACTURA_RECIBO'
                      DataBinding.IsNullValueType = True
                      Visible = False
                      VisibleForCustomization = False
                    end
                    object cxgrdbclmnRecibosNRO_PLAZO_RECIBO: TcxGridDBColumn
                      Caption = 'Nro Plazo'
                      DataBinding.FieldName = 'NRO_PLAZO_RECIBO'
                      DataBinding.IsNullValueType = True
                      Width = 134
                    end
                    object cxgrdbclmnRecibosFORMA_PAGO_ORIGEN_RECIBO: TcxGridDBColumn
                      Caption = 'Forma de Pago Origen'
                      DataBinding.FieldName = 'FORMA_PAGO_ORIGEN_RECIBO'
                      DataBinding.IsNullValueType = True
                      Width = 265
                    end
                    object cxgrdbclmnRecibosFORMA_PAGO_DESCRIPCION_ORIGEN_RECIBO: TcxGridDBColumn
                      Caption = 'Forma de Pago Actual'
                      DataBinding.FieldName = 'FORMA_PAGO_DESCRIPCION_ORIGEN_RECIBO'
                      DataBinding.IsNullValueType = True
                      Width = 217
                    end
                    object cxgrdbclmnRecibosEUROS_RECIBO: TcxGridDBColumn
                      Caption = 'Total Recibo'
                      DataBinding.FieldName = 'EUROS_RECIBO'
                      DataBinding.IsNullValueType = True
                      PropertiesClassName = 'TcxCurrencyEditProperties'
                      Width = 115
                    end
                    object cxgrdbclmnRecibosESTADO_RECIBO: TcxGridDBColumn
                      Caption = 'Estado Recibo'
                      DataBinding.FieldName = 'STADO_RECIBO'
                      DataBinding.IsNullValueType = True
                      Width = 134
                    end
                    object cxgrdbclmnRecibosFECHA_EXPEDICION_RECIBO: TcxGridDBColumn
                      Caption = 'Fecha Expedici'#243'n Recibo'
                      DataBinding.FieldName = 'FECHA_EXPEDICION_RECIBO'
                      DataBinding.IsNullValueType = True
                      Width = 213
                    end
                    object cxgrdbclmnRecibosFECHA_VENCIMIENTO_RECIBO: TcxGridDBColumn
                      Caption = 'Fecha Vencimiento'
                      DataBinding.FieldName = 'FECHA_VENCIMIENTO_RECIBO'
                      DataBinding.IsNullValueType = True
                      Width = 163
                    end
                    object cxgrdbclmnRecibosIBAN_CLIENTE_RECIBO: TcxGridDBColumn
                      Caption = 'Nro Cuenta IBAN'
                      DataBinding.FieldName = 'IBAN_CLIENTE_RECIBO'
                      DataBinding.IsNullValueType = True
                      Width = 272
                    end
                    object cxgrdbclmnRecibosFECHA_PAGO_RECIBO: TcxGridDBColumn
                      Caption = 'Fecha Pago Recibo'
                      DataBinding.FieldName = 'FECHA_PAGO_RECIBO'
                      DataBinding.IsNullValueType = True
                      Width = 160
                    end
                    object cxgrdbclmnRecibosLOCALIDAD_EXPEDICION_RECIBO: TcxGridDBColumn
                      Caption = 'Localidad Expedici'#243'n'
                      DataBinding.FieldName = 'LOCALIDAD_EXPEDICION_RECIBO'
                      DataBinding.IsNullValueType = True
                      Width = 184
                    end
                    object cxgrdbclmnRecibosCODIGO_CLIENTE_RECIBO: TcxGridDBColumn
                      Caption = 'C'#243'digo Cliente'
                      DataBinding.FieldName = 'CODIGO_CLIENTE_RECIBO'
                      DataBinding.IsNullValueType = True
                      Width = 131
                    end
                    object cxgrdbclmnRecibosRAZONSOCIAL_CLIENTE_RECIBO: TcxGridDBColumn
                      Caption = 'Raz'#243'n Social Cliente'
                      DataBinding.FieldName = 'RAZONSOCIAL_CLIENTE_RECIBO'
                      DataBinding.IsNullValueType = True
                      Width = 268
                    end
                    object cxgrdbclmnRecibosDIRECCION1_CLIENTE_RECIBO: TcxGridDBColumn
                      Caption = 'Direcci'#243'n Cliente'
                      DataBinding.FieldName = 'DIRECCION1_CLIENTE_RECIBO'
                      DataBinding.IsNullValueType = True
                      Width = 256
                    end
                    object cxgrdbclmnRecibosPOBLACION_CLIENTE_RECIBO: TcxGridDBColumn
                      Caption = 'Poblaci'#243'n Cliente'
                      DataBinding.FieldName = 'POBLACION_CLIENTE_RECIBO'
                      DataBinding.IsNullValueType = True
                      Width = 246
                    end
                    object cxgrdbclmnRecibosPROVINCIA_CLIENTE_RECIBO: TcxGridDBColumn
                      Caption = 'Provincia Cliente'
                      DataBinding.FieldName = 'PROVINCIA_CLIENTE_RECIBO'
                      DataBinding.IsNullValueType = True
                      Width = 242
                    end
                    object cxgrdbclmnRecibosCPOSTAL_CLIENTE_RECIBO: TcxGridDBColumn
                      Caption = 'C'#243'digo Postal Cliente'
                      DataBinding.FieldName = 'CPOSTAL_CLIENTE_RECIBO'
                      DataBinding.IsNullValueType = True
                      Width = 186
                    end
                    object cxgrdbclmnRecibosIMPORTE_LETRA_RECIBO: TcxGridDBColumn
                      Caption = 'Importe Letra'
                      DataBinding.FieldName = 'IMPORTE_LETRA_RECIBO'
                      DataBinding.IsNullValueType = True
                      Width = 366
                    end
                  end
                  object cxgrdlvlRecibos: TcxGridLevel
                    GridView = tvRecibos
                  end
                end
              end
            end
            object tsOtros: TcxTabSheet
              Margins.Left = 4
              Margins.Top = 4
              Margins.Right = 4
              Margins.Bottom = 4
              Caption = '&4_Otros'
              ImageIndex = 4
              ExplicitLeft = 0
              ExplicitTop = 0
              ExplicitWidth = 0
              ExplicitHeight = 0
              object lblComentarios: TcxLabel
                Left = 32
                Top = 65
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                Caption = 'Comentarios'
                Transparent = True
              end
              object mmodbComentarios: TcxDBMemo
                Left = 32
                Top = 92
                DataBinding.DataField = 'COMENTARIOS_FACTURA'
                DataBinding.DataSource = dsTablaG
                Properties.ScrollBars = ssVertical
                TabOrder = 1
                Height = 149
                Width = 733
              end
            end
          end
        end
        object pnlTopFicha: TPanel
          Left = 0
          Top = 0
          Width = 1078
          Height = 317
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Align = alTop
          BevelOuter = bvNone
          ParentColor = True
          TabOrder = 0
          object pnlBodyFicha: TPanel
            Left = 0
            Top = 0
            Width = 1078
            Height = 317
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            Align = alClient
            BevelEdges = []
            BevelOuter = bvNone
            ParentColor = True
            TabOrder = 0
            object pcCab: TcxPageControl
              Left = 0
              Top = 0
              Width = 1078
              Height = 317
              Margins.Left = 4
              Margins.Top = 4
              Margins.Right = 4
              Margins.Bottom = 4
              Align = alClient
              TabOrder = 0
              Properties.ActivePage = tsCabecera
              Properties.CustomButtons.Buttons = <>
              ClientRectBottom = 311
              ClientRectLeft = 3
              ClientRectRight = 1072
              ClientRectTop = 32
              object tsCabecera: TcxTabSheet
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                Caption = '&Cabecera Factura '
                ImageIndex = 0
                object lblNroFactura: TcxLabel
                  Left = 45
                  Top = 16
                  Margins.Left = 4
                  Margins.Top = 4
                  Margins.Right = 4
                  Margins.Bottom = 4
                  Caption = 'Nro Factura'
                  Transparent = True
                end
                object lblFechaFactura: TcxLabel
                  Left = 95
                  Top = 200
                  Margins.Left = 4
                  Margins.Top = 4
                  Margins.Right = 4
                  Margins.Bottom = 4
                  Caption = 'Fecha'
                  Transparent = True
                end
                object dteFECHA_FACTURA: TcxDBDateEdit
                  Left = 155
                  Top = 196
                  Margins.Left = 4
                  Margins.Top = 4
                  Margins.Right = 4
                  Margins.Bottom = 4
                  DataBinding.DataField = 'FECHA_FACTURA'
                  DataBinding.DataSource = dsTablaG
                  Properties.DateButtons = [btnClear, btnToday]
                  Properties.OnChange = dteFECHA_FACTURAPropertiesChange
                  TabOrder = 10
                  OnKeyUp = dteFECHA_FACTURAKeyUp
                  Width = 143
                end
                object lblSerieFactura: TcxLabel
                  Left = 35
                  Top = 154
                  Margins.Left = 4
                  Margins.Top = 4
                  Margins.Right = 4
                  Margins.Bottom = 4
                  Caption = 'Serie Factura'
                  Transparent = True
                end
                object btnCODIGO_CLIENTE: TcxDBButtonEdit
                  Left = 159
                  Top = 105
                  DataBinding.DataField = 'CODIGO_CLIENTE_FACTURA'
                  DataBinding.DataSource = dsTablaG
                  Properties.Buttons = <
                    item
                      Default = True
                      Kind = bkEllipsis
                    end>
                  Properties.OnButtonClick = btnCODIGO_CLIENTEPropertiesButtonClick
                  Properties.OnChange = btnCODIGO_CLIENTEPropertiesChange
                  Properties.OnEditValueChanged = btnCODIGO_CLIENTEPropertiesEditValueChanged
                  TabOrder = 4
                  OnKeyUp = btnCODIGO_CLIENTEKeyUp
                  Width = 104
                end
                object lblCodigoCliente: TcxLabel
                  Left = 18
                  Top = 109
                  Margins.Left = 4
                  Margins.Top = 4
                  Margins.Right = 4
                  Margins.Bottom = 4
                  Caption = 'C'#243'digo Cliente'
                  Transparent = True
                end
                object lbldbRAZONSOCIAL_EMPRESA_FACTURA: TcxDBLabel
                  Left = 269
                  Top = 60
                  DataBinding.DataField = 'RAZONSOCIAL_EMPRESA_FACTURA'
                  DataBinding.DataSource = dsTablaG
                  Transparent = True
                  Height = 21
                  Width = 332
                end
                object lbldbRAZONSOCIAL_CLIENTE_FACTURA: TcxDBLabel
                  Left = 269
                  Top = 109
                  DataBinding.DataField = 'RAZONSOCIAL_CLIENTE_FACTURA'
                  DataBinding.DataSource = dsTablaG
                  ParentFont = False
                  Style.StyleController = frmOpenApp2.EditStyleController
                  Transparent = True
                  Height = 21
                  Width = 412
                end
                object btnCODIGO_EMPRESA_FACTURA: TcxDBButtonEdit
                  Left = 155
                  Top = 58
                  DataBinding.DataField = 'CODIGO_EMPRESA_FACTURA'
                  DataBinding.DataSource = dsTablaG
                  Properties.Buttons = <
                    item
                      Default = True
                      Kind = bkEllipsis
                    end>
                  Properties.OnButtonClick = btnCODIGO_EMPRESA_FACTURAPropertiesButtonClick
                  Properties.OnChange = btnCODIGO_EMPRESA_FACTURAPropertiesChange
                  Properties.OnEditValueChanged = btnCODIGO_EMPRESA_FACTURAPropertiesEditValueChanged
                  TabOrder = 2
                  Width = 104
                end
                object lblCodigoEmpresa: TcxLabel
                  Left = 7
                  Top = 62
                  Margins.Left = 4
                  Margins.Top = 4
                  Margins.Right = 4
                  Margins.Bottom = 4
                  Caption = 'C'#243'digo Empresa'
                  ParentFont = False
                  Style.StyleController = frmOpenApp2.EditStyleController
                  Transparent = True
                end
                object txtNRO_FACTURA: TcxDBTextEdit
                  Left = 155
                  Top = 12
                  DataBinding.DataField = 'NRO_FACTURA'
                  DataBinding.DataSource = dsTablaG
                  Properties.ReadOnly = True
                  TabOrder = 0
                  Width = 121
                end
                object cbbSerieFactura: TcxDBLookupComboBox
                  Left = 155
                  Top = 150
                  BeepOnEnter = False
                  DataBinding.DataField = 'SERIE_FACTURA'
                  DataBinding.DataSource = dsTablaG
                  Properties.DropDownListStyle = lsEditList
                  Properties.ImmediateDropDownWhenKeyPressed = False
                  Properties.IncrementalFiltering = False
                  Properties.KeyFieldNames = 'SERIE_CONTADOR'
                  Properties.ListColumns = <
                    item
                      Caption = 'Serie'
                      FieldName = 'SERIE_CONTADOR'
                    end>
                  Properties.ListOptions.ColumnSorting = False
                  Properties.ListOptions.ShowHeader = False
                  Properties.ReadOnly = True
                  TabOrder = 5
                  Width = 145
                end
              end
              object tsEmpresa: TcxTabSheet
                Caption = 'Datos E&mpresa Emisora -'
                Color = clBtnFace
                ImageIndex = 2
                ParentColor = False
                ExplicitLeft = 0
                ExplicitTop = 0
                ExplicitWidth = 0
                ExplicitHeight = 0
                object grpEmpresa: TcxGroupBox
                  Left = 22
                  Top = 13
                  Margins.Left = 4
                  Margins.Top = 4
                  Margins.Right = 4
                  Margins.Bottom = 4
                  Caption = 'Empresa'
                  TabOrder = 0
                  Height = 277
                  Width = 770
                  object txtDIRECCION1_EMPRESA_FACTURA: TcxDBTextEdit
                    Left = 14
                    Top = 55
                    Margins.Left = 4
                    Margins.Top = 4
                    Margins.Right = 4
                    Margins.Bottom = 4
                    DataBinding.DataField = 'DIRECCION1_EMPRESA_FACTURA'
                    DataBinding.DataSource = dsTablaG
                    TabOrder = 1
                    Width = 328
                  end
                  object txtCPOSTAL_EMPRESA_FACTURA: TcxDBTextEdit
                    Left = 13
                    Top = 115
                    Margins.Left = 4
                    Margins.Top = 4
                    Margins.Right = 4
                    Margins.Bottom = 4
                    DataBinding.DataField = 'CPOSTAL_EMPRESA_FACTURA'
                    DataBinding.DataSource = dsTablaG
                    TabOrder = 3
                    Width = 75
                  end
                  object txtPROVINCIA_EMPRESA_FACTURA: TcxDBTextEdit
                    Left = 114
                    Top = 169
                    Margins.Left = 4
                    Margins.Top = 4
                    Margins.Right = 4
                    Margins.Bottom = 4
                    DataBinding.DataField = 'PROVINCIA_EMPRESA_FACTURA'
                    DataBinding.DataSource = dsTablaG
                    TabOrder = 5
                    Width = 228
                  end
                  object txtPAIS_EMPRESA_FACTURA: TcxDBTextEdit
                    Left = 114
                    Top = 202
                    Margins.Left = 4
                    Margins.Top = 4
                    Margins.Right = 4
                    Margins.Bottom = 4
                    DataBinding.DataField = 'PAIS_EMPRESA_FACTURA'
                    DataBinding.DataSource = dsTablaG
                    TabOrder = 6
                    Width = 228
                  end
                  object txtDIRECCION2_EMPRESA_FACTURA: TcxDBTextEdit
                    Left = 14
                    Top = 79
                    Margins.Left = 4
                    Margins.Top = 4
                    Margins.Right = 4
                    Margins.Bottom = 4
                    DataBinding.DataField = 'DIRECCION2_EMPRESA_FACTURA'
                    DataBinding.DataSource = dsTablaG
                    TabOrder = 2
                    Width = 328
                  end
                  object lblProvinciaEmpresa: TcxLabel
                    Left = 23
                    Top = 173
                    Margins.Left = 4
                    Margins.Top = 4
                    Margins.Right = 4
                    Margins.Bottom = 4
                    Caption = 'Provincia'
                    Transparent = True
                  end
                  object lblPaisEmpresa: TcxLabel
                    Left = 66
                    Top = 206
                    Margins.Left = 4
                    Margins.Top = 4
                    Margins.Right = 4
                    Margins.Bottom = 4
                    Caption = 'Pa'#237's'
                    Transparent = True
                  end
                  object txtRAZONSOCIAL_EMPRESA_FACTURA: TcxDBTextEdit
                    Left = 14
                    Top = 22
                    Margins.Left = 4
                    Margins.Top = 4
                    Margins.Right = 4
                    Margins.Bottom = 4
                    DataBinding.DataField = 'RAZONSOCIAL_EMPRESA_FACTURA'
                    DataBinding.DataSource = dsTablaG
                    TabOrder = 0
                    Width = 328
                  end
                  object txtNIF_EMPRESA_FACTURA: TcxDBTextEdit
                    Left = 505
                    Top = 29
                    Margins.Left = 4
                    Margins.Top = 4
                    Margins.Right = 4
                    Margins.Bottom = 4
                    DataBinding.DataField = 'NIF_EMPRESA_FACTURA'
                    DataBinding.DataSource = dsTablaG
                    TabOrder = 7
                    Width = 247
                  end
                  object lblNIFEmpresa: TcxLabel
                    Left = 389
                    Top = 33
                    Margins.Left = 4
                    Margins.Top = 4
                    Margins.Right = 4
                    Margins.Bottom = 4
                    Caption = 'NIF Empresa'
                    ParentFont = False
                    Style.StyleController = frmOpenApp2.EditStyleController
                    Transparent = True
                  end
                  object lblMovilEmpresa: TcxLabel
                    Left = 369
                    Top = 66
                    Margins.Left = 4
                    Margins.Top = 4
                    Margins.Right = 4
                    Margins.Bottom = 4
                    Caption = 'M'#243'vil Empresa'
                    ParentFont = False
                    Style.StyleController = frmOpenApp2.EditStyleController
                    Transparent = True
                  end
                  object txtMOVIL_EMPRESA_FACTURA: TcxDBTextEdit
                    Left = 505
                    Top = 62
                    Margins.Left = 4
                    Margins.Top = 4
                    Margins.Right = 4
                    Margins.Bottom = 4
                    DataBinding.DataField = 'MOVIL_EMPRESA_FACTURA'
                    DataBinding.DataSource = dsTablaG
                    TabOrder = 8
                    Width = 247
                  end
                  object txtEMAIL_EMPRESA_FACTURA: TcxDBTextEdit
                    Left = 505
                    Top = 95
                    Margins.Left = 4
                    Margins.Top = 4
                    Margins.Right = 4
                    Margins.Bottom = 4
                    DataBinding.DataField = 'EMAIL_EMPRESA_FACTURA'
                    DataBinding.DataSource = dsTablaG
                    TabOrder = 9
                    Width = 247
                  end
                  object lblEmailEmpresa: TcxLabel
                    Left = 372
                    Top = 99
                    Margins.Left = 4
                    Margins.Top = 4
                    Margins.Right = 4
                    Margins.Bottom = 4
                    Caption = 'Email Empresa'
                    ParentFont = False
                    Style.StyleController = frmOpenApp2.EditStyleController
                    Transparent = True
                  end
                  object chkESREGIMENESPECIALAGRICOLA_EMPRESA_FACTURA: TcxDBCheckBox
                    Left = 372
                    Top = 167
                    Caption = 'Empresa es agricultor/ganadero/pesca (S'#243'lo REAGP)'
                    DataBinding.DataField = 'ESREGIMENESPECIALAGRICOLA_EMPRESA_FACTURA'
                    DataBinding.DataSource = dsTablaG
                    Properties.MultiLine = True
                    Properties.ValueChecked = 'S'
                    Properties.ValueUnchecked = 'N'
                    Properties.OnChange = chkESREGIMENESPECIALAGRICOLA_EMPRESA_FACTURAPropertiesChange
                    TabOrder = 16
                    Transparent = True
                    Width = 250
                  end
                  object chkRETENCION_EMPRESA_FACTURA: TcxDBCheckBox
                    Left = 372
                    Top = 138
                    Caption = 'Empresa practica retenci'#243'n en Factura'
                    DataBinding.DataField = 'ESRETENCIONES_EMPRESA_FACTURA'
                    DataBinding.DataSource = dsTablaG
                    Properties.ValueChecked = 'S'
                    Properties.ValueUnchecked = 'N'
                    TabOrder = 14
                    Transparent = True
                  end
                  object mPOBLACION_EMPRESA_FACTURA: TcxDBMemo
                    Left = 91
                    Top = 115
                    DataBinding.DataField = 'POBLACION_EMPRESA_FACTURA'
                    DataBinding.DataSource = dsTablaG
                    Properties.ScrollBars = ssVertical
                    TabOrder = 4
                    Height = 49
                    Width = 251
                  end
                  object cbbCanalIVA: TcxDBLookupComboBox
                    Left = 112
                    Top = 233
                    DataBinding.DataField = 'GRUPO_ZONA_IVA_EMPRESA_FACTURA'
                    DataBinding.DataSource = dsTablaG
                    Properties.KeyFieldNames = 'GRUPO_ZONA_IVA'
                    Properties.ListColumns = <
                      item
                        Caption = 'Zona de IVA'
                        FieldName = 'DESCRIPCION_ZONA_IVA'
                      end>
                    Properties.ListOptions.ShowHeader = False
                    Properties.ReadOnly = True
                    Properties.OnChange = cbbCanalIVAPropertiesChange
                    TabOrder = 18
                    Width = 363
                  end
                  object lblCanalIVA: TcxLabel
                    Left = 20
                    Top = 237
                    Margins.Left = 4
                    Margins.Top = 4
                    Margins.Right = 4
                    Margins.Bottom = 4
                    Caption = 'Canal IVA'
                    Transparent = True
                  end
                  object lbldbCODIGO_CLIENTE_FACTURA: TcxDBLabel
                    Left = 92
                    Top = -5
                    DataBinding.DataField = 'CODIGO_EMPRESA_FACTURA'
                    DataBinding.DataSource = dsTablaG
                    Transparent = True
                    Height = 21
                    Width = 94
                  end
                end
                object btnUpdateEmpresa: TcxButton
                  Left = 799
                  Top = 50
                  Width = 142
                  Height = 122
                  Caption = 'Dar de Alta o &Actualizar Empresa'
                  TabOrder = 1
                  WordWrap = True
                  OnClick = btnUpdateEmpresaClick
                end
                object btnIrAEmpresa: TcxButton
                  Left = 799
                  Top = 200
                  Width = 142
                  Height = 34
                  Caption = 'I&r a Empresa'
                  TabOrder = 2
                  OnClick = btnIrAEmpresaClick
                end
              end
              object tsDatosCliente: TcxTabSheet
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                Caption = 'Datos C&liente -'
                ImageIndex = 1
                object grpCliente: TcxGroupBox
                  Left = 22
                  Top = 13
                  Margins.Left = 4
                  Margins.Top = 4
                  Margins.Right = 4
                  Margins.Bottom = 4
                  Caption = 'Cliente'
                  TabOrder = 0
                  Height = 277
                  Width = 763
                  object txtDIRECCION1_CLIENTE_FACTURA1: TcxDBTextEdit
                    Left = 13
                    Top = 57
                    Margins.Left = 4
                    Margins.Top = 4
                    Margins.Right = 4
                    Margins.Bottom = 4
                    DataBinding.DataField = 'DIRECCION1_CLIENTE_FACTURA'
                    DataBinding.DataSource = dsTablaG
                    TabOrder = 1
                    Width = 328
                  end
                  object txtCPOSTAL_CLIENTE_FACTURA1: TcxDBTextEdit
                    Left = 13
                    Top = 115
                    Margins.Left = 4
                    Margins.Top = 4
                    Margins.Right = 4
                    Margins.Bottom = 4
                    DataBinding.DataField = 'CPOSTAL_CLIENTE_FACTURA'
                    DataBinding.DataSource = dsTablaG
                    TabOrder = 3
                    Width = 70
                  end
                  object txtPOBLACION_CLIENTE_FACTURA1: TcxDBTextEdit
                    Left = 92
                    Top = 114
                    Margins.Left = 4
                    Margins.Top = 4
                    Margins.Right = 4
                    Margins.Bottom = 4
                    DataBinding.DataField = 'POBLACION_CLIENTE_FACTURA'
                    DataBinding.DataSource = dsTablaG
                    TabOrder = 4
                    Width = 247
                  end
                  object txtPROVINCIA_CLIENTE_FACTURA1: TcxDBTextEdit
                    Left = 113
                    Top = 147
                    Margins.Left = 4
                    Margins.Top = 4
                    Margins.Right = 4
                    Margins.Bottom = 4
                    DataBinding.DataField = 'PROVINCIA_CLIENTE_FACTURA'
                    DataBinding.DataSource = dsTablaG
                    TabOrder = 5
                    Width = 228
                  end
                  object txtPAIS_CLIENTE_FACTURA1: TcxDBTextEdit
                    Left = 113
                    Top = 180
                    Margins.Left = 4
                    Margins.Top = 4
                    Margins.Right = 4
                    Margins.Bottom = 4
                    DataBinding.DataField = 'PAIS_CLIENTE_FACTURA'
                    DataBinding.DataSource = dsTablaG
                    TabOrder = 6
                    Width = 228
                  end
                  object txtDIRECCION2_CLIENTE_FACTURA1: TcxDBTextEdit
                    Left = 13
                    Top = 81
                    Margins.Left = 4
                    Margins.Top = 4
                    Margins.Right = 4
                    Margins.Bottom = 4
                    DataBinding.DataField = 'DIRECCION2_CLIENTE_FACTURA'
                    DataBinding.DataSource = dsTablaG
                    TabOrder = 2
                    Width = 328
                  end
                  object lblcxlbl6: TcxLabel
                    Left = 26
                    Top = 148
                    Margins.Left = 4
                    Margins.Top = 4
                    Margins.Right = 4
                    Margins.Bottom = 4
                    Caption = 'Provincia'
                    Transparent = True
                  end
                  object lblcxlbl13: TcxLabel
                    Left = 69
                    Top = 181
                    Margins.Left = 4
                    Margins.Top = 4
                    Margins.Right = 4
                    Margins.Bottom = 4
                    Caption = 'Pa'#237's'
                    Transparent = True
                  end
                  object txtRAZONSOCIAL_CLIENTE_FACTURA: TcxDBTextEdit
                    Left = 13
                    Top = 26
                    Margins.Left = 4
                    Margins.Top = 4
                    Margins.Right = 4
                    Margins.Bottom = 4
                    DataBinding.DataField = 'RAZONSOCIAL_CLIENTE_FACTURA'
                    DataBinding.DataSource = dsTablaG
                    TabOrder = 0
                    Width = 328
                  end
                  object txtNIF_CLIENTE_FACTURA: TcxDBTextEdit
                    Left = 464
                    Top = 26
                    Margins.Left = 4
                    Margins.Top = 4
                    Margins.Right = 4
                    Margins.Bottom = 4
                    DataBinding.DataField = 'NIF_CLIENTE_FACTURA'
                    DataBinding.DataSource = dsTablaG
                    TabOrder = 7
                    Width = 289
                  end
                  object lblNif: TcxLabel
                    Left = 425
                    Top = 27
                    Margins.Left = 4
                    Margins.Top = 4
                    Margins.Right = 4
                    Margins.Bottom = 4
                    Caption = 'NIF'
                    Transparent = True
                  end
                  object lblTelefonoMovil: TcxLabel
                    Left = 359
                    Top = 59
                    Margins.Left = 4
                    Margins.Top = 4
                    Margins.Right = 4
                    Margins.Bottom = 4
                    Caption = 'Tfno. M'#243'vil'
                    Transparent = True
                  end
                  object txtMOVIL_CLIENTE_FACTURA: TcxDBTextEdit
                    Left = 464
                    Top = 58
                    Margins.Left = 4
                    Margins.Top = 4
                    Margins.Right = 4
                    Margins.Bottom = 4
                    DataBinding.DataField = 'MOVIL_CLIENTE_FACTURA'
                    DataBinding.DataSource = dsTablaG
                    TabOrder = 8
                    Width = 289
                  end
                  object txtEMAIL_CLIENTE_FACTURA: TcxDBTextEdit
                    Left = 464
                    Top = 91
                    Margins.Left = 4
                    Margins.Top = 4
                    Margins.Right = 4
                    Margins.Bottom = 4
                    DataBinding.DataField = 'EMAIL_CLIENTE_FACTURA'
                    DataBinding.DataSource = dsTablaG
                    TabOrder = 9
                    Width = 289
                  end
                  object lblEmail: TcxLabel
                    Left = 407
                    Top = 92
                    Margins.Left = 4
                    Margins.Top = 4
                    Margins.Right = 4
                    Margins.Bottom = 4
                    Caption = 'Email'
                    Transparent = True
                  end
                  object chkESIVA_RECARGO_CLIENTE_FACTURA: TcxDBCheckBox
                    Left = 378
                    Top = 151
                    Caption = 'Aplicar Recargo de Equivalencia'
                    DataBinding.DataField = 'ESIVA_RECARGO_CLIENTE_FACTURA'
                    DataBinding.DataSource = dsTablaG
                    Properties.ValueChecked = 'S'
                    Properties.ValueUnchecked = 'N'
                    Properties.OnChange = chkESIVA_RECARGO_CLIENTE_FACTURAPropertiesChange
                    TabOrder = 16
                    Transparent = True
                  end
                  object chkREGIMENESPECIALAGRICOLA_CLIENTE_FACTURA: TcxDBCheckBox
                    Left = 378
                    Top = 177
                    Caption = 'Cliente es agricultor/ganadero/pesca'
                    DataBinding.DataField = 'ESREGIMENESPECIALAGRICOLA_CLIENTE_FACTURA'
                    DataBinding.DataSource = dsTablaG
                    Properties.ValueChecked = 'S'
                    Properties.ValueUnchecked = 'N'
                    TabOrder = 17
                    Transparent = True
                  end
                  object chkRETENCIONES_EMPRESA_FACTURA3: TcxDBCheckBox
                    Left = 378
                    Top = 124
                    Caption = 'Aplicar IRPF (Es profesional)'
                    DataBinding.DataField = 'ESRETENCIONES_CLIENTE_FACTURA'
                    DataBinding.DataSource = dsTablaG
                    Properties.ValueChecked = 'S'
                    Properties.ValueUnchecked = 'N'
                    TabOrder = 15
                    Transparent = True
                  end
                  object chkEXTRANJERO: TcxDBCheckBox
                    Left = 13
                    Top = 217
                    Caption = 'IVA Exento'
                    DataBinding.DataField = 'ESIVA_EXENTO_CLIENTE_FACTURA'
                    DataBinding.DataSource = dsTablaG
                    Properties.DisplayUnchecked = 'True'
                    Properties.DisplayGrayed = 'False'
                    Properties.ValueChecked = 'S'
                    Properties.ValueUnchecked = 'N'
                    TabOrder = 18
                    Transparent = True
                  end
                  object cbbTARIFA_ARTICULOS_CLIENTES: TcxDBLookupComboBox
                    Left = 548
                    Top = 211
                    Margins.Left = 4
                    Margins.Top = 4
                    Margins.Right = 4
                    Margins.Bottom = 4
                    DataBinding.DataField = 'TARIFA_ARTICULO_CLIENTE_FACTURA'
                    DataBinding.DataSource = dsTablaG
                    Properties.KeyFieldNames = 'CODIGO_TARIFA'
                    Properties.ListColumns = <
                      item
                        FieldName = 'NOMBRE_TARIFA'
                      end>
                    Properties.ListOptions.ShowHeader = False
                    Properties.ReadOnly = True
                    TabOrder = 21
                    OnKeyUp = cbbSerieFacturaKeyUp
                    Width = 205
                  end
                  object lblTarifaArticulosCliente: TcxLabel
                    Left = 407
                    Top = 215
                    Margins.Left = 4
                    Margins.Top = 4
                    Margins.Right = 4
                    Margins.Bottom = 4
                    Caption = 'Tarifa Art'#237'culos'
                    Style.BorderStyle = ebsNone
                    Transparent = True
                  end
                  object chkIVA_EXENTO_CLIENTE_FACTURA: TcxDBCheckBox
                    Left = 132
                    Top = 217
                    Caption = 'Cliente intracomunitario'
                    DataBinding.DataField = 'ESINTRACOMUNITARIO_CLIENTE_FACTURA'
                    DataBinding.DataSource = dsTablaG
                    Properties.DisplayUnchecked = 'True'
                    Properties.DisplayGrayed = 'False'
                    Properties.ValueChecked = 'S'
                    Properties.ValueUnchecked = 'N'
                    TabOrder = 19
                    Transparent = True
                  end
                  object lbldbCODIGO_CLIENTE: TcxDBLabel
                    Left = 81
                    Top = -4
                    DataBinding.DataField = 'CODIGO_CLIENTE_FACTURA'
                    DataBinding.DataSource = dsTablaG
                    Transparent = True
                    Height = 21
                    Width = 94
                  end
                  object cxDBCheckBox1: TcxDBCheckBox
                    Left = 524
                    Top = 242
                    Caption = 'Tarifa con Imp Incl'
                    DataBinding.DataField = 'ESIMP_INCL_TARIFA_CLIENTE_FACTURA'
                    DataBinding.DataSource = dsTablaG
                    Properties.DisplayUnchecked = 'True'
                    Properties.DisplayGrayed = 'False'
                    Properties.ReadOnly = True
                    Properties.ValueChecked = 'S'
                    Properties.ValueUnchecked = 'N'
                    Style.TransparentBorder = False
                    TabOrder = 23
                    Transparent = True
                  end
                end
                object btnUpdateCliente: TcxButton
                  Left = 799
                  Top = 50
                  Width = 142
                  Height = 122
                  Caption = 'Dar de Alta o &Actualizar Cliente'
                  TabOrder = 1
                  WordWrap = True
                  OnClick = btnUpdateClienteClick
                end
                object btnIrACliente: TcxButton
                  Left = 799
                  Top = 200
                  Width = 142
                  Height = 34
                  Caption = 'I&r a Cliente'
                  TabOrder = 2
                  OnClick = btnIrAClienteClick
                end
              end
            end
          end
        end
        object splSplitterFicha: TcxSplitter
          Left = 0
          Top = 317
          Width = 1078
          Height = 4
          Cursor = crSizeNS
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          HotZoneClassName = 'TcxMediaPlayer9Style'
          HotZone.SizePercent = 50
          AlignSplitter = salTop
          Control = pnl1
          ExplicitWidth = 4
        end
      end
      inherited tsPerfil: TcxTabSheet
        ExplicitWidth = 1078
        ExplicitHeight = 766
        inherited pnlPerfilTop: TPanel
          Width = 1078
          ExplicitWidth = 1078
          inherited edtPerfilBusq: TcxTextEdit
            ExplicitHeight = 27
          end
        end
        inherited pnlPerfilDetail: TPanel
          Width = 1078
          Height = 709
          ExplicitWidth = 1078
          ExplicitHeight = 709
          inherited cxgrdPerfil: TcxGrid
            Width = 1078
            Height = 709
            ExplicitWidth = 1078
            ExplicitHeight = 709
            inherited tvPerfil: TcxGridDBTableView
              inherited tvPerfilUSUARIO_GRUPO_PERFILES: TcxGridDBColumn
                DataBinding.IsNullValueType = True
              end
              inherited tvPerfilKEY_PERFILES: TcxGridDBColumn
                DataBinding.IsNullValueType = True
              end
              inherited tvPerfilSUBKEY_PERFILES: TcxGridDBColumn
                DataBinding.IsNullValueType = True
              end
              inherited tvPerfilVALUE_PERFILES: TcxGridDBColumn
                DataBinding.IsNullValueType = True
              end
              inherited tvPerfilVALUE_TEXT_PERFILES: TcxGridDBColumn
                DataBinding.IsNullValueType = True
              end
              inherited tvPerfilTYPE_BLOB_PERFILES: TcxGridDBColumn
                DataBinding.IsNullValueType = True
              end
              inherited tvPerfilVALUE_BLOB_PERFILES: TcxGridDBColumn
                DataBinding.IsNullValueType = True
              end
            end
          end
        end
      end
    end
    inherited pnlTopPage: TPanel
      Width = 1087
      TabOrder = 0
      ExplicitWidth = 1087
      inherited pnlTopGrid: TPanel
        Width = 1087
        ExplicitWidth = 1087
        inherited edtBusqGlobal: TcxTextEdit
          ExplicitHeight = 27
        end
        inherited lblTextoaBuscar: TcxLabel
          Top = 7
          ExplicitTop = 7
        end
      end
    end
  end
  inherited pButtonRightBar: TPanel
    Left = 1087
    Width = 144
    Height = 844
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    TabOrder = 1
    ExplicitLeft = 1087
    ExplicitWidth = 144
    ExplicitHeight = 844
    inherited pButtonGen: TPanel
      Top = 646
      Width = 144
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Constraints.MinHeight = 100
      Constraints.MinWidth = 124
      ExplicitTop = 646
      ExplicitWidth = 144
      inherited btnGrabar: TcxButton
        Width = 140
        OnClick = sbGrabarClick
        ExplicitWidth = 140
      end
      inherited btnCancelar: TcxButton
        Width = 140
        ExplicitWidth = 140
      end
    end
    inherited pButtonBDStat: TPanel
      Width = 144
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Constraints.MinHeight = 46
      Constraints.MinWidth = 124
      ExplicitWidth = 144
      inherited pnStateDataSet: TPanel
        Width = 144
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        ExplicitWidth = 144
        inherited lblEditMode: TcxLabel
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
        end
      end
      inherited pnlDataSetName: TPanel
        Width = 144
        ExplicitWidth = 144
      end
    end
    object btnNuevaFactura: TcxButton
      Left = 1
      Top = 229
      Width = 140
      Height = 34
      Caption = '&Nueva Factura'
      TabOrder = 2
      OnClick = sbNuevaFacturaClick
    end
    object btnRectificar: TcxButton
      Left = 1
      Top = 271
      Width = 140
      Height = 34
      Caption = '&Dupl. '#243' Abonar'
      TabOrder = 3
      OnClick = sbRectificarClick
    end
    object btnImprimir: TcxButton
      Left = 1
      Top = 313
      Width = 140
      Height = 34
      Caption = '&Imprimir'
      TabOrder = 4
      OnClick = sbImprimirClick
    end
  end
  inherited Localizer1: TcxLocalizer
    Left = 976
    Top = 395
  end
  inherited dsTablaG: TDataSource
    Left = 1092
    Top = 407
  end
  object ActionListFacturas: TActionList [5]
    Left = 1040
    Top = 392
    object actArticulo: TAction
      Caption = 'actArticulo'
      ShortCut = 16449
      OnExecute = actArticuloExecute
    end
    object actEmpresa: TAction
      Caption = 'actEmpresa'
      ShortCut = 16453
      OnExecute = actEmpresaExecute
    end
    object actCliente: TAction
      Caption = 'actCliente'
      ShortCut = 16459
      OnExecute = actClienteExecute
    end
  end
  inherited saveDialog: TdxSaveFileDialog
    Left = 696
    Top = 256
  end
end
