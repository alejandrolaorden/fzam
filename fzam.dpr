program Fzam;

uses
  {$IFDEF DEBUG}
  FastMM4,
  {$ENDIF }
  Forms,
  MidasLib,
  Vcl.Consts in 'vcl\Vcl.Consts.pas',
  System.SysConst in 'vcl\System.SysConst.pas',
  inLibDevExp in 'inLibDevExp.pas',
  inLibDir in 'inLibDir.pas',
  inLibGlobalVar in 'inLibGlobalVar.pas',
  inLibLog in 'inLibLog.pas',
  inLibtb in 'inLibtb.pas',
  inLibUser in 'inLibUser.pas',
  inLibWin in 'inLibWin.pas',
  inLibShowMto in 'inLibShowMto.pas',
  inLibUnitForm in 'inLibUnitForm.pas',
  inLibMsg in 'inLibMsg.pas',
  inLibNet in 'inLibNet.pas',
  inLibScriptDB in 'inLibScriptDB.pas',
  inLibIBAN.Utils in 'inLibIBAN.Utils.pas',
  inLibIBAN.Types in 'inLibIBAN.Types.pas',
  inLibIBAN.Funcs in 'inLibIBAN.Funcs.pas',
  inLibFacturas in 'inLibFacturas.pas',
  inMtoFrmBase in 'inMtoFrmBase.pas' {frmBase},
  inMtoLogon in 'inMtoLogon.pas' {frmLogon},
  inMtoPrincipal2 in 'inMtoPrincipal2.pas' {frmOpenApp2},
  inMtoGen in 'inMtoGen.pas' {frmMtoGen},
  inMtoFacturas in 'inMtoFacturas.pas' {frmMtoFacturas},
  inMtoArticulos in 'inMtoArticulos.pas' {frmMtoArticulos},
  inMtoClientes in 'inMtoClientes.pas' {frmMtoClientes},
  inMtoContadores in 'inMtoContadores.pas' {frmMtoContadores},
  inMtoEmpresas in 'inMtoEmpresas.pas' {frmMtoEmpresas},
  inMtoFamilias in 'inMtoFamilias.pas' {frmMtoFamilias},
  inMtoFormasdePago in 'inMtoFormasdePago.pas' {frmMtoFormasdePago},
  inMtoGeneradorProcesos in 'inMtoGeneradorProcesos.pas'
                                                      {frmMtoGeneradorProcesos},
  inMtoGenSearch in 'inMtoGenSearch.pas' {frmMtoSearch},
  inMtoGrupos in 'inMtoGrupos.pas' {frmMtoGrupos},
  inMtoIvas in 'inMtoIvas.pas' {frmMtoIvas},
  inMtoIvasGrupos in 'inMtoIvasGrupos.pas' {frmMtoIvasGrupos},
  inMtoProveedores in 'inMtoProveedores.pas' {frmMtoProveedores},
  inMtoTarifas in 'inMtoTarifas.pas' {frmMtoTarifas},
  inMtoUsuarios in 'inMtoUsuarios.pas' {frmMtoUsuarios},
  inMtoUsuariosPerfiles in 'inMtoUsuariosPerfiles.pas' {frmMtoUsuariosPerfiles},
  inMtoModalArtTar in 'inMtoModalArtTar.pas' {frmMtoModalArtTar},
  inMtoModalFacRec in 'inMtoModalFacRec.pas' {frmGenFacRec},
  inMtoModalGenFilter in 'inMtoModalGenFilter.pas' {frmModalGenFilter},
  inMtoModalGenImp in 'inMtoModalGenImp.pas' {frmPrint},
  inMtoModalGenImpEle in 'inMtoModalGenImpEle.pas' {frmMtoModalGenImpEle},
  inMtoModalGenImpSave in 'inMtoModalGenImpSave.pas' {frmModalGenImpSave},
  inMtoModalGenPass in 'inMtoModalGenPass.pas' {frmModalGenPass},
  inMtoModalImpFac in 'inMtoModalImpFac.pas' {frmPrintFac},
  inMtoModalImpRecFac in 'inMtoModalImpRecFac.pas' {frmPrintRecFac},
  inMtoModalCliEti in 'inMtoModalCliEti.pas' {frmPrintCliEti},
  inMtoSplash in 'inMtoSplash.pas' {frmSplash},
    UniDataConn in 'UniDataConn.pas' {dmConn: TDataModule},
  UniDataGen in 'UniDataGen.pas' {dmBase: TDataModule},
  UniDataArticulos in 'UniDataArticulos.pas' {dmArticulos: TdmArticulos},
  UniDataClientes in 'UniDataClientes.pas' {dmClientes: TdmClientes},
  UniDataContadores in 'UniDataContadores.pas' {dmContadores: dmContadores},
  UniDataEmpresas in 'UniDataEmpresas.pas' {dmEmpresas: TdmEmpresas},
  UniDataFamilias in 'UniDataFamilias.pas' {dmFamilias1. TdmFamilias},
  UniDataFormasdePago in 'UniDataFormasdePago.pas'
                                              {dmFormasdePago: TdmFormasdePago},
  UniDataGeneradorProcesos in 'UniDataGeneradorProcesos.pas'
                                             {dmGeneradorProcesos: TDataModule},
  UniDataGrupos in 'UniDataGrupos.pas' {dmGrupos: TDataModule},
  UniDataIvas in 'UniDataIvas.pas' {dmIvas: TDataModule},
  UniDataIvasGrupos in 'UniDataIvasGrupos.pas' {dmIvasGrupos: TDataModule},
  UniDataPerfiles in 'UniDataPerfiles.pas' {dmPerfiles: TDataModule},
  UniDataProveedores in 'UniDataProveedores.pas' {dmProveedores: TDataModule},
  UniDataTarifas in 'UniDataTarifas.pas' {dmTarifas: TDataModule},
  UniDataUsuarios in 'UniDataUsuarios.pas' {dmUsuarios: TDataModule},
  UniDataUsuariosPerfiles in 'UniDataUsuariosPerfiles.pas'
                                              {dmUsuariosPerfiles: TDataModule},
  UniDataFacturas in 'UniDataFacturas.pas'{dmFacturas: TdmFacturas};

begin
  {$IFDEF DEBUG}
    ReportMemoryLeaksOnShutdown := True;
  {$ENDIF}
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'FZam';
  with TfrmLogon.Create(Application) do
  begin
    try
      ShowModal;
      Caption := Application.Title;
      if sSuccess <> 'S' then
        Exit;
    finally
      Free;
    end;
  end;
  Application.CreateForm(TfrmOpenApp2, frmOpenApp2);
  Application.Run;
end.
