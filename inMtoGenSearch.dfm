inherited frmMtoSearch: TfrmMtoSearch
  BorderStyle = bsSizeable
  Caption = 'frmMtoSearch'
  ClientHeight = 519
  ClientWidth = 941
  Visible = False
  ExplicitWidth = 957
  PixelsPerInch = 96
  TextHeight = 19
  inherited pButtonPage: TPanel
    Width = 801
    Height = 519
    ExplicitWidth = 801
    ExplicitHeight = 519
    inherited pcPantalla: TcxPageControl
      Width = 801
      Height = 409
      ExplicitWidth = 801
      ExplicitHeight = 409
      ClientRectBottom = 403
      ClientRectRight = 795
      inherited tsLista: TcxTabSheet
        ExplicitTop = 32
        ExplicitWidth = 792
        ExplicitHeight = 371
        inherited cxGrdPrincipal: TcxGrid
          Width = 792
          Height = 371
          ExplicitWidth = 792
          ExplicitHeight = 371
          inherited cxGrdDBTabPrin: TcxGridDBTableView
            OnCellDblClick = cxGrdDBTabPrinCellDblClick
            OptionsData.Appending = False
            OptionsData.CancelOnExit = False
            OptionsData.Deleting = False
            OptionsData.DeletingConfirmation = False
            OptionsData.Inserting = False
          end
        end
      end
      inherited tsFicha: TcxTabSheet
        TabVisible = False
        ExplicitWidth = 792
        ExplicitHeight = 371
      end
      inherited tsPerfil: TcxTabSheet
        TabVisible = False
        ExplicitWidth = 792
        ExplicitHeight = 371
        inherited pnlPerfilTop: TPanel
          Width = 792
          ExplicitWidth = 792
        end
        inherited pnlPerfilDetail: TPanel
          Width = 792
          Height = 314
          ExplicitWidth = 792
          ExplicitHeight = 314
          inherited cxgrdPerfil: TcxGrid
            Width = 792
            Height = 314
            ExplicitWidth = 792
            ExplicitHeight = 314
          end
        end
      end
    end
    inherited pnlTopPage: TPanel
      Width = 801
      ExplicitWidth = 801
      inherited pnlTopGrid: TPanel
        Width = 801
        ExplicitWidth = 801
        inherited sbExportExcel: TSpeedButton
          Visible = False
        end
        inherited nvNavegador: TcxDBNavigator
          Visible = False
        end
      end
    end
    object pnl1: TPanel
      Left = 0
      Top = 449
      Width = 801
      Height = 70
      Align = alBottom
      TabOrder = 2
      object btnAceptar: TcxButton
        Left = 320
        Top = 24
        Width = 177
        Height = 25
        Caption = '&Aceptar'
        TabOrder = 0
        OnClick = btnAceptarClick
      end
      object btnCancelar1: TcxButton
        Left = 18
        Top = 24
        Width = 177
        Height = 25
        Caption = '&Cancelar'
        TabOrder = 1
        OnClick = btnCancelarClick
      end
    end
  end
  inherited pButtonRightBar: TPanel
    Left = 801
    Height = 519
    Visible = False
    ExplicitLeft = 801
    ExplicitHeight = 519
    inherited pButtonGen: TPanel
      Top = 321
      ExplicitTop = 321
      inherited btnGrabar: TcxButton
        Visible = False
      end
      inherited btnCancelar: TcxButton
        Visible = False
      end
    end
  end
  object unqryPerfiles: TUniQuery
    Connection = dmConn.conUni
    SQL.Strings = (
      'SELECT * FROM fza_usuarios_perfiles ')
    Left = 376
    Top = 440
  end
  object dsPerfiles: TDataSource
    DataSet = unqryPerfiles
    Left = 312
    Top = 264
  end
end
