USE `factuzam`;
DELIMITER $$
DROP PROCEDURE IF EXISTS `PRC_UPDATE_VERSION_FROM_1.0.0.30112023.alpha` $$
CREATE PROCEDURE `PRC_UPDATE_VERSION_FROM_1.0.0.30112023.alpha` ()
BEGIN
  START TRANSACTION;

  -- Actualizo versión en la bbdd 
  REPLACE INTO           `fza_usuarios_perfiles` (`USUARIO_GRUPO_PERFILES`, 
                                                  `KEY_PERFILES`, 
												  `SUBKEY_PERFILES`, 
												  `VALUE_PERFILES`, 
												  `VALUE_TEXT_PERFILES`, 
												  `TYPE_BLOB_PERFILES`, 
												  `VALUE_BLOB_PERFILES`, 
												  `INSTANTEMODIF`, 
												  `INSTANTEALTA`, 
												  `USUARIOALTA`, 
												  `USUARIOMODIF`) 
										  VALUES ('Todos', 
										          'frmLogon', 
												  'DataBaseVersion', 
												  '1.0.0.30112023.alpha', 
												  NULL, 
												  NULL, 
												  NULL, 
												  '2023-12-01 19:54:58', 
												  '2023-12-01 19:54:49', 
												  'Administrador', 
												  'Administrador');
												  
  -- Modificación de la tabla fza_winforms con una nueva columna y datos con los módulos de datos.
  IF (NOT (EXISTS( SELECT *
                   FROM INFORMATION_SCHEMA.COLUMNS
                  WHERE table_schema = 'factuzam'  
                    AND table_name = 'fza_winforms'
                    AND column_name = 'DATAMODULE_WINF')))  THEN
  BEGIN    	
    ALTER TABLE fza_winforms ADD COLUMN DATAMODULE_WINF VARCHAR(255);		

	UPDATE `fza_winforms` 
	SET `DATAMODULE_WINF` = 'UniDataArticulos.TdmArticulos' 
	WHERE `CALL_WINF` = 'Articulos';
	
	UPDATE `fza_winforms` 
	SET `DATAMODULE_WINF` = 'UniDataClientes.TdmClientes'
	WHERE	`CALL_WINF` = 'Clientes';
	
	UPDATE `fza_winforms`
	SET `DATAMODULE_WINF` = 'UniDataContadores.TdmContadores' 
	WHERE `CALL_WINF` = 'Contadores';
	
	UPDATE `fza_winforms` 
	SET `DATAMODULE_WINF` = 'UniDataEmpresas.TdmEmpresas' 
	WHERE `CALL_WINF` = 'Empresas';
	
	UPDATE `fza_winforms` 
	SET `DATAMODULE_WINF` = 'UniDataFacturas.TdmFacturas' 
	WHERE `CALL_WINF` = 'Facturas';
	
	UPDATE `fza_winforms` 
	SET `DATAMODULE_WINF` = 'UniDataFamilias.TdmFamilias' 
	WHERE `CALL_WINF` = 'Familias';
	
	UPDATE `fza_winforms`
	  SET `DATAMODULE_WINF` = 'UniDataFormasdePago.TdmFormasdePago' 
	WHERE `CALL_WINF` = 'FormasdePago';
	
	UPDATE `fza_winforms` 
	SET `DATAMODULE_WINF` = 'UniDataGeneradorProcesos.TdmGeneradorProcesos' 
	WHERE	`CALL_WINF` = 'GeneradorProcesos';
	
	UPDATE `fza_winforms` 
	SET `DATAMODULE_WINF` = 'UniDataGrupos.TdmGrupos' 
	WHERE	`CALL_WINF` = 'Grupos';
	
	UPDATE `fza_winforms` 
	SET  `DATAMODULE_WINF` = 'UniDataIvas.TdmIvas' 
	WHERE	`CALL_WINF` = 'Ivas';
	
	UPDATE `fza_winforms` 
	SET  `DATAMODULE_WINF` = 'UniDataIvasGrupos.TdmIvasGrupos' 
	WHERE `CALL_WINF` = 'IvasGrupos';
	
	UPDATE `fza_winforms` 
	SET `DATAMODULE_WINF` = 'UniDataProveedores.TdmProveedores' 
	WHERE	`CALL_WINF` = 'Proveedores';
	
	UPDATE `fza_winforms` 
	SET `DATAMODULE_WINF` = 'UniDataTarifas.TdmTarifas' 
	WHERE	`CALL_WINF` = 'Tarifas';
	
	UPDATE `fza_winforms` 
	SET `DATAMODULE_WINF` = 'UniDataUsuarios.TdmUsuarios' 
	WHERE `CALL_WINF` = 'Usuarios';
	
	UPDATE `fza_winforms` 
	SET `DATAMODULE_WINF` = 'UniDataUsuariosPerfiles.TdmUsuariosPerfiles' 
	WHERE	`CALL_WINF` = 'UsuariosPerfiles'; 
  END;
  END IF;
  COMMIT;
END; $$
DELIMITER ;

CALL `PRC_UPDATE_VERSION_FROM_1.0.0.30112023.alpha`;
DROP PROCEDURE `PRC_UPDATE_VERSION_FROM_1.0.0.30112023.alpha`;