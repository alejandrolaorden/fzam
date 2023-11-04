inherited frmMtoIvasGrupos: TfrmMtoIvasGrupos
  Caption = 'IVA'
  PixelsPerInch = 96
  TextHeight = 19
  inherited pButtonPage: TPanel
    inherited pcPantalla: TcxPageControl
      inherited tsLista: TcxTabSheet
        inherited cxGrdPrincipal: TcxGrid
          inherited cxGrdDBTabPrin: TcxGridDBTableView
            OptionsData.Editing = True
            object cxgrdbclmnGrdDBTabPrinGRUPO_ZONA_IVA: TcxGridDBColumn
              Caption = 'C'#243'digo Zona IVA'
              DataBinding.FieldName = 'GRUPO_ZONA_IVA'
              Width = 152
            end
            object cxgrdbclmnGrdDBTabPrinDEFAULT_ZONA_IVA: TcxGridDBColumn
              Caption = 'Zona por defecto'
              DataBinding.FieldName = 'ESDEFAULT_ZONA_IVA'
              PropertiesClassName = 'TcxCheckBoxProperties'
              Properties.ValueChecked = 'S'
              Properties.ValueUnchecked = 'N'
              Width = 150
            end
            object cxgrdbclmnGrdDBTabPrinDESCRIPCION_ZONA_IVA: TcxGridDBColumn
              Caption = 'Descripci'#243'n Zona'
              DataBinding.FieldName = 'DESCRIPCION_ZONA_IVA'
              Width = 265
            end
            object cxgrdbclmnGrdDBTabPrinAPLICA_RE_ZONA_IVA: TcxGridDBColumn
              Caption = 'Grupo permite RE'
              DataBinding.FieldName = 'ESAPLICA_RE_ZONA_IVA'
              PropertiesClassName = 'TcxCheckBoxProperties'
              Properties.ValueChecked = 'S'
              Properties.ValueUnchecked = 'N'
              Width = 157
            end
            object cxGrdDBTabPrinIRPF_IMP_INCL_ZONA_IVA: TcxGridDBColumn
              Caption = 'IRPF Calculado'
              DataBinding.FieldName = 'ESIRPF_IMP_INCL_ZONA_IVA'
              PropertiesClassName = 'TcxCheckBoxProperties'
              Properties.ValueChecked = 'S'
              Properties.ValueUnchecked = 'N'
              Width = 137
            end
            object cxGrdDBTabPrinESIVAAGRICOLA_ZONA_IVA: TcxGridDBColumn
              Caption = 'Es REAGP'
              DataBinding.FieldName = 'ESIVAAGRICOLA_ZONA_IVA'
              PropertiesClassName = 'TcxCheckBoxProperties'
              Properties.ValueChecked = 'S'
              Properties.ValueUnchecked = 'N'
              Width = 131
            end
            object cxGrdDBTabPrinPALABRA_REPORTS_ZONA_IVA: TcxGridDBColumn
              Caption = 'Palabra IVA en Documentos'
              DataBinding.FieldName = 'PALABRA_REPORTS_ZONA_IVA'
              Width = 252
            end
          end
        end
      end
      inherited tsFicha: TcxTabSheet
        Enabled = False
        TabVisible = False
        ExplicitTop = 32
        ExplicitWidth = 942
        ExplicitHeight = 480
      end
    end
  end
  inherited dsTablaG: TDataSource
    DataSet = dmIvasGrupos.unqryTablaG
  end
end
