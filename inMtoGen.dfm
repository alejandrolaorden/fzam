inherited frmMtoGen: TfrmMtoGen
  BorderStyle = bsNone
  Caption = 'Ventana Gen'#233'rica'
  ClientHeight = 558
  ClientWidth = 1091
  Font.Charset = ANSI_CHARSET
  Font.Pitch = fpDefault
  Font.Quality = fqDefault
  KeyPreview = True
  Visible = True
  OnClose = FormClose
  OnKeyUp = FormKeyUp
  OnShow = FormShow
  ExplicitWidth = 1091
  ExplicitHeight = 558
  TextHeight = 19
  object pButtonPage: TPanel [0]
    Left = 0
    Top = 0
    Width = 951
    Height = 558
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Align = alClient
    BevelOuter = bvNone
    ParentBackground = False
    TabOrder = 1
    object pcPantalla: TcxPageControl
      Left = 0
      Top = 40
      Width = 951
      Height = 518
      Align = alClient
      TabOrder = 0
      Properties.ActivePage = tsLista
      Properties.CustomButtons.Buttons = <>
      OnPageChanging = pcPantallaPageChanging
      ClientRectBottom = 512
      ClientRectLeft = 3
      ClientRectRight = 945
      ClientRectTop = 32
      object tsLista: TcxTabSheet
        Caption = '&Lista'
        ImageIndex = 0
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
        object cxGrdPrincipal: TcxGrid
          Left = 0
          Top = 0
          Width = 942
          Height = 480
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Align = alClient
          TabOrder = 0
          object cxGrdDBTabPrin: TcxGridDBTableView
            OnDblClick = cxGrdDBTabPrinDblClick
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
            Navigator.Buttons.Insert.Visible = False
            Navigator.Buttons.Delete.Enabled = False
            Navigator.Buttons.Delete.Hint = 'Borra el registro Activo'
            Navigator.Buttons.Delete.Visible = False
            Navigator.Buttons.Edit.Enabled = False
            Navigator.Buttons.Edit.Hint = 'Edita registro Actual'
            Navigator.Buttons.Edit.Visible = False
            Navigator.Buttons.Post.Hint = 'Guarda Datos introducidos'
            Navigator.Buttons.Post.Visible = False
            Navigator.Buttons.Cancel.Enabled = False
            Navigator.Buttons.Cancel.Hint = 'Cancela la edici'#243'n actual'
            Navigator.Buttons.Cancel.Visible = False
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
            DataController.DataSource = dsTablaG
            DataController.Options = [dcoCaseInsensitive, dcoAssignGroupingValues, dcoAssignMasterDetailKeys, dcoSaveExpanding]
            DataController.Summary.DefaultGroupSummaryItems = <>
            DataController.Summary.FooterSummaryItems = <>
            DataController.Summary.SummaryGroups = <>
            OptionsBehavior.AlwaysShowEditor = True
            OptionsBehavior.GoToNextCellOnEnter = True
            OptionsBehavior.IncSearch = True
            OptionsCustomize.ColumnHiding = True
            OptionsData.Appending = True
            OptionsData.Editing = False
            OptionsView.GroupByBox = False
            OptionsView.Indicator = True
          end
          object cxGrdLvPrin: TcxGridLevel
            GridView = cxGrdDBTabPrin
          end
        end
      end
      object tsFicha: TcxTabSheet
        Caption = '&Ficha'
        ImageIndex = 1
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
      end
      object tsPerfil: TcxTabSheet
        Caption = 'Perfil'
        ImageIndex = 2
        object pnlPerfilTop: TPanel
          Left = 0
          Top = 0
          Width = 942
          Height = 57
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 0
          object edtPerfilBusq: TcxTextEdit
            Left = 294
            Top = 14
            TabOrder = 0
            Width = 243
          end
          object lblTextoaBuscarPerfil: TcxLabel
            Left = 165
            Top = 18
            Caption = 'Texto a buscar'
            Transparent = True
          end
          object btnCargarColumnas: TcxButton
            Left = 9
            Top = 19
            Width = 148
            Height = 24
            Caption = '&Cargar columnas'
            TabOrder = 2
            OnClick = btnCargarColumnasClick
          end
          object btnCargarCaptions: TcxButton
            Left = 555
            Top = 19
            Width = 141
            Height = 24
            Caption = '&Cargar captions'
            TabOrder = 3
            OnClick = btnCargarCaptionsClick
          end
          object btnCargarVblesGlob: TcxButton
            Left = 715
            Top = 19
            Width = 198
            Height = 24
            Caption = '&Cargar Vbles Globales'
            TabOrder = 4
            OnClick = btnCargarVblesGlobClick
          end
        end
        object pnlPerfilDetail: TPanel
          Left = 0
          Top = 57
          Width = 942
          Height = 423
          Align = alClient
          BevelOuter = bvNone
          Caption = 'pnlPerfilDetail'
          TabOrder = 1
          object cxgrdPerfil: TcxGrid
            Left = 0
            Top = 0
            Width = 942
            Height = 423
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            Align = alClient
            TabOrder = 0
            object tvPerfil: TcxGridDBTableView
              OnDblClick = cxGrdDBTabPrinDblClick
              Navigator.Buttons.ConfirmDelete = True
              Navigator.Buttons.CustomButtons = <>
              Navigator.Buttons.First.Hint = 'Va al primer Registro'
              Navigator.Buttons.First.Visible = True
              Navigator.Buttons.PriorPage.Hint = 'Va a la p'#225'gina anterior'
              Navigator.Buttons.PriorPage.Visible = False
              Navigator.Buttons.Prior.Hint = 'Va al Registro Anterior'
              Navigator.Buttons.Prior.Visible = False
              Navigator.Buttons.Next.Enabled = False
              Navigator.Buttons.Next.Hint = 'Va al siguiente Registro'
              Navigator.Buttons.Next.Visible = False
              Navigator.Buttons.NextPage.Hint = 'Va a la p'#225'gina siguiente'
              Navigator.Buttons.NextPage.Visible = True
              Navigator.Buttons.Last.Hint = 'Va al '#250'ltimo registro'
              Navigator.Buttons.Last.Visible = True
              Navigator.Buttons.Insert.Hint = 'Inserta un nuevo Registro'
              Navigator.Buttons.Insert.Visible = True
              Navigator.Buttons.Append.Visible = False
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
              DataController.DataSource = dmBase.dsPerfiles
              DataController.Options = [dcoCaseInsensitive, dcoAssignGroupingValues, dcoAssignMasterDetailKeys, dcoSaveExpanding]
              DataController.Summary.DefaultGroupSummaryItems = <>
              DataController.Summary.FooterSummaryItems = <>
              DataController.Summary.SummaryGroups = <>
              OptionsBehavior.AlwaysShowEditor = True
              OptionsBehavior.GoToNextCellOnEnter = True
              OptionsBehavior.IncSearch = True
              OptionsData.Appending = True
              OptionsView.GroupByBox = False
              object tvPerfilUSUARIO_GRUPO_PERFILES: TcxGridDBColumn
                DataBinding.FieldName = 'USUARIO_GRUPO_PERFILES'
                DataBinding.IsNullValueType = True
                Width = 167
              end
              object tvPerfilKEY_PERFILES: TcxGridDBColumn
                DataBinding.FieldName = 'KEY_PERFILES'
                DataBinding.IsNullValueType = True
                Width = 132
              end
              object tvPerfilSUBKEY_PERFILES: TcxGridDBColumn
                DataBinding.FieldName = 'SUBKEY_PERFILES'
                DataBinding.IsNullValueType = True
                Width = 190
              end
              object tvPerfilVALUE_PERFILES: TcxGridDBColumn
                DataBinding.FieldName = 'VALUE_PERFILES'
                DataBinding.IsNullValueType = True
                Width = 112
              end
              object tvPerfilVALUE_TEXT_PERFILES: TcxGridDBColumn
                DataBinding.FieldName = 'VALUE_TEXT_PERFILES'
                DataBinding.IsNullValueType = True
                PropertiesClassName = 'TcxBlobEditProperties'
                Properties.BlobEditKind = bekMemo
                Width = 140
              end
              object tvPerfilTYPE_BLOB_PERFILES: TcxGridDBColumn
                DataBinding.FieldName = 'TYPE_BLOB_PERFILES'
                DataBinding.IsNullValueType = True
                PropertiesClassName = 'TcxBlobEditProperties'
                Properties.BlobEditKind = bekBlob
              end
              object tvPerfilVALUE_BLOB_PERFILES: TcxGridDBColumn
                DataBinding.FieldName = 'VALUE_BLOB_PERFILES'
                DataBinding.IsNullValueType = True
              end
            end
            object cxgrdlvlPerfil: TcxGridLevel
              GridView = tvPerfil
            end
          end
        end
      end
    end
    object pnlTopPage: TPanel
      Left = 0
      Top = 0
      Width = 951
      Height = 40
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 1
      object pnlTopGrid: TPanel
        Left = 0
        Top = 0
        Width = 951
        Height = 36
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        Align = alTop
        BevelOuter = bvNone
        Ctl3D = False
        ParentBackground = False
        ParentCtl3D = False
        TabOrder = 0
        object sbExportExcel: TSpeedButton
          Left = 811
          Top = 6
          Width = 21
          Height = 23
          Hint = 'Exportar Excel'
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Flat = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Lucida Sans Unicode'
          Font.Pitch = fpFixed
          Font.Style = []
          Font.Quality = fqClearType
          Glyph.Data = {
            36040000424D3604000000000000360000002800000010000000100000000100
            2000000000000004000000000000000000000000000000000000000000000000
            000000000000000000003C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C
            3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF000000000000
            000000000000000000003C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C
            3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF000000000000
            000000000000000000003C3C3CFF3C3C3CFF0000000000000000000000000000
            0000000000000000000000000000000000003C3C3CFF3C3C3CFF3C3C3CFF3C3C
            3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C
            3CFF3C3C3CFF3C3C3CFF3C3C3CFF000000003C3C3CFF3C3C3CFF3C3C3CFF0000
            00003C3C3CFF000000003C3C3CFF0000000000000000000000003C3C3CFF0000
            0000000000001E1E1E803C3C3CFF000000003C3C3CFF3C3C3CFF3C3C3CFF0000
            00001E1E1E80000000003C3C3CFF000000003C3C3CFF3C3C3CFF3C3C3CFF3C3C
            3CFF3C3C3CFF000000003C3C3CFF000000003C3C3CFF3C3C3CFF3C3C3CFF1E1E
            1E80000000001E1E1E803C3C3CFF000000003C3C3CFF3C3C3CFF3C3C3CFF1E1E
            1E80000000001E1E1E803C3C3CFF000000003C3C3CFF3C3C3CFF3C3C3CFF0000
            00001E1E1E80000000003C3C3CFF000000003C3C3CFF3C3C3CFF3C3C3CFF0000
            00003C3C3CFF3C3C3CFF3C3C3CFF000000003C3C3CFF3C3C3CFF3C3C3CFF0000
            00003C3C3CFF000000003C3C3CFF000000003C3C3CFF3C3C3CFF3C3C3CFF1E1E
            1E8000000000000000003C3C3CFF000000003C3C3CFF3C3C3CFF3C3C3CFF3C3C
            3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C
            3CFF3C3C3CFF3C3C3CFF3C3C3CFF000000003C3C3CFF3C3C3CFF000000000000
            000000000000000000003C3C3CFF3C3C3CFF0000000000000000000000000000
            0000000000000000000000000000000000003C3C3CFF3C3C3CFF000000000000
            000000000000000000003C3C3CFF3C3C3CFF0000000000000000000000000000
            0000000000003C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF000000000000
            000000000000000000003C3C3CFF3C3C3CFF0000000000000000000000000000
            0000000000003C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF1E1E1E7E000000000000
            000000000000000000003C3C3CFF3C3C3CFF0000000000000000000000000000
            0000000000003C3C3CFF3C3C3CFF3C3C3CFF1E1E1E7E00000000000000000000
            000000000000000000003C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C
            3CFF3C3C3CFF3C3C3CFF3C3C3CFF1E1E1E7E0000000000000000000000000000
            000000000000000000003C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C
            3CFF3C3C3CFF3C3C3CFF1E1E1E7E000000000000000000000000}
          ParentFont = False
          OnClick = sbExportExcelClick
        end
        object sbGrabarGrid: TSpeedButton
          Left = 846
          Top = 6
          Width = 21
          Height = 23
          Hint = 'Grabar Grid'
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Flat = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Lucida Sans Unicode'
          Font.Pitch = fpFixed
          Font.Style = []
          Font.Quality = fqClearType
          Glyph.Data = {
            36040000424D3604000000000000360000002800000010000000100000000100
            2000000000000004000000000000000000000000000000000000000000000000
            0000000000000000000000000002000000090000000C0000000C0000000C0000
            000D0000000D0000000D0000000C000000070000000200000000000000000000
            0000000000000000000000000008975B36FF975B36FF975B36FF975B36FF1563
            40FF156340FF156340FF156340FF0B32208E0000000600000000000000000000
            0000000000000000000000000008A96F46FFE9BC7EFFE9BC7EFFC99562FF1D78
            52FF3DD4A3FF3DD4A3FF2DA67AFF1D7852FF0000001200000006000000000000
            0002000000080000000C00000014A96F46FFE9BC7EFFE9BC7EFFC99562FF1D78
            52FF3DD4A3FF3DD4A3FF2DA67AFF1D7852FF184994FF0C254B8C000000000000
            000745312ABF60453BFFAFA29DFFA96F46FFFFF4C9FFFFF4C9FFEAD3A9FF1D78
            52FFA0FFECFFA0FFECFF80DEC6FF1D7852FF5FB7E5FF215CA7FF000000000000
            000A6F5347FF947869FFB4A6A2FFCEA988FFB88158FFB88158FFB88158FF7390
            66FF2CA074FF2CA074FF2CA074FF2CA074FF5FB7E5FF215CA7FF000000000000
            000A73574AFF987D6EFF938077FFFDFDFDFFF5F1EFFF6A7DDAFFA4BFFFFFA4BF
            FFFF89A4F7FF215CA7FFA8EFFFFFA8EFFFFF84D3F2FF215CA7FF000000000000
            0009785C4EFF9D8273FF765C50FFFFFFFFFFF9F6F3FFB0B8E4FF6A7EDAFF6A7E
            DAFF6A7EDAFF5384D1FF3B8BC7FF3B8BC7FF3B8BC7FF3B8BC7FF000000000000
            00087C6050FFA28777FF7B6154FFFFFFFFFFFFFFFFFFFEFEFEFFFDFDFDFFFCFC
            FCFFB5A9A3FFB8AAA5FFAC9E9AFF0000000E0000000400000003000000000000
            00077F6354FFA78E7DFF977A6AFF967969FF957967FF84695CFF785D53FF775C
            51FF775C51FF775A50FF62463CFF000000090000000000000000000000000000
            0007836757FFAB9382FF634A41FF614740FF5E463DFF5C443CFF5B433BFF5941
            39FF584037FF795C52FF654A3FFF000000090000000000000000000000000000
            0006866A59FFAF9788FF674E44FFF3EAE4FFE7D5C8FFE7D4C6FFE6D3C5FFE6D3
            C5FF5B433AFF7A5F54FF694E42FF000000080000000000000000000000000000
            0005886D5CFFB39C8CFF6B5248FFF4ECE6FFE9D9CDFFE8D7CAFFE7D5C8FFE6D4
            C6FF5E463EFF7C6156FF6C5145FF000000070000000000000000000000000000
            00048B705EFFB7A091FF70564DFFF6EFEAFFF5EDE8FFF4ECE6FFF4EBE4FFF3EA
            E3FF634A41FF7E6358FF715549FF000000060000000000000000000000000000
            0002675446BF8C715FFF755A50FF8D766CFF897369FF856D65FF81695FFF7C64
            5BFF674D45FF775B4DFF543F36C0000000030000000000000000000000000000
            0001000000020000000300000003000000030000000400000004000000040000
            0004000000040000000400000003000000010000000000000000}
          ParentFont = False
          OnClick = sbGrabarGridClick
        end
        object sbResetGrid: TSpeedButton
          Left = 866
          Top = 6
          Width = 21
          Height = 23
          Hint = 'Reset Grid'
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Flat = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Lucida Sans Unicode'
          Font.Pitch = fpFixed
          Font.Style = []
          Font.Quality = fqClearType
          Glyph.Data = {
            36040000424D3604000000000000360000002800000010000000100000000100
            2000000000000004000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000020000000A00000010000000090000000200000000000000000000
            00020000000A000000120000000C000000030000000000000000000000000000
            00020000000F0F0742921D0F7EEF0603347A0000000E00000002000000020000
            000F0804347C1D0F7EF00F084194000000120000000200000000000000000000
            0008120B47923233AFFF3648CCFF1D1EA5FF0603357A0000000F0000000F0703
            357C1F20A5FF3747CCFF2D2FAEFF120B46950000000B00000000000000000000
            000C281C8DF1596CD8FF3B51D3FF3A4FD2FF1E22A6FF0602347D0502357E2022
            A6FF3A50D3FF3A50D3FF4C5FD4FF291D8CF10000001000000000000000000000
            0006130F3C734D4FBAFF667EE0FF415AD6FF415AD7FF1F24A7FF2529A8FF415A
            D7FF415AD7FF5B72DEFF484AB8FF130F3C790000000900000000000000000000
            00010000000A16123F73585CC1FF758DE6FF4A64DBFF4A65DBFF4A65DBFF4A64
            DBFF6983E3FF5356C0FF16123F780000000C0000000200000000000000000000
            0000000000010000000A191643755D63C7FF6783E5FF5774E2FF5774E2FF5774
            E2FF565CC6FF1916437A0000000D000000020000000000000000000000000000
            00000000000100000009100E3D734A50BEFF7492EBFF6383E7FF6483E7FF6383
            E7FF3840B6FF0B0839780000000C000000020000000000000000000000000000
            0001000000071413416E555CC5FF85A1EFFF7897EDFF9CB6F4FF9DB7F5FF7997
            EEFF7796EDFF414ABCFF0E0C3C730000000A0000000100000000000000000000
            00041818456B636CCFFF93AFF3FF83A1F1FFA6BFF7FF676DCAFF7E87DDFFAFC7
            F8FF83A3F2FF83A1F1FF5058C4FF121040710000000600000000000000000000
            00065759C3EFAFC6F6FF8EADF4FFABC4F8FF6F76D0FF1817456F24244F70868E
            E1FFB5CCF9FF8DACF4FFA1B8F4FF5758C3EF0000000900000000000000000000
            000331326B8695A0EAFFC0D3F9FF7880D7FF1C1C496B00000006000000072527
            526C8B93E6FFC1D3F9FF949EE9FF303168870000000500000000000000000000
            00010000000431336B825E62CBEC1F204D680000000500000001000000010000
            00052728536B5E62CBEC31326883000000070000000100000000000000000000
            0000000000000000000200000004000000020000000100000000000000000000
            0001000000030000000500000004000000010000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000}
          ParentFont = False
          OnClick = sbResetGridClick
        end
        object edtBusqGlobal: TcxTextEdit
          Left = 136
          Top = 6
          TabOrder = 0
          Width = 161
        end
        object nvNavegador: TcxDBNavigator
          Left = 456
          Top = 6
          Width = 352
          Height = 23
          Buttons.CustomButtons = <>
          Buttons.Filter.Visible = False
          DataSource = dsTablaG
          LookAndFeel.NativeStyle = False
          TabOrder = 2
        end
        object lblTextoaBuscar: TcxLabel
          Left = 8
          Top = 9
          Caption = 'Texto a buscar'
          Transparent = True
        end
        object rbBBDD: TcxRadioButton
          Left = 345
          Top = 2
          Width = 100
          Height = 17
          Caption = 'Buscar BBDD'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Montserrat Medium'
          Font.Pitch = fpFixed
          Font.Style = []
          Font.Quality = fqClearType
          ParentFont = False
          TabOrder = 4
          Visible = False
          OnClick = rbBBDDClick
          Transparent = True
        end
        object rbGrid: TcxRadioButton
          Left = 345
          Top = 17
          Width = 100
          Height = 17
          Caption = 'Buscar Grid'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Montserrat Medium'
          Font.Pitch = fpFixed
          Font.Style = []
          Font.Quality = fqClearType
          ParentFont = False
          TabOrder = 5
          Visible = False
          OnClick = rbGridClick
          Transparent = True
        end
        object btnBusq: TcxButton
          Left = 302
          Top = 9
          Width = 33
          Height = 20
          OptionsImage.Glyph.SourceDPI = 96
          OptionsImage.Glyph.Data = {
            89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
            610000001974455874536F6674776172650041646F626520496D616765526561
            647971C9653C0000000B744558745469746C65005A6F6F6D3BCF09FEBC000000
            A449444154785EA5D2C10984301484616F426A7AF73461115BC1C2369093772B
            1272F36A031690537690811D1E44B244F879A0E62368A65AEB50376066ECBE12
            CAA87026647CFE082CE840D5C7FBCB1360B278431105CE4D106B014916CF4877
            360B925A402610D1A4008B04720B2804827F81502050867730FA0D7641FFFB0B
            EC12A0FB1CF8DE04BA4FE28E2E8F28D0CAE31F87ACDD00A747CE2E8088B6A213
            BD7EC0405F9BEBFFA1F53765600000000049454E44AE426082}
          TabOrder = 1
          OnClick = btnBusqClick
        end
      end
    end
  end
  object pButtonRightBar: TPanel [1]
    Left = 951
    Top = 0
    Width = 140
    Height = 558
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Align = alRight
    BevelOuter = bvNone
    ParentBackground = False
    TabOrder = 0
    object pButtonGen: TPanel
      Left = 0
      Top = 360
      Width = 140
      Height = 198
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Align = alBottom
      BevelOuter = bvNone
      Constraints.MinHeight = 81
      Constraints.MinWidth = 123
      ParentBackground = False
      TabOrder = 1
      object btnGrabar: TcxButton
        Left = 0
        Top = 131
        Width = 138
        Height = 34
        Caption = '&Grabar'
        TabOrder = 0
        OnClick = btnGrabarClick
      end
      object btnCancelar: TcxButton
        Left = 0
        Top = 163
        Width = 138
        Height = 34
        Caption = '&Cancelar'
        TabOrder = 1
        OnClick = btnCancelarClick
      end
    end
    object pButtonBDStat: TPanel
      Left = 0
      Top = 0
      Width = 140
      Height = 110
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Align = alTop
      BevelOuter = bvNone
      Constraints.MinHeight = 37
      Constraints.MinWidth = 123
      ParentBackground = False
      TabOrder = 0
      object pnStateDataSet: TPanel
        Left = 0
        Top = 21
        Width = 140
        Height = 25
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Align = alTop
        BevelOuter = bvNone
        Ctl3D = False
        ParentBackground = False
        ParentCtl3D = False
        TabOrder = 0
        object lblEditMode: TcxLabel
          Left = 18
          Top = -1
          Caption = 'EditMode'
          Transparent = True
        end
      end
      object pnlDataSetName: TPanel
        Left = 0
        Top = 0
        Width = 140
        Height = 21
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Align = alTop
        BevelOuter = bvNone
        Ctl3D = False
        ParentBackground = False
        ParentCtl3D = False
        TabOrder = 1
        object lblTablaOrigen: TcxLabel
          Left = 17
          Top = 2
          Caption = 'TablaOrigen'
          Transparent = True
        end
      end
    end
  end
  inherited Localizer1: TcxLocalizer
    Left = 232
    Top = 440
  end
  object dsTablaG: TDataSource
    OnStateChange = dsTablaGStateChange
    Left = 8
    Top = 440
  end
  object JvEnterAsTab1: TJvEnterAsTab
    Left = 528
    Top = 264
  end
  object saveDialog: TdxSaveFileDialog
    Options = [ofOverwritePrompt, ofHideReadOnly, ofEnableSizing]
    Left = 536
    Top = 272
  end
end
