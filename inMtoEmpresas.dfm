inherited frmMtoEmpresas: TfrmMtoEmpresas
  Left = 5
  Top = 4
  Margins.Left = 0
  Margins.Top = 0
  Margins.Right = 0
  Margins.Bottom = 0
  Caption = 'Empresas'
  ClientHeight = 643
  ClientWidth = 914
  ExplicitWidth = 914
  ExplicitHeight = 643
  PixelsPerInch = 96
  TextHeight = 19
  inherited pButtonPage: TPanel
    Width = 774
    Height = 643
    BevelOuter = bvNone
    TabOrder = 0
    ExplicitWidth = 774
    ExplicitHeight = 643
    inherited pcPantalla: TcxPageControl
      Left = 0
      Top = 40
      Width = 774
      Height = 603
      TabOrder = 1
      ExplicitWidth = 772
      ExplicitHeight = 601
      ClientRectBottom = 597
      ClientRectRight = 768
      inherited tsLista: TcxTabSheet
        ExplicitWidth = 763
        ExplicitHeight = 563
        inherited cxGrdPrincipal: TcxGrid
          Width = 765
          Height = 565
          ExplicitWidth = 763
          ExplicitHeight = 563
          inherited cxGrdDBTabPrin: TcxGridDBTableView
            object cxgrdbclmnGrdDBTabPrinCODIGO_EMPRESA: TcxGridDBColumn
              Caption = 'C'#243'digo'
              DataBinding.FieldName = 'CODIGO_EMPRESA'
              Styles.Header = frmOpenApp2.StylCab
              Width = 79
            end
            object cxgrdbclmnGrdDBTabPrinORDEN_EMPRESA: TcxGridDBColumn
              Caption = 'Orden'
              DataBinding.FieldName = 'ORDEN_EMPRESA'
              Styles.Header = frmOpenApp2.StylCab
              Width = 70
            end
            object cxgrdbclmnGrdDBTabPrinACTIVA_EMPRESA: TcxGridDBColumn
              Caption = 'Activo'
              DataBinding.FieldName = 'ACTIVO_EMPRESA'
              PropertiesClassName = 'TcxCheckBoxProperties'
              Properties.ValueChecked = 'S'
              Properties.ValueUnchecked = 'N'
              Styles.Header = frmOpenApp2.StylCab
              Width = 71
            end
            object cxgrdbclmnGrdDBTabPrinRAZONSOCIAL_EMPRESA: TcxGridDBColumn
              Caption = 'Raz'#243'n Social'
              DataBinding.FieldName = 'RAZONSOCIAL_EMPRESA'
              Styles.Header = frmOpenApp2.StylCab
              Width = 186
            end
            object cxgrdbclmnGrdDBTabPrinNIF_EMPRESA: TcxGridDBColumn
              Caption = 'Nif'
              DataBinding.FieldName = 'NIF_EMPRESA'
              Styles.Header = frmOpenApp2.StylCab
              Width = 91
            end
            object cxgrdbclmnGrdDBTabPrinMOVIL_EMPRESA: TcxGridDBColumn
              Caption = 'M'#243'vil'
              DataBinding.FieldName = 'MOVIL_EMPRESA'
              Styles.Header = frmOpenApp2.StylCab
              Width = 115
            end
            object cxgrdbclmnGrdDBTabPrinEMAIL_EMPRESA: TcxGridDBColumn
              Caption = 'Email'
              DataBinding.FieldName = 'EMAIL_EMPRESA'
              Styles.Header = frmOpenApp2.StylCab
              Width = 189
            end
            object cxgrdbclmnGrdDBTabPrinDIRECCION1_EMPRESA: TcxGridDBColumn
              Caption = 'Direci'#243'n'
              DataBinding.FieldName = 'DIRECCION1_EMPRESA'
              Styles.Header = frmOpenApp2.StylCab
              Width = 146
            end
            object cxgrdbclmnGrdDBTabPrinDIRECCION2_EMPRESA: TcxGridDBColumn
              Caption = 'M'#225's Direcci'#243'n'
              DataBinding.FieldName = 'DIRECCION2_EMPRESA'
              Styles.Header = frmOpenApp2.StylCab
              Width = 138
            end
            object cxgrdbclmnGrdDBTabPrinPOBLACION_EMPRESA: TcxGridDBColumn
              Caption = 'Poblaci'#243'n'
              DataBinding.FieldName = 'POBLACION_EMPRESA'
              Styles.Header = frmOpenApp2.StylCab
              Width = 132
            end
            object cxgrdbclmnGrdDBTabPrinPROVINCIA_EMPRESA: TcxGridDBColumn
              Caption = 'Provincia'
              DataBinding.FieldName = 'PROVINCIA_EMPRESA'
              Styles.Header = frmOpenApp2.StylCab
              Width = 113
            end
            object cxgrdbclmnGrdDBTabPrinCPOSTAL_EMPRESA: TcxGridDBColumn
              Caption = 'C'#243'digo Postal'
              DataBinding.FieldName = 'CPOSTAL_EMPRESA'
              Styles.Header = frmOpenApp2.StylCab
              Width = 138
            end
            object cxGrdDBTabPrinDESCRIPCION_ZONA_IVA: TcxGridDBColumn
              Caption = 'Zona de IVA principal'
              DataBinding.FieldName = 'DESCRIPCION_ZONA_IVA'
              Styles.Header = frmOpenApp2.StylCab
              Width = 302
            end
            object cxgrdbclmnGrdDBTabPrin_ESREGIMENESPECIALAGRICOLA_EMPRESA: TcxGridDBColumn
              Caption = 'Es REAGP'
              DataBinding.FieldName = 'ESREGIMENESPECIALAGRICOLA_EMPRESA'
              PropertiesClassName = 'TcxCheckBoxProperties'
              Properties.ValueChecked = 'S'
              Properties.ValueUnchecked = 'N'
              Styles.Header = frmOpenApp2.StylCab
              Width = 86
            end
            object cxgrdbclmnGrdDBTabPrinESRETENCIONES_EMPRESA: TcxGridDBColumn
              Caption = 'Aplica Retenciones'
              DataBinding.FieldName = 'ESRETENCIONES_EMPRESA'
              PropertiesClassName = 'TcxCheckBoxProperties'
              Properties.ValueChecked = 'S'
              Properties.ValueUnchecked = 'N'
              Styles.Header = frmOpenApp2.StylCab
              Width = 170
            end
            object cxgrdbclmnGrdDBTabPrinTEXTO_LEGAL_FACTURA_EMPRESA: TcxGridDBColumn
              Caption = 'Texto en Factura'
              DataBinding.FieldName = 'TEXTO_LEGAL_FACTURA_EMPRESA'
              Styles.Header = frmOpenApp2.StylCab
              Width = 366
            end
            object cxgrdbclmnGrdDBTabPrinINSTANTEMODIF: TcxGridDBColumn
              DataBinding.FieldName = 'INSTANTEMODIF'
              Visible = False
              Styles.Header = frmOpenApp2.StylCab
            end
            object cxgrdbclmnGrdDBTabPrinINSTANTEALTA: TcxGridDBColumn
              DataBinding.FieldName = 'INSTANTEALTA'
              Visible = False
              Styles.Header = frmOpenApp2.StylCab
            end
            object cxgrdbclmnGrdDBTabPrinUSUARIOALTA: TcxGridDBColumn
              DataBinding.FieldName = 'USUARIOALTA'
              Visible = False
              Styles.Header = frmOpenApp2.StylCab
              Width = 88
            end
            object cxgrdbclmnGrdDBTabPrinUSUARIOMODIF: TcxGridDBColumn
              DataBinding.FieldName = 'USUARIOMODIF'
              Visible = False
              Styles.Header = frmOpenApp2.StylCab
              Width = 96
            end
            object cxGrdDBTabPrinSERIE_CONTADOR_EMPRESA: TcxGridDBColumn
              Caption = 'Serie por Defecto en Facturas'
              DataBinding.FieldName = 'SERIE_CONTADOR_EMPRESA'
              Styles.Header = frmOpenApp2.StylCab
              Width = 280
            end
            object cxGrdDBTabPrinPAIS_EMPRESA: TcxGridDBColumn
              DataBinding.FieldName = 'PAIS_EMPRESA'
              Visible = False
              Styles.Header = frmOpenApp2.StylCab
            end
            object cxGrdDBTabPrinGRUPO_ZONA_IVA_EMPRESA: TcxGridDBColumn
              DataBinding.FieldName = 'GRUPO_ZONA_IVA_EMPRESA'
              Visible = False
              Styles.Header = frmOpenApp2.StylCab
            end
          end
        end
      end
      inherited tsFicha: TcxTabSheet
        OnEnter = tsFichaEnter
        ExplicitWidth = 763
        ExplicitHeight = 563
        object pnlFichaDetail: TPanel
          Left = 0
          Top = 182
          Width = 765
          Height = 383
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 2
          ExplicitWidth = 763
          ExplicitHeight = 381
          object pcPestana: TcxPageControl
            Left = 0
            Top = 0
            Width = 765
            Height = 383
            Align = alClient
            TabOrder = 0
            Properties.ActivePage = tsSeries
            Properties.CustomButtons.Buttons = <>
            ExplicitLeft = 1
            ExplicitTop = 1
            ExplicitWidth = 761
            ExplicitHeight = 379
            ClientRectBottom = 377
            ClientRectLeft = 3
            ClientRectRight = 759
            ClientRectTop = 32
            object tsMasDatos: TcxTabSheet
              Caption = '&1_M'#225's Datos'
              ImageIndex = 0
              ExplicitWidth = 752
              ExplicitHeight = 341
              DesignSize = (
                756
                345)
              object cxgrpbx1: TcxGroupBox
                AlignWithMargins = True
                Left = 19
                Top = 3
                TabStop = True
                Anchors = [akLeft, akTop, akRight, akBottom]
                PanelStyle.Active = True
                PanelStyle.BorderWidth = 2
                PanelStyle.CaptionIndent = 4
                PanelStyle.OfficeBackgroundKind = pobkGradient
                PanelStyle.WordWrap = True
                TabOrder = 0
                Transparent = True
                ExplicitWidth = 524
                ExplicitHeight = 282
                Height = 286
                Width = 528
                object lblMovil: TcxLabel
                  Left = 51
                  Top = 25
                  Caption = 'M'#243'vil'
                  Transparent = True
                end
                object txtMOVIL_EMPRESA: TcxDBTextEdit
                  Left = 106
                  Top = 21
                  DataBinding.DataField = 'MOVIL_EMPRESA'
                  DataBinding.DataSource = dsTablaG
                  TabOrder = 0
                  Width = 322
                end
                object lblEmail: TcxLabel
                  Left = 51
                  Top = 63
                  Caption = 'Email'
                  Transparent = True
                end
                object lblDireccion: TcxLabel
                  Left = 17
                  Top = 100
                  Caption = 'Direcci'#243'n'
                  Transparent = True
                end
                object txtDIRECCION1_EMPRESA: TcxDBTextEdit
                  Left = 106
                  Top = 96
                  DataBinding.DataField = 'DIRECCION1_EMPRESA'
                  DataBinding.DataSource = dsTablaG
                  TabOrder = 4
                  Width = 322
                end
                object txtEMAIL_EMPRESA: TcxDBTextEdit
                  Left = 106
                  Top = 59
                  DataBinding.DataField = 'EMAIL_EMPRESA'
                  DataBinding.DataSource = dsTablaG
                  TabOrder = 2
                  Width = 322
                end
                object txtDIRECCION2_EMPRESA: TcxDBTextEdit
                  Left = 106
                  Top = 134
                  DataBinding.DataField = 'DIRECCION2_EMPRESA'
                  DataBinding.DataSource = dsTablaG
                  TabOrder = 6
                  Width = 322
                end
                object txtPOBLACION_EMPRESA: TcxDBTextEdit
                  Left = 106
                  Top = 172
                  DataBinding.DataField = 'POBLACION_EMPRESA'
                  DataBinding.DataSource = dsTablaG
                  TabOrder = 7
                  Width = 322
                end
                object lblPoblacion: TcxLabel
                  Left = 15
                  Top = 176
                  Caption = 'Poblaci'#243'n'
                  Transparent = True
                end
                object lblProvincia: TcxLabel
                  Left = 21
                  Top = 213
                  Caption = 'Provincia'
                  Transparent = True
                end
                object txtPROVINCIA_EMPRESA: TcxDBTextEdit
                  Left = 106
                  Top = 209
                  DataBinding.DataField = 'PROVINCIA_EMPRESA'
                  DataBinding.DataSource = dsTablaG
                  TabOrder = 9
                  Width = 322
                end
                object chkRegimenEspecial: TcxDBCheckBox
                  Left = 69
                  Top = 247
                  Caption = 'R'#233'gimen especial agricola/ganadero/pesca'
                  DataBinding.DataField = 'ESREGIMENESPECIALAGRICOLA_EMPRESA'
                  DataBinding.DataSource = dsTablaG
                  Properties.ValueChecked = 'S'
                  Properties.ValueUnchecked = 'N'
                  Properties.OnChange = chkAplicaRetencionesPropertiesChange
                  Style.TransparentBorder = False
                  TabOrder = 11
                  Transparent = True
                end
              end
            end
            object tsRetenciones: TcxTabSheet
              Caption = '&2_Retenciones'
              ImageIndex = 2
              ExplicitWidth = 752
              ExplicitHeight = 341
              object pnlRetenOpts: TPanel
                Left = 646
                Top = 0
                Width = 110
                Height = 345
                Align = alRight
                BevelOuter = bvNone
                TabOrder = 1
                ExplicitLeft = 642
                ExplicitHeight = 341
                object btnAddIRPF: TcxButton
                  Left = 0
                  Top = 13
                  Width = 105
                  Height = 25
                  Caption = '&A'#241'adir IRPF'
                  TabOrder = 0
                  OnClick = btnAddIRPFClick
                end
              end
              object pnlRetencionesCli: TPanel
                Left = 0
                Top = 0
                Width = 646
                Height = 345
                Align = alClient
                BevelOuter = bvNone
                TabOrder = 0
                ExplicitWidth = 642
                ExplicitHeight = 341
                object cxgrdRetenciones: TcxGrid
                  Left = 0
                  Top = 0
                  Width = 646
                  Height = 345
                  Margins.Left = 4
                  Margins.Top = 4
                  Margins.Right = 4
                  Margins.Bottom = 4
                  Align = alClient
                  TabOrder = 0
                  ExplicitLeft = 1
                  ExplicitTop = 1
                  ExplicitWidth = 640
                  ExplicitHeight = 339
                  object tvRetenciones: TcxGridDBTableView
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
                    OptionsData.Appending = True
                    OptionsView.GroupByBox = False
                    OptionsView.Indicator = True
                    object cxgrdbclmntv1CODIGO_RETENCION: TcxGridDBColumn
                      Caption = 'C'#243'digo Retenci'#243'n'
                      DataBinding.FieldName = 'CODIGO_RETENCION'
                      Width = 163
                    end
                    object cxgrdbclmntv1CODIGO_EMPRESA_RETENCION: TcxGridDBColumn
                      DataBinding.FieldName = 'CODIGO_EMPRESA_RETENCION'
                      Visible = False
                      Width = 122
                    end
                    object tvRetencionesPORCENRETENCION_RETENCION: TcxGridDBColumn
                      Caption = '% Retenci'#243'n'
                      DataBinding.FieldName = 'PORCENRETENCION_RETENCION'
                    end
                    object cxgrdbclmntv1FECHA_DESDE_RETENCION: TcxGridDBColumn
                      Caption = 'Fecha Aplicaci'#243'n desde'
                      DataBinding.FieldName = 'FECHA_DESDE_RETENCION'
                      PropertiesClassName = 'TcxDateEditProperties'
                      Width = 151
                    end
                    object cxgrdbclmntv1FECHA_HASTA_RETENCION: TcxGridDBColumn
                      Caption = 'Fecha Aplicaci'#243'n hasta'
                      DataBinding.FieldName = 'FECHA_HASTA_RETENCION'
                      PropertiesClassName = 'TcxDateEditProperties'
                      Width = 150
                    end
                    object cxgrdbclmntv1INSTANTEMODIF: TcxGridDBColumn
                      DataBinding.FieldName = 'INSTANTEMODIF'
                      Visible = False
                    end
                    object cxgrdbclmntv1INSTANTEALTA: TcxGridDBColumn
                      DataBinding.FieldName = 'INSTANTEALTA'
                      Visible = False
                    end
                    object cxgrdbclmntv1USUARIOALTA: TcxGridDBColumn
                      DataBinding.FieldName = 'USUARIOALTA'
                      Visible = False
                    end
                    object cxgrdbclmntv1USUARIOMODIF: TcxGridDBColumn
                      DataBinding.FieldName = 'USUARIOMODIF'
                      Visible = False
                    end
                  end
                  object cxgrdlvlRetenciones: TcxGridLevel
                    GridView = tvRetenciones
                  end
                end
              end
            end
            object tsHistoriaFacturacion: TcxTabSheet
              Caption = '&3_Hist'#243'rico Facturas'
              ImageIndex = 3
              ExplicitWidth = 752
              ExplicitHeight = 341
              object pnlFactura: TPanel
                Left = 0
                Top = 0
                Width = 756
                Height = 345
                Align = alClient
                TabOrder = 0
                ExplicitWidth = 752
                ExplicitHeight = 341
                object cxgrdEmpresasFacturas: TcxGrid
                  Left = 1
                  Top = 1
                  Width = 637
                  Height = 343
                  Margins.Left = 4
                  Margins.Top = 4
                  Margins.Right = 4
                  Margins.Bottom = 4
                  Align = alClient
                  TabOrder = 0
                  ExplicitWidth = 633
                  ExplicitHeight = 339
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
                    object tvLineasFacturacionLINEA_LINEA: TcxGridDBColumn
                      Caption = 'Nro Linea'
                      DataBinding.FieldName = 'LINEA_FACTURA_LINEA'
                      Width = 28
                    end
                    object tvLineasFacturacionCODIGO_ARTICULO_LINEA: TcxGridDBColumn
                      Caption = 'C'#243'digo Art'#237'culo'
                      DataBinding.FieldName = 'CODIGO_ARTICULO_FACTURA_LINEA'
                      Width = 164
                    end
                    object tvLineasFacturacionDESCRIPCION_ARTICULO_LINEA: TcxGridDBColumn
                      Caption = 'Descripci'#243'n'
                      DataBinding.FieldName = 'DESCRIPCION_ARTICULO_FACTURA_LINEA'
                      Width = 162
                    end
                    object tvLineasFacturacionCANTIDAD_LINEA: TcxGridDBColumn
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
                    object dbcLineasFacturacionNOMBRE_TIPO_IVA: TcxGridDBColumn
                      DataBinding.FieldName = 'NOMBRE_TIPO_IVA'
                    end
                    object tvLineasFacturacionPRECIOVENTA_ARTICULO_LINEA: TcxGridDBColumn
                      Caption = 'Precio CIVA'
                      DataBinding.FieldName = 'PRECIOVENTA_CIVA_ARTICULO_FACTURA_LINEA'
                      PropertiesClassName = 'TcxCurrencyEditProperties'
                      Width = 84
                    end
                    object tvLineasFacturacionSUM_TOTAL_LINEA: TcxGridDBColumn
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
                  Left = 638
                  Top = 1
                  Width = 117
                  Height = 343
                  Align = alRight
                  TabOrder = 1
                  ExplicitLeft = 634
                  ExplicitHeight = 339
                  object btIraFactura: TcxButton
                    Left = 6
                    Top = 16
                    Width = 106
                    Height = 34
                    Caption = '&Ir a Factura'
                    TabOrder = 0
                    OnClick = btIraFacturaClick
                  end
                  object btnIraCliente: TcxButton
                    Left = 7
                    Top = 56
                    Width = 105
                    Height = 34
                    Caption = 'I&r a Cliente'
                    TabOrder = 1
                    OnClick = btnIraClienteClick
                  end
                  object btExportarExcel: TcxButton
                    Left = 5
                    Top = 136
                    Width = 106
                    Height = 34
                    Caption = 'Exp. Excel'
                    TabOrder = 3
                    OnClick = btExportarExcelClick
                  end
                  object btnIraArticulo: TcxButton
                    Left = 7
                    Top = 96
                    Width = 105
                    Height = 34
                    Caption = 'I&r a Art'#237'culo'
                    TabOrder = 2
                    OnClick = btnIraArticuloClick
                  end
                end
              end
            end
            object tsSeries: TcxTabSheet
              Caption = '&4_Series'
              ImageIndex = 4
              ExplicitWidth = 752
              ExplicitHeight = 341
              object pnlSeriesOpts: TPanel
                Left = 638
                Top = 0
                Width = 118
                Height = 345
                Align = alRight
                BevelOuter = bvNone
                TabOrder = 1
                ExplicitLeft = 634
                ExplicitHeight = 341
                object btnAddSerie: TcxButton
                  Left = 6
                  Top = 13
                  Width = 108
                  Height = 25
                  Caption = 'A'#241'adir Serie'
                  TabOrder = 0
                  OnClick = btnAddSerieClick
                end
              end
              object pnlSeriesCli: TPanel
                Left = 0
                Top = 0
                Width = 638
                Height = 345
                Align = alClient
                BevelOuter = bvNone
                TabOrder = 0
                ExplicitWidth = 634
                ExplicitHeight = 341
                object cxGrdSeries: TcxGrid
                  Left = 0
                  Top = 0
                  Width = 638
                  Height = 345
                  Margins.Left = 4
                  Margins.Top = 4
                  Margins.Right = 4
                  Margins.Bottom = 4
                  Align = alClient
                  TabOrder = 0
                  ExplicitLeft = 1
                  ExplicitTop = 1
                  ExplicitWidth = 632
                  ExplicitHeight = 339
                  object tvSeries: TcxGridDBTableView
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
                    OptionsData.Appending = True
                    OptionsView.GroupByBox = False
                    OptionsView.Indicator = True
                    object dbcCODIGO_SERIE: TcxGridDBColumn
                      Caption = 'Serie'
                      DataBinding.FieldName = 'SERIE_SERIE'
                      Width = 163
                    end
                    object dbcCODIGO_EMPRESA: TcxGridDBColumn
                      DataBinding.FieldName = 'CODIGO_EMPRESA_SERIE'
                      Visible = False
                      Width = 122
                    end
                    object dbccxgrdbclmntv1FECHA_DESDE_SERIE: TcxGridDBColumn
                      Caption = 'Fecha Aplicaci'#243'n desde'
                      DataBinding.FieldName = 'FECHA_DESDE_SERIE'
                      PropertiesClassName = 'TcxDateEditProperties'
                      Width = 208
                    end
                    object dbcFECHA_HASTA_SERIE: TcxGridDBColumn
                      Caption = 'Fecha Aplicaci'#243'n hasta'
                      DataBinding.FieldName = 'FECHA_HASTA_SERIE'
                      PropertiesClassName = 'TcxDateEditProperties'
                      Width = 199
                    end
                    object cxgrdbclmn2: TcxGridDBColumn
                      DataBinding.FieldName = 'INSTANTEMODIF'
                      Visible = False
                    end
                    object cxgrdbclmn3: TcxGridDBColumn
                      DataBinding.FieldName = 'INSTANTEALTA'
                      Visible = False
                    end
                    object cxgrdbclmn4: TcxGridDBColumn
                      DataBinding.FieldName = 'USUARIOALTA'
                      Visible = False
                    end
                    object cxgrdbclmn5: TcxGridDBColumn
                      DataBinding.FieldName = 'USUARIOMODIF'
                      Visible = False
                    end
                  end
                  object lvSeries: TcxGridLevel
                    GridView = tvSeries
                  end
                end
              end
            end
            object tsOtros: TcxTabSheet
              Caption = '&5_Otros'
              ImageIndex = 3
              ExplicitWidth = 752
              ExplicitHeight = 341
              object pnlUserInstantBottom: TPanel
                Left = 0
                Top = 266
                Width = 756
                Height = 79
                Align = alBottom
                TabOrder = 6
                ExplicitTop = 262
                ExplicitWidth = 752
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
                  Width = 152
                end
                object lblUsuarioAlta: TcxLabel
                  Left = 17
                  Top = 6
                  Margins.Left = 4
                  Margins.Top = 4
                  Margins.Right = 4
                  Margins.Bottom = 4
                  Caption = 'Usuario Alta'
                  Transparent = True
                end
                object lblInstanteAlta: TcxLabel
                  Left = 177
                  Top = 6
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
                  Width = 192
                end
                object cxdbtxtdtINSTANTEALTA: TcxDBTextEdit
                  Left = 593
                  Top = 37
                  Margins.Left = 4
                  Margins.Top = 4
                  Margins.Right = 4
                  Margins.Bottom = 4
                  DataBinding.DataField = 'INSTANTEMODIF'
                  DataBinding.DataSource = dsTablaG
                  Properties.ReadOnly = True
                  TabOrder = 7
                  Width = 188
                end
                object lblInstanteModif: TcxLabel
                  Left = 593
                  Top = 6
                  Margins.Left = 4
                  Margins.Top = 4
                  Margins.Right = 4
                  Margins.Bottom = 4
                  Caption = 'Instante Modificaci'#243'n'
                  Transparent = True
                end
                object cxdbtxtdtUSUARIOALTA1: TcxDBTextEdit
                  Left = 377
                  Top = 37
                  Margins.Left = 4
                  Margins.Top = 4
                  Margins.Right = 4
                  Margins.Bottom = 4
                  DataBinding.DataField = 'USUARIOALTA'
                  DataBinding.DataSource = dsTablaG
                  Properties.ReadOnly = True
                  TabOrder = 4
                  Width = 168
                end
                object lblUsuarioModif: TcxLabel
                  Left = 337
                  Top = 6
                  Margins.Left = 4
                  Margins.Top = 4
                  Margins.Right = 4
                  Margins.Bottom = 4
                  Caption = 'Usuario '#218'ltima Modificaci'#243'n'
                  Transparent = True
                end
              end
              object lblTextoLegal: TcxLabel
                Left = 48
                Top = 13
                Caption = 'Texto legal en Facturas'
              end
              object cxdbmTEXTO_LEGAL_FACTURA_EMPRESA: TcxDBMemo
                Left = 31
                Top = 39
                DataBinding.DataField = 'TEXTO_LEGAL_FACTURA_EMPRESA'
                DataBinding.DataSource = dsTablaG
                TabOrder = 0
                Height = 89
                Width = 378
              end
              object lblOrden: TcxLabel
                Left = 24
                Top = 147
                Caption = 'Orden en Listados'
                Transparent = True
              end
              object txtMOVIL_CLIENTE1: TcxDBTextEdit
                Left = 313
                Top = 189
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                DataBinding.DataField = 'SERIE_CONTADOR_EMPRESA'
                DataBinding.DataSource = dsTablaG
                TabOrder = 2
                Width = 77
              end
              object lblTextoLegal1: TcxLabel
                Left = 25
                Top = 193
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                Caption = 'Serie por defecto en Documentos'
                Transparent = True
              end
              object cxdbspndtORDEN_EMPRESA: TcxDBSpinEdit
                Left = 183
                Top = 144
                DataBinding.DataField = 'ORDEN_EMPRESA'
                DataBinding.DataSource = dsTablaG
                TabOrder = 1
                Width = 86
              end
            end
          end
        end
        object spltFicha: TcxSplitter
          Left = 0
          Top = 178
          Width = 765
          Height = 4
          HotZoneClassName = 'TcxMediaPlayer9Style'
          AlignSplitter = salTop
          Control = pnlFichaDetail
          ExplicitWidth = 763
        end
        object pnlFichaCab: TPanel
          Left = 0
          Top = 0
          Width = 765
          Height = 178
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 0
          ExplicitWidth = 763
          DesignSize = (
            765
            178)
          object cxgrpbx2: TcxGroupBox
            AlignWithMargins = True
            Left = 9
            Top = 5
            TabStop = True
            Anchors = [akLeft, akTop, akRight, akBottom]
            TabOrder = 0
            Transparent = True
            ExplicitWidth = 724
            Height = 166
            Width = 726
            object lblCodigo: TcxLabel
              Left = 24
              Top = 17
              Caption = 'C'#243'digo'
              Transparent = True
            end
            object txtCODIGO_EMPRESA: TcxDBTextEdit
              Left = 102
              Top = 15
              DataBinding.DataField = 'CODIGO_EMPRESA'
              DataBinding.DataSource = dsTablaG
              Properties.ReadOnly = False
              TabOrder = 1
              Width = 126
            end
            object lblNif: TcxLabel
              Left = 317
              Top = 17
              Caption = 'Nif'
              Transparent = True
            end
            object txtNIF_EMPRESA: TcxDBTextEdit
              Left = 352
              Top = 15
              DataBinding.DataField = 'NIF_EMPRESA'
              DataBinding.DataSource = dsTablaG
              TabOrder = 3
              Width = 161
            end
            object lblNombre: TcxLabel
              Left = 24
              Top = 59
              Caption = 'Raz'#243'n Social'
              Transparent = True
            end
            object txtRAZONSOCIAL_EMPRESA: TcxDBTextEdit
              Left = 146
              Top = 55
              DataBinding.DataField = 'RAZONSOCIAL_EMPRESA'
              DataBinding.DataSource = dsTablaG
              TabOrder = 5
              Width = 367
            end
            object chkActivo: TcxDBCheckBox
              Left = 24
              Top = 88
              Caption = 'Activo'
              DataBinding.DataField = 'ACTIVO_EMPRESA'
              DataBinding.DataSource = dsTablaG
              Properties.ValueChecked = 'S'
              Properties.ValueUnchecked = 'N'
              Style.TransparentBorder = False
              TabOrder = 6
              Transparent = True
            end
            object chkAplicaRetenciones: TcxDBCheckBox
              Left = 24
              Top = 122
              Caption = 'Retiene IRPF'
              DataBinding.DataField = 'ESRETENCIONES_EMPRESA'
              DataBinding.DataSource = dsTablaG
              Properties.ValueChecked = 'S'
              Properties.ValueUnchecked = 'N'
              Properties.OnChange = chkAplicaRetencionesPropertiesChange
              Style.TransparentBorder = False
              TabOrder = 7
              Transparent = True
            end
            object lblCanalIVA: TcxLabel
              Left = 178
              Top = 93
              Margins.Left = 4
              Margins.Top = 4
              Margins.Right = 4
              Margins.Bottom = 4
              Caption = 'Canal de IVA'
              Properties.Alignment.Horz = taRightJustify
              Transparent = True
              AnchorX = 289
            end
            object cbbZonaIVA: TcxDBLookupComboBox
              Left = 180
              Top = 122
              DataBinding.DataField = 'GRUPO_ZONA_IVA_EMPRESA'
              DataBinding.DataSource = dsTablaG
              Properties.KeyFieldNames = 'GRUPO_ZONA_IVA'
              Properties.ListColumns = <
                item
                  FieldName = 'DESCRIPCION_ZONA_IVA'
                end>
              Properties.ListOptions.ShowHeader = False
              Properties.ValidateOnEnter = False
              TabOrder = 9
              Width = 333
            end
          end
        end
      end
      inherited tsPerfil: TcxTabSheet
        ExplicitWidth = 763
        ExplicitHeight = 563
        inherited pnlPerfilTop: TPanel
          Width = 765
          BevelOuter = bvNone
          ExplicitWidth = 763
        end
        inherited pnlPerfilDetail: TPanel
          Width = 765
          Height = 508
          BevelOuter = bvNone
          ExplicitWidth = 763
          ExplicitHeight = 506
          inherited cxgrdPerfil: TcxGrid
            Left = 0
            Top = 0
            Width = 765
            Height = 508
            ExplicitWidth = 761
            ExplicitHeight = 504
          end
        end
      end
    end
    inherited pnlTopPage: TPanel
      Left = 0
      Top = 0
      Width = 774
      BevelOuter = bvNone
      TabOrder = 0
      ExplicitWidth = 772
      inherited pnlTopGrid: TPanel
        Left = 0
        Top = 0
        Width = 774
        ExplicitWidth = 770
        inherited edtBusqGlobal: TcxTextEdit
          TabOrder = 1
        end
        inherited nvNavegador: TcxDBNavigator
          TabOrder = 2
        end
        inherited rbBBDD: TcxRadioButton
          TabOrder = 0
        end
      end
    end
  end
  inherited pButtonRightBar: TPanel
    Left = 774
    Height = 643
    BevelOuter = bvNone
    TabOrder = 1
    ExplicitLeft = 774
    ExplicitHeight = 643
    inherited pButtonGen: TPanel
      Left = 0
      Top = 445
      Width = 140
      TabOrder = 2
      ExplicitTop = 444
    end
    inherited pButtonBDStat: TPanel
      Left = 0
      Top = 0
      Width = 140
      inherited pnStateDataSet: TPanel
        Width = 140
      end
      inherited pnlDataSetName: TPanel
        Width = 140
      end
    end
    object btnNuevaEmpresa: TcxButton
      Left = 1
      Top = 154
      Width = 138
      Height = 25
      Caption = '&Nueva Empresa'
      TabOrder = 1
      OnClick = btnNuevaEmpresaClick
    end
  end
  inherited dsTablaG: TDataSource
    DataSet = dmEmpresas.unqryTablaG
    Left = 628
    Top = 535
  end
  object ActionListEmpresas: TActionList [4]
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
  end
end
