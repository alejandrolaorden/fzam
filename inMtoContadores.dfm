inherited frmMtoContadores: TfrmMtoContadores
  Caption = 'Contadores'
  PixelsPerInch = 96
  TextHeight = 19
  inherited pButtonPage: TPanel
    inherited pcPantalla: TcxPageControl
      Properties.ActivePage = tsLista
      inherited tsLista: TcxTabSheet
        inherited cxGrdPrincipal: TcxGrid
          inherited cxGrdDBTabPrin: TcxGridDBTableView
            OptionsData.Editing = True
            object cxgrdbclmnGrdDBTabPrinTIPODOC_CONTADOR: TcxGridDBColumn
              Caption = 'Tipo de Documento'
              DataBinding.FieldName = 'TIPODOC_CONTADOR'
              Width = 149
            end
            object cxgrdbclmnGrdDBTabPrinSERIE_CONTADOR: TcxGridDBColumn
              Caption = 'Serie'
              DataBinding.FieldName = 'SERIE_CONTADOR'
              Width = 128
            end
            object cxgrdbclmnGrdDBTabPrinCONTADOR_CONTADOR: TcxGridDBColumn
              Caption = 'Contador'
              DataBinding.FieldName = 'CONTADOR_CONTADOR'
              Width = 174
            end
            object cxGrdDBTabPrinNUMDIGIT_CONTADOR: TcxGridDBColumn
              Caption = 'Digitos Contador'
              DataBinding.FieldName = 'NUMDIGIT_CONTADOR'
              PropertiesClassName = 'TcxSpinEditProperties'
              Properties.MaxValue = 30.000000000000000000
              Width = 161
            end
            object cxGrdDBTabPrinACTIVO_CONTADOR: TcxGridDBColumn
              Caption = 'EsActivo'
              DataBinding.FieldName = 'ACTIVO_CONTADOR'
              PropertiesClassName = 'TcxCheckBoxProperties'
              Properties.ValueChecked = 'S'
              Properties.ValueUnchecked = 'N'
              Width = 70
            end
            object cxgrdbclmnGrdDBTabPrinDEFAULT_CONTADOR: TcxGridDBColumn
              Caption = 'Es contador por defecto'
              DataBinding.FieldName = 'DEFAULT_CONTADOR'
              PropertiesClassName = 'TcxCheckBoxProperties'
              Properties.ValueChecked = 'S'
              Properties.ValueUnchecked = 'N'
              Width = 177
            end
            object cxgrdbclmnGrdDBTabPrinINSTANTEMODIF: TcxGridDBColumn
              DataBinding.FieldName = 'INSTANTEMODIF'
              Visible = False
            end
            object cxgrdbclmnGrdDBTabPrinINSTANTEALTA: TcxGridDBColumn
              DataBinding.FieldName = 'INSTANTEALTA'
              Visible = False
            end
            object cxgrdbclmnGrdDBTabPrinUSUARIOALTA: TcxGridDBColumn
              DataBinding.FieldName = 'USUARIOALTA'
              Visible = False
            end
            object cxgrdbclmnGrdDBTabPrinUSUARIOMODIF: TcxGridDBColumn
              DataBinding.FieldName = 'USUARIOMODIF'
              Visible = False
            end
          end
        end
      end
      inherited tsFicha: TcxTabSheet
        TabVisible = False
      end
    end
  end
end
