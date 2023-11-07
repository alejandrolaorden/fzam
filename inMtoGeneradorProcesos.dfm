inherited frmMtoGeneradorProcesos: TfrmMtoGeneradorProcesos
  Left = 5
  Top = 4
  Caption = 'Generador de Procesos'
  ClientHeight = 571
  ClientWidth = 999
  OnKeyDown = FormKeyDown
  ExplicitWidth = 999
  ExplicitHeight = 571
  PixelsPerInch = 96
  TextHeight = 19
  inherited pButtonPage: TPanel
    Width = 859
    Height = 571
    TabOrder = 0
    ExplicitWidth = 859
    ExplicitHeight = 571
    inherited pcPantalla: TcxPageControl
      Width = 859
      Height = 531
      TabOrder = 1
      ExplicitWidth = 859
      ExplicitHeight = 531
      ClientRectBottom = 525
      ClientRectRight = 853
      inherited tsLista: TcxTabSheet
        ExplicitWidth = 851
        ExplicitHeight = 497
        inherited cxGrdPrincipal: TcxGrid
          Width = 851
          Height = 497
          ExplicitWidth = 851
          ExplicitHeight = 497
          inherited cxGrdDBTabPrin: TcxGridDBTableView
            object cxgrdbclmnGrdDBTabPrinCODIGO_GENERADORPROCESO: TcxGridDBColumn
              Caption = 'C'#243'digo Proceso'
              DataBinding.FieldName = 'CODIGO_GENERADORPROCESO'
            end
            object cxgrdbclmnGrdDBTabPrinNOMBRE_GENERADORPROCESO: TcxGridDBColumn
              Caption = 'Nombre Proceso'
              DataBinding.FieldName = 'NOMBRE_GENERADORPROCESO'
              Width = 471
            end
            object cxgrdbclmnGrdDBTabPrinINSTANTEMODIF: TcxGridDBColumn
              DataBinding.FieldName = 'INSTANTEMODIF'
              Visible = False
              VisibleForCustomization = False
            end
            object cxgrdbclmnGrdDBTabPrinINSTANTEALTA: TcxGridDBColumn
              DataBinding.FieldName = 'INSTANTEALTA'
              Visible = False
              VisibleForCustomization = False
            end
            object cxgrdbclmnGrdDBTabPrinUSUARIOALTA: TcxGridDBColumn
              DataBinding.FieldName = 'USUARIOALTA'
              Visible = False
              VisibleForCustomization = False
            end
            object cxgrdbclmnGrdDBTabPrinUSUARIOMODIF: TcxGridDBColumn
              DataBinding.FieldName = 'USUARIOMODIF'
              Visible = False
              VisibleForCustomization = False
            end
          end
        end
      end
      inherited tsFicha: TcxTabSheet
        ExplicitWidth = 850
        ExplicitHeight = 493
        object pnl1: TPanel
          Left = 0
          Top = 0
          Width = 850
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
            Width = 848
            Height = 111
            Align = alClient
            TabOrder = 0
            object txtCODIGO_FAMILIA: TcxDBTextEdit
              Left = 95
              Top = 17
              DataBinding.DataField = 'CODIGO_GENERADORPROCESO'
              DataBinding.DataSource = dsTablaG
              Properties.ReadOnly = False
              TabOrder = 0
              Width = 121
            end
            object lblCodigo: TcxLabel
              Left = 21
              Top = 21
              Caption = 'C'#243'digo'
              Transparent = True
            end
            object lblNombre: TcxLabel
              Left = 16
              Top = 65
              Caption = 'Nombre'
              Transparent = True
            end
            object txtNOMBRE_FAMILIA: TcxDBTextEdit
              Left = 94
              Top = 62
              DataBinding.DataField = 'NOMBRE_GENERADORPROCESO'
              DataBinding.DataSource = dsTablaG
              TabOrder = 3
              Width = 570
            end
          end
        end
        object pnl2: TPanel
          Left = 0
          Top = 117
          Width = 850
          Height = 376
          Align = alClient
          TabOrder = 1
          object pcPestana: TcxPageControl
            Left = 1
            Top = 1
            Width = 848
            Height = 374
            Align = alClient
            TabOrder = 0
            Properties.ActivePage = tsMetadatos
            Properties.CustomButtons.Buttons = <>
            ClientRectBottom = 368
            ClientRectLeft = 3
            ClientRectRight = 842
            ClientRectTop = 32
            object tsSQL: TcxTabSheet
              Caption = '&1_C'#243'digo SQL'
              ImageIndex = 0
              ExplicitLeft = 0
              ExplicitTop = 0
              ExplicitWidth = 0
              ExplicitHeight = 0
              object pnl6: TPanel
                Left = 0
                Top = 251
                Width = 839
                Height = 85
                Align = alBottom
                TabOrder = 0
                ExplicitTop = 255
                ExplicitWidth = 841
                object cxmResul: TcxMemo
                  Left = 1
                  Top = 1
                  Align = alClient
                  TabOrder = 0
                  Height = 83
                  Width = 837
                end
              end
              object pnl7: TPanel
                Left = 0
                Top = 0
                Width = 839
                Height = 251
                Align = alClient
                TabOrder = 1
                ExplicitWidth = 841
                ExplicitHeight = 255
                object dbsyndtPROCESO_GENERADORPROCESO: TDBSynEdit
                  Left = 1
                  Top = 1
                  Width = 837
                  Height = 249
                  Cursor = crIBeam
                  DataField = 'PROCESO_GENERADORPROCESO'
                  DataSource = dsTablaG
                  Align = alClient
                  Ctl3D = True
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -15
                  Font.Name = 'Consolas'
                  Font.Pitch = fpFixed
                  Font.Style = []
                  Font.Quality = fqClearTypeNatural
                  ParentColor = False
                  ParentCtl3D = False
                  ParentFont = False
                  TabOrder = 0
                  OnKeyDown = dbsyndtPROCESO_GENERADORPROCESOKeyDown
                  Gutter.BorderStyle = gbsRight
                  Gutter.Font.Charset = DEFAULT_CHARSET
                  Gutter.Font.Color = clWindowText
                  Gutter.Font.Height = -13
                  Gutter.Font.Name = 'Consolas'
                  Gutter.Font.Pitch = fpFixed
                  Gutter.Font.Style = []
                  Gutter.Font.Quality = fqClearTypeNatural
                  Gutter.ShowLineNumbers = True
                  Gutter.Bands = <
                    item
                      Kind = gbkMarks
                      Width = 13
                    end
                    item
                      Kind = gbkLineNumbers
                    end
                    item
                      Kind = gbkFold
                    end
                    item
                      Kind = gbkTrackChanges
                    end
                    item
                      Kind = gbkMargin
                      Width = 3
                    end>
                  Highlighter = synsqlsyn2
                  Options = [eoAltSetsColumnMode, eoAutoIndent, eoDragDropEditing, eoEnhanceHomeKey, eoEnhanceEndKey, eoGroupUndo, eoScrollPastEol, eoShowScrollHint, eoSmartTabDelete, eoSmartTabs, eoTabIndent, eoTabsToSpaces]
                  SelectedColor.Alpha = 0.400000005960464500
                  TabWidth = 2
                  WantTabs = True
                  ExplicitWidth = 839
                  ExplicitHeight = 253
                  RemovedKeystrokes = <
                    item
                      Command = ecTab
                      ShortCut = 9
                    end
                    item
                      Command = ecShiftTab
                      ShortCut = 8201
                    end>
                  AddedKeystrokes = <
                    item
                      Command = ecTab
                      ShortCut = 9
                      ShortCut2 = 9
                    end
                    item
                      Command = ecShiftTab
                      ShortCut = 8201
                      ShortCut2 = 8201
                    end>
                end
              end
            end
            object tsMetadatos: TcxTabSheet
              Caption = '&2_Metadatos'
              ImageIndex = 2
              object cxspltr2: TcxSplitter
                Left = 233
                Top = 0
                Width = 4
                Height = 336
                HotZoneClassName = 'TcxMediaPlayer9Style'
                Control = pnlTree
              end
              object pnlTabs: TPanel
                Left = 237
                Top = 0
                Width = 602
                Height = 336
                Align = alClient
                Caption = 'pnlTabs'
                TabOrder = 1
                object pcMetadato: TcxPageControl
                  Left = 1
                  Top = 1
                  Width = 600
                  Height = 334
                  Align = alClient
                  TabOrder = 0
                  Properties.ActivePage = tsContenido
                  Properties.CustomButtons.Buttons = <>
                  ClientRectBottom = 328
                  ClientRectLeft = 3
                  ClientRectRight = 594
                  ClientRectTop = 32
                  object tsEstructura: TcxTabSheet
                    Caption = '&Estructura Metadato'
                    ImageIndex = 0
                    ExplicitLeft = 0
                    ExplicitTop = 0
                    ExplicitWidth = 0
                    ExplicitHeight = 0
                    object syndtEstructura: TSynEdit
                      Left = 0
                      Top = 0
                      Width = 591
                      Height = 296
                      Align = alClient
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -13
                      Font.Name = 'Courier New'
                      Font.Style = []
                      Font.Quality = fqClearTypeNatural
                      TabOrder = 0
                      OnKeyDown = syndtEstructuraKeyDown
                      UseCodeFolding = False
                      BorderStyle = bsNone
                      Gutter.Font.Charset = DEFAULT_CHARSET
                      Gutter.Font.Color = clWindowText
                      Gutter.Font.Height = -11
                      Gutter.Font.Name = 'Courier New'
                      Gutter.Font.Style = []
                      Gutter.Font.Quality = fqClearTypeNatural
                      Gutter.ShowLineNumbers = True
                      Gutter.Bands = <
                        item
                          Kind = gbkMarks
                          Width = 13
                        end
                        item
                          Kind = gbkLineNumbers
                        end
                        item
                          Kind = gbkFold
                        end
                        item
                          Kind = gbkTrackChanges
                        end
                        item
                          Kind = gbkMargin
                          Width = 3
                        end>
                      Highlighter = synsqlsyn2
                      Options = [eoAutoIndent, eoDragDropEditing, eoEnhanceHomeKey, eoEnhanceEndKey, eoGroupUndo, eoScrollPastEol, eoShowScrollHint, eoSmartTabDelete, eoSmartTabs, eoTabIndent, eoTabsToSpaces]
                      SelectedColor.Alpha = 0.400000005960464500
                      ExplicitWidth = 590
                      ExplicitHeight = 304
                      RemovedKeystrokes = <
                        item
                          Command = ecTab
                          ShortCut = 9
                        end
                        item
                          Command = ecShiftTab
                          ShortCut = 8201
                        end>
                      AddedKeystrokes = <
                        item
                          Command = ecTab
                          ShortCut = 9
                          ShortCut2 = 9
                        end
                        item
                          Command = ecShiftTab
                          ShortCut = 8201
                          ShortCut2 = 8201
                        end>
                    end
                    object mmo1: TMemo
                      Left = 488
                      Top = 344
                      Width = 57
                      Height = 41
                      Lines.Strings = (
                        'mm'
                        'o1')
                      TabOrder = 1
                      Visible = False
                    end
                  end
                  object tsContenido: TcxTabSheet
                    Caption = '&Vista Contenido'
                    ImageIndex = 1
                    object cxgrdMetadatos1: TcxGrid
                      Left = 0
                      Top = 0
                      Width = 474
                      Height = 296
                      Margins.Left = 4
                      Margins.Top = 4
                      Margins.Right = 4
                      Margins.Bottom = 4
                      Align = alClient
                      TabOrder = 0
                      object tvMetadatostvVista: TcxGridDBTableView
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
                            Format = '0,00 '#8364';-0,00 '#8364
                            Position = spFooter
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
                      end
                      object tv2: TcxGridDBTableView
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
                        object cxgrdbclmncxgrdbtblvwcxgrd1DBTableView1LINEA_LINEA1: TcxGridDBColumn
                          Caption = 'Nro Linea'
                          DataBinding.FieldName = 'LINEA_FACTURA_LINEA'
                          Width = 28
                        end
                        object cxgrdbclmncxgrdbtblvwcxgrd1DBTableView1CODIGO_ARTICULO_LINEA1: TcxGridDBColumn
                          Caption = 'C'#243'digo Art'#237'culo'
                          DataBinding.FieldName = 'CODIGO_ARTICULO_FACTURA_LINEA'
                          Width = 164
                        end
                        object cxgrdbclmncxgrdbtblvwcxgrd1DBTableView1DESCRIPCION_ARTICULO_LINEA1: TcxGridDBColumn
                          Caption = 'Descripci'#243'n'
                          DataBinding.FieldName = 'DESCRIPCION_ARTICULO_FACTURA_LINEA'
                          Width = 162
                        end
                        object cxgrdbclmncxgrdbtblvwcxgrd1DBTableView1CANTIDAD_LINEA1: TcxGridDBColumn
                          Caption = 'Cantidad'
                          DataBinding.FieldName = 'CANTIDAD_FACTURA_LINEA'
                          Width = 84
                        end
                        object cxgrdbclmnLineasFacturacionTIPO_CANTIDAD_ARTICULO_FACTURA_LINEA1: TcxGridDBColumn
                          Caption = 'Tipo Cantidad'
                          DataBinding.FieldName = 'TIPO_CANTIDAD_ARTICULO_FACTURA_LINEA'
                        end
                        object cxgrdbclmnLineasFacturacionPRECIOVENTA_SIVA_ARTICULO_FACTURA_LINEA1: TcxGridDBColumn
                          Caption = 'Precio SIVA'
                          DataBinding.FieldName = 'PRECIOVENTA_SIVA_ARTICULO_FACTURA_LINEA'
                        end
                        object cxgrdbclmnLineasFacturacionPORCEN_IVA_FACTURA_LINEA1: TcxGridDBColumn
                          Caption = 'Porcentaje IVA'
                          DataBinding.FieldName = 'PORCEN_IVA_FACTURA_LINEA'
                          PropertiesClassName = 'TcxSpinEditProperties'
                          Properties.DisplayFormat = '0.00 %'
                          Properties.EditFormat = '0.00 %'
                          Properties.Increment = 0.100000000000000000
                          Properties.LargeIncrement = 1.000000000000000000
                          Properties.MaxValue = 100.000000000000000000
                        end
                        object cxgrdbclmnLineasFacturacionTIPOIVA_ARTICULO_FACTURA_LINEA1: TcxGridDBColumn
                          Caption = 'Tipo IVA'
                          DataBinding.FieldName = 'TIPOIVA_ARTICULO_FACTURA_LINEA'
                        end
                        object cxgrdbclmncxgrdbtblvwcxgrd1DBTableView1PRECIOVENTA_ARTICULO_LINEA1: TcxGridDBColumn
                          Caption = 'Precio CIVA'
                          DataBinding.FieldName = 'PRECIOVENTA_CIVA_ARTICULO_FACTURA_LINEA'
                          PropertiesClassName = 'TcxCurrencyEditProperties'
                          Width = 84
                        end
                        object cxgrdbclmncxgrdbtblvwcxgrd1DBTableView1SUM_TOTAL_LINEA1: TcxGridDBColumn
                          Caption = 'Total'
                          DataBinding.FieldName = 'TOTAL_FACTURA_LINEA'
                          PropertiesClassName = 'TcxCurrencyEditProperties'
                          Width = 84
                        end
                        object cxgrdbclmnLineasFacturacionFECHA_ENTREGA_FACTURA_LINEA1: TcxGridDBColumn
                          Caption = 'Fecha de Entrega'
                          DataBinding.FieldName = 'FECHA_ENTREGA_FACTURA_LINEA'
                          PropertiesClassName = 'TcxDateEditProperties'
                        end
                      end
                      object cxgrdlvlMetadatoslv11: TcxGridLevel
                        GridView = tvMetadatostvVista
                      end
                    end
                    object pnlFacturaOpts1: TPanel
                      Left = 474
                      Top = 0
                      Width = 117
                      Height = 296
                      Align = alRight
                      TabOrder = 1
                      object btnExportarExcelMeta: TcxButton
                        Left = 6
                        Top = 8
                        Width = 106
                        Height = 34
                        Caption = 'Exp. E&xcel'
                        TabOrder = 0
                        OnClick = btnExportarExcelMetaClick
                      end
                      object btnEditarMeta: TcxButton
                        Left = 6
                        Top = 48
                        Width = 106
                        Height = 34
                        Caption = 'Editar G&rid'
                        TabOrder = 1
                        OnClick = btnEditarMetaClick
                      end
                    end
                  end
                end
              end
              object pnlTree: TPanel
                Left = 0
                Top = 0
                Width = 233
                Height = 336
                Align = alLeft
                Caption = 'pnlTree'
                TabOrder = 2
                object tv1: TdxDBTreeView
                  Left = 1
                  Top = 1
                  Width = 231
                  Height = 293
                  ShowNodeHint = False
                  DataSource = dmGeneradorProcesos.dsMetadatos
                  KeyField = 'CODIGO_METADATO'
                  ListField = 'NOMBRE_METADATO'
                  ParentField = 'PARENT_METADATO'
                  RootValue = Null
                  SeparatedSt = ' - '
                  RaiseOnError = True
                  ReadOnly = True
                  Indent = 19
                  Align = alClient
                  ParentColor = False
                  Options = [trCanDBNavigate, trSmartRecordCopy, trCheckHasChildren]
                  SelectedIndex = -1
                  TabOrder = 0
                  OnDblClick = tv1DblClick
                end
                object pnlTreeBotton: TPanel
                  Left = 1
                  Top = 294
                  Width = 231
                  Height = 41
                  Align = alBottom
                  TabOrder = 1
                  object btRefresh: TcxButton
                    Left = 5
                    Top = 6
                    Width = 217
                    Height = 25
                    Caption = 'Refrescar MetaDatos'
                    TabOrder = 0
                    OnClick = btRefreshClick
                  end
                  object cxdbtxtdtNOMBRE_METADATO: TcxDBTextEdit
                    Left = 12
                    Top = 20
                    DataBinding.DataField = 'NOMBRE_METADATO'
                    DataBinding.DataSource = dmGeneradorProcesos.dsMetadatos
                    Properties.OnChange = cxdbtxtdtNOMBRE_METADATOPropertiesChange
                    TabOrder = 1
                    Visible = False
                    Width = 121
                  end
                end
              end
            end
            object tsVistaDatos: TcxTabSheet
              Caption = '&3_VistaDatos'
              ImageIndex = 3
              ExplicitLeft = 0
              ExplicitTop = 0
              ExplicitWidth = 0
              ExplicitHeight = 0
              object cxVista: TcxGrid
                Left = 0
                Top = 0
                Width = 724
                Height = 340
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                Align = alClient
                TabOrder = 0
                object tvVista: TcxGridDBTableView
                  Navigator.Buttons.ConfirmDelete = True
                  Navigator.Buttons.CustomButtons = <>
                  Navigator.Visible = True
                  ScrollbarAnnotations.CustomAnnotations = <>
                  DataController.DataModeController.SmartRefresh = True
                  DataController.DataSource = dmGeneradorProcesos.dsVista
                  DataController.Summary.DefaultGroupSummaryItems = <
                    item
                      Kind = skSum
                    end
                    item
                      Format = '0,00 '#8364';-0,00 '#8364
                      Position = spFooter
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
                end
                object tv3: TcxGridDBTableView
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
                  object cxgrdbclmncxgrdbtblvwcxgrd1DBTableView1LINEA_LINEA11: TcxGridDBColumn
                    Caption = 'Nro Linea'
                    DataBinding.FieldName = 'LINEA_FACTURA_LINEA'
                    Width = 28
                  end
                  object cxgrdbclmncxgrdbtblvwcxgrd1DBTableView1CODIGO_ARTICULO_LINEA11: TcxGridDBColumn
                    Caption = 'C'#243'digo Art'#237'culo'
                    DataBinding.FieldName = 'CODIGO_ARTICULO_FACTURA_LINEA'
                    Width = 164
                  end
                  object cxgrdbclmncxgrdbtblvwcxgrd1DBTableView1DESCRIPCION_ARTICULO_LINEA11: TcxGridDBColumn
                    Caption = 'Descripci'#243'n'
                    DataBinding.FieldName = 'DESCRIPCION_ARTICULO_FACTURA_LINEA'
                    Width = 162
                  end
                  object cxgrdbclmncxgrdbtblvwcxgrd1DBTableView1CANTIDAD_LINEA11: TcxGridDBColumn
                    Caption = 'Cantidad'
                    DataBinding.FieldName = 'CANTIDAD_FACTURA_LINEA'
                    Width = 84
                  end
                  object cxgrdbclmnLineasFacturacionTIPO_CANTIDAD_ARTICULO_FACTURA_LINEA11: TcxGridDBColumn
                    Caption = 'Tipo Cantidad'
                    DataBinding.FieldName = 'TIPO_CANTIDAD_ARTICULO_FACTURA_LINEA'
                  end
                  object cxgrdbclmnLineasFacturacionPRECIOVENTA_SIVA_ARTICULO_FACTURA_LINEA11: TcxGridDBColumn
                    Caption = 'Precio SIVA'
                    DataBinding.FieldName = 'PRECIOVENTA_SIVA_ARTICULO_FACTURA_LINEA'
                  end
                  object cxgrdbclmnLineasFacturacionPORCEN_IVA_FACTURA_LINEA11: TcxGridDBColumn
                    Caption = 'Porcentaje IVA'
                    DataBinding.FieldName = 'PORCEN_IVA_FACTURA_LINEA'
                    PropertiesClassName = 'TcxSpinEditProperties'
                    Properties.DisplayFormat = '0.00 %'
                    Properties.EditFormat = '0.00 %'
                    Properties.Increment = 0.100000000000000000
                    Properties.LargeIncrement = 1.000000000000000000
                    Properties.MaxValue = 100.000000000000000000
                  end
                  object cxgrdbclmnLineasFacturacionTIPOIVA_ARTICULO_FACTURA_LINEA11: TcxGridDBColumn
                    Caption = 'Tipo IVA'
                    DataBinding.FieldName = 'TIPOIVA_ARTICULO_FACTURA_LINEA'
                  end
                  object cxgrdbclmncxgrdbtblvwcxgrd1DBTableView1PRECIOVENTA_ARTICULO_LINEA11: TcxGridDBColumn
                    Caption = 'Precio CIVA'
                    DataBinding.FieldName = 'PRECIOVENTA_CIVA_ARTICULO_FACTURA_LINEA'
                    PropertiesClassName = 'TcxCurrencyEditProperties'
                    Width = 84
                  end
                  object cxgrdbclmncxgrdbtblvwcxgrd1DBTableView1SUM_TOTAL_LINEA11: TcxGridDBColumn
                    Caption = 'Total'
                    DataBinding.FieldName = 'TOTAL_FACTURA_LINEA'
                    PropertiesClassName = 'TcxCurrencyEditProperties'
                    Width = 84
                  end
                  object cxgrdbclmnLineasFacturacionFECHA_ENTREGA_FACTURA_LINEA11: TcxGridDBColumn
                    Caption = 'Fecha de Entrega'
                    DataBinding.FieldName = 'FECHA_ENTREGA_FACTURA_LINEA'
                    PropertiesClassName = 'TcxDateEditProperties'
                  end
                end
                object lvVista: TcxGridLevel
                  GridView = tvVista
                end
              end
              object pnlFacturaOpts: TPanel
                Left = 724
                Top = 0
                Width = 117
                Height = 340
                Align = alRight
                TabOrder = 1
                object btnExportarExcel: TcxButton
                  Left = 6
                  Top = 8
                  Width = 106
                  Height = 34
                  Caption = 'Exp. E&xcel'
                  TabOrder = 0
                  OnClick = btnExportarExcelClick
                end
                object btnEditar: TcxButton
                  Left = 6
                  Top = 48
                  Width = 106
                  Height = 34
                  Caption = 'Editar G&rid'
                  TabOrder = 1
                  OnClick = btnEditarClick
                end
              end
            end
            object tsOtros: TcxTabSheet
              Caption = '&4_Otros'
              ImageIndex = 3
              ExplicitLeft = 4
              ExplicitTop = 30
              ExplicitWidth = 841
              ExplicitHeight = 340
              object pnl3: TPanel
                Left = 0
                Top = 257
                Width = 839
                Height = 79
                Align = alBottom
                TabOrder = 0
                ExplicitTop = 261
                ExplicitWidth = 841
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
                object cxlblUsuarioAlta: TcxLabel
                  Left = 17
                  Top = 9
                  Margins.Left = 4
                  Margins.Top = 4
                  Margins.Right = 4
                  Margins.Bottom = 4
                  Caption = 'Usuario Alta'
                  Transparent = True
                end
                object cxlblInstanteAlta: TcxLabel
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
                  Width = 136
                end
                object cxdbtxtdtINSTANTEALTA: TcxDBTextEdit
                  Left = 613
                  Top = 37
                  Margins.Left = 4
                  Margins.Top = 4
                  Margins.Right = 4
                  Margins.Bottom = 4
                  DataBinding.DataField = 'INSTANTEMODIF'
                  DataBinding.DataSource = dsTablaG
                  Properties.ReadOnly = True
                  TabOrder = 7
                  Width = 219
                end
                object cxlblInstanteModif: TcxLabel
                  Left = 613
                  Top = 9
                  Margins.Left = 4
                  Margins.Top = 4
                  Margins.Right = 4
                  Margins.Bottom = 4
                  Caption = 'Instante Modificaci'#243'n'
                  Transparent = True
                end
                object cxdbtxtdtUSUARIOALTA1: TcxDBTextEdit
                  Left = 337
                  Top = 37
                  Margins.Left = 4
                  Margins.Top = 4
                  Margins.Right = 4
                  Margins.Bottom = 4
                  DataBinding.DataField = 'USUARIOALTA'
                  DataBinding.DataSource = dsTablaG
                  Properties.ReadOnly = True
                  TabOrder = 4
                  Width = 248
                end
                object cxlblUsuarioModif: TcxLabel
                  Left = 337
                  Top = 9
                  Margins.Left = 4
                  Margins.Top = 4
                  Margins.Right = 4
                  Margins.Bottom = 4
                  Caption = 'Usuario '#218'ltima Modificaci'#243'n'
                  Transparent = True
                end
              end
            end
          end
        end
        object cxspltr1: TcxSplitter
          Left = 0
          Top = 113
          Width = 850
          Height = 4
          HotZoneClassName = 'TcxMediaPlayer9Style'
          AlignSplitter = salTop
          Control = pnl1
        end
      end
      inherited tsPerfil: TcxTabSheet
        ExplicitWidth = 852
        ExplicitHeight = 495
        inherited pnlPerfilTop: TPanel
          Width = 850
          ExplicitWidth = 852
          inherited edtPerfilBusq: TcxTextEdit
            ExplicitHeight = 27
          end
        end
        inherited pnlPerfilDetail: TPanel
          Width = 850
          Height = 436
          ExplicitWidth = 851
          ExplicitHeight = 440
          inherited cxgrdPerfil: TcxGrid
            Width = 851
            Height = 440
            ExplicitWidth = 851
            ExplicitHeight = 440
            inherited tvPerfil: TcxGridDBTableView
              object cxgrdbclmnPerfilUSUARIO_GRUPO_PERFILES: TcxGridDBColumn
                DataBinding.FieldName = 'USUARIO_GRUPO_PERFILES'
                Width = 167
              end
              object cxgrdbclmnPerfilKEY_PERFILES: TcxGridDBColumn
                DataBinding.FieldName = 'KEY_PERFILES'
                Width = 112
              end
              object cxgrdbclmnPerfilSUBKEY_PERFILES: TcxGridDBColumn
                DataBinding.FieldName = 'SUBKEY_PERFILES'
                Width = 291
              end
              object cxgrdbclmnPerfilVALUE_PERFILES: TcxGridDBColumn
                DataBinding.FieldName = 'VALUE_PERFILES'
                Width = 188
              end
              object cxgrdbclmnPerfilVALUE_TEXT_PERFILES: TcxGridDBColumn
                DataBinding.FieldName = 'VALUE_TEXT_PERFILES'
                PropertiesClassName = 'TcxBlobEditProperties'
                Properties.BlobEditKind = bekMemo
              end
              object cxgrdbclmnPerfilTYPE_BLOB_PERFILES: TcxGridDBColumn
                DataBinding.FieldName = 'TYPE_BLOB_PERFILES'
              end
              object cxgrdbclmnPerfilVALUE_BLOB_PERFILES: TcxGridDBColumn
                DataBinding.FieldName = 'VALUE_BLOB_PERFILES'
              end
              object cxgrdbclmnPerfilINSTANTEMODIF: TcxGridDBColumn
                DataBinding.FieldName = 'INSTANTEMODIF'
              end
              object cxgrdbclmnPerfilINSTANTEALTA: TcxGridDBColumn
                DataBinding.FieldName = 'INSTANTEALTA'
              end
              object cxgrdbclmnPerfilUSUARIOALTA: TcxGridDBColumn
                DataBinding.FieldName = 'USUARIOALTA'
                Width = 88
              end
              object cxgrdbclmnPerfilUSUARIOMODIF: TcxGridDBColumn
                DataBinding.FieldName = 'USUARIOMODIF'
                Width = 96
              end
            end
          end
        end
      end
    end
    inherited pnlTopPage: TPanel
      Width = 859
      TabOrder = 0
      ExplicitWidth = 859
      inherited pnlTopGrid: TPanel
        Width = 859
        ExplicitWidth = 859
        inherited edtBusqGlobal: TcxTextEdit
          ExplicitHeight = 27
        end
      end
    end
  end
  inherited pButtonRightBar: TPanel
    Left = 859
    Height = 571
    TabOrder = 1
    ExplicitLeft = 859
    ExplicitHeight = 571
    inherited pButtonGen: TPanel
      Top = 373
      ExplicitTop = 373
    end
    object btnEjecutar: TcxButton
      Left = 1
      Top = 328
      Width = 138
      Height = 49
      Caption = '&Ejecutar (F5)'
      TabOrder = 2
      WordWrap = True
      OnClick = btnEjecutarClick
    end
  end
  inherited dsTablaG: TDataSource
    DataSet = dmGeneradorProcesos.unqryTablaG
    Left = 428
    Top = 287
  end
  object synsqlsyn2: TSynSQLSyn [4]
    SQLDialect = sqlMySQL
    Left = 176
    Top = 432
  end
end
