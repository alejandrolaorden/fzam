inherited frmMtoGrupos: TfrmMtoGrupos
  Caption = 'Grupos'
  TextHeight = 19
  inherited pButtonPage: TPanel
    inherited pcPantalla: TcxPageControl
      Properties.ActivePage = tsFicha
      inherited tsLista: TcxTabSheet
        inherited cxGrdPrincipal: TcxGrid
          inherited cxGrdDBTabPrin: TcxGridDBTableView
            OptionsData.Editing = True
            object cxGrdDBTabPrinGRUPO_USUARIO: TcxGridDBColumn
              Caption = 'Nombre Grupo'
              DataBinding.FieldName = 'GRUPO_GRUPO'
              DataBinding.IsNullValueType = True
              Width = 136
            end
            object cxGrdDBTabPrinESGRUPOADMINISTRADOR: TcxGridDBColumn
              Caption = 'Es Grupo Administrador'
              DataBinding.FieldName = 'ESGRUPOADMINISTRADOR_GRUPO'
              DataBinding.IsNullValueType = True
              PropertiesClassName = 'TcxCheckBoxProperties'
              Properties.ValueChecked = 'S'
              Properties.ValueUnchecked = 'N'
              Width = 152
            end
          end
        end
      end
      inherited tsFicha: TcxTabSheet
        object Panel1: TPanel
          Left = 0
          Top = 0
          Width = 942
          Height = 129
          Align = alTop
          TabOrder = 0
          object cxLabel1: TcxLabel
            Left = 88
            Top = 39
            Caption = 'Nombre grupo'
            Transparent = True
          end
          object cxLabel2: TcxLabel
            Left = 24
            Top = 75
            Caption = 'Es grupo administradores'
            Transparent = True
          end
          object txtNOMBRE_GRUPO: TcxDBTextEdit
            Left = 221
            Top = 38
            DataBinding.DataField = 'GRUPO_GRUPO'
            DataBinding.DataSource = dsTablaG
            TabOrder = 2
            Width = 197
          end
          object cxDBCheckBox1: TcxDBCheckBox
            Left = 254
            Top = 77
            DataBinding.DataField = 'ESGRUPOADMINISTRADOR_GRUPO'
            DataBinding.DataSource = dsTablaG
            Properties.ValueChecked = 'S'
            Properties.ValueUnchecked = 'N'
            TabOrder = 3
          end
        end
        object cxgrdUsuarios: TcxGrid
          Left = 0
          Top = 129
          Width = 942
          Height = 351
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Align = alClient
          TabOrder = 1
          object tvUsuarios: TcxGridDBTableView
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
            DataController.DataSource = dmGrupos.dsUsuariosGrupo
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
            object tvUsuariosUSUARIO_USUARIO: TcxGridDBColumn
              Caption = 'Usuario'
              DataBinding.FieldName = 'USUARIO_USUARIO'
              DataBinding.IsNullValueType = True
              Width = 133
            end
            object tvUsuariosGRUPO_USUARIO: TcxGridDBColumn
              Caption = 'Grupo'
              DataBinding.FieldName = 'GRUPO_USUARIO'
              DataBinding.IsNullValueType = True
              Width = 140
            end
            object tvUsuariosEMPRESADEF_USUARIO: TcxGridDBColumn
              Caption = 'Empresa por defecto'
              DataBinding.FieldName = 'EMPRESADEF_USUARIO'
              DataBinding.IsNullValueType = True
              Width = 156
            end
            object tvUsuariosULTIMOLOGIN_USUARIO: TcxGridDBColumn
              Caption = #218'ltima conexi'#243'n'
              DataBinding.FieldName = 'ULTIMOLOGIN_USUARIO'
              DataBinding.IsNullValueType = True
              Width = 177
            end
          end
          object cxgrdlvlUsuarios: TcxGridLevel
            GridView = tvUsuarios
          end
        end
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
  inherited dsTablaG: TDataSource
    DataSet = dmGrupos.unqryTablaG
  end
end
