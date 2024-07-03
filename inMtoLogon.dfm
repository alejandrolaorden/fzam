inherited frmLogon: TfrmLogon
  Left = 372
  Top = 317
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Login FactuZam'
  ClientHeight = 492
  ClientWidth = 779
  Font.Charset = ANSI_CHARSET
  KeyPreview = True
  Position = poScreenCenter
  OnClose = FormClose
  OnKeyDown = FormKeyDown
  ExplicitWidth = 795
  ExplicitHeight = 531
  TextHeight = 19
  object lblUsuario: TLabel [0]
    Left = 47
    Top = 31
    Width = 65
    Height = 19
    Caption = 'Usuario'
  end
  object lblContrasena: TLabel [1]
    Left = 15
    Top = 113
    Width = 98
    Height = 19
    Caption = 'Contrase'#241'a'
  end
  object lblHostBBDD: TLabel [2]
    Left = 392
    Top = 19
    Width = 90
    Height = 19
    Caption = 'Host BBDD'
  end
  object Bevel1: TBevel [3]
    Left = 333
    Top = 42
    Width = 10
    Height = 153
  end
  object lblNomBBDD: TLabel [4]
    Left = 391
    Top = 83
    Width = 90
    Height = 19
    Caption = 'Nom BBDD'
  end
  object lblUserBBDD: TLabel [5]
    Left = 365
    Top = 115
    Width = 116
    Height = 19
    Caption = 'Usuario BBDD'
  end
  object lblPasswordBBDD: TLabel [6]
    Left = 351
    Top = 147
    Width = 130
    Height = 19
    Caption = 'Password BBDD'
  end
  object lblPortHost: TLabel [7]
    Left = 385
    Top = 50
    Width = 99
    Height = 19
    Caption = 'Puerto Host'
  end
  object btnAceptar: TcxButton [8]
    Left = 105
    Top = 178
    Width = 89
    Height = 29
    Caption = '&Aceptar'
    ParentShowHint = False
    ShowHint = False
    TabOrder = 3
    OnClick = btnAceptarClick
  end
  object btnSalir: TcxButton [9]
    Left = 8
    Top = 178
    Width = 91
    Height = 29
    Caption = '&Salir'
    ModalResult = 3
    TabOrder = 4
    OnClick = btnSalirClick
  end
  object edtUser: TcxTextEdit [10]
    Left = 119
    Top = 23
    TabOrder = 0
    Width = 181
  end
  object edtPass: TcxTextEdit [11]
    Left = 119
    Top = 110
    Properties.EchoMode = eemPassword
    Properties.PasswordChar = '*'
    TabOrder = 1
    Width = 181
  end
  object edtGrupo: TcxTextEdit [12]
    Left = 8
    Top = 60
    TabOrder = 2
    Visible = False
    Width = 41
  end
  object btnConf: TcxButton [13]
    Left = 200
    Top = 178
    Width = 123
    Height = 29
    Caption = '&Conf BBDD ->'
    TabOrder = 5
    OnClick = btnConfClick
  end
  object edtHostName: TcxTextEdit [14]
    Left = 494
    Top = 16
    TabOrder = 6
    Width = 243
  end
  object edtNomBD: TcxTextEdit [15]
    Left = 494
    Top = 80
    TabOrder = 7
    Width = 150
  end
  object edtUserBD: TcxTextEdit [16]
    Left = 494
    Top = 112
    TabOrder = 8
    Width = 150
  end
  object edtPassBD: TcxTextEdit [17]
    Left = 494
    Top = 144
    Properties.EchoMode = eemPassword
    Properties.PasswordChar = '*'
    TabOrder = 9
    OnExit = edtPassBDExit
    Width = 128
  end
  object edtPortBD: TcxTextEdit [18]
    Left = 494
    Top = 47
    Properties.OnChange = edtPortBDPropertiesChange
    TabOrder = 10
    Width = 49
  end
  object btnTest: TcxButton [19]
    Left = 349
    Top = 178
    Width = 428
    Height = 30
    Caption = 'Grabar ini y Probar Conexi'#243'n'
    TabOrder = 11
    OnClick = btnTestClick
  end
  object btnSubirScript: TcxButton [20]
    Left = 349
    Top = 216
    Width = 117
    Height = 30
    Caption = 'Subir script'
    TabOrder = 12
    OnClick = btnSubirScriptClick
  end
  object btnCopiaSeguridad: TcxButton [21]
    Left = 472
    Top = 216
    Width = 150
    Height = 30
    Caption = 'Copia seguridad'
    TabOrder = 13
    OnClick = btnCopiaSeguridadClick
  end
  object btnRecover: TcxButton [22]
    Left = 628
    Top = 216
    Width = 149
    Height = 30
    Caption = 'Recuperar crypt'
    TabOrder = 14
    OnClick = btnRecoverClick
  end
  object chkRememberPassword: TcxCheckBox [23]
    Left = 119
    Top = 141
    Caption = 'Recordar Password'
    TabOrder = 15
  end
  object chkRememberUser: TcxCheckBox [24]
    Left = 119
    Top = 52
    Caption = 'Recordar Usuario'
    TabOrder = 16
  end
  object btChangePassRoot: TcxButton [25]
    Left = 628
    Top = 147
    Width = 29
    Height = 24
    OptionsImage.Glyph.SourceDPI = 96
    OptionsImage.Glyph.Data = {
      89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
      610000001974455874536F6674776172650041646F626520496D616765526561
      647971C9653C00000027744558745469746C6500526566726573683B52657065
      61743B426172733B526962626F6E3B52656C6F6164CD4DF6E90000009B494441
      54785EAD93310AC0200C457B11E9219C0A9EA7B327C899DC1C7B8C8EEEBD44FA
      87146CD280A5151E42481ED1E8C4CC9FF84F9052BA0820830A0EA14A2C7479F4
      24584001EC502487006B41E88A37B082595825C66097DD0872571C11D3DD45D0
      001B81B3B480F49146A7A08BADC0B9301A90BB0202F744BB5C4103510B24764D
      227B1DEC03632C203C09E8C5433277402F9FF2BF9FE91327781B12D28E1D1785
      0000000049454E44AE426082}
    TabOrder = 17
    OnClick = btChangePassRootClick
  end
  object chkAuto: TcxCheckBox [26]
    Left = 8
    Top = 283
    Caption = 'Arranque sin login'
    Style.TransparentBorder = False
    TabOrder = 18
  end
  object pnlPPBottom: TPanel [27]
    Left = 0
    Top = 311
    Width = 779
    Height = 181
    Align = alBottom
    TabOrder = 19
    object cxMemo1: TcxMemo
      Left = 1
      Top = 1
      TabStop = False
      Align = alClient
      ParentColor = True
      Properties.ReadOnly = True
      Properties.ScrollBars = ssVertical
      TabOrder = 0
      Visible = False
      Height = 179
      Width = 777
    end
  end
  object MySQLUniProvider1: TMySQLUniProvider
    Left = 752
    Top = 72
  end
  object ucConexion: TUniConnection
    ProviderName = 'MySQL'
    Port = 3307
    Database = 'factuzam'
    SpecificOptions.Strings = (
      'MySQL.UseUnicode=True')
    Username = 'root'
    Server = '127.0.0.1'
    LoginPrompt = False
    OnError = ucConexionError
    Left = 664
    Top = 72
    EncryptedPassword = 'CEFFB9FFC9FFA8FFC9FF96FFCEFF95FFCEFF'
  end
  object udDump: TUniDump
    Connection = ucConexion
    SpecificOptions.Strings = (
      'MySQL.BackupStoredProcs=True'
      'MySQL.BackupTables=True'
      'MySQL.BackupTriggers=True'
      'MySQL.BackupViews=True'
      'MySQL.HexBlob=True')
    Options.QuoteNames = True
    Left = 752
    Top = 128
  end
  object tbUsers: TUniTable
    TableName = 'fza_usuarios'
    Connection = ucConexion
    Left = 664
    Top = 128
  end
  object UniSQLMonitor1: TUniSQLMonitor
    Active = False
    Options = [moDialog, moSQLMonitor, moDBMonitor, moCustom, moHandled]
    DBMonitorOptions.Host = '0'
    DBMonitorOptions.Port = 0
    DBMonitorOptions.ReconnectTimeout = 0
    DBMonitorOptions.SendTimeout = 0
    TraceFlags = [tfQPrepare, tfQExecute, tfQFetch, tfError, tfStmt, tfConnect, tfTransact, tfBlob, tfService, tfMisc, tfParams, tfObjDestroy, tfPool]
    OnSQL = UniSQLMonitor1SQL
    Left = 696
    Top = 31
  end
  object saveDialog: TdxSaveFileDialog
    Options = [ofOverwritePrompt, ofHideReadOnly, ofEnableSizing]
    Left = 384
    Top = 248
  end
  object openDialog: TdxOpenFileDialog
    Left = 456
    Top = 248
  end
end
