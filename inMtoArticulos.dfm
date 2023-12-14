inherited frmMtoArticulos: TfrmMtoArticulos
  Left = 5
  Top = 4
  Caption = 'Articulos'
  ClientHeight = 713
  ClientWidth = 996
  ExplicitWidth = 996
  ExplicitHeight = 713
  PixelsPerInch = 96
  TextHeight = 19
  inherited pButtonPage: TPanel
    Width = 856
    Height = 713
    TabOrder = 0
    ExplicitWidth = 856
    ExplicitHeight = 713
    inherited pcPantalla: TcxPageControl
      Width = 856
      Height = 673
      TabOrder = 1
      Properties.ActivePage = tsFicha
      ExplicitWidth = 856
      ExplicitHeight = 673
      ClientRectBottom = 667
      ClientRectRight = 850
      inherited tsLista: TcxTabSheet
        ExplicitLeft = 3
        ExplicitTop = 32
        ExplicitWidth = 847
        ExplicitHeight = 635
        inherited cxGrdPrincipal: TcxGrid
          Width = 847
          Height = 635
          ExplicitWidth = 847
          ExplicitHeight = 635
          inherited cxGrdDBTabPrin: TcxGridDBTableView
            object cxgrdbclmnGrdDBTabPrinCODIGO_ARTICULO: TcxGridDBColumn
              Caption = 'C'#243'digo Art'#237'culo'
              DataBinding.FieldName = 'CODIGO_ARTICULO'
              Styles.Header = frmOpenApp2.StylCab
              Width = 150
            end
            object cxgrdbclmnGrdDBTabPrinACTIVO_ARTICULO: TcxGridDBColumn
              Caption = 'Activo'
              DataBinding.FieldName = 'ACTIVO_ARTICULO'
              PropertiesClassName = 'TcxCheckBoxProperties'
              Properties.ValueChecked = 'S'
              Properties.ValueUnchecked = 'N'
              Styles.Header = frmOpenApp2.StylCab
              Width = 76
            end
            object cxgrdbclmnGrdDBTabPrinDESCRIPCION_ARTICULO: TcxGridDBColumn
              Caption = 'Descripci'#243'n'
              DataBinding.FieldName = 'DESCRIPCION_ARTICULO'
              Styles.Header = frmOpenApp2.StylCab
              Width = 205
            end
            object cxgrdbclmnGrdDBTabPrinCODIGO_FAMILIA_ARTICULO: TcxGridDBColumn
              Caption = 'C'#243'digo Familia'
              DataBinding.FieldName = 'CODIGO_FAMILIA_ARTICULO'
              PropertiesClassName = 'TcxTextEditProperties'
              Styles.Header = frmOpenApp2.StylCab
              Width = 149
            end
            object cxgrdbclmnGrdDBTabPrinDESCRIPCION_FAMILIA: TcxGridDBColumn
              Caption = 'Descripci'#243'n Familia'
              DataBinding.FieldName = 'DESCRIPCION_FAMILIA'
              Styles.Header = frmOpenApp2.StylCab
              Width = 470
            end
            object cxgrdbclmnGrdDBTabPrinTIPOIVA_ARTICULO: TcxGridDBColumn
              Caption = 'Tipo IVA'
              DataBinding.FieldName = 'NOMBRE_TIPO_IVA'
              PropertiesClassName = 'TcxTextEditProperties'
              Styles.Header = frmOpenApp2.StylCab
              Width = 130
            end
          end
        end
      end
      inherited tsFicha: TcxTabSheet
        ExplicitLeft = 3
        ExplicitTop = 32
        ExplicitWidth = 847
        ExplicitHeight = 635
        object pnlTopFicha: TPanel
          Left = 0
          Top = 0
          Width = 847
          Height = 174
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 0
          object pnlBodyFicha: TPanel
            Left = 0
            Top = 0
            Width = 847
            Height = 174
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 0
            object txtCODIGO_ARTICULO: TcxDBTextEdit
              Left = 100
              Top = 13
              DataBinding.DataField = 'CODIGO_ARTICULO'
              DataBinding.DataSource = dsTablaG
              Properties.ReadOnly = False
              TabOrder = 0
              Width = 121
            end
            object lblCodigo: TcxLabel
              Left = 25
              Top = 14
              Caption = 'C'#243'digo'
              Transparent = True
            end
            object lblNombre: TcxLabel
              Left = 18
              Top = 55
              Caption = 'Nombre'
              Transparent = True
            end
            object txtDESCRIPCION_ARTICULO: TcxDBTextEdit
              Left = 100
              Top = 54
              DataBinding.DataField = 'DESCRIPCION_ARTICULO'
              DataBinding.DataSource = dsTablaG
              TabOrder = 3
              Width = 322
            end
            object chkActivo: TcxDBCheckBox
              Left = 230
              Top = 16
              Caption = 'Activo'
              DataBinding.DataField = 'ACTIVO_ARTICULO'
              DataBinding.DataSource = dsTablaG
              Properties.ValueChecked = 'S'
              Properties.ValueUnchecked = 'N'
              TabOrder = 4
              Transparent = True
            end
            object cbbFamilia: TcxDBLookupComboBox
              Left = 100
              Top = 95
              DataBinding.DataField = 'CODIGO_FAMILIA_ARTICULO'
              DataBinding.DataSource = dsTablaG
              Properties.KeyFieldNames = 'CODIGO_FAMILIA'
              Properties.ListColumns = <
                item
                  Fixed = True
                  SortOrder = soAscending
                  Width = 100
                  FieldName = 'CODIGO_FAMILIA'
                end
                item
                  Sorting = False
                  FieldName = 'NOMBRE_FAMILIA'
                end>
              Properties.ListOptions.ShowHeader = False
              TabOrder = 5
              Width = 322
            end
            object lblFamilia: TcxLabel
              Left = 27
              Top = 96
              Margins.Left = 4
              Margins.Top = 4
              Margins.Right = 4
              Margins.Bottom = 4
              Caption = 'Familia'
              Properties.Alignment.Horz = taRightJustify
              Transparent = True
              AnchorX = 90
            end
            object rgTipoIVA: TcxDBRadioGroup
              Left = 472
              Top = 6
              Caption = 'Tipo de IVA'
              DataBinding.DataField = 'TIPOIVA_ARTICULO'
              DataBinding.DataSource = dsTablaG
              Properties.Items = <
                item
                  Caption = 'Normal'
                  Value = 'N'
                end
                item
                  Caption = 'Reducido'
                  Value = 'R'
                end
                item
                  Caption = 'S'#250'per Reducido'
                  Value = 'SR'
                end
                item
                  Caption = 'Exento'
                  Value = 'E'
                end>
              TabOrder = 7
              Height = 122
              Width = 185
            end
            object cxDBLabel1: TcxDBLabel
              Left = 100
              Top = 128
              DataBinding.DataField = 'DESCRIPCION_FAMILIA'
              DataBinding.DataSource = dsTablaG
              Height = 21
              Width = 693
            end
          end
        end
        object pnlButtonFicha: TPanel
          Left = 0
          Top = 178
          Width = 847
          Height = 457
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 1
          ExplicitTop = 149
          ExplicitHeight = 486
          object pcDetail: TcxPageControl
            Left = 0
            Top = 0
            Width = 847
            Height = 457
            Align = alClient
            TabOrder = 0
            Properties.ActivePage = tsLineasFactura
            Properties.CustomButtons.Buttons = <>
            ExplicitHeight = 486
            ClientRectBottom = 451
            ClientRectLeft = 3
            ClientRectRight = 841
            ClientRectTop = 32
            object tsVariaciones: TcxTabSheet
              Caption = '&0_Variaciones'
              ImageIndex = 4
              TabVisible = False
              object pnlUpVariaciones: TPanel
                Left = 0
                Top = 0
                Width = 838
                Height = 73
                Align = alTop
                TabOrder = 0
                object lbl11: TcxLabel
                  Left = 5
                  Top = 26
                  Margins.Left = 4
                  Margins.Top = 4
                  Margins.Right = 4
                  Margins.Bottom = 4
                  Caption = 'Variaciones'
                  Properties.Alignment.Horz = taRightJustify
                  Transparent = True
                  AnchorX = 107
                end
                object cbbVARIACIONES_ARTICULOS: TcxDBLookupComboBox
                  Left = 123
                  Top = 22
                  DataBinding.DataField = 'CODIGO_FAMILIA_ARTICULO'
                  DataBinding.DataSource = dsTablaG
                  Properties.KeyFieldNames = 'CODIGO_VARIACION'
                  Properties.ListColumns = <
                    item
                      FieldName = 'CODIGO_VARIACION'
                    end
                    item
                      FieldName = 'NOMBRE_VARIACION'
                    end>
                  Properties.ListOptions.ShowHeader = False
                  TabOrder = 1
                  Width = 322
                end
              end
              object pnlBodyVariaciones: TPanel
                Left = 0
                Top = 73
                Width = 838
                Height = 346
                Align = alClient
                TabOrder = 1
                ExplicitHeight = 375
                object pnlRightVariacion: TPanel
                  Left = 629
                  Top = 1
                  Width = 208
                  Height = 344
                  Align = alRight
                  TabOrder = 0
                  ExplicitHeight = 373
                end
                object pnlBodyVariacion: TPanel
                  Left = 1
                  Top = 1
                  Width = 628
                  Height = 344
                  Align = alClient
                  TabOrder = 1
                  ExplicitHeight = 373
                  object cxGrid1: TcxGrid
                    Left = 1
                    Top = 1
                    Width = 626
                    Height = 342
                    Margins.Left = 4
                    Margins.Top = 4
                    Margins.Right = 4
                    Margins.Bottom = 4
                    Align = alClient
                    TabOrder = 0
                    ExplicitHeight = 371
                    object tvVariaciones: TcxGridDBTableView
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
                      DataController.Summary.FooterSummaryItems = <>
                      DataController.Summary.SummaryGroups = <>
                      OptionsBehavior.AlwaysShowEditor = True
                      OptionsBehavior.GoToNextCellOnEnter = True
                      OptionsBehavior.IncSearch = True
                      OptionsCustomize.ColumnHiding = True
                      OptionsData.Inserting = False
                      OptionsView.GroupByBox = False
                      OptionsView.Indicator = True
                      object dbcVariacionesCODIGO_VARIACION: TcxGridDBColumn
                        DataBinding.FieldName = 'CODIGO_VARIACION'
                        Width = 176
                      end
                      object dbcVariacionesCODIGO_ARTICULO: TcxGridDBColumn
                        Caption = 'C'#243'digo Art'#237'culo'
                        DataBinding.FieldName = 'CODIGO_ARTICULO'
                        Visible = False
                      end
                      object dbcVariacionesNOMBRE_COLUMNA: TcxGridDBColumn
                        Caption = 'Nombre Columna'
                        DataBinding.FieldName = 'NOMBRE_COLUMNA'
                        Width = 104
                      end
                      object dbcVariacionesCODIGO_UNICO: TcxGridDBColumn
                        Caption = 'C'#243'digo '#218'nico'
                        DataBinding.FieldName = 'CODIGO_UNICO'
                        Width = 139
                      end
                      object dbcVariacionesVALOR_VARIACION: TcxGridDBColumn
                        Caption = 'Valor'
                        DataBinding.FieldName = 'VALOR_VARIACION'
                        Width = 162
                      end
                      object dbcVariacionesNOMBRE_VARIACION: TcxGridDBColumn
                        DataBinding.FieldName = 'NOMBRE_VARIACION'
                        Width = 180
                      end
                      object dbcVariacionesACTIVO_VARIACION: TcxGridDBColumn
                        DataBinding.FieldName = 'ACTIVO_VARIACION'
                      end
                      object dbcVariacionesORDEN_VARIACION: TcxGridDBColumn
                        DataBinding.FieldName = 'ORDEN_VARIACION'
                      end
                    end
                    object lv1: TcxGridLevel
                      GridView = tvVariaciones
                    end
                  end
                end
              end
            end
            object tsTarifas: TcxTabSheet
              Caption = '&1_Tarifas'
              ImageIndex = 1
              ExplicitLeft = 0
              ExplicitTop = 0
              ExplicitWidth = 0
              ExplicitHeight = 448
              object cxgrdTarifas: TcxGrid
                Left = 0
                Top = 0
                Width = 722
                Height = 419
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                Align = alClient
                TabOrder = 0
                ExplicitHeight = 448
                object tvTarifas: TcxGridDBTableView
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
                  DataController.Summary.FooterSummaryItems = <>
                  DataController.Summary.SummaryGroups = <>
                  OptionsBehavior.AlwaysShowEditor = True
                  OptionsBehavior.GoToNextCellOnEnter = True
                  OptionsBehavior.IncSearch = True
                  OptionsCustomize.ColumnHiding = True
                  OptionsData.Inserting = False
                  OptionsView.GroupByBox = False
                  OptionsView.Indicator = True
                  object cxgrdbclmnTarifasCODIGO_TARIFA: TcxGridDBColumn
                    Caption = 'C'#243'digo Tarifa'
                    DataBinding.FieldName = 'CODIGO_TARIFA'
                    PropertiesClassName = 'TcxTextEditProperties'
                    Properties.ReadOnly = True
                    Width = 129
                  end
                  object cxgrdbclmnTarifasNOMBRE_TARIFA: TcxGridDBColumn
                    Caption = 'Nombre Tarifa'
                    DataBinding.FieldName = 'NOMBRE_TARIFA'
                    PropertiesClassName = 'TcxTextEditProperties'
                    Properties.ReadOnly = True
                    Width = 145
                  end
                  object dbcTarifasESIMP_INCL_TARIFA: TcxGridDBColumn
                    Caption = 'Imp. Incl.'
                    DataBinding.FieldName = 'ESIMP_INCL_TARIFA'
                    PropertiesClassName = 'TcxCheckBoxProperties'
                    Properties.ValueChecked = 'S'
                    Properties.ValueUnchecked = 'N'
                    Width = 86
                  end
                  object cxgrdbclmnTarifasCODIGO_ARTICULO_TARIFA: TcxGridDBColumn
                    DataBinding.FieldName = 'CODIGO_ARTICULO_TARIFA'
                    Visible = False
                    VisibleForCustomization = False
                  end
                  object cxgrdbclmnTarifasDESCRIPCION_ARTICULO: TcxGridDBColumn
                    DataBinding.FieldName = 'DESCRIPCION_ARTICULO'
                    Visible = False
                    VisibleForCustomization = False
                  end
                  object cxgrdbclmnTarifasTIPO_CANTIDAD_ARTICULO: TcxGridDBColumn
                    DataBinding.FieldName = 'TIPO_CANTIDAD_ARTICULO'
                    Visible = False
                    VisibleForCustomization = False
                  end
                  object dbcTarifasPRECIOSALIDA: TcxGridDBColumn
                    Caption = 'Precio Salida'
                    DataBinding.FieldName = 'PRECIOSALIDA_TARIFA'
                    PropertiesClassName = 'TcxCurrencyEditProperties'
                    Properties.OnEditValueChanged = dbcTarifasPRECIOSALIDAPropertiesEditValueChanged
                    Width = 113
                  end
                  object dbcTarifasPORCEN_DTO_TARIFA: TcxGridDBColumn
                    Caption = '% Descuento'
                    DataBinding.FieldName = 'PORCEN_DTO_TARIFA'
                    PropertiesClassName = 'TcxSpinEditProperties'
                    Properties.DisplayFormat = '#.## %'
                    Properties.EditFormat = '#,## %'
                    Properties.OnEditValueChanged = dbcTarifasPORCEN_DTO_TARIFAPropertiesEditValueChanged
                    Width = 124
                  end
                  object dbcTarifasPRECIO_DTO_TARIFA: TcxGridDBColumn
                    Caption = 'Cantidad Descuento'
                    DataBinding.FieldName = 'PRECIO_DTO_TARIFA'
                    PropertiesClassName = 'TcxCurrencyEditProperties'
                    Properties.OnEditValueChanged = dbcTarifasPRECIO_DTO_TARIFAPropertiesEditValueChanged
                    Width = 174
                  end
                  object dbcTarifasPRECIOFINAL: TcxGridDBColumn
                    Caption = 'Precio Final'
                    DataBinding.FieldName = 'PRECIOFINAL_TARIFA'
                    PropertiesClassName = 'TcxCurrencyEditProperties'
                    Properties.OnEditValueChanged = dbcTarifasPRECIOFINALPropertiesEditValueChanged
                    Width = 129
                  end
                  object cxgrdbclmnTarifasTIPO_IVA_ARTICULO: TcxGridDBColumn
                    DataBinding.FieldName = 'TIPO_IVA_ARTICULO'
                    Visible = False
                    VisibleForCustomization = False
                  end
                  object cxgrdbclmnTarifasACTIVO_TARIFA: TcxGridDBColumn
                    Caption = 'Tarifa Activa'
                    DataBinding.FieldName = 'ACTIVO_TARIFA'
                    PropertiesClassName = 'TcxCheckBoxProperties'
                    Properties.ValueChecked = 'S'
                    Properties.ValueUnchecked = 'N'
                    Width = 110
                  end
                  object cxgrdbclmnTarifasFECHA_DESDE_TARIFA: TcxGridDBColumn
                    Caption = 'Fecha Desde'
                    DataBinding.FieldName = 'FECHA_DESDE_TARIFA'
                    Width = 112
                  end
                  object cxgrdbclmnTarifasFECHA_HASTA_TARIFA: TcxGridDBColumn
                    Caption = 'Fecha Hasta'
                    DataBinding.FieldName = 'FECHA_HASTA_TARIFA'
                    Width = 107
                  end
                  object dbcTarifasESDEFAULT_TARIFA: TcxGridDBColumn
                    Caption = 'Tarifa x Defecto'
                    DataBinding.FieldName = 'ESDEFAULT_TARIFA'
                    PropertiesClassName = 'TcxCheckBoxProperties'
                    Properties.ValueChecked = 'S'
                    Properties.ValueUnchecked = 'N'
                    Width = 142
                  end
                  object cxgrdbclmnTarifasCODIGO_PROVEEDOR: TcxGridDBColumn
                    Caption = 'C'#243'digo Proveedor'
                    DataBinding.FieldName = 'CODIGO_PROVEEDOR'
                    PropertiesClassName = 'TcxTextEditProperties'
                    Properties.ReadOnly = True
                    Width = 156
                  end
                  object cxgrdbclmnTarifasRAZONSOCIAL_PROVEEDOR: TcxGridDBColumn
                    DataBinding.FieldName = 'RAZONSOCIAL_PROVEEDOR'
                    PropertiesClassName = 'TcxTextEditProperties'
                    Properties.ReadOnly = True
                    Width = 231
                  end
                  object cxgrdbclmnTarifasPRECIO_ULT_COMPRA: TcxGridDBColumn
                    Caption = 'Precio '#218'lt Compra'
                    DataBinding.FieldName = 'PRECIO_ULT_COMPRA'
                    PropertiesClassName = 'TcxCurrencyEditProperties'
                    Properties.ReadOnly = True
                    Width = 156
                  end
                  object cxgrdbclmnTarifasFECHA_VALIDEZ: TcxGridDBColumn
                    Caption = 'Fecha Validez'
                    DataBinding.FieldName = 'FECHA_VALIDEZ'
                    PropertiesClassName = 'TcxDateEditProperties'
                    Properties.ReadOnly = True
                    Width = 121
                  end
                  object cxgrdbclmnTarifasCODIGO_FAMILIA_ARTICULO: TcxGridDBColumn
                    Caption = 'Familia'
                    DataBinding.FieldName = 'CODIGO_FAMILIA_ARTICULO'
                    PropertiesClassName = 'TcxTextEditProperties'
                    Properties.ReadOnly = True
                  end
                  object cxgrdbclmnTarifasDESCRIPCION_FAMILIA: TcxGridDBColumn
                    Caption = 'Descripci'#243'n Familia'
                    DataBinding.FieldName = 'DESCRIPCION_FAMILIA'
                    PropertiesClassName = 'TcxTextEditProperties'
                    Properties.ReadOnly = True
                    Width = 301
                  end
                  object cxgrdbclmnTarifasINSTANTEALTA: TcxGridDBColumn
                    DataBinding.FieldName = 'INSTANTEALTA'
                    Visible = False
                  end
                  object cxgrdbclmnTarifasINSTANTEMODIF: TcxGridDBColumn
                    DataBinding.FieldName = 'INSTANTEMODIF'
                    Visible = False
                  end
                  object cxgrdbclmnTarifasUSUARIOALTA: TcxGridDBColumn
                    DataBinding.FieldName = 'USUARIOALTA'
                    Visible = False
                  end
                  object cxgrdbclmnTarifasUSUARIOMODIF: TcxGridDBColumn
                    DataBinding.FieldName = 'USUARIOMODIF'
                    Visible = False
                  end
                  object dbcTarifasCODIGO_UNICO_TARIFA: TcxGridDBColumn
                    DataBinding.FieldName = 'CODIGO_UNICO_TARIFA'
                    Visible = False
                  end
                end
                object cxgrdlvlTarifas: TcxGridLevel
                  GridView = tvTarifas
                end
              end
              object pnlFacturaOpts2: TPanel
                Left = 722
                Top = 0
                Width = 116
                Height = 419
                Align = alRight
                BevelOuter = bvNone
                TabOrder = 1
                ExplicitHeight = 448
                object btnIraTarifa: TcxButton
                  Left = 6
                  Top = 16
                  Width = 105
                  Height = 34
                  Caption = 'Ir a &Tarifa'
                  TabOrder = 0
                  OnClick = btnIraTarifaClick
                end
                object btnCrearTarifa: TcxButton
                  Left = 7
                  Top = 56
                  Width = 104
                  Height = 34
                  Caption = 'C&rear Tarifa'
                  TabOrder = 1
                  OnClick = btnCrearTarifaClick
                end
                object btnExportarTarifa: TcxButton
                  Left = 6
                  Top = 96
                  Width = 105
                  Height = 34
                  Caption = '&Exp Excel'
                  TabOrder = 2
                  OnClick = btnExportarTarifaClick
                end
              end
            end
            object tsProveedores: TcxTabSheet
              Caption = '&2_Proveedores'
              ImageIndex = 2
              ExplicitLeft = 0
              ExplicitTop = 0
              ExplicitWidth = 0
              ExplicitHeight = 448
              object cxgrdProveedores: TcxGrid
                Left = 0
                Top = 0
                Width = 717
                Height = 419
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                Align = alClient
                TabOrder = 0
                ExplicitHeight = 448
                object tvProveedores: TcxGridDBTableView
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
                  DataController.Summary.FooterSummaryItems = <>
                  DataController.Summary.SummaryGroups = <>
                  OptionsBehavior.AlwaysShowEditor = True
                  OptionsBehavior.GoToNextCellOnEnter = True
                  OptionsBehavior.IncSearch = True
                  OptionsCustomize.ColumnHiding = True
                  OptionsData.CancelOnExit = False
                  OptionsData.DeletingConfirmation = False
                  OptionsData.Inserting = False
                  OptionsView.GroupByBox = False
                  OptionsView.Indicator = True
                  object cxgrdbclmnProveedoresCODIGO_PROVEEDOR: TcxGridDBColumn
                    Caption = 'C'#243'digo Proveedor'
                    DataBinding.FieldName = 'CODIGO_PROVEEDOR'
                    PropertiesClassName = 'TcxButtonEditProperties'
                    Properties.Buttons = <
                      item
                        Default = True
                        Kind = bkEllipsis
                      end>
                    Properties.OnButtonClick = cxgrdbclmnProveedoresCODIGO_PROVEEDORPropertiesButtonClick
                    Width = 158
                  end
                  object cxgrdbclmnProveedoresRAZONSOCIAL_PROVEEDOR: TcxGridDBColumn
                    Caption = 'Raz'#243'n Social Proveedor'
                    DataBinding.FieldName = 'RAZONSOCIAL_PROVEEDOR'
                    PropertiesClassName = 'TcxTextEditProperties'
                    Properties.ReadOnly = True
                    Width = 221
                  end
                  object cxgrdbclmnProveedoresESPROVEEDORPRINCIPAL: TcxGridDBColumn
                    Caption = 'Es Proveedor Principal'
                    DataBinding.FieldName = 'ESPROVEEDORPRINCIPAL'
                    PropertiesClassName = 'TcxCheckBoxProperties'
                    Properties.ValueChecked = 'S'
                    Properties.ValueUnchecked = 'N'
                    Width = 202
                  end
                  object cxgrdbclmnProveedoresCODIGO_ARTICULO: TcxGridDBColumn
                    DataBinding.FieldName = 'CODIGO_ARTICULO'
                    Visible = False
                    VisibleForCustomization = False
                  end
                  object cxgrdbclmnProveedoresPRECIO_ULT_COMPRA: TcxGridDBColumn
                    Caption = 'Precio '#218'ltima Compra'
                    DataBinding.FieldName = 'PRECIO_ULT_COMPRA'
                    Width = 194
                  end
                  object cxgrdbclmnProveedoresFECHA_VALIDEZ: TcxGridDBColumn
                    Caption = 'Fecha '#250'ltimo Precio'
                    DataBinding.FieldName = 'FECHA_VALIDEZ'
                    Width = 174
                  end
                  object cxgrdbclmnProveedoresINSTANTEMODIF: TcxGridDBColumn
                    DataBinding.FieldName = 'INSTANTEMODIF'
                    Visible = False
                    VisibleForCustomization = False
                  end
                  object cxgrdbclmnProveedoresINSTANTEALTA: TcxGridDBColumn
                    DataBinding.FieldName = 'INSTANTEALTA'
                    Visible = False
                    VisibleForCustomization = False
                  end
                  object cxgrdbclmnProveedoresUSUARIOALTA: TcxGridDBColumn
                    DataBinding.FieldName = 'USUARIOALTA'
                    Visible = False
                    VisibleForCustomization = False
                  end
                  object cxgrdbclmnProveedoresUSUARIOMODIF: TcxGridDBColumn
                    DataBinding.FieldName = 'USUARIOMODIF'
                    Visible = False
                    VisibleForCustomization = False
                  end
                end
                object cxgrdlvlProveedores: TcxGridLevel
                  GridView = tvProveedores
                end
              end
              object pnlFacturaOpts1: TPanel
                Left = 717
                Top = 0
                Width = 121
                Height = 419
                Align = alRight
                TabOrder = 1
                ExplicitHeight = 448
                object btnIraProveedor: TcxButton
                  Left = 5
                  Top = 61
                  Width = 116
                  Height = 34
                  Caption = '&Ir a Proveedor'
                  TabOrder = 0
                  OnClick = btnIraProveedorClick
                end
                object btnExportarProveedor: TcxButton
                  Left = 5
                  Top = 101
                  Width = 116
                  Height = 34
                  Caption = '&Exp Excel'
                  TabOrder = 1
                  OnClick = btnExportarProveedorClick
                end
                object btnAddProveedor: TcxButton
                  Left = 5
                  Top = 21
                  Width = 116
                  Height = 34
                  Caption = '&A'#241'adir'
                  TabOrder = 2
                  OnClick = btnAddProveedorClick
                end
              end
            end
            object tsLineasFactura: TcxTabSheet
              Caption = '&3_Lineas de Facturas - '
              ImageIndex = 3
              ExplicitLeft = 0
              ExplicitTop = 0
              ExplicitWidth = 0
              ExplicitHeight = 448
              object cxgrdLinFac: TcxGrid
                Left = 0
                Top = 0
                Width = 725
                Height = 419
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                Align = alClient
                TabOrder = 0
                ExplicitHeight = 448
                object tvLinFac: TcxGridDBTableView
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
                      Format = '#.##'
                      Kind = skSum
                      Column = cxgrdbclmnLinFacCANTIDAD_FACTURA_LINEA
                    end
                    item
                      Format = '##,##.00 '#8364
                      Kind = skSum
                      Column = cxgrdbclmnLinFacTOTAL_FACTURA_LINEA
                    end>
                  DataController.Summary.SummaryGroups = <>
                  OptionsBehavior.AlwaysShowEditor = True
                  OptionsBehavior.GoToNextCellOnEnter = True
                  OptionsBehavior.IncSearch = True
                  OptionsCustomize.ColumnHiding = True
                  OptionsData.CancelOnExit = False
                  OptionsData.Deleting = False
                  OptionsData.DeletingConfirmation = False
                  OptionsData.Editing = False
                  OptionsData.Inserting = False
                  OptionsView.Footer = True
                  OptionsView.GroupByBox = False
                  OptionsView.Indicator = True
                  object cxgrdbclmnLinFacNRO_FACTURA_LINEA: TcxGridDBColumn
                    Caption = 'Nro Factura'
                    DataBinding.FieldName = 'NRO_FACTURA_LINEA'
                    Width = 119
                  end
                  object cxgrdbclmnLinFacSERIE_FACTURA_LINEA: TcxGridDBColumn
                    Caption = 'Serie Factura'
                    DataBinding.FieldName = 'SERIE_FACTURA_LINEA'
                    Width = 141
                  end
                  object cxgrdbclmnLinFacLINEA_FACTURA_LINEA: TcxGridDBColumn
                    Caption = 'Nro Linea'
                    DataBinding.FieldName = 'LINEA_FACTURA_LINEA'
                    Width = 109
                  end
                  object cxgrdbclmnLinFacTIPO_CANTIDAD_ARTICULO_FACTURA_LINEA: TcxGridDBColumn
                    Caption = 'Tipo Cantidad'
                    DataBinding.FieldName = 'TIPO_CANTIDAD_ARTICULO_FACTURA_LINEA'
                    Width = 134
                  end
                  object cxgrdbclmnLinFacCANTIDAD_FACTURA_LINEA: TcxGridDBColumn
                    Caption = 'Cantidad'
                    DataBinding.FieldName = 'CANTIDAD_FACTURA_LINEA'
                    Width = 82
                  end
                  object cxgrdbclmnLinFacDESCRIPCION_ARTICULO_FACTURA_LINEA: TcxGridDBColumn
                    Caption = 'Descripci'#243'n Linea'
                    DataBinding.FieldName = 'DESCRIPCION_ARTICULO_FACTURA_LINEA'
                    Width = 155
                  end
                  object cxgrdbclmnLinFacNOMBRE_TARIFA: TcxGridDBColumn
                    Caption = 'Tarifa Aplicada'
                    DataBinding.FieldName = 'NOMBRE_TARIFA'
                    Width = 143
                  end
                  object cxgrdbclmnLinFacESIMP_INCL_TARIFA_FACTURA_LINEA: TcxGridDBColumn
                    Caption = 'Precio Imp. Incl.'
                    DataBinding.FieldName = 'ESIMP_INCL_TARIFA_FACTURA_LINEA'
                    PropertiesClassName = 'TcxCheckBoxProperties'
                    Properties.ValueChecked = 'S'
                    Properties.ValueUnchecked = 'N'
                    Width = 137
                  end
                  object cxgrdbclmnLinFacPRECIOVENTA_SIVA_ARTICULO_FACTURA_LINEA: TcxGridDBColumn
                    Caption = 'Precio sin IVA'
                    DataBinding.FieldName = 'PRECIOVENTA_SIVA_ARTICULO_FACTURA_LINEA'
                    PropertiesClassName = 'TcxCurrencyEditProperties'
                    Width = 131
                  end
                  object cxgrdbclmnLinFacTIPOIVA_ARTICULO_FACTURA_LINEA: TcxGridDBColumn
                    Caption = 'Tipo IVA'
                    DataBinding.FieldName = 'TIPOIVA_ARTICULO_FACTURA_LINEA'
                    Width = 108
                  end
                  object cxgrdbclmnLinFacPORCEN_IVA_FACTURA_LINEA: TcxGridDBColumn
                    Caption = '% IVA'
                    DataBinding.FieldName = 'PORCEN_IVA_FACTURA_LINEA'
                    PropertiesClassName = 'TcxSpinEditProperties'
                    Properties.DisplayFormat = '0.00 %'
                    Properties.EditFormat = '0.00 %'
                    Properties.MaxValue = 100.000000000000000000
                    Properties.ValueType = vtFloat
                    Width = 80
                  end
                  object cxgrdbclmnLinFacPRECIOVENTA_CIVA_ARTICULO_FACTURA_LINEA: TcxGridDBColumn
                    Caption = 'Precio Con IVA'
                    DataBinding.FieldName = 'PRECIOVENTA_CIVA_ARTICULO_FACTURA_LINEA'
                    PropertiesClassName = 'TcxCurrencyEditProperties'
                    Width = 152
                  end
                  object cxgrdbclmnLinFacCODIGO_ARTICULO_FACTURA_LINEA: TcxGridDBColumn
                    DataBinding.FieldName = 'CODIGO_ARTICULO_FACTURA_LINEA'
                    Visible = False
                    VisibleForCustomization = False
                  end
                  object cxgrdbclmnLinFacCODIGO_FAMILIA_FACTURA_LINEA: TcxGridDBColumn
                    DataBinding.FieldName = 'CODIGO_FAMILIA_FACTURA_LINEA'
                    Visible = False
                    VisibleForCustomization = False
                  end
                  object cxgrdbclmnLinFacNOMBRE_FAMILIA_FACTURA_LINEA: TcxGridDBColumn
                    DataBinding.FieldName = 'NOMBRE_FAMILIA_FACTURA_LINEA'
                    Visible = False
                    VisibleForCustomization = False
                  end
                  object cxgrdbclmnLinFacTOTAL_FACTURA_LINEA: TcxGridDBColumn
                    Caption = 'Total Linea'
                    DataBinding.FieldName = 'TOTAL_FACTURA_LINEA'
                    PropertiesClassName = 'TcxCurrencyEditProperties'
                    Width = 118
                  end
                  object cxgrdbclmnLinFacFECHA_ENTREGA_FACTURA_LINEA: TcxGridDBColumn
                    Caption = 'Fecha Entrega'
                    DataBinding.FieldName = 'FECHA_ENTREGA_FACTURA_LINEA'
                    PropertiesClassName = 'TcxDateEditProperties'
                    Width = 136
                  end
                end
                object cxgrdlvlLinFac: TcxGridLevel
                  GridView = tvLinFac
                end
              end
              object pnlFacturaOpts: TPanel
                Left = 725
                Top = 0
                Width = 113
                Height = 419
                Align = alRight
                TabOrder = 1
                ExplicitHeight = 448
                object btnIraFactura: TcxButton
                  Left = 6
                  Top = 16
                  Width = 104
                  Height = 34
                  Caption = 'Ir a F&actura'
                  TabOrder = 0
                  OnClick = btnIraFacturaClick
                end
                object btnIraEmpresa: TcxButton
                  Left = 7
                  Top = 56
                  Width = 104
                  Height = 34
                  Caption = 'Ir a &Empresa'
                  TabOrder = 1
                  OnClick = btnIraEmpresaClick
                end
                object btnExportarLineas: TcxButton
                  Left = 6
                  Top = 138
                  Width = 104
                  Height = 34
                  Caption = '&Exp Excel'
                  TabOrder = 2
                end
                object btnIraCliente: TcxButton
                  Left = 7
                  Top = 96
                  Width = 104
                  Height = 34
                  Caption = 'Ir a C&liente'
                  TabOrder = 3
                  OnClick = btnIraClienteClick
                end
              end
            end
            object tsOtros: TcxTabSheet
              Caption = '&4_Otros'
              ImageIndex = 3
              object pnl3: TPanel
                Left = 0
                Top = 340
                Width = 838
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
                  Left = 163
                  Top = 9
                  Margins.Left = 4
                  Margins.Top = 4
                  Margins.Right = 4
                  Margins.Bottom = 4
                  Caption = 'Instante Alta'
                  Transparent = True
                end
                object cxdbtxtdtUSUARIOALTA: TcxDBTextEdit
                  Left = 163
                  Top = 37
                  Margins.Left = 4
                  Margins.Top = 4
                  Margins.Right = 4
                  Margins.Bottom = 4
                  DataBinding.DataField = 'INSTANTEALTA'
                  DataBinding.DataSource = dsTablaG
                  Properties.ReadOnly = True
                  TabOrder = 3
                  Width = 192
                end
                object cxdbtxtdtINSTANTEALTA: TcxDBTextEdit
                  Left = 511
                  Top = 37
                  Margins.Left = 4
                  Margins.Top = 4
                  Margins.Right = 4
                  Margins.Bottom = 4
                  DataBinding.DataField = 'INSTANTEMODIF'
                  DataBinding.DataSource = dsTablaG
                  Properties.ReadOnly = True
                  TabOrder = 7
                  Width = 198
                end
                object lblInstanteModif: TcxLabel
                  Left = 514
                  Top = 9
                  Margins.Left = 4
                  Margins.Top = 4
                  Margins.Right = 4
                  Margins.Bottom = 4
                  Caption = 'Instante Modificaci'#243'n'
                  Transparent = True
                end
                object cxdbtxtdtUSUARIOALTA1: TcxDBTextEdit
                  Left = 359
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
                  Left = 359
                  Top = 9
                  Margins.Left = 4
                  Margins.Top = 4
                  Margins.Right = 4
                  Margins.Bottom = 4
                  Caption = 'Us '#218'lt. Modif.'
                  Transparent = True
                end
              end
              object chkACTIVO_ARTICULO: TcxDBCheckBox
                Left = 48
                Top = 24
                Caption = 'Es Activo fijo --Es Maquinaria o Aperos-- (S'#243'lo REAGP)'
                DataBinding.DataField = 'ESACTIVO_FIJO_ARTICULO'
                DataBinding.DataSource = dsTablaG
                Properties.ValueChecked = 'S'
                Properties.ValueUnchecked = 'N'
                TabOrder = 1
                Transparent = True
              end
              object cxdbtxtdtTIPO_CANTIDAD_ARTICULO: TcxDBTextEdit
                Left = 184
                Top = 109
                DataBinding.DataField = 'TIPO_CANTIDAD_ARTICULO'
                DataBinding.DataSource = dsTablaG
                TabOrder = 2
                Width = 130
              end
              object lblNombre1: TcxLabel
                Left = 30
                Top = 110
                Caption = 'Tipo de Cantidad'
                Transparent = True
              end
              object lblTextoLegal11: TcxLabel
                Left = 376
                Top = 110
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                Caption = 'Orden en Listados'
                Transparent = True
              end
              object cxdbspndtORDEN_CLIENTE: TcxDBSpinEdit
                Left = 537
                Top = 106
                DataBinding.DataField = 'ORDEN_ARTICULO'
                DataBinding.DataSource = dsTablaG
                TabOrder = 5
                Width = 106
              end
            end
          end
        end
        object splSplitterFicha: TcxSplitter
          Left = 0
          Top = 174
          Width = 847
          Height = 4
          HotZoneClassName = 'TcxMediaPlayer9Style'
          AlignSplitter = salTop
          Control = pnlButtonFicha
          ExplicitTop = 145
          ExplicitWidth = 4
        end
      end
      inherited tsPerfil: TcxTabSheet
        ExplicitWidth = 847
        ExplicitHeight = 635
        inherited pnlPerfilTop: TPanel
          Width = 847
          ExplicitWidth = 847
          inherited edtPerfilBusq: TcxTextEdit
            ExplicitHeight = 27
          end
        end
        inherited pnlPerfilDetail: TPanel
          Width = 847
          Height = 578
          ExplicitWidth = 847
          ExplicitHeight = 578
          inherited cxgrdPerfil: TcxGrid
            Width = 847
            Height = 578
            ExplicitWidth = 847
            ExplicitHeight = 578
          end
        end
      end
    end
    inherited pnlTopPage: TPanel
      Width = 856
      TabOrder = 0
      ExplicitWidth = 856
      inherited pnlTopGrid: TPanel
        Width = 856
        ExplicitWidth = 856
        inherited edtBusqGlobal: TcxTextEdit
          ExplicitHeight = 27
        end
        inherited rbBBDD: TcxRadioButton
          Top = 3
          Font.Name = 'Calibri'
          Font.Quality = fqClearTypeNatural
          ExplicitTop = 3
        end
        inherited rbGrid: TcxRadioButton
          Font.Name = 'Calibri'
        end
      end
    end
  end
  inherited pButtonRightBar: TPanel
    Left = 856
    Height = 713
    TabOrder = 1
    ExplicitLeft = 856
    ExplicitHeight = 713
    inherited pButtonGen: TPanel
      Top = 515
      ExplicitTop = 515
    end
    object btnNuevoArticulo: TcxButton
      Left = 1
      Top = 157
      Width = 138
      Height = 25
      Caption = '&Nuevo Art'#237'culo'
      TabOrder = 2
      OnClick = btnNuevoArticuloClick
    end
  end
  inherited Localizer1: TcxLocalizer
    Left = 176
    Top = 288
  end
  inherited dsTablaG: TDataSource
    Left = 324
    Top = 287
  end
  object ActionListArticulos: TActionList [4]
    Left = 464
    Top = 288
    object actFacturas: TAction
      Caption = 'actFacturas'
      ShortCut = 16454
      OnExecute = actFacturasExecute
    end
    object actEmpresas: TAction
      ShortCut = 16453
      OnExecute = actEmpresasExecute
    end
    object actClientes: TAction
      Caption = 'actClientes'
      ShortCut = 16459
      OnExecute = actClientesExecute
    end
    object actProveedores: TAction
      Caption = 'actProveedores'
      ShortCut = 16464
      OnExecute = actProveedoresExecute
    end
    object actTarifas: TAction
      Caption = 'actTarifas'
      ShortCut = 16468
      OnExecute = actTarifasExecute
    end
  end
end
