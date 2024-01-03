inherited frmModalGenFilter: TfrmModalGenFilter
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Filtrar por grupos de datos'
  ClientHeight = 366
  ClientWidth = 617
  Position = poMainFormCenter
  OnClose = FormClose
  ExplicitWidth = 633
  ExplicitHeight = 405
  TextHeight = 19
  object pnl1: TPanel [0]
    Left = 0
    Top = 325
    Width = 617
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    object btnGuardar: TcxButton
      Left = 462
      Top = 8
      Width = 145
      Height = 25
      Caption = '&Aceptar'
      TabOrder = 0
      OnClick = btnGuardarClick
    end
    object btnCancelar: TcxButton
      Left = 8
      Top = 8
      Width = 137
      Height = 25
      Caption = '&Cancelar'
      TabOrder = 1
      OnClick = btnCancelarClick
    end
  end
  object cxGrid1: TcxGrid [1]
    Left = 0
    Top = 0
    Width = 617
    Height = 325
    Align = alClient
    TabOrder = 1
    ExplicitLeft = 192
    ExplicitTop = 104
    ExplicitWidth = 250
    ExplicitHeight = 200
    object cxGrid1DBTableView1: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      ScrollbarAnnotations.CustomAnnotations = <>
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = cxGrid1DBTableView1
    end
  end
  object pnl2: TPanel [2]
    Left = 0
    Top = 0
    Width = 617
    Height = 325
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 2
    ExplicitTop = 8
    ExplicitWidth = 621
    ExplicitHeight = 326
    object pcFiltros: TcxPageControl
      Left = 0
      Top = 0
      Width = 621
      Height = 326
      Align = alClient
      TabOrder = 0
      Properties.ActivePage = tsEmpresas
      Properties.CustomButtons.Buttons = <>
      ExplicitLeft = 1
      ExplicitTop = 1
      ExplicitWidth = 615
      ExplicitHeight = 323
      ClientRectBottom = 320
      ClientRectLeft = 3
      ClientRectRight = 615
      ClientRectTop = 32
      object tsEmpresas: TcxTabSheet
        Caption = '&1_Empresas -'
        ImageIndex = 0
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
        object grdEmp: TcxGrid
          Left = 0
          Top = 0
          Width = 612
          Height = 288
          Align = alClient
          TabOrder = 0
          ExplicitLeft = 184
          ExplicitTop = 48
          ExplicitWidth = 250
          ExplicitHeight = 200
          object tvEmp: TcxGridDBTableView
            Navigator.Buttons.CustomButtons = <>
            ScrollbarAnnotations.CustomAnnotations = <>
            DataController.DataSource = dmGenFilter.dsEmpresas
            DataController.Summary.DefaultGroupSummaryItems = <>
            DataController.Summary.FooterSummaryItems = <>
            DataController.Summary.SummaryGroups = <>
            OptionsData.CancelOnExit = False
            OptionsData.Deleting = False
            OptionsData.DeletingConfirmation = False
            OptionsData.Editing = False
            OptionsData.Inserting = False
            OptionsSelection.MultiSelect = True
            OptionsSelection.MultiSelectMode = msmPersistent
            OptionsView.GroupByBox = False
            object tvEmpCODIGO_EMPRESA: TcxGridDBColumn
              DataBinding.FieldName = 'CODIGO_EMPRESA'
            end
            object tvEmpRAZONSOCIAL_EMPRESA: TcxGridDBColumn
              DataBinding.FieldName = 'RAZONSOCIAL_EMPRESA'
            end
            object tvEmpNIF_EMPRESA: TcxGridDBColumn
              DataBinding.FieldName = 'NIF_EMPRESA'
            end
            object tvEmpMOVIL_EMPRESA: TcxGridDBColumn
              DataBinding.FieldName = 'MOVIL_EMPRESA'
            end
            object tvEmpEMAIL_EMPRESA: TcxGridDBColumn
              DataBinding.FieldName = 'EMAIL_EMPRESA'
            end
            object tvEmpDIRECCION1_EMPRESA: TcxGridDBColumn
              DataBinding.FieldName = 'DIRECCION1_EMPRESA'
            end
            object tvEmpDIRECCION2_EMPRESA: TcxGridDBColumn
              DataBinding.FieldName = 'DIRECCION2_EMPRESA'
            end
            object tvEmpCPOSTAL_EMPRESA: TcxGridDBColumn
              DataBinding.FieldName = 'CPOSTAL_EMPRESA'
            end
            object tvEmpPOBLACION_EMPRESA: TcxGridDBColumn
              DataBinding.FieldName = 'POBLACION_EMPRESA'
            end
            object tvEmpPROVINCIA_EMPRESA: TcxGridDBColumn
              DataBinding.FieldName = 'PROVINCIA_EMPRESA'
            end
            object tvEmpPAIS_EMPRESA: TcxGridDBColumn
              DataBinding.FieldName = 'PAIS_EMPRESA'
            end
            object tvEmpSERIE_CONTADOR_EMPRESA: TcxGridDBColumn
              DataBinding.FieldName = 'SERIE_CONTADOR_EMPRESA'
            end
            object tvEmpGRUPO_ZONA_IVA_EMPRESA: TcxGridDBColumn
              DataBinding.FieldName = 'GRUPO_ZONA_IVA_EMPRESA'
            end
            object tvEmpESRETENCIONES_EMPRESA: TcxGridDBColumn
              DataBinding.FieldName = 'ESRETENCIONES_EMPRESA'
            end
            object tvEmpESREGIMENESPECIALAGRICOLA_EMPRESA: TcxGridDBColumn
              DataBinding.FieldName = 'ESREGIMENESPECIALAGRICOLA_EMPRESA'
            end
            object tvEmpTEXTO_LEGAL_FACTURA_EMPRESA: TcxGridDBColumn
              DataBinding.FieldName = 'TEXTO_LEGAL_FACTURA_EMPRESA'
            end
          end
          object lvEmp: TcxGridLevel
            GridView = tvEmp
          end
        end
      end
      object tsFamilias: TcxTabSheet
        Caption = '&2_Familias -'
        ImageIndex = 1
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
        object cxDBListBox2: TcxDBListBox
          AlignWithMargins = True
          Left = 3
          Top = 3
          Width = 606
          Height = 282
          Align = alClient
          Columns = 2
          ItemHeight = 19
          MultiSelect = True
          ReadOnly = True
          TabOrder = 0
        end
      end
      object tsTarifas: TcxTabSheet
        Caption = '&3_Tarifas -'
        ImageIndex = 2
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
        object cxDBListBox3: TcxDBListBox
          AlignWithMargins = True
          Left = 3
          Top = 3
          Width = 606
          Height = 282
          Align = alClient
          Columns = 2
          ItemHeight = 19
          MultiSelect = True
          ReadOnly = True
          TabOrder = 0
        end
      end
      object tsArticulos: TcxTabSheet
        Caption = '&4_Articulos -'
        ImageIndex = 3
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
      end
      object tsVentas: TcxTabSheet
        Caption = '&5_Facturas -'
        ImageIndex = 4
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
      end
    end
  end
  inherited Localizer1: TcxLocalizer
    Left = 160
    Top = 328
  end
  object JvEnterAsTab1: TJvEnterAsTab
    Left = 240
    Top = 328
  end
end
