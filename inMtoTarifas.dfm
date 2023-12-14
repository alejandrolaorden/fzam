inherited frmMtoTarifas: TfrmMtoTarifas
  Left = 5
  Top = 4
  Caption = 'Tarifas'
  ClientHeight = 614
  ClientWidth = 855
  ExplicitWidth = 855
  ExplicitHeight = 614
  TextHeight = 19
  inherited pButtonPage: TPanel
    Width = 715
    Height = 614
    TabOrder = 0
    ExplicitWidth = 715
    ExplicitHeight = 614
    inherited pcPantalla: TcxPageControl
      Width = 715
      Height = 574
      TabOrder = 1
      Properties.ActivePage = tsFicha
      ExplicitWidth = 715
      ExplicitHeight = 574
      ClientRectBottom = 568
      ClientRectRight = 709
      inherited tsLista: TcxTabSheet
        ExplicitWidth = 706
        ExplicitHeight = 536
        inherited cxGrdPrincipal: TcxGrid
          Width = 706
          Height = 536
          ExplicitWidth = 706
          ExplicitHeight = 536
          inherited cxGrdDBTabPrin: TcxGridDBTableView
            object cxgrdbclmnGrdDBTabPrinCODIGO_TARIFA: TcxGridDBColumn
              Caption = 'C'#243'digo Tarifa'
              DataBinding.FieldName = 'CODIGO_TARIFA'
              DataBinding.IsNullValueType = True
              Width = 141
            end
            object cxgrdbclmnGrdDBTabPrinNOMBRE_TARIFA: TcxGridDBColumn
              Caption = 'Nombre Tarifa'
              DataBinding.FieldName = 'NOMBRE_TARIFA'
              DataBinding.IsNullValueType = True
              Width = 188
            end
            object cxgrdbclmnGrdDBTabPrinACTIVO_TARIFA: TcxGridDBColumn
              Caption = 'Activa'
              DataBinding.FieldName = 'ACTIVO_TARIFA'
              DataBinding.IsNullValueType = True
              Width = 75
            end
            object cxgrdbclmnGrdDBTabPrinFECHA_DESDE_TARIFA: TcxGridDBColumn
              Caption = 'Fecha Validez Desde'
              DataBinding.FieldName = 'FECHA_DESDE_TARIFA'
              DataBinding.IsNullValueType = True
              Width = 206
            end
            object cxgrdbclmnGrdDBTabPrinFECHA_HASTA_TARIFA: TcxGridDBColumn
              Caption = 'Fecha Validez Hasta'
              DataBinding.FieldName = 'FECHA_HASTA_TARIFA'
              DataBinding.IsNullValueType = True
              Width = 201
            end
            object cxgrdbclmnGrdDBTabPrinESIMP_INCL_TARIFA: TcxGridDBColumn
              Caption = 'Impuestos incl.'
              DataBinding.FieldName = 'ESIMP_INCL_TARIFA'
              DataBinding.IsNullValueType = True
              Width = 141
            end
            object cxgrdbclmnGrdDBTabPrinESDEFAULT_TARIFA: TcxGridDBColumn
              Caption = 'Tarifa por defecto'
              DataBinding.FieldName = 'ESDEFAULT_TARIFA'
              DataBinding.IsNullValueType = True
              Width = 202
            end
            object cxgrdbclmnGrdDBTabPrinINSTANTEMODIF: TcxGridDBColumn
              DataBinding.FieldName = 'INSTANTEMODIF'
              DataBinding.IsNullValueType = True
              Visible = False
              VisibleForCustomization = False
            end
            object cxgrdbclmnGrdDBTabPrinINSTANTEALTA: TcxGridDBColumn
              DataBinding.FieldName = 'INSTANTEALTA'
              DataBinding.IsNullValueType = True
              Visible = False
              VisibleForCustomization = False
            end
            object cxgrdbclmnGrdDBTabPrinUSUARIOALTA: TcxGridDBColumn
              DataBinding.FieldName = 'USUARIOALTA'
              DataBinding.IsNullValueType = True
              Visible = False
              VisibleForCustomization = False
              Width = 109
            end
            object cxgrdbclmnGrdDBTabPrinUSUARIOMODIF: TcxGridDBColumn
              DataBinding.FieldName = 'USUARIOMODIF'
              DataBinding.IsNullValueType = True
              Visible = False
              VisibleForCustomization = False
              Width = 119
            end
          end
        end
      end
      inherited tsFicha: TcxTabSheet
        ExplicitWidth = 706
        ExplicitHeight = 536
        object pnl1: TPanel
          Left = 0
          Top = 0
          Width = 706
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
            Width = 704
            Height = 111
            Align = alClient
            TabOrder = 0
            object txtCODIGO_TARIFA: TcxDBTextEdit
              Left = 101
              Top = 9
              DataBinding.DataField = 'CODIGO_TARIFA'
              DataBinding.DataSource = dsTablaG
              Properties.ReadOnly = False
              TabOrder = 0
              Width = 121
            end
            object lblCodigo: TcxLabel
              Left = 29
              Top = 13
              Caption = 'C'#243'digo'
              Transparent = True
            end
            object lblNombre: TcxLabel
              Left = 22
              Top = 49
              Caption = 'Nombre'
              Transparent = True
            end
            object txtNOMBRE_TARIFA: TcxDBTextEdit
              Left = 100
              Top = 46
              DataBinding.DataField = 'NOMBRE_TARIFA'
              DataBinding.DataSource = dsTablaG
              TabOrder = 3
              Width = 322
            end
            object chkActivo: TcxDBCheckBox
              Left = 79
              Top = 78
              Caption = 'Activo'
              DataBinding.DataField = 'ACTIVO_TARIFA'
              DataBinding.DataSource = dsTablaG
              Properties.ValueChecked = 'S'
              Properties.ValueUnchecked = 'N'
              TabOrder = 4
              Transparent = True
            end
            object cxdbchckbxACTIVO_TARIFA: TcxDBCheckBox
              Left = 237
              Top = 11
              Caption = 'Impuestos inclu'#237'dos en el precio final'
              DataBinding.DataField = 'ESIMP_INCL_TARIFA'
              DataBinding.DataSource = dsTablaG
              Properties.ValueChecked = 'S'
              Properties.ValueUnchecked = 'N'
              Style.TransparentBorder = False
              TabOrder = 5
              Transparent = True
            end
          end
        end
        object pnl2: TPanel
          Left = 0
          Top = 117
          Width = 706
          Height = 419
          Align = alClient
          TabOrder = 1
          object pcPestana: TcxPageControl
            Left = 1
            Top = 1
            Width = 704
            Height = 417
            Align = alClient
            TabOrder = 0
            Properties.ActivePage = tsOtros
            Properties.CustomButtons.Buttons = <>
            ClientRectBottom = 411
            ClientRectLeft = 3
            ClientRectRight = 698
            ClientRectTop = 32
            object tsArticulos: TcxTabSheet
              Caption = '&1_Art'#237'culos'
              ImageIndex = 0
              object pnl6: TPanel
                Left = 568
                Top = 0
                Width = 127
                Height = 379
                Align = alRight
                TabOrder = 0
                object btnIraArticulo: TcxButton
                  Left = 3
                  Top = 13
                  Width = 120
                  Height = 25
                  Caption = 'Ir a Art'#237'culo'
                  TabOrder = 0
                  OnClick = btnIraArticuloClick
                end
                object btAddBlock: TcxButton
                  Left = 3
                  Top = 53
                  Width = 120
                  Height = 25
                  Caption = 'A'#241'adir Bloque'
                  TabOrder = 1
                  Visible = False
                  OnClick = btAddBlockClick
                end
              end
              object cxspltr1: TcxSplitter
                Left = 564
                Top = 0
                Width = 4
                Height = 379
                HotZoneClassName = 'TcxMediaPlayer9Style'
                Control = pnl6
              end
              object pnlArticulos: TPanel
                Left = 0
                Top = 0
                Width = 564
                Height = 379
                Align = alClient
                TabOrder = 2
                object cxgrdArticulosTarifas: TcxGrid
                  Left = 5
                  Top = 1
                  Width = 558
                  Height = 377
                  Margins.Left = 4
                  Margins.Top = 4
                  Margins.Right = 4
                  Margins.Bottom = 4
                  Align = alClient
                  TabOrder = 0
                  object tvArticulos: TcxGridDBTableView
                    Navigator.Buttons.ConfirmDelete = True
                    Navigator.Buttons.CustomButtons = <>
                    Navigator.Visible = True
                    ScrollbarAnnotations.CustomAnnotations = <>
                    DataController.DataModeController.SmartRefresh = True
                    DataController.Summary.DefaultGroupSummaryItems = <
                      item
                        Kind = skSum
                      end
                      item
                        Kind = skSum
                      end
                      item
                        Kind = skSum
                      end
                      item
                        Kind = skSum
                      end>
                    DataController.Summary.FooterSummaryItems = <
                      item
                        Format = '0.00 '#8364';-0.00 '#8364
                        Kind = skSum
                      end
                      item
                        Format = '0.00 '#8364';-0.00 '#8364
                        Kind = skSum
                      end
                      item
                        Format = '0.00 '#8364';-0.00 '#8364
                        Kind = skSum
                      end
                      item
                        Format = '0.00 '#8364';-0.00 '#8364
                        Kind = skSum
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
                    object cxgrdbclmnArticulosACTIVO_TARIFA: TcxGridDBColumn
                      Caption = 'Precio Activo'
                      DataBinding.FieldName = 'ACTIVO_TARIFA'
                      DataBinding.IsNullValueType = True
                      Width = 126
                    end
                    object cxgrdbclmnArticulosCODIGO_ARTICULO_TARIFA: TcxGridDBColumn
                      Caption = 'C'#243'digo Art'#237'culo'
                      DataBinding.FieldName = 'CODIGO_ARTICULO_TARIFA'
                      DataBinding.IsNullValueType = True
                      Width = 138
                    end
                    object cxgrdbclmnArticulosDESCRIPCION_ARTICULO: TcxGridDBColumn
                      Caption = 'Descripci'#243'n Art'#237'culo'
                      DataBinding.FieldName = 'DESCRIPCION_ARTICULO'
                      DataBinding.IsNullValueType = True
                      Width = 96
                    end
                    object cxgrdbclmnArticulosCODIGO_FAMILIA_ARTICULO: TcxGridDBColumn
                      Caption = 'C'#243'digo Familia'
                      DataBinding.FieldName = 'CODIGO_FAMILIA_ARTICULO'
                      DataBinding.IsNullValueType = True
                      Width = 122
                    end
                    object cxgrdbclmnArticulosDESCRIPCION_FAMILIA: TcxGridDBColumn
                      Caption = 'Descripci'#243'n Familia'
                      DataBinding.FieldName = 'DESCRIPCION_FAMILIA'
                      DataBinding.IsNullValueType = True
                      Width = 265
                    end
                    object cxgrdbclmnArticulosCODIGO_PROVEEDOR: TcxGridDBColumn
                      Caption = 'C'#243'digo Proveedor'
                      DataBinding.FieldName = 'CODIGO_PROVEEDOR'
                      DataBinding.IsNullValueType = True
                      Width = 125
                    end
                    object cxgrdbclmnArticulosRAZONSOCIAL_PROVEEDOR: TcxGridDBColumn
                      Caption = 'Nombre Proveedor'
                      DataBinding.FieldName = 'RAZONSOCIAL_PROVEEDOR'
                      DataBinding.IsNullValueType = True
                      Width = 208
                    end
                    object cxgrdbclmnArticulosTIPOIVA_ARTICULO: TcxGridDBColumn
                      Caption = 'Tipo de IVA'
                      DataBinding.FieldName = 'TIPOIVA_ARTICULO'
                      DataBinding.IsNullValueType = True
                      Width = 152
                    end
                    object cxgrdbclmnArticulosFECHA_DESDE_TARIFA: TcxGridDBColumn
                      Caption = 'Precio desde Fecha'
                      DataBinding.FieldName = 'FECHA_DESDE_TARIFA'
                      DataBinding.IsNullValueType = True
                    end
                    object cxgrdbclmnArticulosFECHA_HASTA_TARIFA: TcxGridDBColumn
                      Caption = 'Precio Hasta Fecha'
                      DataBinding.FieldName = 'FECHA_HASTA_TARIFA'
                      DataBinding.IsNullValueType = True
                    end
                    object cxgrdbclmnArticulosTIPO_CANTIDAD_ARTICULO: TcxGridDBColumn
                      Caption = 'Tipo Cantidad'
                      DataBinding.FieldName = 'TIPO_CANTIDAD_ARTICULO'
                      DataBinding.IsNullValueType = True
                      Width = 129
                    end
                    object cxgrdbclmnArticulosPRECIO_ULT_COMPRA: TcxGridDBColumn
                      Caption = 'Precio '#218'ltima Compra'
                      DataBinding.FieldName = 'PRECIO_ULT_COMPRA'
                      DataBinding.IsNullValueType = True
                      Width = 190
                    end
                    object cxgrdbclmnArticulosFECHA_VALIDEZ: TcxGridDBColumn
                      Caption = 'Fecha '#218'ltima Compra'
                      DataBinding.FieldName = 'FECHA_VALIDEZ'
                      DataBinding.IsNullValueType = True
                    end
                    object cxgrdbclmnArticulosPRECIOFINAL: TcxGridDBColumn
                      Caption = 'Precio Salida'
                      DataBinding.FieldName = 'PRECIOFINAL'
                      DataBinding.IsNullValueType = True
                    end
                    object cxgrdbclmnArticulosINSTANTEALTA: TcxGridDBColumn
                      DataBinding.FieldName = 'INSTANTEALTA'
                      DataBinding.IsNullValueType = True
                      Visible = False
                      VisibleForCustomization = False
                    end
                    object cxgrdbclmnArticulosINSTANTEMODIF: TcxGridDBColumn
                      DataBinding.FieldName = 'INSTANTEMODIF'
                      DataBinding.IsNullValueType = True
                      Visible = False
                      VisibleForCustomization = False
                    end
                    object cxgrdbclmnArticulosUSUARIOALTA: TcxGridDBColumn
                      DataBinding.FieldName = 'USUARIOALTA'
                      DataBinding.IsNullValueType = True
                      Visible = False
                      VisibleForCustomization = False
                      Width = 109
                    end
                    object cxgrdbclmnArticulosUSUARIOMODIF: TcxGridDBColumn
                      DataBinding.FieldName = 'USUARIOMODIF'
                      DataBinding.IsNullValueType = True
                      Visible = False
                      VisibleForCustomization = False
                      Width = 131
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
                      DataBinding.FieldName = 'LINEA_FACTURA_LINEA'
                      DataBinding.IsNullValueType = True
                      Width = 28
                    end
                    object cxgrdbclmncxgrdbtblvwcxgrd1DBTableView1CODIGO_ARTICULO_LINEA: TcxGridDBColumn
                      Caption = 'C'#243'digo Tratamiento'
                      DataBinding.FieldName = 'CODIGO_ARTICULO_FACTURA_LINEA'
                      DataBinding.IsNullValueType = True
                      Width = 164
                    end
                    object cxgrdbclmncxgrdbtblvwcxgrd1DBTableView1DESCRIPCION_ARTICULO_LINEA: TcxGridDBColumn
                      Caption = 'Descripci'#243'n Tratamiento'
                      DataBinding.FieldName = 'DESCRIPCION_ARTICULO_FACTURA_LINEA'
                      DataBinding.IsNullValueType = True
                      Width = 162
                    end
                    object cxgrdbclmnLineasFacturacionTIPO_CANTIDAD_ARTICULO_FACTURA_LINEA: TcxGridDBColumn
                      DataBinding.FieldName = 'TIPO_CANTIDAD_ARTICULO_FACTURA_LINEA'
                      DataBinding.IsNullValueType = True
                    end
                    object cxgrdbclmncxgrdbtblvwcxgrd1DBTableView1CANTIDAD_LINEA: TcxGridDBColumn
                      Caption = 'Cantidad'
                      DataBinding.FieldName = 'CANTIDAD_FACTURA_LINEA'
                      DataBinding.IsNullValueType = True
                      Width = 84
                    end
                    object cxgrdbclmnLineasFacturacionPRECIOVENTA_SIVA_ARTICULO_FACTURA_LINEA: TcxGridDBColumn
                      DataBinding.FieldName = 'PRECIOVENTA_SIVA_ARTICULO_FACTURA_LINEA'
                      DataBinding.IsNullValueType = True
                    end
                    object cxgrdbclmnLineasFacturacionPORCEN_IVA_FACTURA_LINEA: TcxGridDBColumn
                      Caption = 'Porcentaje IVA'
                      DataBinding.FieldName = 'PORCEN_IVA_FACTURA_LINEA'
                      DataBinding.IsNullValueType = True
                      PropertiesClassName = 'TcxSpinEditProperties'
                      Properties.EditFormat = '0.00 %'
                    end
                    object cxgrdbclmncxgrdbtblvwcxgrd1DBTableView1PRECIOVENTA_ARTICULO_LINEA: TcxGridDBColumn
                      Caption = 'Precio'
                      DataBinding.FieldName = 'PRECIOVENTA_CIVA_ARTICULO_FACTURA_LINEA'
                      DataBinding.IsNullValueType = True
                      PropertiesClassName = 'TcxCurrencyEditProperties'
                      Width = 84
                    end
                    object cxgrdbclmncxgrdbtblvwcxgrd1DBTableView1SUM_TOTAL_LINEA: TcxGridDBColumn
                      Caption = 'Total'
                      DataBinding.FieldName = 'TOTAL_FACTURA_LINEA'
                      DataBinding.IsNullValueType = True
                      PropertiesClassName = 'TcxCurrencyEditProperties'
                      Width = 84
                    end
                    object cxgrdbclmnLineasFacturacionFECHA_ENTREGA_FACTURA_LINEA: TcxGridDBColumn
                      Caption = 'Fecha de Entrega'
                      DataBinding.FieldName = 'FECHA_ENTREGA_FACTURA_LINEA'
                      DataBinding.IsNullValueType = True
                      PropertiesClassName = 'TcxDateEditProperties'
                    end
                    object cxgrdbclmnLineasFacturacionTIPOIVA_ARTICULO_FACTURA_LINEA: TcxGridDBColumn
                      DataBinding.FieldName = 'TIPOIVA_ARTICULO_FACTURA_LINEA'
                      DataBinding.IsNullValueType = True
                    end
                  end
                  object cxgrdlvlArticulosTarifas: TcxGridLevel
                    GridView = tvArticulos
                  end
                end
                object cxspltr2: TcxSplitter
                  Left = 1
                  Top = 1
                  Width = 4
                  Height = 377
                end
              end
            end
            object tsOtros: TcxTabSheet
              Caption = '&2_Otros'
              ImageIndex = 3
              object pnl3: TPanel
                Left = 0
                Top = 300
                Width = 695
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
                  Left = 177
                  Top = 9
                  Margins.Left = 4
                  Margins.Top = 4
                  Margins.Right = 4
                  Margins.Bottom = 4
                  Caption = 'Instante Alta'
                  Transparent = True
                end
                object cxdbtxtdtUSUARIOALTA: TcxDBTextEdit
                  Left = 177
                  Top = 37
                  Margins.Left = 4
                  Margins.Top = 4
                  Margins.Right = 4
                  Margins.Bottom = 4
                  DataBinding.DataField = 'INSTANTEALTA'
                  DataBinding.DataSource = dsTablaG
                  Properties.ReadOnly = True
                  TabOrder = 3
                  Width = 185
                end
                object cxdbtxtdtINSTANTEALTA: TcxDBTextEdit
                  Left = 525
                  Top = 37
                  Margins.Left = 4
                  Margins.Top = 4
                  Margins.Right = 4
                  Margins.Bottom = 4
                  DataBinding.DataField = 'INSTANTEMODIF'
                  DataBinding.DataSource = dsTablaG
                  Properties.ReadOnly = True
                  TabOrder = 7
                  Width = 196
                end
                object lblInstanteModif: TcxLabel
                  Left = 525
                  Top = 9
                  Margins.Left = 4
                  Margins.Top = 4
                  Margins.Right = 4
                  Margins.Bottom = 4
                  Caption = 'Instante Modificaci'#243'n'
                  Transparent = True
                end
                object cxdbtxtdtUSUARIOALTA1: TcxDBTextEdit
                  Left = 373
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
                  Left = 373
                  Top = 9
                  Margins.Left = 4
                  Margins.Top = 4
                  Margins.Right = 4
                  Margins.Bottom = 4
                  Caption = 'Us. '#218'lt. Modif.'
                  Transparent = True
                end
              end
              object cxdbdtdtFECHA_FACTURA: TcxDBDateEdit
                Left = 215
                Top = 71
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                DataBinding.DataField = 'FECHA_DESDE_TARIFA'
                DataBinding.DataSource = dsTablaG
                Properties.DateButtons = [btnClear, btnToday]
                TabOrder = 1
                Width = 143
              end
              object cxlbllblcxlbl3: TcxLabel
                Left = 33
                Top = 72
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                Caption = 'Fecha Validez Desde'
                Transparent = True
              end
              object cxdbdtdtFECHA_FACTURA1: TcxDBDateEdit
                Left = 215
                Top = 108
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                DataBinding.DataField = 'FECHA_HASTA_TARIFA'
                DataBinding.DataSource = dsTablaG
                Properties.DateButtons = [btnClear, btnToday]
                TabOrder = 3
                Width = 143
              end
              object cxlbllblcxlbl31: TcxLabel
                Left = 38
                Top = 109
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                Caption = 'Fecha Validez Hasta'
                Transparent = True
              end
            end
          end
        end
        object cxspltr3: TcxSplitter
          Left = 0
          Top = 113
          Width = 706
          Height = 4
          HotZoneClassName = 'TcxMediaPlayer9Style'
          AlignSplitter = salTop
          Control = pnl2
        end
      end
      inherited tsPerfil: TcxTabSheet
        ExplicitWidth = 706
        ExplicitHeight = 536
        inherited pnlPerfilTop: TPanel
          Width = 706
          ExplicitWidth = 706
        end
        inherited pnlPerfilDetail: TPanel
          Width = 706
          Height = 479
          ExplicitWidth = 706
          ExplicitHeight = 479
          inherited cxgrdPerfil: TcxGrid
            Width = 706
            Height = 479
            ExplicitWidth = 706
            ExplicitHeight = 479
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
      Width = 715
      TabOrder = 0
      ExplicitWidth = 715
      inherited pnlTopGrid: TPanel
        Width = 715
        ExplicitWidth = 715
      end
    end
  end
  inherited pButtonRightBar: TPanel
    Left = 715
    Height = 614
    TabOrder = 1
    ExplicitLeft = 715
    ExplicitHeight = 614
    inherited pButtonGen: TPanel
      Top = 416
      ExplicitTop = 416
    end
  end
  inherited dsTablaG: TDataSource
    Left = 404
    Top = 375
  end
  object ActionListTarifas: TActionList
    Left = 416
    Top = 296
    object actArticulos: TAction
      Caption = 'Articulos'
      ShortCut = 16449
      OnExecute = btnIraArticuloClick
    end
    object actFamilias: TAction
      Caption = 'Familias'
      ShortCut = 16462
      OnExecute = actFamiliasExecute
    end
    object actProveedores: TAction
      Caption = 'actProveedores'
      ShortCut = 16464
      OnExecute = actProveedoresExecute
    end
  end
end
