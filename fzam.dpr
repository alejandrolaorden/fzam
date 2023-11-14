program Fzam;

uses
  {$IFDEF DEBUG}
  FastMM4,
  {$ENDIF }
  MidasLib,
  Vcl.Forms,
  Vcl.Controls,
  UniDataArticulos in 'UniDataArticulos.pas',
  UniDataClientes in 'UniDataClientes.pas',
  UniDataConn in 'UniDataConn.pas' {dmConn: TDataModule},
  UniDataContadores in 'UniDataContadores.pas',
  UniDataEmpresas in 'UniDataEmpresas.pas',
  UniDataFamilias in 'UniDataFamilias.pas',
  UniDataFormasdePago in 'UniDataFormasdePago.pas',
  UniDataGeneradorProcesos in 'UniDataGeneradorProcesos.pas' {dmGeneradorProcesos: TDataModule},
  UniDataGrupos in 'UniDataGrupos.pas' {dmGrupos: TDataModule},
  UniDataIvas in 'UniDataIvas.pas' {dmIvas: TDataModule},
  UniDataIvasGrupos in 'UniDataIvasGrupos.pas' {dmIvasGrupos: TDataModule},
  UniDataPerfiles in 'UniDataPerfiles.pas' {dmPerfiles: TDataModule},
  UniDataProveedores in 'UniDataProveedores.pas' {dmProveedores: TDataModule},
  UniDataTarifas in 'UniDataTarifas.pas' {dmTarifas: TDataModule},
  UniDataUsuarios in 'UniDataUsuarios.pas' {dmUsuarios: TDataModule},
  UniDataUsuariosPerfiles in 'UniDataUsuariosPerfiles.pas' {dmUsuariosPerfiles: TDataModule},
  inLibDevExp in 'inLibDevExp.pas',
  inLibDir in 'inLibDir.pas',
  inLibGlobalVar in 'inLibGlobalVar.pas',
  inLibLog in 'inLibLog.pas',
  inLibtb in 'inLibtb.pas',
  inLibUser in 'inLibUser.pas',
  inLibWin in 'inLibWin.pas',
  inLibShowMto in 'inLibShowMto.pas',
  inMtoFrmBase in 'inMtoFrmBase.pas' {frmBase},
  inMtoGen in 'inMtoGen.pas' {frmMtoGen},
  UniDataGen in 'UniDataGen.pas' {dmBase: TDataModule},
  inMtoFacturas in 'inMtoFacturas.pas',
  UniDataFacturas in 'UniDataFacturas.pas',
  inMtoArticulos in 'inMtoArticulos.pas',
  inMtoClientes in 'inMtoClientes.pas',
  inMtoContadores in 'inMtoContadores.pas',
  inMtoEmpresas in 'inMtoEmpresas.pas',
  inMtoFamilias in 'inMtoFamilias.pas',
  inMtoFormasdePago in 'inMtoFormasdePago.pas',
  inMtoGeneradorProcesos in 'inMtoGeneradorProcesos.pas' {frmMtoGeneradorProcesos},
  inMtoGenSearch in 'inMtoGenSearch.pas' {frmMtoSearch},
  inMtoGrupos in 'inMtoGrupos.pas' {frmMtoGrupos},
  inMtoIvas in 'inMtoIvas.pas' {frmMtoIvas},
  inMtoIvasGrupos in 'inMtoIvasGrupos.pas' {frmMtoIvasGrupos},
  inMtoLogon in 'inMtoLogon.pas' {frmLogon},
  inMtoModalArtTar in 'inMtoModalArtTar.pas' {frmMtoModalArtTar},
  inMtoModalFacRec in 'inMtoModalFacRec.pas' {frmGenFacRec},
  inMtoModalGenFilter in 'inMtoModalGenFilter.pas' {frmModalGenFilter},
  inMtoModalGenImp in 'inMtoModalGenImp.pas' {frmPrint},
  inMtoModalGenImpEle in 'inMtoModalGenImpEle.pas' {frmMtoModalGenImpEle},
  inMtoModalGenImpSave in 'inMtoModalGenImpSave.pas' {frmModalGenImpSave},
  inMtoModalGenPass in 'inMtoModalGenPass.pas' {frmModalGenPass},
  inMtoModalImpFac in 'inMtoModalImpFac.pas' {frmPrintFac},
  inMtoModalImpRecFac in 'inMtoModalImpRecFac.pas' {frmPrintRecFac},
  inMtoProveedores in 'inMtoProveedores.pas' {frmMtoProveedores},
  inMtoTarifas in 'inMtoTarifas.pas' {frmMtoTarifas},
  inMtoUsuarios in 'inMtoUsuarios.pas' {frmMtoUsuarios},
  inMtoUsuariosPerfiles in 'inMtoUsuariosPerfiles.pas' {frmMtoUsuariosPerfiles},
  inMtoPrincipal2 in 'inMtoPrincipal2.pas' {frmOpenApp2},
  inLibUnitForm in 'inLibUnitForm.pas',
  inLibMsg in 'inLibMsg.pas',
  inLibNet in 'inLibNet.pas',
  vcl.consts in 'vcl\vcl.consts.pas',
  system.sysconst in 'vcl\system.sysconst.pas',
  inLibScriptDB in 'inLibScriptDB.pas',
  inMtoSplash in 'inMtoSplash.pas' {frmSplash};

begin
    {$IFDEF DEBUG}
      ReportMemoryLeaksOnShutdown := True;
    {$ENDIF}
    Application.Initialize;
    Application.MainFormOnTaskbar := True;
    Application.Title := 'Login';
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
