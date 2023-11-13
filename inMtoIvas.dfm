inherited frmMtoIvas: TfrmMtoIvas
  Caption = 'IVA'
  PixelsPerInch = 96
  TextHeight = 19
  inherited pButtonPage: TPanel
    inherited pcPantalla: TcxPageControl
      Properties.ActivePage = tsLista
      inherited tsLista: TcxTabSheet
        ExplicitLeft = 3
        ExplicitTop = 32
        ExplicitWidth = 942
        ExplicitHeight = 480
        inherited cxGrdPrincipal: TcxGrid
          inherited cxGrdDBTabPrin: TcxGridDBTableView
            OptionsCustomize.ColumnExpressionEditing = True
            OptionsData.Editing = True
            object cxgrdbclmnGrdDBTabPrinCODIGO_IVA: TcxGridDBColumn
              Caption = 'C'#243'digo'
              DataBinding.FieldName = 'CODIGO_IVA'
              Width = 75
            end
            object cxgrdbclmnGrdDBTabPrinGRUPO_ZONA_IVA: TcxGridDBColumn
              Caption = 'Grupo Zona'
              DataBinding.FieldName = 'GRUPO_ZONA_IVA'
              PropertiesClassName = 'TcxLookupComboBoxProperties'
              Properties.KeyFieldNames = 'GRUPO_ZONA_IVA'
              Properties.ListColumns = <
                item
                  Caption = 'C'#243'digo Zona'
                  FieldName = 'GRUPO_ZONA_IVA'
                end
                item
                  Caption = 'Descripci'#243'n Zona'
                  FieldName = 'DESCRIPCION_ZONA_IVA'
                end>
              Properties.ListSource = dmIvas.dsZonas
              Properties.OnChange = cxgrdbclmnGrdDBTabPrinGRUPO_ZONA_IVAPropertiesChange
              Width = 181
            end
            object cxgrdbclmnGrdDBTabPrinDESCRIPCION_ZONA_IVA: TcxGridDBColumn
              Caption = 'Descripci'#243'n Zona'
              DataBinding.FieldName = 'DESCRIPCION_ZONA_IVA'
              Width = 174
            end
            object cxGrdDBTabPrinPORCENNORMAL_IVA: TcxGridDBColumn
              DataBinding.FieldName = 'PORCENNORMAL_IVA'
              PropertiesClassName = 'TcxSpinEditProperties'
              Properties.DisplayFormat = '0.00 %'
              Properties.EditFormat = '0.00 %'
              Properties.Increment = 0.100000000000000000
              Properties.LargeIncrement = 1.000000000000000000
              Properties.MaxValue = 100.000000000000000000
              Properties.ValueType = vtFloat
            end
            object cxGrdDBTabPrinPORCENNORMAL_RE_IVA: TcxGridDBColumn
              DataBinding.FieldName = 'PORCENNORMAL_RE_IVA'
              PropertiesClassName = 'TcxSpinEditProperties'
              Properties.DisplayFormat = '0.00 %'
              Properties.EditFormat = '0.00 %'
              Properties.Increment = 0.100000000000000000
              Properties.LargeIncrement = 1.000000000000000000
              Properties.MaxValue = 100.000000000000000000
              Properties.ValueType = vtFloat
            end
            object cxGrdDBTabPrinPORCENREDUCIDO_IVA: TcxGridDBColumn
              DataBinding.FieldName = 'PORCENREDUCIDO_IVA'
              PropertiesClassName = 'TcxSpinEditProperties'
              Properties.DisplayFormat = '0.00 %'
              Properties.EditFormat = '0.00 %'
              Properties.Increment = 0.100000000000000000
              Properties.LargeIncrement = 1.000000000000000000
              Properties.MaxValue = 100.000000000000000000
              Properties.ValueType = vtFloat
            end
            object cxGrdDBTabPrinPORCENREDUCIDO_RE_IVA: TcxGridDBColumn
              DataBinding.FieldName = 'PORCENREDUCIDO_RE_IVA'
              PropertiesClassName = 'TcxSpinEditProperties'
              Properties.DisplayFormat = '0.00 %'
              Properties.EditFormat = '0.00 %'
              Properties.Increment = 0.100000000000000000
              Properties.LargeIncrement = 1.000000000000000000
              Properties.MaxValue = 100.000000000000000000
              Properties.ValueType = vtFloat
            end
            object cxGrdDBTabPrinPORCENSUPERREDUCIDO_IVA: TcxGridDBColumn
              DataBinding.FieldName = 'PORCENSUPERREDUCIDO_IVA'
              PropertiesClassName = 'TcxSpinEditProperties'
              Properties.DisplayFormat = '0.00 %'
              Properties.EditFormat = '0.00 %'
              Properties.Increment = 0.100000000000000000
              Properties.LargeIncrement = 1.000000000000000000
              Properties.MaxValue = 100.000000000000000000
              Properties.ValueType = vtFloat
            end
            object cxGrdDBTabPrinPORCENSUPERREDUCIDO_RE_IVA: TcxGridDBColumn
              DataBinding.FieldName = 'PORCENSUPERREDUCIDO_RE_IVA'
              PropertiesClassName = 'TcxSpinEditProperties'
              Properties.DisplayFormat = '0.00 %'
              Properties.EditFormat = '0.00 %'
              Properties.Increment = 0.100000000000000000
              Properties.LargeIncrement = 1.000000000000000000
              Properties.MaxValue = 100.000000000000000000
              Properties.ValueType = vtFloat
            end
            object cxGrdDBTabPrinPORCENEXENTO_IVA: TcxGridDBColumn
              DataBinding.FieldName = 'PORCENEXENTO_IVA'
              PropertiesClassName = 'TcxSpinEditProperties'
              Properties.DisplayFormat = '0.00 %'
              Properties.EditFormat = '0.00 %'
              Properties.Increment = 0.100000000000000000
              Properties.LargeIncrement = 1.000000000000000000
              Properties.MaxValue = 100.000000000000000000
              Properties.ValueType = vtFloat
            end
            object cxGrdDBTabPrinPORCENEXENTO_RE_IVA: TcxGridDBColumn
              DataBinding.FieldName = 'PORCENEXENTO_RE_IVA'
              PropertiesClassName = 'TcxSpinEditProperties'
              Properties.DisplayFormat = '0.00 %'
              Properties.EditFormat = '0.00 %'
              Properties.Increment = 0.100000000000000000
              Properties.LargeIncrement = 1.000000000000000000
              Properties.MaxValue = 100.000000000000000000
              Properties.ValueType = vtFloat
            end
            object cxgrdbclmnGrdDBTabPrinFECHA_DESDE_IVA: TcxGridDBColumn
              Caption = 'Validez desde'
              DataBinding.FieldName = 'FECHA_DESDE_IVA'
              PropertiesClassName = 'TcxDateEditProperties'
              Width = 109
            end
            object cxgrdbclmnGrdDBTabPrinFECHA_HASTA_IVA: TcxGridDBColumn
              Caption = 'Validez hasta'
              DataBinding.FieldName = 'FECHA_HASTA_IVA'
              PropertiesClassName = 'TcxDateEditProperties'
              Properties.Nullstring = 'Activo'
              Width = 97
            end
            object cxGrdDBTabPrinESAPLICA_RE_ZONA_IVA: TcxGridDBColumn
              DataBinding.FieldName = 'ESAPLICA_RE_ZONA_IVA'
              PropertiesClassName = 'TcxCheckBoxProperties'
              Properties.ReadOnly = True
              Options.Editing = False
              Options.ExpressionEditing = False
              Options.GroupFooters = False
              Options.Grouping = False
            end
            object cxGrdDBTabPrinESIVAAGRICOLA_ZONA_IVA: TcxGridDBColumn
              DataBinding.FieldName = 'ESIVAAGRICOLA_ZONA_IVA'
              PropertiesClassName = 'TcxCheckBoxProperties'
              Properties.ReadOnly = True
              Options.Editing = False
              Options.ExpressionEditing = False
              Options.GroupFooters = False
              Options.Grouping = False
            end
            object cxGrdDBTabPrinESDEFAULT_ZONA_IVA: TcxGridDBColumn
              DataBinding.FieldName = 'ESDEFAULT_ZONA_IVA'
              PropertiesClassName = 'TcxCheckBoxProperties'
              Properties.ReadOnly = True
              Options.Editing = False
              Options.ExpressionEditing = False
              Options.GroupFooters = False
              Options.Grouping = False
            end
            object cxGrdDBTabPrinESIRPF_IMP_INCL_ZONA_IVA: TcxGridDBColumn
              DataBinding.FieldName = 'ESIRPF_IMP_INCL_ZONA_IVA'
              PropertiesClassName = 'TcxCheckBoxProperties'
              Properties.ReadOnly = True
              Options.Editing = False
              Options.ExpressionEditing = False
              Options.GroupFooters = False
              Options.Grouping = False
            end
            object cxGrdDBTabPrinPALABRA_REPORTS_ZONA_IVA: TcxGridDBColumn
              DataBinding.FieldName = 'PALABRA_REPORTS_ZONA_IVA'
              PropertiesClassName = 'TcxTextEditProperties'
              Options.Editing = False
              Options.ExpressionEditing = False
              Options.GroupFooters = False
              Options.Grouping = False
            end
          end
        end
      end
      inherited tsFicha: TcxTabSheet
        Enabled = False
        TabVisible = False
        ExplicitLeft = 3
        ExplicitTop = 32
        ExplicitWidth = 942
        ExplicitHeight = 480
      end
      inherited tsPerfil: TcxTabSheet
        inherited pnlPerfilTop: TPanel
          inherited edtPerfilBusq: TcxTextEdit
            ExplicitHeight = 27
          end
        end
      end
    end
  end
  inherited dsTablaG: TDataSource
    DataSet = dmIvas.unqryTablaG
  end
end
