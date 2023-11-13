﻿inherited frmMtoProveedores: TfrmMtoProveedores
  Caption = 'Proveedores'
  ClientHeight = 525
  ClientWidth = 868
  ExplicitWidth = 868
  ExplicitHeight = 525
  PixelsPerInch = 96
  TextHeight = 19
  inherited pButtonPage: TPanel
    Width = 714
    Height = 525
    TabOrder = 0
    ExplicitWidth = 714
    ExplicitHeight = 525
    inherited pcPantalla: TcxPageControl
      Width = 714
      Height = 485
      TabOrder = 1
      ExplicitWidth = 714
      ExplicitHeight = 485
      ClientRectBottom = 479
      ClientRectRight = 708
      inherited tsLista: TcxTabSheet
        ExplicitLeft = 3
        ExplicitTop = 32
        ExplicitWidth = 705
        ExplicitHeight = 447
        inherited cxGrdPrincipal: TcxGrid
          Width = 705
          Height = 447
          ExplicitWidth = 705
          ExplicitHeight = 447
          inherited cxGrdDBTabPrin: TcxGridDBTableView
            object cxgrdbclmnGrdDBTabPrinCODIGO_CLIENTE: TcxGridDBColumn
              Caption = 'C'#243'digo'
              DataBinding.FieldName = 'CODIGO_PROVEEDOR'
              Width = 81
            end
            object cxgrdbclmnGrdDBTabPrinACTIVO_CLIENTE: TcxGridDBColumn
              Caption = 'Activo'
              DataBinding.FieldName = 'ACTIVO_PROVEEDOR'
              PropertiesClassName = 'TcxCheckBoxProperties'
              Properties.ValueChecked = 'S'
              Properties.ValueUnchecked = 'N'
              Width = 67
            end
            object cxgrdbclmnGrdDBTabPrinRAZONSOCIAL_CLIENTE: TcxGridDBColumn
              Caption = 'Raz'#243'n Social'
              DataBinding.FieldName = 'RAZONSOCIAL_PROVEEDOR'
              Width = 212
            end
            object cxgrdbclmnGrdDBTabPrinNIF_CLIENTE: TcxGridDBColumn
              Caption = 'Nif Cif'
              DataBinding.FieldName = 'NIF_PROVEEDOR'
              PropertiesClassName = 'TcxMaskEditProperties'
              Width = 104
            end
            object cxgrdbclmnGrdDBTabPrinMOVIL_CLIENTE: TcxGridDBColumn
              Caption = 'Tel'#233'fono M'#243'vil'
              DataBinding.FieldName = 'MOVIL_PROVEEDOR'
              Width = 113
            end
            object cxgrdbclmnGrdDBTabPrinTELEFONO_CLIENTE: TcxGridDBColumn
              Caption = 'Tel'#233'fono Fijo'
              DataBinding.FieldName = 'TELEFONO_PROVEEDOR'
              Width = 121
            end
            object cxgrdbclmnGrdDBTabPrinEMAIL_CLIENTE: TcxGridDBColumn
              Caption = 'Email'
              DataBinding.FieldName = 'EMAIL_PROVEEDOR'
              Width = 196
            end
            object cxgrdbclmnGrdDBTabPrinDIRECCION1_CLIENTE: TcxGridDBColumn
              Caption = 'Direcci'#243'n'
              DataBinding.FieldName = 'DIRECCION1_PROVEEDOR'
              Width = 251
            end
            object cxgrdbclmnGrdDBTabPrinDIRECCION2_CLIENTE: TcxGridDBColumn
              Caption = 'M'#225's Direcci'#243'n'
              DataBinding.FieldName = 'DIRECCION2_PROVEEDOR'
              Width = 77
            end
            object cxgrdbclmnGrdDBTabPrinPOBLACION_CLIENTE: TcxGridDBColumn
              Caption = 'Poblaci'#243'n'
              DataBinding.FieldName = 'POBLACION_PROVEEDOR'
              Width = 146
            end
            object cxgrdbclmnGrdDBTabPrinPROVINCIA_CLIENTE: TcxGridDBColumn
              Caption = 'Provincia'
              DataBinding.FieldName = 'PROVINCIA_PROVEEDOR'
              Width = 135
            end
            object cxgrdbclmnGrdDBTabPrinCPOSTAL_CLIENTE: TcxGridDBColumn
              Caption = 'C'#243'digo Postal'
              DataBinding.FieldName = 'CPOSTAL_PROVEEDOR'
              Width = 95
            end
            object cxgrdbclmnGrdDBTabPrinPAIS_CLIENTE: TcxGridDBColumn
              Caption = 'Pa'#237's'
              DataBinding.FieldName = 'PAIS_PROVEEDOR'
              Width = 118
            end
            object cxgrdbclmnGrdDBTabPrinOBSERVACIONES_CLIENTE: TcxGridDBColumn
              Caption = 'Observaciones'
              DataBinding.FieldName = 'OBSERVACIONES_PROVEEDOR'
              Width = 192
            end
            object cxgrdbclmnGrdDBTabPrinREFERENCIA_CLIENTE: TcxGridDBColumn
              Caption = 'Referencia'
              DataBinding.FieldName = 'REFERENCIA_PROVEEDOR'
              Width = 184
            end
            object cxgrdbclmnGrdDBTabPrinCONTACTO_CLIENTE: TcxGridDBColumn
              Caption = 'Contacto'
              DataBinding.FieldName = 'CONTACTO_PROVEEDOR'
              Width = 151
            end
            object cxgrdbclmnGrdDBTabPrinTELEFONO_CONTACTO_CLIENTE: TcxGridDBColumn
              Caption = 'Tel'#233'fono de Contacto'
              DataBinding.FieldName = 'TELEFONO_CONTACTO_PROVEEDOR'
              Width = 140
            end
            object cxgrdbclmnGrdDBTabPrinIBAN_CLIENTE: TcxGridDBColumn
              Caption = 'Nro Cuenta'
              DataBinding.FieldName = 'IBAN_PROVEEDOR'
              Visible = False
              Width = 50
            end
            object cxgrdbclmnGrdDBTabPrinINSTANTEMODIF: TcxGridDBColumn
              DataBinding.FieldName = 'INSTANTEMODIF'
              PropertiesClassName = 'TcxDateEditProperties'
              Visible = False
            end
            object cxgrdbclmnGrdDBTabPrinINSTANTEALTA: TcxGridDBColumn
              DataBinding.FieldName = 'INSTANTEALTA'
              PropertiesClassName = 'TcxDateEditProperties'
              Visible = False
            end
            object cxgrdbclmnGrdDBTabPrinUSUARIOALTA: TcxGridDBColumn
              DataBinding.FieldName = 'USUARIOALTA'
              Visible = False
              Width = 74
            end
            object cxgrdbclmnGrdDBTabPrinUSUARIOMODIF: TcxGridDBColumn
              DataBinding.FieldName = 'USUARIOMODIF'
              Visible = False
              Width = 108
            end
          end
        end
      end
      inherited tsFicha: TcxTabSheet
        ExplicitLeft = 3
        ExplicitTop = 32
        ExplicitWidth = 705
        ExplicitHeight = 447
        object pnlCabFicha: TPanel
          Left = 0
          Top = 0
          Width = 705
          Height = 137
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 0
          object txtCODIGO_PROVEEDOR: TcxDBTextEdit
            Left = 41
            Top = 31
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            DataBinding.DataField = 'CODIGO_PROVEEDOR'
            DataBinding.DataSource = dsTablaG
            TabOrder = 1
            Width = 149
          end
          object lblCodigo: TcxLabel
            Left = 41
            Top = 7
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            Caption = 'C'#243'digo'
            Transparent = True
          end
          object txtRAZONSOCIAL_PROVEEDOR: TcxDBTextEdit
            Left = 224
            Top = 31
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            DataBinding.DataField = 'RAZONSOCIAL_PROVEEDOR'
            DataBinding.DataSource = dsTablaG
            TabOrder = 3
            Width = 497
          end
          object lblRazonSocial: TcxLabel
            Left = 224
            Top = 7
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            Caption = 'Raz'#243'n Social Fiscal'
            Transparent = True
          end
          object cxdbtxtdtTELEFONO2: TcxDBTextEdit
            Left = 571
            Top = 93
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            DataBinding.DataField = 'TELEFONO_PROVEEDOR'
            DataBinding.DataSource = dsTablaG
            TabOrder = 10
            Width = 150
          end
          object lblTeléfonos: TcxLabel
            Left = 320
            Top = 94
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            Caption = 'Tel'#233'fonos'
            Transparent = True
          end
          object lblEmail: TcxLabel
            Left = 357
            Top = 66
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            Caption = 'Email'
            Transparent = True
          end
          object cxdbtxtdtEMAIL: TcxDBTextEdit
            Left = 414
            Top = 62
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            DataBinding.DataField = 'EMAIL_PROVEEDOR'
            DataBinding.DataSource = dsTablaG
            TabOrder = 5
            Width = 307
          end
          object lblNif: TcxLabel
            Left = 41
            Top = 68
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            Caption = 'NIF/CIF'
            Transparent = True
          end
          object cxdbtxtdtNIF: TcxDBTextEdit
            Left = 41
            Top = 93
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            DataBinding.DataField = 'NIF_PROVEEDOR'
            DataBinding.DataSource = dsTablaG
            TabOrder = 6
            Width = 149
          end
          object cxdbtxtdtMOVIL_CLIENTE: TcxDBTextEdit
            Left = 414
            Top = 93
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            DataBinding.DataField = 'MOVIL_PROVEEDOR'
            DataBinding.DataSource = dsTablaG
            TabOrder = 7
            Width = 139
          end
          object chkActivo: TcxDBCheckBox
            Left = 224
            Top = 62
            Caption = 'Activo'
            DataBinding.DataField = 'ACTIVO_PROVEEDOR'
            DataBinding.DataSource = dsTablaG
            Properties.ValueChecked = 'S'
            Properties.ValueUnchecked = 'N'
            TabOrder = 4
            Transparent = True
          end
        end
        object pnlDetailFicha: TPanel
          Left = 0
          Top = 141
          Width = 705
          Height = 306
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 2
          object pcPestanas: TcxPageControl
            Left = 0
            Top = 0
            Width = 705
            Height = 306
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            Align = alClient
            TabOrder = 0
            Properties.ActivePage = tsVentas
            Properties.CustomButtons.Buttons = <>
            ClientRectBottom = 300
            ClientRectLeft = 3
            ClientRectRight = 699
            ClientRectTop = 32
            object tsDomicilioFiscal: TcxTabSheet
              Margins.Left = 4
              Margins.Top = 4
              Margins.Right = 4
              Margins.Bottom = 4
              Caption = '&1_Domicilio fiscal'
              ImageIndex = 0
              object cxdbtxtdt7: TcxDBTextEdit
                Left = 147
                Top = 21
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                DataBinding.DataField = 'DIRECCION1_PROVEEDOR'
                DataBinding.DataSource = dsTablaG
                TabOrder = 0
                Width = 303
              end
              object lblDireccion1: TcxLabel
                Left = 35
                Top = 25
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                Caption = 'Direcci'#243'n 1'
                Properties.Alignment.Horz = taRightJustify
                Transparent = True
                AnchorX = 135
              end
              object lblCodPostal: TcxLabel
                Left = 14
                Top = 103
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                Caption = 'C'#243'digo Postal'
                Properties.Alignment.Horz = taRightJustify
                Transparent = True
                AnchorX = 135
              end
              object cxdbtxtdt8: TcxDBTextEdit
                Left = 147
                Top = 99
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                DataBinding.DataField = 'CPOSTAL_PROVEEDOR'
                DataBinding.DataSource = dsTablaG
                TabOrder = 4
                Width = 77
              end
              object lblPoblacion: TcxLabel
                Left = 49
                Top = 143
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                Caption = 'Poblaci'#243'n'
                Properties.Alignment.Horz = taRightJustify
                Transparent = True
                AnchorX = 135
              end
              object cxdbtxtdt9: TcxDBTextEdit
                Left = 147
                Top = 139
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                DataBinding.DataField = 'POBLACION_PROVEEDOR'
                DataBinding.DataSource = dsTablaG
                TabOrder = 6
                Width = 303
              end
              object cxdbtxtdt10: TcxDBTextEdit
                Left = 147
                Top = 178
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                DataBinding.DataField = 'PROVINCIA_PROVEEDOR'
                DataBinding.DataSource = dsTablaG
                TabOrder = 8
                Width = 303
              end
              object lblProvincia: TcxLabel
                Left = 55
                Top = 182
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                Caption = 'Provincia'
                Properties.Alignment.Horz = taRightJustify
                Transparent = True
                AnchorX = 135
              end
              object cxdbtxtdt16: TcxDBTextEdit
                Left = 147
                Top = 218
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                DataBinding.DataField = 'PAIS_PROVEEDOR'
                DataBinding.DataSource = dsTablaG
                TabOrder = 10
                Width = 303
              end
              object lblPais: TcxLabel
                Left = 98
                Top = 222
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                Caption = 'Pa'#237's'
                Properties.Alignment.Horz = taRightJustify
                Transparent = True
                AnchorX = 135
              end
              object cxdbtxtdtDireccion: TcxDBTextEdit
                Left = 147
                Top = 60
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                DataBinding.DataField = 'DIRECCION2_PROVEEDOR'
                DataBinding.DataSource = dsTablaG
                TabOrder = 2
                Width = 304
              end
              object lblDireccion2: TcxLabel
                Left = 35
                Top = 64
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                Caption = 'Direcci'#243'n 2'
                Properties.Alignment.Horz = taRightJustify
                Transparent = True
                AnchorX = 135
              end
            end
            object tsArticulos: TcxTabSheet
              Caption = '&2_Articulos'
              ImageIndex = 3
              object pnl6: TPanel
                Left = 578
                Top = 0
                Width = 118
                Height = 268
                Align = alRight
                BevelOuter = bvNone
                TabOrder = 1
                object btnIraArticulo: TcxButton
                  Left = 6
                  Top = 13
                  Width = 110
                  Height = 25
                  Caption = 'Ir a Art'#237'culo'
                  TabOrder = 0
                  OnClick = btnIraArticuloClick
                end
              end
              object pnl61: TPanel
                Left = 0
                Top = 0
                Width = 578
                Height = 268
                Align = alClient
                BevelOuter = bvNone
                TabOrder = 0
                object cxgrdArticulos: TcxGrid
                  Left = 0
                  Top = 0
                  Width = 578
                  Height = 268
                  Margins.Left = 4
                  Margins.Top = 4
                  Margins.Right = 4
                  Margins.Bottom = 4
                  Align = alClient
                  TabOrder = 0
                  object tvArticulos: TcxGridDBTableView
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
                    DataController.DataSource = dmProveedores.dsArticulos
                    DataController.Options = [dcoCaseInsensitive, dcoAssignGroupingValues, dcoAssignMasterDetailKeys, dcoSaveExpanding]
                    DataController.Summary.DefaultGroupSummaryItems = <>
                    DataController.Summary.FooterSummaryItems = <>
                    DataController.Summary.SummaryGroups = <>
                    OptionsBehavior.AlwaysShowEditor = True
                    OptionsBehavior.GoToNextCellOnEnter = True
                    OptionsBehavior.IncSearch = True
                    OptionsCustomize.ColumnHiding = True
                    OptionsData.CancelOnExit = False
                    OptionsData.Deleting = False
                    OptionsData.DeletingConfirmation = False
                    OptionsData.Inserting = False
                    OptionsView.GroupByBox = False
                    OptionsView.Indicator = True
                    object cxgrdbclmnArticulosCODIGO_PROVEEDOR: TcxGridDBColumn
                      DataBinding.FieldName = 'CODIGO_PROVEEDOR'
                      Visible = False
                      VisibleForCustomization = False
                    end
                    object cxgrdbclmnArticulosCODIGO_ARTICULO: TcxGridDBColumn
                      Caption = 'C'#243'digo Art'#237'culo'
                      DataBinding.FieldName = 'CODIGO_ARTICULO'
                      Options.Editing = False
                      Width = 135
                    end
                    object cxgrdbclmnArticulosDESCRIPCION_ARTICULO: TcxGridDBColumn
                      Caption = 'Descripci'#243'n'
                      DataBinding.FieldName = 'DESCRIPCION_ARTICULO'
                      Options.Editing = False
                      Width = 269
                    end
                    object cxgrdbclmnArticulosCODIGO_FAMILIA: TcxGridDBColumn
                      Caption = 'C'#243'digo Familia'
                      DataBinding.FieldName = 'CODIGO_FAMILIA'
                      Options.Editing = False
                      Width = 130
                    end
                    object cxgrdbclmnArticulosDESCRIPCION_FAMILIA: TcxGridDBColumn
                      Caption = 'Familia'
                      DataBinding.FieldName = 'DESCRIPCION_FAMILIA'
                      Options.Editing = False
                      Width = 222
                    end
                    object cxgrdbclmnArticulosTIPO_CATNTIDAD_ARTICULO: TcxGridDBColumn
                      Caption = 'Tipo Cantidad'
                      DataBinding.FieldName = 'TIPO_CATNTIDAD_ARTICULO'
                      Width = 127
                    end
                    object cxgrdbclmnArticulosESACTIVO_FIJO_ARTICULO: TcxGridDBColumn
                      DataBinding.FieldName = 'ESACTIVO_FIJO_ARTICULO'
                      Visible = False
                      VisibleForCustomization = False
                    end
                    object cxgrdbclmnArticulosPRECIO_ULT_COMPRA: TcxGridDBColumn
                      Caption = 'Precio '#218'lt. Compra'
                      DataBinding.FieldName = 'PRECIO_ULT_COMPRA'
                      Width = 167
                    end
                    object cxgrdbclmnArticulosFECHA_VALIDEZ: TcxGridDBColumn
                      Caption = 'Fecha '#218'lt Compra'
                      DataBinding.FieldName = 'FECHA_VALIDEZ'
                      Width = 159
                    end
                    object cxgrdbclmnArticulosESPROVEEDORPRINCIPAL: TcxGridDBColumn
                      Caption = 'Proveedor Principal'
                      DataBinding.FieldName = 'ESPROVEEDORPRINCIPAL'
                      Width = 183
                    end
                    object cxgrdbclmnArticulosINSTANTEMODIF: TcxGridDBColumn
                      DataBinding.FieldName = 'INSTANTEMODIF'
                      Visible = False
                      VisibleForCustomization = False
                    end
                    object cxgrdbclmnArticulosINSTANTEALTA: TcxGridDBColumn
                      DataBinding.FieldName = 'INSTANTEALTA'
                      Visible = False
                      VisibleForCustomization = False
                    end
                    object cxgrdbclmnArticulosUSUARIOALTA: TcxGridDBColumn
                      DataBinding.FieldName = 'USUARIOALTA'
                      Visible = False
                      VisibleForCustomization = False
                    end
                    object cxgrdbclmnArticulosUSUARIOMODIF: TcxGridDBColumn
                      DataBinding.FieldName = 'USUARIOMODIF'
                      Visible = False
                      VisibleForCustomization = False
                    end
                  end
                  object cxgrdlvlArticulos: TcxGridLevel
                    GridView = tvArticulos
                  end
                end
              end
            end
            object tsVentas: TcxTabSheet
              Caption = '&3_Ventas'
              ImageIndex = 4
              object cxgrdLinFac: TcxGrid
                Left = 0
                Top = 0
                Width = 578
                Height = 268
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                Align = alClient
                TabOrder = 0
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
                      Format = '0.00 '#8364';-0.00 '#8364
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
                    Caption = 'Nro Fact.'
                    DataBinding.FieldName = 'NRO_FACTURA_LINEA'
                    Width = 83
                  end
                  object cxgrdbclmnLinFacSERIE_FACTURA_LINEA: TcxGridDBColumn
                    Caption = 'Serie'
                    DataBinding.FieldName = 'SERIE_FACTURA_LINEA'
                    Width = 59
                  end
                  object cxgrdbclmnLinFacLINEA_FACTURA_LINEA: TcxGridDBColumn
                    Caption = 'Nro Linea'
                    DataBinding.FieldName = 'LINEA_FACTURA_LINEA'
                    Width = 96
                  end
                  object cxgrdbclmnLinFacCANTIDAD_FACTURA_LINEA: TcxGridDBColumn
                    Caption = 'Cantidad'
                    DataBinding.FieldName = 'CANTIDAD_FACTURA_LINEA'
                    Width = 89
                  end
                  object cxgrdbclmnLinFacTIPO_CANTIDAD_ARTICULO_FACTURA_LINEA: TcxGridDBColumn
                    Caption = 'Tipo Cantidad'
                    DataBinding.FieldName = 'TIPO_CANTIDAD_ARTICULO_FACTURA_LINEA'
                    Width = 93
                  end
                  object cxgrdbclmnLinFacCODIGO_ARTICULO_FACTURA_LINEA: TcxGridDBColumn
                    Caption = 'C'#243'digo Art'#237'culo'
                    DataBinding.FieldName = 'CODIGO_ARTICULO_FACTURA_LINEA'
                    Visible = False
                    VisibleForCustomization = False
                  end
                  object cxgrdbclmnLinFacCODIGO_FAMILIA_FACTURA_LINEA: TcxGridDBColumn
                    Caption = 'C'#243'digo Familia'
                    DataBinding.FieldName = 'CODIGO_FAMILIA_FACTURA_LINEA'
                    Visible = False
                    VisibleForCustomization = False
                  end
                  object cxgrdbclmnLinFacNOMBRE_FAMILIA_FACTURA_LINEA: TcxGridDBColumn
                    Caption = 'Nombre Familia'
                    DataBinding.FieldName = 'NOMBRE_FAMILIA_FACTURA_LINEA'
                    Visible = False
                    VisibleForCustomization = False
                  end
                  object cxgrdbclmnLinFacDESCRIPCION_ARTICULO_FACTURA_LINEA: TcxGridDBColumn
                    Caption = 'Descripci'#243'n Art'#237'culo'
                    DataBinding.FieldName = 'DESCRIPCION_ARTICULO_FACTURA_LINEA'
                    Width = 176
                  end
                  object cxgrdbclmnLinFacNOMBRE_TARIFA: TcxGridDBColumn
                    Caption = 'Tarifa'
                    DataBinding.FieldName = 'NOMBRE_TARIFA'
                    Width = 73
                  end
                  object cxgrdbclmnLinFacESIMP_INCL_TARIFA_FACTURA_LINEA: TcxGridDBColumn
                    Caption = 'Imp Incl'
                    DataBinding.FieldName = 'ESIMP_INCL_TARIFA_FACTURA_LINEA'
                    Width = 60
                  end
                  object cxgrdbclmnLinFacPRECIOVENTA_SIVA_ARTICULO_FACTURA_LINEA: TcxGridDBColumn
                    Caption = 'Precio SIVA'
                    DataBinding.FieldName = 'PRECIOVENTA_SIVA_ARTICULO_FACTURA_LINEA'
                  end
                  object dbcLinFacNOMBRE_TIPO_IVA: TcxGridDBColumn
                    Caption = 'Tipo de IVA'
                    DataBinding.FieldName = 'NOMBRE_TIPO_IVA'
                  end
                  object cxgrdbclmnLinFacPORCEN_IVA_FACTURA_LINEA: TcxGridDBColumn
                    Caption = '% IVA'
                    DataBinding.FieldName = 'PORCEN_IVA_FACTURA_LINEA'
                    Width = 57
                  end
                  object cxgrdbclmnLinFacPRECIOVENTA_CIVA_ARTICULO_FACTURA_LINEA: TcxGridDBColumn
                    Caption = 'Precio CIVA'
                    DataBinding.FieldName = 'PRECIOVENTA_CIVA_ARTICULO_FACTURA_LINEA'
                    Width = 120
                  end
                  object cxgrdbclmnLinFacTOTAL_FACTURA_LINEA: TcxGridDBColumn
                    Caption = 'Total Linea'
                    DataBinding.FieldName = 'TOTAL_FACTURA_LINEA'
                    PropertiesClassName = 'TcxCurrencyEditProperties'
                    Options.Editing = False
                    Width = 97
                  end
                  object cxgrdbclmnLinFacFECHA_ENTREGA_FACTURA_LINEA: TcxGridDBColumn
                    Caption = 'Fecha Entrega'
                    DataBinding.FieldName = 'FECHA_ENTREGA_FACTURA_LINEA'
                    PropertiesClassName = 'TcxDateEditProperties'
                  end
                  object dbcLinFacCODIGO_TARIFA_FACTURA_LINEA: TcxGridDBColumn
                    Caption = 'Tarifa Empleada'
                    DataBinding.FieldName = 'CODIGO_TARIFA_FACTURA_LINEA'
                    Width = 149
                  end
                  object dbcLinFacCODIGO_CLIENTE_FACTURA: TcxGridDBColumn
                    DataBinding.FieldName = 'CODIGO_CLIENTE_FACTURA'
                  end
                end
                object cxgrdlvlLinFac: TcxGridLevel
                  GridView = tvLinFac
                end
              end
              object pnl62: TPanel
                Left = 578
                Top = 0
                Width = 118
                Height = 268
                Align = alRight
                BevelOuter = bvNone
                TabOrder = 1
                object btnIraFactura: TcxButton
                  Left = 6
                  Top = 13
                  Width = 110
                  Height = 25
                  Caption = 'Ir a Factura'
                  TabOrder = 0
                  OnClick = btnIraFacturaClick
                end
                object btnIraCliente: TcxButton
                  Left = 6
                  Top = 53
                  Width = 110
                  Height = 25
                  Caption = 'Ir a Cliente'
                  TabOrder = 1
                  OnClick = btnIraClienteClick
                end
                object btnExportar: TcxButton
                  Left = 6
                  Top = 135
                  Width = 110
                  Height = 24
                  Caption = '&Exp Excel'
                  TabOrder = 2
                  OnClick = btnExportarClick
                end
                object btnIraArticuloVentas: TcxButton
                  Left = 4
                  Top = 93
                  Width = 112
                  Height = 25
                  Caption = 'Ir a Art'#237'culo'
                  TabOrder = 3
                  OnClick = btnIraArticuloClick
                end
              end
            end
            object tsMasDatos: TcxTabSheet
              Caption = '&4_M'#225's datos'
              ImageIndex = 1
              object lblObservaciones: TcxLabel
                Left = -10
                Top = 105
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                Caption = 'Observaciones'
                Properties.Alignment.Horz = taRightJustify
                Transparent = True
                AnchorX = 118
              end
              object lblReferencia: TcxLabel
                Left = 25
                Top = 66
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                Caption = 'Referencia'
                Properties.Alignment.Horz = taRightJustify
                Transparent = True
                AnchorX = 118
              end
              object cxdbtxtdtREFERENCIA_CLIENTE: TcxDBTextEdit
                Left = 126
                Top = 62
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                DataBinding.DataField = 'REFERENCIA_PROVEEDOR'
                DataBinding.DataSource = dsTablaG
                TabOrder = 4
                Width = 519
              end
              object lblContacto: TcxLabel
                Left = 36
                Top = 23
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                Caption = 'Contacto'
                Properties.Alignment.Horz = taRightJustify
                Transparent = True
                AnchorX = 118
              end
              object cxdbtxtdtREFERENCIA_CLIENTE1: TcxDBTextEdit
                Left = 126
                Top = 19
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                DataBinding.DataField = 'CONTACTO_PROVEEDOR'
                DataBinding.DataSource = dsTablaG
                TabOrder = 0
                Width = 188
              end
              object cxdbtxtdtIBAN: TcxDBTextEdit
                Left = 126
                Top = 212
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                DataBinding.DataField = 'IBAN_PROVEEDOR'
                DataBinding.DataSource = dsTablaG
                TabOrder = 8
                Width = 323
              end
              object lblNroCuenta: TcxLabel
                Left = -4
                Top = 213
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                Caption = 'IBAN Bancario'
                Properties.Alignment.Horz = taRightJustify
                Transparent = True
                AnchorX = 118
              end
              object lblTelefonoContacto: TcxLabel
                Left = 341
                Top = 23
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                Caption = 'Tel'#233'fono Contacto'
                Transparent = True
              end
              object cxdbtxtdtCONTACTO_CLIENTE: TcxDBTextEdit
                Left = 513
                Top = 19
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                DataBinding.DataField = 'TELEFONO_CONTACTO_PROVEEDOR'
                DataBinding.DataSource = dsTablaG
                TabOrder = 1
                Width = 188
              end
              object cxdbm2: TcxDBMemo
                Left = 126
                Top = 101
                DataBinding.DataField = 'OBSERVACIONES_PROVEEDOR'
                DataBinding.DataSource = dsTablaG
                TabOrder = 6
                Height = 89
                Width = 575
              end
            end
            object tsOtros: TcxTabSheet
              Caption = '&5_Otros'
              ImageIndex = 4
              object pnl3: TPanel
                Left = 0
                Top = 189
                Width = 696
                Height = 79
                Align = alBottom
                BevelOuter = bvNone
                TabOrder = 2
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
                  Left = 170
                  Top = 9
                  Margins.Left = 4
                  Margins.Top = 4
                  Margins.Right = 4
                  Margins.Bottom = 4
                  Caption = 'Instante Alta'
                  Transparent = True
                end
                object cxdbtxtdtUSUARIOALTA: TcxDBTextEdit
                  Left = 170
                  Top = 37
                  Margins.Left = 4
                  Margins.Top = 4
                  Margins.Right = 4
                  Margins.Bottom = 4
                  DataBinding.DataField = 'INSTANTEALTA'
                  DataBinding.DataSource = dsTablaG
                  Properties.ReadOnly = True
                  TabOrder = 3
                  Width = 193
                end
                object cxdbtxtdtINSTANTEALTA: TcxDBTextEdit
                  Left = 534
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
                  Left = 534
                  Top = 9
                  Margins.Left = 4
                  Margins.Top = 4
                  Margins.Right = 4
                  Margins.Bottom = 4
                  Caption = 'Instante Modificaci'#243'n'
                  Transparent = True
                end
                object cxdbtxtdtUSUARIOALTA1: TcxDBTextEdit
                  Left = 366
                  Top = 37
                  Margins.Left = 4
                  Margins.Top = 4
                  Margins.Right = 4
                  Margins.Bottom = 4
                  DataBinding.DataField = 'USUARIOALTA'
                  DataBinding.DataSource = dsTablaG
                  Properties.ReadOnly = True
                  TabOrder = 4
                  Width = 140
                end
                object lblUsuarioModif: TcxLabel
                  Left = 366
                  Top = 9
                  Margins.Left = 4
                  Margins.Top = 4
                  Margins.Right = 4
                  Margins.Bottom = 4
                  Caption = 'Usuario '#218'lt. Modif'
                  Transparent = True
                end
              end
              object lblTextoLegal11: TcxLabel
                Left = 353
                Top = 139
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                Caption = 'Orden en Listados'
                Transparent = True
              end
              object cxdbspndtORDEN_CLIENTE: TcxDBSpinEdit
                Left = 520
                Top = 138
                DataBinding.DataField = 'ORDEN_PROVEEDOR'
                DataBinding.DataSource = dsTablaG
                TabOrder = 0
                Width = 106
              end
            end
          end
        end
        object cxspltr1: TcxSplitter
          Left = 0
          Top = 137
          Width = 705
          Height = 4
          HotZoneClassName = 'TcxMediaPlayer9Style'
          AlignSplitter = salTop
          Control = pnlDetailFicha
        end
      end
      inherited tsPerfil: TcxTabSheet
        ExplicitWidth = 705
        ExplicitHeight = 447
        inherited pnlPerfilTop: TPanel
          Width = 705
          ExplicitWidth = 705
          inherited edtPerfilBusq: TcxTextEdit
            ExplicitHeight = 27
          end
        end
        inherited pnlPerfilDetail: TPanel
          Width = 705
          Height = 390
          ExplicitWidth = 705
          ExplicitHeight = 390
          inherited cxgrdPerfil: TcxGrid
            Width = 705
            Height = 390
            ExplicitWidth = 705
            ExplicitHeight = 390
          end
        end
      end
    end
    inherited pnlTopPage: TPanel
      Width = 714
      TabOrder = 0
      ExplicitWidth = 714
      inherited pnlTopGrid: TPanel
        Width = 714
        ExplicitWidth = 714
        inherited edtBusqGlobal: TcxTextEdit
          TabOrder = 3
        end
        inherited nvNavegador: TcxDBNavigator
          Top = 5
          Height = 25
          ExplicitTop = 5
          ExplicitHeight = 25
        end
        inherited rbBBDD: TcxRadioButton
          TabOrder = 0
        end
      end
    end
  end
  inherited pButtonRightBar: TPanel
    Left = 714
    Width = 154
    Height = 525
    TabOrder = 1
    ExplicitLeft = 714
    ExplicitWidth = 154
    ExplicitHeight = 525
    inherited pButtonGen: TPanel
      Top = 327
      Width = 154
      ExplicitTop = 327
      ExplicitWidth = 154
    end
    inherited pButtonBDStat: TPanel
      Width = 154
      ExplicitWidth = 154
      inherited pnStateDataSet: TPanel
        Width = 154
        ExplicitWidth = 154
      end
      inherited pnlDataSetName: TPanel
        Width = 154
        ExplicitWidth = 154
      end
    end
    object btnNuevoProveedor: TcxButton
      Left = 1
      Top = 154
      Width = 149
      Height = 25
      Caption = '&Nuevo Proveedor'
      TabOrder = 2
      OnClick = btnNuevoProveedorClick
    end
  end
  inherited Localizer1: TcxLocalizer
    Left = 128
    Top = 416
  end
  inherited dsTablaG: TDataSource
    DataSet = dmProveedores.unqryTablaG
    Left = 24
    Top = 488
  end
  object ActionListProveedores: TActionList
    Left = 424
    Top = 248
    object actArticulos: TAction
      Caption = 'Articulos'
      ShortCut = 16449
      OnExecute = actArticulosExecute
    end
    object actFacturas: TAction
      Caption = 'Facturas'
      ShortCut = 16454
      OnExecute = actFacturasExecute
    end
    object actClientes: TAction
      Caption = 'Clientes'
      ShortCut = 16459
      OnExecute = actClientesExecute
    end
  end
end
