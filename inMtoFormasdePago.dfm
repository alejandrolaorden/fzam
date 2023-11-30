inherited frmMtoFormasdePago: TfrmMtoFormasdePago
  Left = 5
  Top = 4
  Caption = 'Formas de pago'
  ClientHeight = 674
  ClientWidth = 894
  ExplicitWidth = 894
  ExplicitHeight = 674
  PixelsPerInch = 96
  TextHeight = 19
  inherited pButtonPage: TPanel
    Width = 754
    Height = 674
    TabOrder = 0
    ExplicitWidth = 754
    ExplicitHeight = 674
    inherited pcPantalla: TcxPageControl
      Width = 754
      Height = 634
      TabOrder = 1
      ExplicitWidth = 754
      ExplicitHeight = 634
      ClientRectBottom = 628
      ClientRectRight = 748
      inherited tsLista: TcxTabSheet
        ExplicitLeft = 3
        ExplicitTop = 32
        ExplicitWidth = 745
        ExplicitHeight = 596
        inherited cxGrdPrincipal: TcxGrid
          Width = 745
          Height = 596
          ExplicitWidth = 745
          ExplicitHeight = 596
          inherited cxGrdDBTabPrin: TcxGridDBTableView
            object cxGrdDBTabPrinCODIGO_FORMAPAGO: TcxGridDBColumn
              Caption = 'C'#243'digo'
              DataBinding.FieldName = 'CODIGO_FORMAPAGO'
              Width = 196
            end
            object cxGrdDBTabPrinACTIVO_FORMAPAGO: TcxGridDBColumn
              Caption = 'Activo'
              DataBinding.FieldName = 'ACTIVO_FORMAPAGO'
              PropertiesClassName = 'TcxCheckBoxProperties'
              Properties.ValueChecked = 'S'
              Properties.ValueUnchecked = 'N'
              Width = 91
            end
            object cxGrdDBTabPrinORDEN_FORMAPAGO: TcxGridDBColumn
              Caption = 'Orden'
              DataBinding.FieldName = 'ORDEN_FORMAPAGO'
              Width = 120
            end
            object cxGrdDBTabPrinDESCRIPCION_FORMAPAGO: TcxGridDBColumn
              Caption = 'Descripci'#243'n'
              DataBinding.FieldName = 'DESCRIPCION_FORMAPAGO'
              Width = 231
            end
            object cxGrdDBTabPrinN_PLAZOS_FORMAPAGO: TcxGridDBColumn
              Caption = 'N'#250'mero de Plazos'
              DataBinding.FieldName = 'N_PLAZOS_FORMAPAGO'
              Width = 169
            end
            object cxGrdDBTabPrinDIAS_ENTRE_PLAZOS_FORMAPAGO: TcxGridDBColumn
              Caption = 'D'#237'as entre plazos'
              DataBinding.FieldName = 'N_DIAS_ENTRE_PLAZOS_FORMAPAGO'
              Width = 165
            end
            object cxGrdDBTabPrinDEFAULT_FORMAPAGO: TcxGridDBColumn
              Caption = 'Por defecto'
              DataBinding.FieldName = 'ESDEFAULT_FORMAPAGO'
              Width = 159
            end
            object cxGrdDBTabPrinPORCEN_ANTICIPO_FORMAPAGO: TcxGridDBColumn
              Caption = '% Anticipo'
              DataBinding.FieldName = 'PORCEN_ANTICIPO_FORMAPAGO'
              PropertiesClassName = 'TcxSpinEditProperties'
              Properties.DisplayFormat = '0.00 %'
              Properties.EditFormat = '0.00 %'
              Properties.MaxValue = 100.000000000000000000
              Properties.ValueType = vtFloat
              Width = 92
            end
          end
        end
      end
      inherited tsFicha: TcxTabSheet
        ExplicitWidth = 745
        ExplicitHeight = 596
        object pnl1: TPanel
          Left = 0
          Top = 0
          Width = 745
          Height = 113
          Align = alTop
          TabOrder = 0
          object cxdbtxtdt1: TcxDBTextEdit
            Left = 104
            Top = 33
            DataBinding.DataField = 'CODIGO'
            DataBinding.DataSource = dsTablaG
            Enabled = False
            TabOrder = 1
            Width = 121
          end
          object cxdbtxtdt2: TcxDBTextEdit
            Left = 104
            Top = 61
            DataBinding.DataField = 'DESCRIPCION'
            DataBinding.DataSource = dsTablaG
            TabOrder = 2
            Width = 241
          end
          object cxdbtxtdt15: TcxDBTextEdit
            Left = 856
            Top = 89
            DataBinding.DataField = 'modificado'
            DataBinding.DataSource = dsTablaG
            TabOrder = 3
            Width = 57
          end
          object Panel1: TPanel
            Left = 1
            Top = 1
            Width = 743
            Height = 111
            Align = alClient
            TabOrder = 0
            object txtCODIGO_FORMAPAGO: TcxDBTextEdit
              Left = 101
              Top = 13
              DataBinding.DataField = 'CODIGO_FORMAPAGO'
              DataBinding.DataSource = dsTablaG
              Properties.ReadOnly = False
              TabOrder = 0
              Width = 156
            end
            object lblCodigo: TcxLabel
              Left = 21
              Top = 17
              Caption = 'C'#243'digo'
              Transparent = True
            end
            object lblNombre: TcxLabel
              Left = 18
              Top = 51
              Caption = 'Nombre'
              Transparent = True
            end
            object txtNOMBRE_FORMAPAGO: TcxDBTextEdit
              Left = 100
              Top = 48
              DataBinding.DataField = 'DESCRIPCION_FORMAPAGO'
              DataBinding.DataSource = dsTablaG
              TabOrder = 3
              Width = 429
            end
            object chkActivo: TcxDBCheckBox
              Left = 79
              Top = 78
              Caption = 'Activo'
              DataBinding.DataField = 'ACTIVO_FORMAPAGO'
              DataBinding.DataSource = dsTablaG
              Properties.ValueChecked = 'S'
              Properties.ValueUnchecked = 'N'
              TabOrder = 4
              Transparent = True
            end
          end
        end
        object pnl2: TPanel
          Left = 0
          Top = 117
          Width = 745
          Height = 479
          Align = alClient
          TabOrder = 1
          object pcPestana: TcxPageControl
            Left = 1
            Top = 1
            Width = 743
            Height = 477
            Align = alClient
            TabOrder = 0
            Properties.ActivePage = tsVentas
            Properties.CustomButtons.Buttons = <>
            ClientRectBottom = 471
            ClientRectLeft = 3
            ClientRectRight = 737
            ClientRectTop = 32
            object tsMasDatos: TcxTabSheet
              Caption = '&1_M'#225's Datos-'
              ImageIndex = 0
              object cxLabel1: TcxLabel
                Left = 28
                Top = 32
                Caption = 'N'#250'mero de plazos'
                Transparent = True
              end
              object cxDBSpinEdit1: TcxDBSpinEdit
                Left = 191
                Top = 31
                DataBinding.DataField = 'N_PLAZOS_FORMAPAGO'
                DataBinding.DataSource = dsTablaG
                TabOrder = 1
                Width = 106
              end
              object cxLabel2: TcxLabel
                Left = 28
                Top = 88
                Caption = 'D'#237'as entre plazos'
                Transparent = True
              end
              object cxDBSpinEdit2: TcxDBSpinEdit
                Left = 191
                Top = 87
                DataBinding.DataField = 'N_DIAS_ENTRE_PLAZOS_FORMAPAGO'
                DataBinding.DataSource = dsTablaG
                TabOrder = 3
                Width = 106
              end
              object cxLabel3: TcxLabel
                Left = 79
                Top = 135
                Caption = '% Adelanto'
                Transparent = True
              end
              object cxDBSpinEdit3: TcxDBSpinEdit
                Left = 191
                Top = 135
                DataBinding.DataField = 'PORCEN_ANTICIPO_FORMAPAGO'
                DataBinding.DataSource = dsTablaG
                Properties.AssignedValues.MinValue = True
                Properties.DisplayFormat = '0.00 %'
                Properties.EditFormat = '0.00 %'
                Properties.MaxValue = 100.000000000000000000
                TabOrder = 5
                Width = 106
              end
            end
            object tsVentas: TcxTabSheet
              Caption = '&2_Ventas-'
              ImageIndex = 2
              object pnlFactura: TPanel
                Left = 0
                Top = 0
                Width = 734
                Height = 439
                Align = alClient
                TabOrder = 0
                object cxgrdFacturas: TcxGrid
                  Left = 1
                  Top = 1
                  Width = 615
                  Height = 437
                  Margins.Left = 4
                  Margins.Top = 4
                  Margins.Right = 4
                  Margins.Bottom = 4
                  Align = alClient
                  TabOrder = 0
                  object tvFacturacion: TcxGridDBTableView
                    Navigator.Buttons.ConfirmDelete = True
                    Navigator.Buttons.CustomButtons = <>
                    Navigator.Visible = True
                    ScrollbarAnnotations.CustomAnnotations = <>
                    DataController.DataModeController.SmartRefresh = True
                    DataController.Summary.DefaultGroupSummaryItems = <
                      item
                        Kind = skSum
                        Column = tvFacturacionTOTAL_LIQUIDO_FACTURA
                      end
                      item
                        Format = '0,00 '#8364';-0,00 '#8364
                        Position = spFooter
                        Column = tvFacturacionTOTAL_LIQUIDO_FACTURA
                      end>
                    DataController.Summary.FooterSummaryItems = <
                      item
                        Format = '0.00 '#8364';-0.00 '#8364
                        Kind = skSum
                        Column = tvFacturacionTOTAL_LIQUIDO_FACTURA
                      end
                      item
                        Format = '0.00 '#8364';-0.00 '#8364
                        Kind = skSum
                        Column = tvFacturacionTOTAL_BASES_FACTURA
                      end
                      item
                        Format = '0.00 '#8364';-0.00 '#8364
                        Kind = skSum
                        Column = tvFacturacionTOTAL_RETENCION_FACTURA
                      end
                      item
                        Format = '0.00 '#8364';-0.00 '#8364
                        Kind = skSum
                        Column = tvFacturacionTOTAL_IMPUESTOS_FACTURA
                      end>
                    DataController.Summary.SummaryGroups = <>
                    OptionsBehavior.GoToNextCellOnEnter = True
                    OptionsCustomize.ColumnGrouping = False
                    OptionsData.Deleting = False
                    OptionsData.Editing = False
                    OptionsData.Inserting = False
                    OptionsSelection.InvertSelect = False
                    OptionsView.NoDataToDisplayInfoText = '<No hay datos a mostrar>'
                    OptionsView.Footer = True
                    OptionsView.GroupByBox = False
                    OptionsView.GroupFooters = gfAlwaysVisible
                    object tvFacturacionFECHA_FACTURA: TcxGridDBColumn
                      DataBinding.FieldName = 'FECHA_FACTURA'
                    end
                    object tvFacturacionNRO_FACTURA: TcxGridDBColumn
                      DataBinding.FieldName = 'NRO_FACTURA'
                    end
                    object tvFacturacionSERIE_FACTURA: TcxGridDBColumn
                      DataBinding.FieldName = 'SERIE_FACTURA'
                    end
                    object tvFacturacionTOTAL_BASES_FACTURA: TcxGridDBColumn
                      DataBinding.FieldName = 'TOTAL_BASES_FACTURA'
                    end
                    object tvFacturacionPORCEN_RETENCION_FACTURA: TcxGridDBColumn
                      DataBinding.FieldName = 'PORCEN_RETENCION_FACTURA'
                    end
                    object tvFacturacionTOTAL_RETENCION_FACTURA: TcxGridDBColumn
                      DataBinding.FieldName = 'TOTAL_RETENCION_FACTURA'
                    end
                    object tvFacturacionTOTAL_IMPUESTOS_FACTURA: TcxGridDBColumn
                      DataBinding.FieldName = 'TOTAL_IMPUESTOS_FACTURA'
                    end
                    object tvFacturacionTOTAL_LIQUIDO_FACTURA: TcxGridDBColumn
                      DataBinding.FieldName = 'TOTAL_LIQUIDO_FACTURA'
                    end
                    object tvFacturacionFORMA_PAGO_FACTURA: TcxGridDBColumn
                      DataBinding.FieldName = 'FORMA_PAGO_FACTURA'
                    end
                    object tvFacturacionCODIGO_CLIENTE_FACTURA: TcxGridDBColumn
                      DataBinding.FieldName = 'CODIGO_CLIENTE_FACTURA'
                    end
                    object tvFacturacionRAZONSOCIAL_CLIENTE_FACTURA: TcxGridDBColumn
                      DataBinding.FieldName = 'RAZONSOCIAL_CLIENTE_FACTURA'
                    end
                    object tvFacturacionNIF_CLIENTE_FACTURA: TcxGridDBColumn
                      DataBinding.FieldName = 'NIF_CLIENTE_FACTURA'
                    end
                    object tvFacturacionMOVIL_CLIENTE_FACTURA: TcxGridDBColumn
                      DataBinding.FieldName = 'MOVIL_CLIENTE_FACTURA'
                    end
                    object tvFacturacionEMAIL_CLIENTE_FACTURA: TcxGridDBColumn
                      DataBinding.FieldName = 'EMAIL_CLIENTE_FACTURA'
                    end
                    object tvFacturacionDIRECCION1_CLIENTE_FACTURA: TcxGridDBColumn
                      DataBinding.FieldName = 'DIRECCION1_CLIENTE_FACTURA'
                    end
                    object tvFacturacionDIRECCION2_CLIENTE_FACTURA: TcxGridDBColumn
                      DataBinding.FieldName = 'DIRECCION2_CLIENTE_FACTURA'
                    end
                    object tvFacturacionPOBLACION_CLIENTE_FACTURA: TcxGridDBColumn
                      DataBinding.FieldName = 'POBLACION_CLIENTE_FACTURA'
                    end
                    object tvFacturacionPROVINCIA_CLIENTE_FACTURA: TcxGridDBColumn
                      DataBinding.FieldName = 'PROVINCIA_CLIENTE_FACTURA'
                    end
                    object tvFacturacionCPOSTAL_CLIENTE_FACTURA: TcxGridDBColumn
                      DataBinding.FieldName = 'CPOSTAL_CLIENTE_FACTURA'
                    end
                    object tvFacturacionPAIS_CLIENTE_FACTURA: TcxGridDBColumn
                      DataBinding.FieldName = 'PAIS_CLIENTE_FACTURA'
                    end
                    object tvFacturacionESIVA_RECARGO_CLIENTE_FACTURA: TcxGridDBColumn
                      DataBinding.FieldName = 'ESIVA_RECARGO_CLIENTE_FACTURA'
                    end
                    object tvFacturacionESIVA_EXENTO_CLIENTE_FACTURA: TcxGridDBColumn
                      DataBinding.FieldName = 'ESIVA_EXENTO_CLIENTE_FACTURA'
                    end
                    object tvFacturacionESREGIMENESPECIALAGRICOLA_CLIENTE_FACTURA: TcxGridDBColumn
                      DataBinding.FieldName = 'ESREGIMENESPECIALAGRICOLA_CLIENTE_FACTURA'
                    end
                    object tvFacturacionESRETENCIONES_CLIENTE_FACTURA: TcxGridDBColumn
                      DataBinding.FieldName = 'ESRETENCIONES_CLIENTE_FACTURA'
                    end
                    object tvFacturacionNOMBRE_TARIFA_CLIENTE: TcxGridDBColumn
                      DataBinding.FieldName = 'NOMBRE_TARIFA_CLIENTE'
                    end
                    object tvFacturacionESIMP_INCL_TARIFA_CLIENTE_FACTURA: TcxGridDBColumn
                      DataBinding.FieldName = 'ESIMP_INCL_TARIFA_CLIENTE_FACTURA'
                    end
                    object tvFacturacionESINTRACOMUNITARIO_CLIENTE_FACTURA: TcxGridDBColumn
                      DataBinding.FieldName = 'ESINTRACOMUNITARIO_CLIENTE_FACTURA'
                    end
                    object tvFacturacionESIRPF_IMP_INCL_ZONA_IVA_FACTURA: TcxGridDBColumn
                      DataBinding.FieldName = 'ESIRPF_IMP_INCL_ZONA_IVA_FACTURA'
                    end
                    object tvFacturacionESAPLICA_RE_ZONA_IVA_FACTURA: TcxGridDBColumn
                      DataBinding.FieldName = 'ESAPLICA_RE_ZONA_IVA_FACTURA'
                    end
                    object tvFacturacionESIVAAGRICOLA_ZONA_IVA_FACTURA: TcxGridDBColumn
                      DataBinding.FieldName = 'ESIVAAGRICOLA_ZONA_IVA_FACTURA'
                    end
                    object tvFacturacionPALABRA_REPORTS_ZONA_IVA_FACTURA: TcxGridDBColumn
                      DataBinding.FieldName = 'PALABRA_REPORTS_ZONA_IVA_FACTURA'
                    end
                    object tvFacturacionDESCRIPCION_ZONA_IVA: TcxGridDBColumn
                      DataBinding.FieldName = 'DESCRIPCION_ZONA_IVA'
                    end
                    object tvFacturacionESVENTA_ACTIVO_FIJO_FACTURA: TcxGridDBColumn
                      DataBinding.FieldName = 'ESVENTA_ACTIVO_FIJO_FACTURA'
                    end
                    object tvFacturacionPORCEN_IVAN_FACTURA: TcxGridDBColumn
                      DataBinding.FieldName = 'PORCEN_IVAN_FACTURA'
                    end
                    object tvFacturacionTOTAL_IVAN_FACTURA: TcxGridDBColumn
                      DataBinding.FieldName = 'TOTAL_IVAN_FACTURA'
                    end
                    object tvFacturacionPORCEN_REN_FACTURA: TcxGridDBColumn
                      DataBinding.FieldName = 'PORCEN_REN_FACTURA'
                    end
                    object tvFacturacionTOTAL_REN_FACTURA: TcxGridDBColumn
                      DataBinding.FieldName = 'TOTAL_REN_FACTURA'
                    end
                    object tvFacturacionTOTAL_BASEI_IVAN_FACTURA: TcxGridDBColumn
                      DataBinding.FieldName = 'TOTAL_BASEI_IVAN_FACTURA'
                    end
                    object tvFacturacionPORCEN_IVAR_FACTURA: TcxGridDBColumn
                      DataBinding.FieldName = 'PORCEN_IVAR_FACTURA'
                    end
                    object tvFacturacionTOTAL_IVAR_FACTURA: TcxGridDBColumn
                      DataBinding.FieldName = 'TOTAL_IVAR_FACTURA'
                    end
                    object tvFacturacionPORCEN_RER_FACTURA: TcxGridDBColumn
                      DataBinding.FieldName = 'PORCEN_RER_FACTURA'
                    end
                    object tvFacturacionTOTAL_RER_FACTURA: TcxGridDBColumn
                      DataBinding.FieldName = 'TOTAL_RER_FACTURA'
                    end
                    object tvFacturacionTOTAL_BASEI_IVAR_FACTURA: TcxGridDBColumn
                      DataBinding.FieldName = 'TOTAL_BASEI_IVAR_FACTURA'
                    end
                    object tvFacturacionPORCEN_IVAS_FACTURA: TcxGridDBColumn
                      DataBinding.FieldName = 'PORCEN_IVAS_FACTURA'
                    end
                    object tvFacturacionTOTAL_IVAS_FACTURA: TcxGridDBColumn
                      DataBinding.FieldName = 'TOTAL_IVAS_FACTURA'
                    end
                    object tvFacturacionPORCEN_RES_FACTURA: TcxGridDBColumn
                      DataBinding.FieldName = 'PORCEN_RES_FACTURA'
                    end
                    object tvFacturacionTOTAL_RES_FACTURA: TcxGridDBColumn
                      DataBinding.FieldName = 'TOTAL_RES_FACTURA'
                    end
                    object tvFacturacionTOTAL_BASEI_IVAS_FACTURA: TcxGridDBColumn
                      DataBinding.FieldName = 'TOTAL_BASEI_IVAS_FACTURA'
                    end
                    object tvFacturacionPORCEN_IVAE_FACTURA: TcxGridDBColumn
                      DataBinding.FieldName = 'PORCEN_IVAE_FACTURA'
                    end
                    object tvFacturacionTOTAL_IVAE_FACTURA: TcxGridDBColumn
                      DataBinding.FieldName = 'TOTAL_IVAE_FACTURA'
                    end
                    object tvFacturacionPORCEN_REE_FACTURA: TcxGridDBColumn
                      DataBinding.FieldName = 'PORCEN_REE_FACTURA'
                    end
                    object tvFacturacionTOTAL_REE_FACTURA: TcxGridDBColumn
                      DataBinding.FieldName = 'TOTAL_REE_FACTURA'
                    end
                    object tvFacturacionTOTAL_BASEI_IVAE_FACTURA: TcxGridDBColumn
                      DataBinding.FieldName = 'TOTAL_BASEI_IVAE_FACTURA'
                    end
                    object tvFacturacionCODIGO_EMPRESA_FACTURA: TcxGridDBColumn
                      DataBinding.FieldName = 'CODIGO_EMPRESA_FACTURA'
                    end
                    object tvFacturacionRAZONSOCIAL_EMPRESA_FACTURA: TcxGridDBColumn
                      DataBinding.FieldName = 'RAZONSOCIAL_EMPRESA_FACTURA'
                    end
                    object tvFacturacionNIF_EMPRESA_FACTURA: TcxGridDBColumn
                      DataBinding.FieldName = 'NIF_EMPRESA_FACTURA'
                    end
                    object tvFacturacionMOVIL_EMPRESA_FACTURA: TcxGridDBColumn
                      DataBinding.FieldName = 'MOVIL_EMPRESA_FACTURA'
                    end
                    object tvFacturacionEMAIL_EMPRESA_FACTURA: TcxGridDBColumn
                      DataBinding.FieldName = 'EMAIL_EMPRESA_FACTURA'
                    end
                    object tvFacturacionDIRECCION1_EMPRESA_FACTURA: TcxGridDBColumn
                      DataBinding.FieldName = 'DIRECCION1_EMPRESA_FACTURA'
                    end
                    object tvFacturacionDIRECCION2_EMPRESA_FACTURA: TcxGridDBColumn
                      DataBinding.FieldName = 'DIRECCION2_EMPRESA_FACTURA'
                    end
                    object tvFacturacionPOBLACION_EMPRESA_FACTURA: TcxGridDBColumn
                      DataBinding.FieldName = 'POBLACION_EMPRESA_FACTURA'
                    end
                    object tvFacturacionPROVINCIA_EMPRESA_FACTURA: TcxGridDBColumn
                      DataBinding.FieldName = 'PROVINCIA_EMPRESA_FACTURA'
                    end
                    object tvFacturacionPAIS_EMPRESA_FACTURA: TcxGridDBColumn
                      DataBinding.FieldName = 'PAIS_EMPRESA_FACTURA'
                    end
                    object tvFacturacionCPOSTAL_EMPRESA_FACTURA: TcxGridDBColumn
                      DataBinding.FieldName = 'CPOSTAL_EMPRESA_FACTURA'
                    end
                    object tvFacturacionESRETENCIONES_EMPRESA_FACTURA: TcxGridDBColumn
                      DataBinding.FieldName = 'ESRETENCIONES_EMPRESA_FACTURA'
                    end
                    object tvFacturacionDESCRIPCION_ZONA_IVA_EMPRESA_FACTURA: TcxGridDBColumn
                      DataBinding.FieldName = 'DESCRIPCION_ZONA_IVA_EMPRESA_FACTURA'
                    end
                    object tvFacturacionESREGIMENESPECIALAGRICOLA_EMPRESA_FACTURA: TcxGridDBColumn
                      DataBinding.FieldName = 'ESREGIMENESPECIALAGRICOLA_EMPRESA_FACTURA'
                    end
                  end
                  object tvLineasFacturacion: TcxGridDBTableView
                    Navigator.Buttons.CustomButtons = <>
                    ScrollbarAnnotations.CustomAnnotations = <>
                    DataController.DetailKeyFieldNames = 'NRO_FACTURA_LINEA; SERIE_FACTURA_LINEA'
                    DataController.KeyFieldNames = 'LINEA_FACTURA_LINEA'
                    DataController.MasterKeyFieldNames = 'NRO_FACTURA; SERIE_FACTURA'
                    DataController.Summary.DefaultGroupSummaryItems = <>
                    DataController.Summary.FooterSummaryItems = <>
                    DataController.Summary.SummaryGroups = <>
                    OptionsBehavior.ColumnHeaderHints = False
                    OptionsCustomize.ColumnFiltering = False
                    OptionsCustomize.ColumnGrouping = False
                    OptionsCustomize.ColumnMoving = False
                    OptionsCustomize.ColumnsQuickCustomizationShowCommands = False
                    OptionsData.Deleting = False
                    OptionsData.Editing = False
                    OptionsData.Inserting = False
                    OptionsView.GroupByBox = False
                    object cxgrdbclmncxgrdbtblvwcxgrd1DBTableView1LINEA_LINEA: TcxGridDBColumn
                      Caption = 'Nro Linea'
                      DataBinding.FieldName = 'LINEA_FACTURA_LINEA'
                      Width = 28
                    end
                    object cxgrdbclmncxgrdbtblvwcxgrd1DBTableView1CODIGO_ARTICULO_LINEA: TcxGridDBColumn
                      Caption = 'C'#243'digo Art'#237'culo'
                      DataBinding.FieldName = 'CODIGO_ARTICULO_FACTURA_LINEA'
                      Width = 164
                    end
                    object cxgrdbclmncxgrdbtblvwcxgrd1DBTableView1DESCRIPCION_ARTICULO_LINEA: TcxGridDBColumn
                      Caption = 'Descripci'#243'n'
                      DataBinding.FieldName = 'DESCRIPCION_ARTICULO_FACTURA_LINEA'
                      Width = 162
                    end
                    object cxgrdbclmncxgrdbtblvwcxgrd1DBTableView1CANTIDAD_LINEA: TcxGridDBColumn
                      Caption = 'Cantidad'
                      DataBinding.FieldName = 'CANTIDAD_FACTURA_LINEA'
                      Width = 84
                    end
                    object tvLineasFacturacionTIPO_CANTIDAD_ARTICULO_FACTURA_LINEA: TcxGridDBColumn
                      Caption = 'Tipo Cantidad'
                      DataBinding.FieldName = 'TIPO_CANTIDAD_ARTICULO_FACTURA_LINEA'
                    end
                    object tvLineasFacturacionPRECIOVENTA_SIVA_ARTICULO_FACTURA_LINEA: TcxGridDBColumn
                      Caption = 'Precio SIVA'
                      DataBinding.FieldName = 'PRECIOVENTA_SIVA_ARTICULO_FACTURA_LINEA'
                      PropertiesClassName = 'TcxCurrencyEditProperties'
                    end
                    object tvLineasFacturacionPORCEN_IVA_FACTURA_LINEA: TcxGridDBColumn
                      Caption = 'Porcentaje IVA'
                      DataBinding.FieldName = 'PORCEN_IVA_FACTURA_LINEA'
                      PropertiesClassName = 'TcxSpinEditProperties'
                      Properties.DisplayFormat = '0.00 %'
                      Properties.EditFormat = '0.00 %'
                      Properties.Increment = 0.100000000000000000
                      Properties.LargeIncrement = 1.000000000000000000
                      Properties.MaxValue = 100.000000000000000000
                    end
                    object tvLineasFacturacionTIPOIVA_ARTICULO_FACTURA_LINEA: TcxGridDBColumn
                      Caption = 'Tipo IVA'
                      DataBinding.FieldName = 'TIPOIVA_ARTICULO_FACTURA_LINEA'
                      PropertiesClassName = 'TcxLookupComboBoxProperties'
                      Properties.KeyFieldNames = 'CODIGO_ABREVIATURA_TIPO_IVA'
                      Properties.ListColumns = <
                        item
                          FieldName = 'NOMBRE_TIPO_IVA'
                        end>
                    end
                    object cxgrdbclmncxgrdbtblvwcxgrd1DBTableView1PRECIOVENTA_ARTICULO_LINEA: TcxGridDBColumn
                      Caption = 'Precio CIVA'
                      DataBinding.FieldName = 'PRECIOVENTA_CIVA_ARTICULO_FACTURA_LINEA'
                      PropertiesClassName = 'TcxCurrencyEditProperties'
                      Width = 84
                    end
                    object cxgrdbclmncxgrdbtblvwcxgrd1DBTableView1SUM_TOTAL_LINEA: TcxGridDBColumn
                      Caption = 'Total'
                      DataBinding.FieldName = 'TOTAL_FACTURA_LINEA'
                      PropertiesClassName = 'TcxCurrencyEditProperties'
                      Width = 84
                    end
                    object tvLineasFacturacionFECHA_ENTREGA_FACTURA_LINEA: TcxGridDBColumn
                      Caption = 'Fecha de Entrega'
                      DataBinding.FieldName = 'FECHA_ENTREGA_FACTURA_LINEA'
                      PropertiesClassName = 'TcxDateEditProperties'
                    end
                  end
                  object cxgrdlvlcxgrd1Level1: TcxGridLevel
                    GridView = tvFacturacion
                    object cxgrdlvlcxgrd1Level2: TcxGridLevel
                      GridView = tvLineasFacturacion
                    end
                  end
                end
                object pnlFacturaOpts: TPanel
                  Left = 616
                  Top = 1
                  Width = 117
                  Height = 437
                  Align = alRight
                  TabOrder = 1
                  object btnIraFactura: TcxButton
                    Left = 6
                    Top = 16
                    Width = 109
                    Height = 34
                    Caption = '&Ir a Factura'
                    TabOrder = 0
                    OnClick = btnIraFacturaClick
                  end
                  object btnIraCliente: TcxButton
                    Left = 7
                    Top = 56
                    Width = 108
                    Height = 34
                    Caption = 'I&r a Cliente'
                    TabOrder = 1
                    OnClick = btnIraClienteClick
                  end
                  object btExportarExcel: TcxButton
                    Left = 7
                    Top = 176
                    Width = 108
                    Height = 34
                    Caption = 'Exp. Excel'
                    TabOrder = 2
                    OnClick = btExportarExcelClick
                  end
                  object btnIraEmpresa: TcxButton
                    Left = 7
                    Top = 96
                    Width = 108
                    Height = 34
                    Caption = 'I&r a Empresa'
                    TabOrder = 3
                    OnClick = btnIraEmpresaClick
                  end
                  object btnIraArticulo: TcxButton
                    Left = 7
                    Top = 136
                    Width = 108
                    Height = 34
                    Caption = 'I&r a Art'#237'culo'
                    TabOrder = 4
                    OnClick = btnIraArticuloClick
                  end
                end
              end
            end
            object tsOtros: TcxTabSheet
              Caption = '&3_Otros-'
              ImageIndex = 3
              object pnl3: TPanel
                Left = 0
                Top = 360
                Width = 734
                Height = 79
                Align = alBottom
                TabOrder = 0
                object cxdbtxtdtDIRECCION1_CLIENTE: TcxDBTextEdit
                  Left = 17
                  Top = 37
                  Margins.Left = 4
                  Margins.Top = 4
                  Margins.Right = 4
                  Margins.Bottom = 4
                  DataBinding.DataField = 'USUARIOALTA'
                  DataBinding.DataSource = dsTablaG
                  Properties.ReadOnly = True
                  TabOrder = 2
                  Width = 136
                end
                object lblUsuarioAlta: TcxLabel
                  Left = 17
                  Top = 9
                  Margins.Left = 4
                  Margins.Top = 4
                  Margins.Right = 4
                  Margins.Bottom = 4
                  Caption = 'Usuario Alta'
                  Transparent = True
                end
                object lblInstanteAlta: TcxLabel
                  Left = 160
                  Top = 9
                  Margins.Left = 4
                  Margins.Top = 4
                  Margins.Right = 4
                  Margins.Bottom = 4
                  Caption = 'Instante Alta'
                  Transparent = True
                end
                object cxdbtxtdtUSUARIOALTA: TcxDBTextEdit
                  Left = 160
                  Top = 37
                  Margins.Left = 4
                  Margins.Top = 4
                  Margins.Right = 4
                  Margins.Bottom = 4
                  DataBinding.DataField = 'INSTANTEALTA'
                  DataBinding.DataSource = dsTablaG
                  Properties.ReadOnly = True
                  TabOrder = 3
                  Width = 195
                end
                object cxdbtxtdtINSTANTEALTA: TcxDBTextEdit
                  Left = 514
                  Top = 37
                  Margins.Left = 4
                  Margins.Top = 4
                  Margins.Right = 4
                  Margins.Bottom = 4
                  DataBinding.DataField = 'INSTANTEMODIF'
                  DataBinding.DataSource = dsTablaG
                  Properties.ReadOnly = True
                  TabOrder = 7
                  Width = 201
                end
                object lblInstanteModif: TcxLabel
                  Left = 514
                  Top = 9
                  Margins.Left = 4
                  Margins.Top = 4
                  Margins.Right = 4
                  Margins.Bottom = 4
                  Caption = 'Instante Modif.'
                  Transparent = True
                end
                object cxdbtxtdtUSUARIOALTA1: TcxDBTextEdit
                  Left = 364
                  Top = 37
                  Margins.Left = 4
                  Margins.Top = 4
                  Margins.Right = 4
                  Margins.Bottom = 4
                  DataBinding.DataField = 'USUARIOALTA'
                  DataBinding.DataSource = dsTablaG
                  Properties.ReadOnly = True
                  TabOrder = 4
                  Width = 136
                end
                object lblUsuarioModif: TcxLabel
                  Left = 364
                  Top = 9
                  Margins.Left = 4
                  Margins.Top = 4
                  Margins.Right = 4
                  Margins.Bottom = 4
                  Caption = 'Usuario '#218'lt. Modif'
                  Transparent = True
                end
              end
              object lblOrden: TcxLabel
                Left = 20
                Top = 24
                Caption = 'Orden en Listados'
                Transparent = True
              end
              object cxdbspndtORDEN_CLIENTE: TcxDBSpinEdit
                Left = 179
                Top = 23
                DataBinding.DataField = 'ORDEN_FORMAPAGO'
                DataBinding.DataSource = dsTablaG
                TabOrder = 2
                Width = 106
              end
            end
          end
        end
        object cxspltr1: TcxSplitter
          Left = 0
          Top = 113
          Width = 745
          Height = 4
          HotZoneClassName = 'TcxMediaPlayer9Style'
          AlignSplitter = salTop
          Control = pnl1
        end
      end
      inherited tsPerfil: TcxTabSheet
        ExplicitWidth = 745
        ExplicitHeight = 596
        inherited pnlPerfilTop: TPanel
          Width = 745
          ExplicitWidth = 745
          inherited edtPerfilBusq: TcxTextEdit
            ExplicitHeight = 27
          end
        end
        inherited pnlPerfilDetail: TPanel
          Width = 745
          Height = 539
          ExplicitWidth = 745
          ExplicitHeight = 539
          inherited cxgrdPerfil: TcxGrid
            Width = 745
            Height = 539
            ExplicitWidth = 745
            ExplicitHeight = 539
          end
        end
      end
    end
    inherited pnlTopPage: TPanel
      Width = 754
      TabOrder = 0
      ExplicitWidth = 754
      inherited pnlTopGrid: TPanel
        Width = 754
        ExplicitWidth = 754
      end
    end
  end
  inherited pButtonRightBar: TPanel
    Left = 754
    Height = 674
    TabOrder = 1
    ExplicitLeft = 754
    ExplicitHeight = 674
    inherited pButtonGen: TPanel
      Top = 476
      ExplicitTop = 476
    end
  end
  inherited dsTablaG: TDataSource
    Left = 612
    Top = 559
  end
  object ActionListFormasdePAgo: TActionList
    Left = 440
    Top = 304
    object actClientes: TAction
      Caption = 'Clientes'
      ShortCut = 16459
      OnExecute = actClientesExecute
    end
    object actArticulos: TAction
      Caption = 'actArticulos'
      ShortCut = 16449
      OnExecute = actArticulosExecute
    end
    object actFacturas: TAction
      Caption = 'actFacturas'
      ShortCut = 16454
      OnExecute = actFacturasExecute
    end
    object actEmpresas: TAction
      Caption = 'Empresas'
      ShortCut = 16453
      OnExecute = actEmpresasExecute
    end
  end
end
