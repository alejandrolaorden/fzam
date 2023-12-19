inherited frmMtoUsuarios: TfrmMtoUsuarios
  Caption = 'Usuarios'
  TextHeight = 19
  inherited pButtonPage: TPanel
    inherited pcPantalla: TcxPageControl
      inherited tsLista: TcxTabSheet
        inherited cxGrdPrincipal: TcxGrid
          inherited cxGrdDBTabPrin: TcxGridDBTableView
            OptionsData.Editing = True
            object cxGrdDBTabPrinUSUARIO_USUARIO: TcxGridDBColumn
              Caption = 'Nombre de Usuario'
              DataBinding.FieldName = 'USUARIO_USUARIO'
              DataBinding.IsNullValueType = True
              Width = 189
            end
            object cxGrdDBTabPrinGRUPO_USUARIO: TcxGridDBColumn
              Caption = 'Grupo'
              DataBinding.FieldName = 'GRUPO_USUARIO'
              DataBinding.IsNullValueType = True
              PropertiesClassName = 'TcxLookupComboBoxProperties'
              Properties.KeyFieldNames = 'GRUPO_GRUPO'
              Properties.ListColumns = <
                item
                  FieldName = 'GRUPO_GRUPO'
                end>
              Properties.ListOptions.ShowHeader = False
              Properties.ListSource = dmUsuarios.dsGrupos
              Width = 197
            end
            object cxgrdbclmnGrdDBTabPrinESGRUPOADMINISTRADOR_GRUPO: TcxGridDBColumn
              Caption = 'Es Administrador'
              DataBinding.FieldName = 'ESGRUPOADMINISTRADOR_GRUPO'
              DataBinding.IsNullValueType = True
              PropertiesClassName = 'TcxCheckBoxProperties'
              Properties.ReadOnly = True
              Properties.ValueChecked = 'S'
              Properties.ValueUnchecked = 'N'
              Width = 167
            end
            object cxGrdDBTabPrinEMPRESADEF_USUARIO: TcxGridDBColumn
              Caption = 'Empresa por defecto en documentos'
              DataBinding.FieldName = 'EMPRESADEF_USUARIO'
              DataBinding.IsNullValueType = True
              PropertiesClassName = 'TcxLookupComboBoxProperties'
              Properties.KeyFieldNames = 'CODIGO_EMPRESA'
              Properties.ListColumns = <
                item
                  MinWidth = 60
                  FieldName = 'CODIGO_EMPRESA'
                end
                item
                  FieldName = 'RAZONSOCIAL_EMPRESA'
                end>
              Properties.ListOptions.ColumnSorting = False
              Properties.ListSource = dmUsuarios.dsEmpresas
              Width = 334
            end
            object cxgrdbclmnGrdDBTabPrinRAZONSOCIAL_EMPRESA: TcxGridDBColumn
              Caption = 'Raz'#243'n Social Empresa'
              DataBinding.FieldName = 'RAZONSOCIAL_EMPRESA'
              DataBinding.IsNullValueType = True
              Width = 218
            end
            object cxGrdDBTabPrinPASSWORD_USUARIO: TcxGridDBColumn
              Caption = 'Password Encriptado'
              DataBinding.FieldName = 'PASSWORD_USUARIO'
              DataBinding.IsNullValueType = True
              PropertiesClassName = 'TcxTextEditProperties'
              Properties.EchoMode = eemPassword
              Properties.PasswordChar = '*'
              Properties.ReadOnly = True
              Width = 193
            end
            object cxGrdDBTabPrinULTIMOLOGIN_USUARIO: TcxGridDBColumn
              Caption = #218'ltima Conexi'#243'n'
              DataBinding.FieldName = 'ULTIMOLOGIN_USUARIO'
              DataBinding.IsNullValueType = True
              PropertiesClassName = 'TcxDateEditProperties'
              Properties.ReadOnly = True
              Width = 190
            end
          end
        end
      end
      inherited tsFicha: TcxTabSheet
        TabVisible = False
      end
      inherited tsPerfil: TcxTabSheet
        inherited pnlPerfilDetail: TPanel
          inherited cxgrdPerfil: TcxGrid
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
  end
  inherited pButtonRightBar: TPanel
    object btSetPass: TcxButton
      Left = 4
      Top = 128
      Width = 130
      Height = 57
      Caption = 'Cambiar &Contrase'#241'a'
      TabOrder = 2
      WordWrap = True
      OnClick = btSetPassClick
    end
  end
  inherited dsTablaG: TDataSource
    DataSet = dmUsuarios.unqryTablaG
  end
end
