inherited frmMtoContadores: TfrmMtoContadores
  Caption = 'Contadores'
  OnDestroy = FormDestroy
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
            OptionsData.Editing = True
            object cxgrdbclmnGrdDBTabPrinTIPODOC_CONTADOR: TcxGridDBColumn
              Caption = 'Tipo de Documento'
              DataBinding.FieldName = 'TIPODOC_CONTADOR'
              Options.Editing = False
              Width = 177
            end
            object cxGrdDBTabPrinDESCRIPCION_TIPODOCUMENTO: TcxGridDBColumn
              Caption = 'Documento'
              DataBinding.FieldName = 'DESCRIPCION_TIPODOCUMENTO'
              Width = 197
            end
            object cxGrdDBTabPrinEMPRESA_CONTADOR: TcxGridDBColumn
              Caption = 'Empresa'
              DataBinding.FieldName = 'EMPRESA_CONTADOR'
              Width = 88
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
    inherited pnlTopPage: TPanel
      inherited pnlTopGrid: TPanel
        inherited edtBusqGlobal: TcxTextEdit
          ExplicitHeight = 27
        end
      end
    end
  end
  inherited dsTablaG: TDataSource
    DataSet = dmContadores.unqryTablaG
  end
end
