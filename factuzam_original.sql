DROP DATABASE IF EXISTS factuzam; 
CREATE DATABASE factuzam   CHARACTER SET utf8mb4        COLLATE utf8mb4_spanish_ci; 
USE factuzam;

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
DELIMITER $$
DROP PROCEDURE IF EXISTS `PRC_CALCULAR_FACTURA_NETOS` $$
CREATE  PROCEDURE `PRC_CALCULAR_FACTURA_NETOS`(IN `pSERIE_FACTURA` VARCHAR(12), 
                                              IN `pNRO_FACTURA` VARCHAR(12))
BEGIN
  DECLARE pPRECIOSIVA decimal(19,6);
  DECLARE pPRECIOCIVA decimal(19,6);
  DECLARE pPORCEN decimal(19,6);
  DECLARE pTIPO VARCHAR(2);
  DECLARE pIVA_RECARGO varchar(1) DEFAULT '';
  DECLARE pAPLICA_RECARGO varchar(1) DEFAULT '';
  DECLARE pIVA_EXENTO varchar(1) DEFAULT '';
  DECLARE pREG_AG_EMP varchar(1) DEFAULT '';
  DECLARE pREG_AG_CLI varchar(1) DEFAULT '';
  DECLARE pINTRACOMUNITARIO varchar(1) DEFAULT '';
  DECLARE pAPLICA_RETENCIONES_CLI varchar(1) DEFAULT '';
  DECLARE pAPLICA_RETENCIONES_EMP varchar(1) DEFAULT '';
  DECLARE pPORCENREN decimal(19,6) DEFAULT 0;
  DECLARE pPORCENRER decimal(19,6) DEFAULT 0;
  DECLARE pPORCENRES decimal(19,6) DEFAULT 0;
  DECLARE pPORCENREE decimal(19,6) DEFAULT 0;
  DECLARE pSUMBASEN decimal(19,6) DEFAULT 0;
  DECLARE pSUMBASER decimal(19,6) DEFAULT 0;
  DECLARE pSUMBASES decimal(19,6) DEFAULT 0;
  DECLARE pSUMBASEE decimal(19,6) DEFAULT 0;
  DECLARE pTOTN decimal(19,6) DEFAULT 0;
  DECLARE pTOTR decimal(19,6) DEFAULT 0;
  DECLARE pTOTS decimal(19,6) DEFAULT 0;
  DECLARE pTOTE decimal(19,6) DEFAULT 0;
  DECLARE pTOTRECN decimal(19,6) DEFAULT 0;
  DECLARE pTOTRECR decimal(19,6) DEFAULT 0;
  DECLARE pTOTRECS decimal(19,6) DEFAULT 0;
  DECLARE pTOTRECE decimal(19,6) DEFAULT 0;
  DECLARE pSUMTOTREC decimal(19,6) DEFAULT 0;
  DECLARE pSUMTOT decimal(19,6) DEFAULT 0;
  DECLARE pPORCENN decimal(19,6) DEFAULT 0;
  DECLARE pTOTBASES decimal(19,6) DEFAULT 0;
  DECLARE pPORCENR decimal(19,6) DEFAULT 0;
  DECLARE pPORCENS decimal(19,6) DEFAULT 0;
  DECLARE pPORCENE decimal(19,6) DEFAULT 0;
  DECLARE pPORCENRET decimal(19,6) DEFAULT 0;
  DECLARE pGRUPO_ZONA_IVA TYPE OF fza_ivas_grupos.GRUPO_ZONA_IVA;
  DECLARE pCODIGO_IVA TYPE OF fza_ivas.CODIGO_IVA;
  DECLARE pTOTALRET decimal(19,6) DEFAULT 0;
  DECLARE pFECHA datetime;
  DECLARE pLINEA varchar(3);
  DECLARE pIMP_INCL varchar(1);
  DECLARE pCANTIDAD decimal(19,6) DEFAULT 0;
  DECLARE pCODART varchar(20);
  DECLARE pTIPOIVAF varchar(1) DEFAULT 'X';
  DECLARE pIRPF_IMP_INCL VARCHAR(1);
  DECLARE pVENTA_ACT_FIJ VARCHAR(1);
  DECLARE finished INTEGER DEFAULT 0;
  DECLARE pCODEMPRESA varchar(8);
  DECLARE CUR_LINEAS 
          CURSOR FOR 
              SELECT LINEA_FACTURA_LINEA,
                     CODIGO_ARTICULO_FACTURA_LINEA,
                     PRECIOVENTA_SIVA_ARTICULO_FACTURA_LINEA AS PRECIOSIVA,
                     PRECIOVENTA_CIVA_ARTICULO_FACTURA_LINEA AS PRECIOCIVA,
                     PORCEN_IVA_FACTURA_LINEA AS PORCEN,
                     TIPOIVA_ARTICULO_FACTURA_LINEA AS TIPO,
                     ESIMP_INCL_TARIFA_FACTURA_LINEA AS IMP_INCL,
                     CANTIDAD_FACTURA_LINEA as CANTIDAD
                FROM FZA_FACTURAS_LINEAS 
               WHERE SERIE_FACTURA_LINEA = pSERIE_FACTURA 
                 AND NRO_FACTURA_LINEA = pNRO_FACTURA;
  DECLARE CONTINUE HANDLER 
          FOR NOT FOUND SET finished = 1;
  START TRANSACTION;
  SELECT PORCEN_IVAN_FACTURA,
         PORCEN_IVAR_FACTURA,
         PORCEN_IVAS_FACTURA,
         PORCEN_IVAE_FACTURA,
         PORCEN_RETENCION_FACTURA,
         ESAPLICA_RE_ZONA_IVA_FACTURA,
         ESIVA_RECARGO_CLIENTE_FACTURA,
         ESIVA_EXENTO_CLIENTE_FACTURA,
         ESRETENCIONES_CLIENTE_FACTURA,
         ESRETENCIONES_EMPRESA_FACTURA,
         ESIRPF_IMP_INCL_ZONA_IVA_FACTURA,
         PORCEN_REN_FACTURA,
         PORCEN_RER_FACTURA,
         PORCEN_RES_FACTURA,
         PORCEN_REE_FACTURA,
         ESREGIMENESPECIALAGRICOLA_EMPRESA_FACTURA,
         ESREGIMENESPECIALAGRICOLA_CLIENTE_FACTURA,
         GRUPO_ZONA_IVA_EMPRESA_FACTURA,
         CODIGO_IVA_FACTURA,
         ESINTRACOMUNITARIO_CLIENTE_FACTURA,
         FECHA_FACTURA,
         CODIGO_EMPRESA_FACTURA,
         ESVENTA_ACTIVO_FIJO_FACTURA
    INTO pPORCENN,
         pPORCENR,
         pPORCENS,
         pPORCENE,
         pPORCENRET,
         pIVA_RECARGO,
         pAPLICA_RECARGO,
         pIVA_EXENTO,
         pAPLICA_RETENCIONES_CLI,
         pAPLICA_RETENCIONES_EMP,
         pIRPF_IMP_INCL,
         pPORCENREN,
         pPORCENRER,
         pPORCENRES,
         pPORCENREE,
         pREG_AG_EMP,
         pREG_AG_CLI,
         pGRUPO_ZONA_IVA,
         pCODIGO_IVA,
         pINTRACOMUNITARIO,
         pFECHA,
         pCODEMPRESA,
         pVENTA_ACT_FIJ
    FROM fza_facturas
   WHERE SERIE_FACTURA = pSERIE_FACTURA
     AND NRO_FACTURA = pNRO_FACTURA;
  IF (pREG_AG_EMP = 'S') THEN
    SET pAPLICA_RETENCIONES_EMP = 'S';
    SET pAPLICA_RECARGO = 'N';
    IF ( EXISTS(SELECT CODIGO_EMPRESA 
                  FROM vi_ivas_empresa 
                 WHERE CODIGO_EMPRESA = pcodempresa 
                   AND ESIVAAGRICOLA_ZONA_IVA = 'S') ) THEN
      SELECT GRUPO_ZONA_IVA,
             CODIGO_IVA, 
             PORCENNORMAL_IVA,
             PORCENEXENTO_IVA,
             PORCENREDUCIDO_IVA,
             PORCENSUPERREDUCIDO_IVA
        INTO pGRUPO_ZONA_IVA,
             pCODIGO_IVA,
             pPORCENN,
             pPORCENE,
             pPORCENR,
             pPORCENS
        FROM vi_ivas_empresa 
       WHERE ESIVAAGRICOLA_ZONA_IVA ='S'
         AND CODIGO_EMPRESA = pCODEMPRESA
         AND FECHA_DESDE_IVA <= pFECHA
         AND (FECHA_HASTA_IVA IS NULL 
              OR FECHA_HASTA_IVA >= pFECHA);
	  END IF;
  END IF;
  IF (pINTRACOMUNITARIO = 'S') THEN
    SET pIVA_EXENTO = 'S';
    SET pAPLICA_RETENCIONES_CLI = 'N';
    SET pREG_AG_CLI = 'N';
  END IF;
  IF ((pVENTA_ACT_FIJ = 'S') AND (pREG_AG_EMP = 'S')) THEN
    SET pIVA_EXENTO = 'S';   
  END IF;    
	/* SELECT pREG_AG_EMP, pREG_AG_CLI; */
  IF ((pREG_AG_EMP = 'S') AND (pREG_AG_CLI = 'S')) THEN
    SET pAPLICA_RETENCIONES_CLI = 'S';
    SET pIVA_EXENTO = 'S';
  END IF;
  IF ((pREG_AG_EMP = 'S') AND (pREG_AG_CLI = 'N') AND 
      (pAPLICA_RETENCIONES_CLI='N' )) THEN
    SET pIVA_EXENTO = 'S';
  END IF;    
  IF ((pREG_AG_EMP = 'S') AND (pREG_AG_CLI = 'N') AND 
      (pAPLICA_RETENCIONES_CLI='S' )) THEN
    SET pTIPOIVAF = 'N';
  END IF;
	/* SELECT pIVA_EXENTO, pSUMBASEE; */
  IF (pIVA_EXENTO = 'S') THEN
    SET pPORCENN = pPORCENE;
    SET pPORCENR = pPORCENE;
    SET pPORCENS = pPORCENE;
    SET pPORCENE = pPORCENE;
    SET pPORCENREN = 0;
    SET pPORCENRER = 0;
    SET pPORCENRES = 0;
    SET pPORCENREE = 0;
    SET pTIPOIVAF = 'E';
    SET pSUMBASEN = 0;
    SET pSUMBASER = 0;
    SET pSUMBASES = 0;
    SET pSUMBASEE = pSUMBASEE +
                    pSUMBASEN +
                    pSUMBASER +
                    pSUMBASES;
	  /* select pSUMBASEE, pSUMBASEN, pSUMBASER, pSUMBASES, 'IVA EXENTO obl' as comment; */
  END IF;
  OPEN CUR_LINEAS;
  GETLINEAS: LOOP
    FETCH CUR_LINEAS INTO pLINEA, 
                          pCODART, 
                          pPRECIOSIVA, 
                          pPRECIOCIVA, 
                          pPORCEN, 
                          pTIPO, 
                          pIMP_INCL, 
                          pCANTIDAD ;
    IF finished = 1 THEN 
      LEAVE GETLINEAS;
    END IF;
		/* select pLINEA,pTIPO, pCODART, pPRECIOSIVA, pPRECIOCIVA, pPORCEN, pIMP_INCL, pCANTIDAD, pSERIE_FACTURA, pNRO_FACTURA; */
    IF pIVA_EXENTO = 'S' THEN
		  SET pTIPO = 'E';			
		END IF;
		CASE pTIPO
    WHEN  'N' THEN
      SET pPORCEN = pPORCENN;
      IF (pIMP_INCL = 'S') THEN
        SET pPRECIOSIVA = pPRECIOCIVA/(1+pPORCEN/100);
				/* SELECT pPRECIOSIVA, pPRECIOCIVA; */
			END IF;
      SET pSUMBASEN = PSUMBASEN + pPRECIOSIVA*pCANTIDAD;
    WHEN 'R' THEN
      SET pPORCEN = pPORCENR;
      IF (pIMP_INCL = 'S') THEN
        SET pPRECIOSIVA = pPRECIOCIVA/(1+pPORCEN/100);			  
      END IF;
      SET pSUMBASER = PSUMBASER + pPRECIOSIVA*pCANTIDAD;
    WHEN 'S' THEN
      SET pPORCEN = pPORCENS;
      IF (pIMP_INCL = 'S') THEN
        SET pPRECIOSIVA = pPRECIOCIVA/(1+pPORCEN/100);
      END IF;
      SET pSUMBASES = PSUMBASES + pPRECIOSIVA*pCANTIDAD;
    WHEN 'E' THEN
       SET pPORCEN = pPORCENE;
        IF (pIMP_INCL = 'S') THEN
          SET pPRECIOSIVA = pPRECIOCIVA/(1+pPORCEN/100);
        END IF;
        SET pSUMBASEE = PSUMBASEE + pPRECIOSIVA*pCANTIDAD;
    END CASE;
	  /* SELECT pSUMBASEN, pSUMBASER, pSUMBASES, pSUMBASEE; */
    IF (pIMP_INCL = 'S') THEN
      UPDATE FZA_FACTURAS_LINEAS 
         SET PORCEN_IVA_FACTURA_LINEA = pPORCEN,
             TIPOIVA_ARTICULO_FACTURA_LINEA = pTIPO,
             PRECIOVENTA_SIVA_ARTICULO_FACTURA_LINEA = 
                       PRECIOVENTA_CIVA_ARTICULO_FACTURA_LINEA/(1+pPORCEN/100),
             TOTAL_FACTURA_LINEA = 
               CANTIDAD_FACTURA_LINEA * PRECIOVENTA_CIVA_ARTICULO_FACTURA_LINEA
       WHERE SERIE_FACTURA_LINEA = pSERIE_FACTURA 
         AND NRO_FACTURA_LINEA = pNRO_FACTURA
             AND LINEA_FACTURA_LINEA = pLINEA; 
    ELSE
      UPDATE FZA_FACTURAS_LINEAS 
         SET PORCEN_IVA_FACTURA_LINEA = pPORCEN,
             TIPOIVA_ARTICULO_FACTURA_LINEA = pTIPO,
             PRECIOVENTA_CIVA_ARTICULO_FACTURA_LINEA = 
                      PRECIOVENTA_SIVA_ARTICULO_FACTURA_LINEA*(1+pPORCEN/100) ,
             TOTAL_FACTURA_LINEA = 
               CANTIDAD_FACTURA_LINEA * PRECIOVENTA_CIVA_ARTICULO_FACTURA_LINEA
        WHERE SERIE_FACTURA_LINEA = pSERIE_FACTURA 
          AND NRO_FACTURA_LINEA = pNRO_FACTURA
          AND LINEA_FACTURA_LINEA = pLINEA; 
    END IF;
  END LOOP GETLINEAS;
  SET PTOTBASES = pSUMBASEN + pSUMBASER + pSUMBASES + pSUMBASEE;
  SET pTOTN = pSUMBASEN * (1 + pPORCENN/100) - pSUMBASEN;
  SET pTOTR = pSUMBASER * (1 + pPORCENR/100) - pSUMBASER;
  SET pTOTS = pSUMBASES * (1 + pPORCENS/100) - pSUMBASES;
  SET pTOTE = pSUMBASEE * (1 + pPORCENE/100) - pSUMBASEE;
  SET pSUMTOT = pTOTN + pTOTR + pTOTS + pTOTE;
	/* SELECT PTOTBASES,pSUMBASEN, pSUMBASER, pSUMBASES, pSUMBASEE, pTOTN, pTOTR, pTOTS, pTOTE, pPORCENN, pPORCENR, pPORCENS, pPORCENE; */
  IF ( (pIVA_RECARGO ='S') AND (pAPLICA_RECARGO = 'S') ) THEN
    SET pTOTRECN = pSUMBASEN * (1 + pPORCENREN/100) - pSUMBASEN;
		SET pTOTRECR = pSUMBASER * (1 + pPORCENRER/100) - pSUMBASER;
    SET pTOTRECS = pSUMBASES * (1 + pPORCENRES/100) - pSUMBASES;
    SET pTOTRECE = pSUMBASEE * (1 + pPORCENREE/100) - pSUMBASEE;
    SET pSUMTOTREC = pTOTRECN + pTOTRECR + pTOTRECS + pTOTRECE;
		/* SELECT pTOTRECN, pSUMBASEN, pPORCENREN, pTOTRECS,  */
  ELSE 
    SET pTOTRECN = 0;
    SET pTOTRECR = 0;
    SET pTOTRECS = 0;
    SET pTOTRECE = 0;
    SET pSUMTOTREC = 0;
  END IF;
	/* SELECT pAPLICA_RETENCIONES_CLI, pAPLICA_RETENCIONES_EMP; */
  IF ( (pAPLICA_RETENCIONES_CLI = 'S') AND
       (pAPLICA_RETENCIONES_EMP = 'S') AND 
        pPORCENRET = 0							
     )  AND (( EXISTS( SELECT PORCENRETENCION_RETENCION
               FROM fza_empresas_retenciones
              WHERE CODIGO_EMPRESA_RETENCION = pCODEMPRESA
							  AND  FECHA_DESDE_RETENCION <= pFECHA
                         AND (    FECHA_HASTA_RETENCION >= pFECHA
                               OR FECHA_HASTA_RETENCION IS NULL)) ) ) THEN 
    SET pPORCENRET = (SELECT PORCENRETENCION_RETENCION 
                        FROM fza_empresas_retenciones 
                       WHERE CODIGO_EMPRESA_RETENCION = pCODEMPRESA
                         AND FECHA_DESDE_RETENCION <= pFECHA
                         AND (    FECHA_HASTA_RETENCION >= pFECHA
                               OR FECHA_HASTA_RETENCION IS NULL) LIMIT 1);
  ELSE
	  IF ((pPORCENRET = 0) OR (pPORCENRET IS NULL)) THEN
		  SET pPORCENRET = 0;
		  SET pTOTALRET = 0;
		END IF;
  END IF;
  IF (pIRPF_IMP_INCL = 'S') THEN
    SET pTOTALRET = (pTOTBASES + pSUMTOT ) * (pPORCENRET/100);
  ELSE
    SET pTOTALRET = pTOTBASES * (pPORCENRET/100);
  END IF;
	/* SELECT pPORCENRET, pTOTALRET; */
  IF ((pVENTA_ACT_FIJ = 'S') AND (pREG_AG_EMP = 'S')) THEN
    SET pPORCENRET = 0;
    SET PTOTALRET = 0;
  END IF;
  UPDATE fza_facturas 
     SET TOTAL_BASEI_IVAN_FACTURA = pSUMBASEN,
         TOTAL_BASEI_IVAR_FACTURA = pSUMBASER,
         TOTAL_BASEI_IVAS_FACTURA = pSUMBASES,
         TOTAL_BASEI_IVAE_FACTURA = pSUMBASEE,
         TOTAL_IVAN_FACTURA = pTOTN,
         TOTAL_IVAR_FACTURA = pTOTR,
         TOTAL_IVAS_FACTURA = pTOTS,
         TOTAL_IVAE_FACTURA = pTOTE,
         TOTAL_REN_FACTURA = PTOTRECN,
         TOTAL_RER_FACTURA = PTOTRECR,
         TOTAL_RES_FACTURA = PTOTRECS,
         TOTAL_REE_FACTURA = PTOTRECE,
         TOTAL_BASES_FACTURA = pTOTBASES,
         TOTAL_RETENCION_FACTURA = pTOTALRET,
         TOTAL_LIQUIDO_FACTURA = pTOTBASES + 
                                 pSUMTOT - 
                                 PTOTALRET + 
                                 pSUMTOTREC,
         ESIVA_EXENTO_CLIENTE_FACTURA = pIVA_EXENTO,
         ESRETENCIONES_CLIENTE_FACTURA = pAPLICA_RETENCIONES_CLI,
         ESRETENCIONES_EMPRESA_FACTURA = pAPLICA_RETENCIONES_EMP,
         ESIVA_RECARGO_CLIENTE_FACTURA = pAPLICA_RECARGO,
         TOTAL_IMPUESTOS_FACTURA = pSUMTOTREC + pSUMTOT,
         GRUPO_ZONA_IVA_EMPRESA_FACTURA = pGRUPO_ZONA_IVA,
         CODIGO_IVA_FACTURA = pCODIGO_IVA,
         PORCEN_IVAN_FACTURA = pPORCENN,
         PORCEN_IVAE_FACTURA = pPORCENE,
         PORCEN_IVAR_FACTURA = pPORCENR,
         PORCEN_IVAS_FACTURA = pPORCENS,
         PORCEN_RETENCION_FACTURA = pPORCENRET
   WHERE NRO_FACTURA = pNRO_FACTURA 
     AND SERIE_FACTURA = pSERIE_FACTURA;
	 COMMIT;
END $$
DELIMITER ;


DELIMITER $$
DROP PROCEDURE IF EXISTS `PRC_CREAR_ACTUALIZAR_CLIENTE` $$
CREATE  PROCEDURE `PRC_CREAR_ACTUALIZAR_CLIENTE`(IN `pCODIGO_CLIENTE`                       varchar(10),
                            IN `pRAZONSOCIAL_CLIENTE`             varchar(200),
                            IN `pNIF_CLIENTE`                      varchar(50),
                            IN `pMOVIL_CLIENTE`                    varchar(40),
                            IN `pEMAIL_CLIENTE`                   varchar(200),
                            IN `pDIRECCION1_CLIENTE`              varchar(200),
                            IN `pDIRECCION2_CLIENTE`              varchar(200),
                            IN `pPOBLACION_CLIENTE`               varchar(200),
                            IN `pPROVINCIA_CLIENTE`               varchar(200),
                            IN `pCPOSTAL_CLIENTE`                  varchar(15),
                            IN `pPAIS_CLIENTE`                    varchar(150),
                            IN `pESIVA_EXENTO_CLIENTE`              varchar(1),
                            IN `pESRETENCIONES_CLIENTE`             varchar(1),
                            IN `pESIVA_RECARGO_CLIENTE`             varchar(1),
                            IN `pESINTRACOMUNITARIO_CLIENTE`        varchar(1),
                            IN `pESREGIMENESPECIALAGRICOLA_CLIENTE` varchar(1),
                            IN `pTARIFA_ARTICULO_CLIENTE`          varchar(10),
                            IN `pUSUARIO`                         varchar(100),
                            IN `pINSTANTEMODIF`                      TIMESTAMP)
BEGIN
START TRANSACTION;
 IF( EXISTS( SELECT *
               FROM fza_clientes
              WHERE `CODIGO_CLIENTE` =  pCODIGO_CLIENTE) ) THEN
 BEGIN
   UPDATE fza_clientes
      SET RAZONSOCIAL_CLIENTE               = pRAZONSOCIAL_CLIENTE ,
          NIF_CLIENTE                       = pNIF_CLIENTE         ,
          MOVIL_CLIENTE                     = pMOVIL_CLIENTE       ,
          EMAIL_CLIENTE                     = pEMAIL_CLIENTE       ,
          DIRECCION1_CLIENTE                = pDIRECCION1_CLIENTE  ,
          DIRECCION2_CLIENTE                = pDIRECCION2_CLIENTE  ,
          POBLACION_CLIENTE                 = pPOBLACION_CLIENTE   ,
          PROVINCIA_CLIENTE                 = pPROVINCIA_CLIENTE   ,
          CPOSTAL_CLIENTE                   = pCPOSTAL_CLIENTE     ,
          PAIS_CLIENTE                      = pPAIS_CLIENTE        ,
          ESIVA_EXENTO_CLIENTE              = pESIVA_EXENTO_CLIENTE  ,
          ESRETENCIONES_CLIENTE             = pESRETENCIONES_CLIENTE ,
          ESIVA_RECARGO_CLIENTE             = pESIVA_RECARGO_CLIENTE ,
          ESREGIMENESPECIALAGRICOLA_CLIENTE = pESREGIMENESPECIALAGRICOLA_CLIENTE,
          ESINTRACOMUNITARIO_CLIENTE        = pESINTRACOMUNITARIO_CLIENTE,
          TARIFA_ARTICULO_CLIENTE           = pTARIFA_ARTICULO_CLIENTE,
          USUARIOMODIF                      = pUSUARIO             
    WHERE CODIGO_cliente = pCODIGO_CLIENTE;
  END;
  ELSE
  BEGIN
    INSERT INTO fza_clientes (CODIGO_CLIENTE                    ,
                              RAZONSOCIAL_CLIENTE               ,
                              NIF_CLIENTE                       ,
                              MOVIL_CLIENTE                     ,
                              EMAIL_CLIENTE                     ,
                              DIRECCION1_CLIENTE                ,
                              DIRECCION2_CLIENTE                ,
                              POBLACION_CLIENTE                 ,
                              PROVINCIA_CLIENTE                 ,
                              CPOSTAL_CLIENTE                   ,
                              PAIS_CLIENTE                      ,
                              ESIVA_EXENTO_CLIENTE              ,
                              ESRETENCIONES_CLIENTE             ,
                              ESIVA_RECARGO_CLIENTE             ,
                              ESREGIMENESPECIALAGRICOLA_CLIENTE ,
                              ESINTRACOMUNITARIO_CLIENTE        ,
                              TARIFA_ARTICULO_CLIENTE           ,
                              USUARIOMODIF                      ,
                              USUARIOALTA                       ,
                              INSTANTEALTA                      ,
                              INSTANTEMODIF
                      ) VALUES
                             (pCODIGO_CLIENTE                   ,
                              pRAZONSOCIAL_CLIENTE              ,
                              pNIF_CLIENTE                      ,
                              pMOVIL_CLIENTE                    ,
                              pEMAIL_CLIENTE                    ,
                              pDIRECCION1_CLIENTE               ,
                              pDIRECCION2_CLIENTE               ,
                              pPOBLACION_CLIENTE                ,
                              pPROVINCIA_CLIENTE                ,
                              pCPOSTAL_CLIENTE                  ,
                              pPAIS_CLIENTE                     ,
                              pESIVA_EXENTO_CLIENTE             ,
                              pESRETENCIONES_CLIENTE            ,
                              pESIVA_RECARGO_CLIENTE            ,
                              pESREGIMENESPECIALAGRICOLA_CLIENTE,
                              pESINTRACOMUNITARIO_CLIENTE       ,
                              pTARIFA_ARTICULO_CLIENTE          ,
                              pUSUARIO                          ,
                              pUSUARIO                          ,
                              pINSTANTEMODIF                    ,
                              pINSTANTEMODIF           
                              );
  END;
  END IF;
  COMMIT;
END $$
DELIMITER ;


DELIMITER $$
DROP PROCEDURE IF EXISTS `PRC_CREAR_ACTUALIZAR_EMPRESA` $$
CREATE  PROCEDURE `PRC_CREAR_ACTUALIZAR_EMPRESA`(IN `pCODIGO_EMPRESA`                varchar(10), 
																																					 IN `pRAZONSOCIAL_EMPRESA`           varchar(200),
																																					 IN `pNIF_EMPRESA`                   varchar(50),
																																					 IN `pMOVIL_EMPRESA`                 varchar(40),
																																					 IN `pEMAIL_EMPRESA`                 varchar(200),
																																					 IN `pDIRECCION1_EMPRESA`            varchar(200),
																																					 IN `pDIRECCION2_EMPRESA`            varchar(200),
																																					 IN `pPOBLACION_EMPRESA`             varchar(200),
																																					 IN `pPROVINCIA_EMPRESA`             varchar(200),
																																					 IN `pCPOSTAL_EMPRESA`               varchar(15),
																																					 IN `pPAIS_EMPRESA`                  varchar(150),
																																					 IN `pRETENCIONES_EMPRESA`           varchar(1),
																																					 IN `pIVA_RECARGO_EMPRESA`           varchar(1),
																																					 IN `pREGIMENESPECIALAGRICOLA_EMPRESA` varchar(1),
																																					 IN `pGRUPO_ZONA_IVA_EMPRESA`        varchar(10),
																																					 IN `pUSUARIO`                       varchar(100),
																																					 IN `pINSTANTEMODIF`                 TIMESTAMP)
BEGIN
START TRANSACTION;
 IF( EXISTS(
             SELECT *
             FROM fza_empresas
             WHERE `CODIGO_EMPRESA` =  pCODIGO_EMPRESA) ) THEN
  UPDATE fza_EMPRESAs
    SET  RAZONSOCIAL_EMPRESA               = pRAZONSOCIAL_EMPRESA            ,
         NIF_EMPRESA                       = pNIF_EMPRESA                    ,
         MOVIL_EMPRESA                     = pMOVIL_EMPRESA                  ,
         EMAIL_EMPRESA                     = pEMAIL_EMPRESA                  ,
         DIRECCION1_EMPRESA                = pDIRECCION1_EMPRESA             ,
         DIRECCION2_EMPRESA                = pDIRECCION2_EMPRESA             ,
         POBLACION_EMPRESA                 = pPOBLACION_EMPRESA              ,
         PROVINCIA_EMPRESA                 = pPROVINCIA_EMPRESA              ,
         CPOSTAL_EMPRESA                   = pCPOSTAL_EMPRESA                ,
         PAIS_EMPRESA                      = pPAIS_EMPRESA                   ,
         ESRETENCIONES_EMPRESA             = pRETENCIONES_EMPRESA            ,
         ESREGIMENESPECIALAGRICOLA_EMPRESA = pREGIMENESPECIALAGRICOLA_EMPRESA,
         GRUPO_ZONA_IVA_EMPRESA            = pGRUPO_ZONA_IVA_EMPRESA,
         USUARIOMODIF                      = pUSUARIO             
  WHERE CODIGO_EMPRESA = pCODIGO_EMPRESA;
  ELSE
  INSERT INTO fza_EMPRESAs (CODIGO_EMPRESA                     ,
                            RAZONSOCIAL_EMPRESA               ,
                            NIF_EMPRESA                       ,
                            MOVIL_EMPRESA                     ,
                            EMAIL_EMPRESA                     ,
                            DIRECCION1_EMPRESA                ,
                            DIRECCION2_EMPRESA                ,
                            POBLACION_EMPRESA                 ,
                            PROVINCIA_EMPRESA                 ,
                            CPOSTAL_EMPRESA                   ,
                            PAIS_EMPRESA                      ,
                            ESRETENCIONES_EMPRESA             ,
                            ESREGIMENESPECIALAGRICOLA_EMPRESA ,
                            GRUPO_ZONA_IVA_EMPRESA            ,
                            USUARIOMODIF                      ,
                            USUARIOALTA                       ,
                            INSTANTEALTA  
                    ) VALUES
                           (pCODIGO_EMPRESA      ,
                            pRAZONSOCIAL_EMPRESA ,
                            pNIF_EMPRESA         ,
                            pMOVIL_EMPRESA       ,
                            pEMAIL_EMPRESA       ,
                            pDIRECCION1_EMPRESA  ,
                            pDIRECCION2_EMPRESA  ,
                            pPOBLACION_EMPRESA   ,
                            pPROVINCIA_EMPRESA   ,
                            pCPOSTAL_EMPRESA     ,
                            pPAIS_EMPRESA        ,
                            pRETENCIONES_EMPRESA ,
                            pREGIMENESPECIALAGRICOLA_EMPRESA,
                            pGRUPO_ZONA_IVA_EMPRESA,
                            pUSUARIO             ,
                            pUSUARIO             ,
                            pINSTANTEMODIF       
                            );
  END IF;
  COMMIT;
END $$
DELIMITER ;


DELIMITER $$
DROP PROCEDURE IF EXISTS `PRC_CREAR_ACTUALIZAR_KEY` $$
CREATE  PROCEDURE `PRC_CREAR_ACTUALIZAR_KEY`(IN `pUSUARIO`       varchar(200),
                                              IN `pKEY`           varchar(100),
                                              IN `pSUBKEY`        varchar(100),
                                              IN `pVALUE`         varchar(200),
                                              IN `pVALUE_TEXT`    text,
                                              IN `pUSUARIO_MODIF` varchar(100))
BEGIN
START TRANSACTION;
 IF( EXISTS(
             SELECT *
               FROM `fza_usuarios_perfiles`
              WHERE `USUARIO_GRUPO_PERFILES` = `pUSUARIO`
                AND `KEY_PERFILES`           = `pKEY` 
                AND `SUBKEY_PERFILES`        = `pSUBKEY` )) THEN
  BEGIN
    UPDATE `fza_usuarios_perfiles`
      SET `VALUE_PERFILES`      = `pVALUE`,
          `VALUE_TEXT_PERFILES` = `pVALUE_TEXT`,
          `USUARIOMODIF`        = `pUSUARIO_MODIF`
    WHERE `USUARIO_GRUPO_PERFILES` = `pUSUARIO`
      AND `KEY_PERFILES`           = `pKEY` 
      AND `SUBKEY_PERFILES`        = `pSUBKEY`;
  END;
  ELSE
  BEGIN
    INSERT INTO fza_usuarios_perfiles (`USUARIO_GRUPO_PERFILES`, 
                                       `KEY_PERFILES`          , 
                                       `SUBKEY_PERFILES`       , 
                                       `VALUE_PERFILES`        , 
                                       `VALUE_TEXT_PERFILES`   , 
                                       `INSTANTEALTA`          , 
                                       `USUARIOALTA`           , 
                                       `USUARIOMODIF`
                                      ) VALUES
                             (`pUSUARIO`         ,
                              `pKEY`             ,
                              `pSUBKEY`          ,
                              `pVALUE`           ,
                              `pVALUE_TEXT`      ,
                              CURRENT_TIMESTAMP  ,
                              `pUSUARIO_MODIF`   ,
                              `pUSUARIO_MODIF`
                             );
  END;
  END IF;
  COMMIT;
END $$
DELIMITER ;


DELIMITER $$
DROP PROCEDURE IF EXISTS `PRC_CREAR_FACTURA_ABONO` $$
CREATE  PROCEDURE `PRC_CREAR_FACTURA_ABONO`(IN `pidseriefactura`      varchar(200),
                                      IN `pidnumfactura`        varchar(200),
                                      IN `pidseriefacturaabono` varchar(200),
																			IN `pidcodigo_empresa`    varchar(200),
                                      IN `pfechafacturaabono`   date,
                                     OUT `pidnumfacturaabono`   varchar(200),
                                      IN `pUSUARIO`             varchar(100),
                                      IN `pINSTANTEMODIF`       TIMESTAMP)
BEGIN
   DECLARE contadorped varchar(200);
   START TRANSACTION;
   CALL PRC_GET_NEXT_CONT_FACT_SERIE(pidseriefacturaabono, 'FC', pidcodigo_empresa, pUSUARIO, @cont);   
   SET @pFecha = (SELECT DATE_FORMAT(pfechafacturaabono, '%Y-%m-%d'));
   SET contadorped = @cont;     
   SET pidnumfacturaabono = contadorped;
   INSERT INTO fza_facturas  (`NRO_FACTURA`                                  ,
                              `SERIE_FACTURA`                                ,
                              `FECHA_FACTURA`                                ,
                              `CODIGO_EMPRESA_FACTURA`                       ,
                              `RAZONSOCIAL_EMPRESA_FACTURA`                  ,
                              `NIF_EMPRESA_FACTURA`                          ,
                              `MOVIL_EMPRESA_FACTURA`                        ,
                              `EMAIL_EMPRESA_FACTURA`                        ,
                              `DIRECCION1_EMPRESA_FACTURA`                   ,
                              `DIRECCION2_EMPRESA_FACTURA`                   ,
                              `POBLACION_EMPRESA_FACTURA`                    ,
                              `PROVINCIA_EMPRESA_FACTURA`                    ,
                              `PAIS_EMPRESA_FACTURA`                         ,
                              `CPOSTAL_EMPRESA_FACTURA`                      ,
                              `ESRETENCIONES_EMPRESA_FACTURA`                ,
                              `GRUPO_ZONA_IVA_EMPRESA_FACTURA`               ,
                              `ESREGIMENESPECIALAGRICOLA_EMPRESA_FACTURA`    ,
                              `CODIGO_CLIENTE_FACTURA`                       ,
                              `RAZONSOCIAL_CLIENTE_FACTURA`                  ,
                              `NIF_CLIENTE_FACTURA`                          ,
                              `MOVIL_CLIENTE_FACTURA`                        ,
                              `EMAIL_CLIENTE_FACTURA`                        ,
                              `DIRECCION1_CLIENTE_FACTURA`                   ,
                              `DIRECCION2_CLIENTE_FACTURA`                   ,
                              `POBLACION_CLIENTE_FACTURA`                    ,
                              `PROVINCIA_CLIENTE_FACTURA`                    ,
                              `CPOSTAL_CLIENTE_FACTURA`                      ,
                              `PAIS_CLIENTE_FACTURA`                         ,
                              `ESIVA_RECARGO_CLIENTE_FACTURA`                ,
                              `ESIVA_EXENTO_CLIENTE_FACTURA`                 ,
                              `ESREGIMENESPECIALAGRICOLA_CLIENTE_FACTURA`    ,
                              `ESRETENCIONES_CLIENTE_FACTURA`                ,
                              `TARIFA_ARTICULO_CLIENTE_FACTURA`              ,
                              `ESIMP_INCL_TARIFA_CLIENTE_FACTURA`            ,
                              `ESINTRACOMUNITARIO_CLIENTE_FACTURA`           ,
                              `ESIRPF_IMP_INCL_ZONA_IVA_FACTURA`             ,
                              `ESAPLICA_RE_ZONA_IVA_FACTURA`                 ,
                              `ESIVAAGRICOLA_ZONA_IVA_FACTURA`               ,
                              `PALABRA_REPORTS_ZONA_IVA_FACTURA`             ,
                              `CODIGO_IVA_FACTURA`                           ,
                              `ESVENTA_ACTIVO_FIJO_FACTURA`                  ,
                              `PORCEN_IVAN_FACTURA`                          ,
                              `TOTAL_IVAN_FACTURA`                           ,
                              `PORCEN_REN_FACTURA`                           ,
                              `TOTAL_REN_FACTURA`                            ,
                              `TOTAL_BASEI_IVAN_FACTURA`                     ,
                              `PORCEN_IVAR_FACTURA`                          ,
                              `TOTAL_IVAR_FACTURA`                           ,
                              `PORCEN_RER_FACTURA`                           ,
                              `TOTAL_RER_FACTURA`                            ,
                              `TOTAL_BASEI_IVAR_FACTURA`                     ,
                              `PORCEN_IVAS_FACTURA`                          ,
                              `TOTAL_IVAS_FACTURA`                           ,
                              `PORCEN_RES_FACTURA`                           ,
                              `TOTAL_RES_FACTURA`                            ,
                              `TOTAL_BASEI_IVAS_FACTURA`                     ,
                              `PORCEN_IVAE_FACTURA`                          ,
                              `TOTAL_IVAE_FACTURA`                           ,
                              `PORCEN_REE_FACTURA`                           ,
                              `TOTAL_REE_FACTURA`                            ,
                              `TOTAL_BASEI_IVAE_FACTURA`                     ,
                              `TOTAL_BASES_FACTURA`                          ,
                              `TOTAL_IMPUESTOS_FACTURA`                      ,
                              `FORMA_PAGO_FACTURA`                           ,
                              `PORCEN_RETENCION_FACTURA`                     ,
                              `TOTAL_RETENCION_FACTURA`                      ,
                              `TOTAL_LIQUIDO_FACTURA`                        ,
                              `NRO_FACTURA_ABONO_FACTURA`                    ,
                              `SERIE_FACTURA_ABONO_FACTURA`                  ,
                              `TEXTO_LEGAL_FACTURA_CLIENTE_FACTURA`          ,
                              `TEXTO_LEGAL_FACTURA_EMPRESA_FACTURA`          ,
                              `DOCUMENTO_FACTURA`                            ,
                              `COMENTARIOS_FACTURA`                          ,
                              `CONTADOR_LINEAS_FACTURA`                      ,
															`ESCREARARTICULOS_FACTURA`										 ,	
                              `ESDESCRIPCIONES_AMP_FACTURA`	                 ,
                              `ESFECHADEENTREGA_FACTURA`	                   ,
                              `INSTANTEMODIF`                                ,
                              `INSTANTEALTA`                                 ,
                              `USUARIOALTA`                                  ,                        
                              `USUARIOMODIF`
                             )                                 
                     SELECT `contadorped`                                    ,
                            `pidseriefacturaabono`                           ,
                            `@pFecha`                                        ,
                            `CODIGO_EMPRESA_FACTURA`                         ,
                            `RAZONSOCIAL_EMPRESA_FACTURA`                    ,
                            `NIF_EMPRESA_FACTURA`                            ,
                            `MOVIL_EMPRESA_FACTURA`                          ,
                            `EMAIL_EMPRESA_FACTURA`                          ,
                            `DIRECCION1_EMPRESA_FACTURA`                     ,
                            `DIRECCION2_EMPRESA_FACTURA`                     ,
                            `POBLACION_EMPRESA_FACTURA`                      ,
                            `PROVINCIA_EMPRESA_FACTURA`                      ,
                            `PAIS_EMPRESA_FACTURA`                           ,
                            `CPOSTAL_EMPRESA_FACTURA`                        ,
                            `ESRETENCIONES_EMPRESA_FACTURA`                  ,
                            `GRUPO_ZONA_IVA_EMPRESA_FACTURA`                 ,
                            `ESREGIMENESPECIALAGRICOLA_EMPRESA_FACTURA`      ,
                            `CODIGO_CLIENTE_FACTURA`                         ,
                            `RAZONSOCIAL_CLIENTE_FACTURA`                    ,
                            `NIF_CLIENTE_FACTURA`                            ,
                            `MOVIL_CLIENTE_FACTURA`                          ,
                            `EMAIL_CLIENTE_FACTURA`                          ,
                            `DIRECCION1_CLIENTE_FACTURA`                     ,
                            `DIRECCION2_CLIENTE_FACTURA`                     ,
                            `POBLACION_CLIENTE_FACTURA`                      ,
                            `PROVINCIA_CLIENTE_FACTURA`                      ,
                            `CPOSTAL_CLIENTE_FACTURA`                        ,
                            `PAIS_CLIENTE_FACTURA`                           ,
                            `ESIVA_RECARGO_CLIENTE_FACTURA`                  ,
                            `ESIVA_EXENTO_CLIENTE_FACTURA`                   ,
                            `ESREGIMENESPECIALAGRICOLA_CLIENTE_FACTURA`      ,
                            `ESRETENCIONES_CLIENTE_FACTURA`                  ,
                            `TARIFA_ARTICULO_CLIENTE_FACTURA`                ,
                            `ESIMP_INCL_TARIFA_CLIENTE_FACTURA`              ,
                            `ESINTRACOMUNITARIO_CLIENTE_FACTURA`             ,
                            `ESIRPF_IMP_INCL_ZONA_IVA_FACTURA`               ,
                            `ESAPLICA_RE_ZONA_IVA_FACTURA`                   ,
                            `ESIVAAGRICOLA_ZONA_IVA_FACTURA`                 ,
                            `PALABRA_REPORTS_ZONA_IVA_FACTURA`               ,
                            `CODIGO_IVA_FACTURA`                             ,
                            `ESVENTA_ACTIVO_FIJO_FACTURA`                    ,
                            `PORCEN_IVAN_FACTURA`                            ,
                            `TOTAL_IVAN_FACTURA`                             ,
                            `PORCEN_REN_FACTURA`                             ,
                            `TOTAL_REN_FACTURA`                              ,
                            `TOTAL_BASEI_IVAN_FACTURA`                       ,
                            `PORCEN_IVAR_FACTURA`                            ,
                            `TOTAL_IVAR_FACTURA`                             ,
                            `PORCEN_RER_FACTURA`                             ,
                            `TOTAL_RER_FACTURA`                              ,
                            `TOTAL_BASEI_IVAR_FACTURA`                       ,
                            `PORCEN_IVAS_FACTURA`                            ,
                            `TOTAL_IVAS_FACTURA`                             ,
                            `PORCEN_RES_FACTURA`                             ,
                            `TOTAL_RES_FACTURA`                              ,
                            `TOTAL_BASEI_IVAS_FACTURA`                       ,
                            `PORCEN_IVAE_FACTURA`                            ,
                            `TOTAL_IVAE_FACTURA`                             ,
                            `PORCEN_REE_FACTURA`                             ,
                            `TOTAL_REE_FACTURA`                              ,
                            `TOTAL_BASEI_IVAE_FACTURA`                       ,
                            `TOTAL_BASES_FACTURA`                            ,
                            `TOTAL_IMPUESTOS_FACTURA`                        ,
                            `FORMA_PAGO_FACTURA`                             ,
                            `PORCEN_RETENCION_FACTURA`                       ,
                            `TOTAL_RETENCION_FACTURA`                        ,
                            `TOTAL_LIQUIDO_FACTURA`                          ,
                            `NRO_FACTURA_ABONO_FACTURA`                      ,
                            `SERIE_FACTURA_ABONO_FACTURA`                    ,
                            `TEXTO_LEGAL_FACTURA_CLIENTE_FACTURA`            ,
                            `TEXTO_LEGAL_FACTURA_EMPRESA_FACTURA`            ,
                            `DOCUMENTO_FACTURA`                              ,
                            `COMENTARIOS_FACTURA`                            ,
                            `CONTADOR_LINEAS_FACTURA`                        ,
														`ESCREARARTICULOS_FACTURA`											 ,	
                            `ESDESCRIPCIONES_AMP_FACTURA`	                   ,
                            `ESFECHADEENTREGA_FACTURA`	                     , 
                            `pINSTANTEMODIF`                                 ,
                            `pINSTANTEMODIF`                                 ,
                            `pUSUARIO`                                       ,
                            `pUSUARIO`
                       FROM `fza_facturas` 
                      WHERE `NRO_FACTURA`   = `pidnumfactura` 
                        AND `SERIE_FACTURA` = `pidseriefactura`;  
  INSERT INTO `fza_facturas_lineas` (`NRO_FACTURA_LINEA`                      ,
                                     `SERIE_FACTURA_LINEA`                    ,
                                     `LINEA_FACTURA_LINEA`                    ,
                                     `CODIGO_ARTICULO_FACTURA_LINEA`          ,
                                     `TIPO_CANTIDAD_ARTICULO_FACTURA_LINEA`   ,
                                     `ESIMP_INCL_TARIFA_FACTURA_LINEA`        ,
                                     `TIPOIVA_ARTICULO_FACTURA_LINEA`         ,
                                     `DESCRIPCION_ARTICULO_FACTURA_LINEA`     ,
                                     `CANTIDAD_FACTURA_LINEA`                 ,
                                     `PRECIOVENTA_SIVA_ARTICULO_FACTURA_LINEA`,
                                     `PORCEN_IVA_FACTURA_LINEA`               ,
                                     `PRECIOVENTA_CIVA_ARTICULO_FACTURA_LINEA`,
                                     `TOTAL_FACTURA_LINEA`                    ,
                                     `INSTANTEMODIF`                          ,
                                     `INSTANTEALTA`                           ,
                                     `USUARIOALTA`                            ,                        
                                     `USUARIOMODIF`                  
                                      ) 
                              SELECT `contadorped`                             ,
                                     `pidseriefacturaabono`                    ,
                                     `LINEA_FACTURA_LINEA`                     ,
                                     `CODIGO_ARTICULO_FACTURA_LINEA`           ,
                                     `TIPO_CANTIDAD_ARTICULO_FACTURA_LINEA`    ,
                                     `ESIMP_INCL_TARIFA_FACTURA_LINEA`         ,
                                     `TIPOIVA_ARTICULO_FACTURA_LINEA`          ,
                                     `DESCRIPCION_ARTICULO_FACTURA_LINEA`      ,
                                     (`CANTIDAD_FACTURA_LINEA`*-1)             ,
                                     `PRECIOVENTA_SIVA_ARTICULO_FACTURA_LINEA` ,
                                     `PORCEN_IVA_FACTURA_LINEA`                ,
                                     `PRECIOVENTA_CIVA_ARTICULO_FACTURA_LINEA` ,
                                     (`TOTAL_FACTURA_LINEA` * -1)              ,
                                     `pINSTANTEMODIF`                          ,
                                     `pINSTANTEMODIF`                          ,
                                     `pUSUARIO`                                ,
                                     `pUSUARIO`
                               FROM  `fza_facturas_lineas` 
                              WHERE  `SERIE_FACTURA_LINEA`  = `pidseriefactura`
                                AND  `NRO_FACTURA_LINEA`    = `pidnumfactura`  ;                 
   CALL `PRC_CALCULAR_FACTURA_NETOS`(`pidseriefacturaabono`, `contadorped`);
   COMMIT;
END $$
DELIMITER ;


DELIMITER $$
DROP PROCEDURE IF EXISTS `PRC_CREAR_FACTURA_DUPLICADA` $$
CREATE  PROCEDURE `PRC_CREAR_FACTURA_DUPLICADA`(IN `pidseriefactura`      varchar(200),
                                        IN `pidnumfactura`        varchar(200),
                                        IN `pidseriefacturaabono` varchar(200),
																				IN `pidcodigo_empresa`    varchar(200),
                                        IN `pfechafacturaabono`   date,
                                        IN `pUSUARIO`             varchar(100),
                                        IN `pINSTANTEMODIF`       TIMESTAMP,
                                       OUT `pidnumfacturaabono`   varchar(200))
BEGIN
   DECLARE `contadorped` varchar(200);
   DECLARE `pfecha` date;
   START TRANSACTION;
   CALL PRC_GET_NEXT_CONT_FACT_SERIE(`pidseriefacturaabono`, 
                                     'FC', 
																		 pidcodigo_empresa,
																		 pUSUARIO,
                                     `contadorped`);
   SET pFecha = (SELECT DATE_FORMAT(`pfechafacturaabono`, '%Y-%m-%d'));
   SET pidnumfacturaabono = contadorped;
   INSERT INTO fza_facturas (`NRO_FACTURA`                                  ,
                             `SERIE_FACTURA`                                ,
                             `FECHA_FACTURA`                                ,
                             `CODIGO_EMPRESA_FACTURA`                       ,
                             `RAZONSOCIAL_EMPRESA_FACTURA`                  ,
                             `NIF_EMPRESA_FACTURA`                          ,
                             `MOVIL_EMPRESA_FACTURA`                        ,
                             `EMAIL_EMPRESA_FACTURA`                        ,
                             `DIRECCION1_EMPRESA_FACTURA`                   ,
                             `DIRECCION2_EMPRESA_FACTURA`                   ,
                             `POBLACION_EMPRESA_FACTURA`                    ,
                             `PROVINCIA_EMPRESA_FACTURA`                    ,
                             `PAIS_EMPRESA_FACTURA`                         ,
                             `CPOSTAL_EMPRESA_FACTURA`                      ,
                             `ESRETENCIONES_EMPRESA_FACTURA`                ,
                             `GRUPO_ZONA_IVA_EMPRESA_FACTURA`               ,
                             `ESREGIMENESPECIALAGRICOLA_EMPRESA_FACTURA`    ,
                             `CODIGO_CLIENTE_FACTURA`                       ,
                             `RAZONSOCIAL_CLIENTE_FACTURA`                  ,
                             `NIF_CLIENTE_FACTURA`                          ,
                             `MOVIL_CLIENTE_FACTURA`                        ,
                             `EMAIL_CLIENTE_FACTURA`                        ,
                             `DIRECCION1_CLIENTE_FACTURA`                   ,
                             `DIRECCION2_CLIENTE_FACTURA`                   ,
                             `POBLACION_CLIENTE_FACTURA`                    ,
                             `PROVINCIA_CLIENTE_FACTURA`                    ,
                             `CPOSTAL_CLIENTE_FACTURA`                      ,
                             `PAIS_CLIENTE_FACTURA`                         ,
                             `ESIVA_RECARGO_CLIENTE_FACTURA`                ,
                             `ESIVA_EXENTO_CLIENTE_FACTURA`                 ,
                             `ESREGIMENESPECIALAGRICOLA_CLIENTE_FACTURA`    ,
                             `ESRETENCIONES_CLIENTE_FACTURA`                ,
                             `TARIFA_ARTICULO_CLIENTE_FACTURA`              ,
                             `ESIMP_INCL_TARIFA_CLIENTE_FACTURA`            ,
                             `ESINTRACOMUNITARIO_CLIENTE_FACTURA`           ,
                             `ESIRPF_IMP_INCL_ZONA_IVA_FACTURA`             ,
                             `ESAPLICA_RE_ZONA_IVA_FACTURA`                 ,
                             `ESIVAAGRICOLA_ZONA_IVA_FACTURA`               ,
                             `PALABRA_REPORTS_ZONA_IVA_FACTURA`             ,
                             `CODIGO_IVA_FACTURA`                           ,
                             `ESVENTA_ACTIVO_FIJO_FACTURA`                  ,
                             `PORCEN_IVAN_FACTURA`                          ,
                             `TOTAL_IVAN_FACTURA`                           ,
                             `PORCEN_REN_FACTURA`                           ,
                             `TOTAL_REN_FACTURA`                            ,
                             `TOTAL_BASEI_IVAN_FACTURA`                     ,
                             `PORCEN_IVAR_FACTURA`                          ,
                             `TOTAL_IVAR_FACTURA`                           ,
                             `PORCEN_RER_FACTURA`                           ,
                             `TOTAL_RER_FACTURA`                            ,
                             `TOTAL_BASEI_IVAR_FACTURA`                     ,
                             `PORCEN_IVAS_FACTURA`                          ,
                             `TOTAL_IVAS_FACTURA`                           ,
                             `PORCEN_RES_FACTURA`                           ,
                             `TOTAL_RES_FACTURA`                            ,
                             `TOTAL_BASEI_IVAS_FACTURA`                     ,
                             `PORCEN_IVAE_FACTURA`                          ,
                             `TOTAL_IVAE_FACTURA`                           ,
                             `PORCEN_REE_FACTURA`                           ,
                             `TOTAL_REE_FACTURA`                            ,
                             `TOTAL_BASEI_IVAE_FACTURA`                     ,
                             `TOTAL_BASES_FACTURA`                          ,
                             `TOTAL_IMPUESTOS_FACTURA`                      ,
                             `FORMA_PAGO_FACTURA`                           ,
                             `PORCEN_RETENCION_FACTURA`                     ,
                             `TOTAL_RETENCION_FACTURA`                      ,
                             `TOTAL_LIQUIDO_FACTURA`                        ,
                             `NRO_FACTURA_ABONO_FACTURA`                    ,
                             `SERIE_FACTURA_ABONO_FACTURA`                  ,
                             `TEXTO_LEGAL_FACTURA_CLIENTE_FACTURA`          ,
                             `TEXTO_LEGAL_FACTURA_EMPRESA_FACTURA`          ,
                             `DOCUMENTO_FACTURA`                            ,
                             `COMENTARIOS_FACTURA`                          ,
                             `CONTADOR_LINEAS_FACTURA`                      ,
														 `ESCREARARTICULOS_FACTURA`											,	
                             `ESDESCRIPCIONES_AMP_FACTURA`	                ,
                             `ESFECHADEENTREGA_FACTURA`	                    ,
                             `INSTANTEMODIF`                                ,
                             `INSTANTEALTA`                                 ,
                             `USUARIOALTA`                                  ,
                             `USUARIOMODIF`
                        )
                          SELECT `contadorped`                                ,
                                 `pidseriefacturaabono`                       ,
                                 `pFecha`                                     ,
                                 `CODIGO_EMPRESA_FACTURA`                     ,
                                 `RAZONSOCIAL_EMPRESA_FACTURA`                ,
                                 `NIF_EMPRESA_FACTURA`                        ,
                                 `MOVIL_EMPRESA_FACTURA`                      ,
                                 `EMAIL_EMPRESA_FACTURA`                      ,
                                 `DIRECCION1_EMPRESA_FACTURA`                 ,
                                 `DIRECCION2_EMPRESA_FACTURA`                 ,
                                 `POBLACION_EMPRESA_FACTURA`                  ,
                                 `PROVINCIA_EMPRESA_FACTURA`                  ,
                                 `PAIS_EMPRESA_FACTURA`                       ,
                                 `CPOSTAL_EMPRESA_FACTURA`                    ,
                                 `ESRETENCIONES_EMPRESA_FACTURA`              ,
                                 `GRUPO_ZONA_IVA_EMPRESA_FACTURA`             ,
                                 `ESREGIMENESPECIALAGRICOLA_EMPRESA_FACTURA`  ,
                                 `CODIGO_CLIENTE_FACTURA`                     ,
                                 `RAZONSOCIAL_CLIENTE_FACTURA`                ,
                                 `NIF_CLIENTE_FACTURA`                        ,
                                 `MOVIL_CLIENTE_FACTURA`                      ,
                                 `EMAIL_CLIENTE_FACTURA`                      ,
                                 `DIRECCION1_CLIENTE_FACTURA`                 ,
                                 `DIRECCION2_CLIENTE_FACTURA`                 ,
                                 `POBLACION_CLIENTE_FACTURA`                  ,
                                 `PROVINCIA_CLIENTE_FACTURA`                  ,
                                 `CPOSTAL_CLIENTE_FACTURA`                    ,
                                 `PAIS_CLIENTE_FACTURA`                       ,
                                 `ESIVA_RECARGO_CLIENTE_FACTURA`              ,
                                 `ESIVA_EXENTO_CLIENTE_FACTURA`               ,
                                 `ESREGIMENESPECIALAGRICOLA_CLIENTE_FACTURA`  ,
                                 `ESRETENCIONES_CLIENTE_FACTURA`              ,
                                 `TARIFA_ARTICULO_CLIENTE_FACTURA`            ,
                                 `ESIMP_INCL_TARIFA_CLIENTE_FACTURA`          ,
                                 `ESINTRACOMUNITARIO_CLIENTE_FACTURA`         ,
                                 `ESIRPF_IMP_INCL_ZONA_IVA_FACTURA`           ,
                                 `ESAPLICA_RE_ZONA_IVA_FACTURA`               ,
                                 `ESIVAAGRICOLA_ZONA_IVA_FACTURA`             ,
                                 `PALABRA_REPORTS_ZONA_IVA_FACTURA`           ,
                                 `CODIGO_IVA_FACTURA`                         ,
                                 `ESVENTA_ACTIVO_FIJO_FACTURA`                ,
                                 `PORCEN_IVAN_FACTURA`                        ,
                                 `TOTAL_IVAN_FACTURA`                         ,
                                 `PORCEN_REN_FACTURA`                         ,
                                 `TOTAL_REN_FACTURA`                          ,
                                 `TOTAL_BASEI_IVAN_FACTURA`                   ,
                                 `PORCEN_IVAR_FACTURA`                        ,
                                 `TOTAL_IVAR_FACTURA`                         ,
                                 `PORCEN_RER_FACTURA`                         ,
                                 `TOTAL_RER_FACTURA`                          ,
                                 `TOTAL_BASEI_IVAR_FACTURA`                   ,
                                 `PORCEN_IVAS_FACTURA`                        ,
                                 `TOTAL_IVAS_FACTURA`                         ,
                                 `PORCEN_RES_FACTURA`                         ,
                                 `TOTAL_RES_FACTURA`                          ,
                                 `TOTAL_BASEI_IVAS_FACTURA`                   ,
                                 `PORCEN_IVAE_FACTURA`                        ,
                                 `TOTAL_IVAE_FACTURA`                         ,
                                 `PORCEN_REE_FACTURA`                         ,
                                 `TOTAL_REE_FACTURA`                          ,
                                 `TOTAL_BASEI_IVAE_FACTURA`                   ,
                                 `TOTAL_BASES_FACTURA`                        ,
                                 `TOTAL_IMPUESTOS_FACTURA`                    ,
                                 `FORMA_PAGO_FACTURA`                         ,
                                 `PORCEN_RETENCION_FACTURA`                   ,
                                 `TOTAL_RETENCION_FACTURA`                    ,
                                 `TOTAL_LIQUIDO_FACTURA`                      ,
                                 `NRO_FACTURA_ABONO_FACTURA`                  ,
                                 `SERIE_FACTURA_ABONO_FACTURA`                ,
                                 `TEXTO_LEGAL_FACTURA_CLIENTE_FACTURA`        ,
                                 `TEXTO_LEGAL_FACTURA_EMPRESA_FACTURA`        ,
                                 `DOCUMENTO_FACTURA`                          ,
                                 `COMENTARIOS_FACTURA`                        ,
                                 `CONTADOR_LINEAS_FACTURA`                    ,
																 `ESCREARARTICULOS_FACTURA`										,	
                                 `ESDESCRIPCIONES_AMP_FACTURA`	              ,
                                 `ESFECHADEENTREGA_FACTURA`	                  ,
                                 `pINSTANTEMODIF`                             ,
                                 `pINSTANTEMODIF`                             ,
                                 `pUSUARIO`                                   ,
                                 `pUSUARIO`
                            FROM `fza_facturas` 
                           WHERE `NRO_FACTURA`   = `pidnumfactura` 
                             AND `SERIE_FACTURA` = `pidseriefactura`;  
  INSERT INTO fza_facturas_lineas (`NRO_FACTURA_LINEA`                        ,
                                   `SERIE_FACTURA_LINEA`                      ,
                                   `LINEA_FACTURA_LINEA`                      ,
                                   `CODIGO_ARTICULO_FACTURA_LINEA`            ,
                                   `TIPO_CANTIDAD_ARTICULO_FACTURA_LINEA`     ,
                                   `ESIMP_INCL_TARIFA_FACTURA_LINEA`          ,
                                   `TIPOIVA_ARTICULO_FACTURA_LINEA`           ,
                                   `DESCRIPCION_ARTICULO_FACTURA_LINEA`       ,
                                   `CANTIDAD_FACTURA_LINEA`                   ,
                                   `PRECIOVENTA_SIVA_ARTICULO_FACTURA_LINEA`  ,
                                   `PORCEN_IVA_FACTURA_LINEA`                 ,
                                   `PRECIOVENTA_CIVA_ARTICULO_FACTURA_LINEA`  ,
                                   `TOTAL_FACTURA_LINEA`                      ,
                                   `INSTANTEMODIF`                            ,
                                   `INSTANTEALTA`                             ,
                                   `USUARIOALTA`                              ,
                                   `USUARIOMODIF`
                                  )
                           SELECT `contadorped`                               ,
                                  `pidseriefacturaabono`                      ,
                                  `LINEA_FACTURA_LINEA`                       ,
                                  `CODIGO_ARTICULO_FACTURA_LINEA`             ,
                                  `TIPO_CANTIDAD_ARTICULO_FACTURA_LINEA`      ,
                                  `ESIMP_INCL_TARIFA_FACTURA_LINEA`           ,
                                  `TIPOIVA_ARTICULO_FACTURA_LINEA`            ,
                                  `DESCRIPCION_ARTICULO_FACTURA_LINEA`        ,
                                  `CANTIDAD_FACTURA_LINEA`                    ,
                                  `PRECIOVENTA_SIVA_ARTICULO_FACTURA_LINEA`   ,
                                  `PORCEN_IVA_FACTURA_LINEA`                  ,
                                  `PRECIOVENTA_CIVA_ARTICULO_FACTURA_LINEA`   ,
                                  `TOTAL_FACTURA_LINEA`                       ,
                                  `pINSTANTEMODIF`                            ,
                                  `pINSTANTEMODIF`                            ,
                                  `pUSUARIO`                                  ,
                                  `pUSUARIO`
                             FROM `fza_facturas_lineas`
                            WHERE `SERIE_FACTURA_LINEA`      = `pidseriefactura`
                              AND `NRO_FACTURA_LINEA`        = `pidnumfactura` ;
    COMMIT;
END $$
DELIMITER ;


DELIMITER $$
DROP PROCEDURE IF EXISTS `PRC_CREAR_METADATOS` $$
CREATE  PROCEDURE `PRC_CREAR_METADATOS`(IN `pDATABASENAME` varchar(100))
BEGIN
START TRANSACTION;
  DROP TABLE IF EXISTS `fza_metadatos`;
  CREATE TABLE `fza_metadatos`  (
    `CODIGO_METADATO` int(20) NOT NULL AUTO_INCREMENT,
    `NOMBRE_METADATO` varchar(100) CHARACTER SET utf8mb4 
                               COLLATE utf8mb4_spanish_ci NOT NULL,
    `PARENT_METADATO` varchar(20) CHARACTER SET utf8mb4 
                               COLLATE utf8mb4_spanish_ci NOT NULL,
    PRIMARY KEY (`CODIGO_METADATO`) USING BTREE
  ) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 
             COLLATE = utf8mb4_spanish_ci ROW_FORMAT = Dynamic;
  INSERT INTO `fza_metadatos` (`PARENT_METADATO`, `NOMBRE_METADATO`)
  SELECT '1' AS `PARENT_METADATO`,
         `table_name` as `NOMBRE_METADATO`
    FROM `information_schema`.`TABLES` 
   WHERE `table_schema` = `pDATABASENAME`  
     AND `table_type` = 'BASE TABLE';
  INSERT INTO `fza_metadatos` (`PARENT_METADATO`, `NOMBRE_METADATO`)    
  SELECT '2' AS `PARENT_METADATO`,
         `table_name` as `NOMBRE_METADATO`
    FROM `information_schema`.`TABLES` 
   WHERE `table_schema` = `pDATABASENAME`
     AND `table_type` = 'VIEW';
   INSERT INTO `fza_metadatos` (`PARENT_METADATO`, `NOMBRE_METADATO`) 
   SELECT '3' AS `PARENT_METADATO`,
          `SPECIFIC_NAME` AS `NOMBRE_METADATO`
     FROM `information_schema`.`ROUTINES` 
    WHERE `ROUTINE_SCHEMA` = pDATABASENAME  
      AND `ROUTINE_TYPE` = 'PROCEDURE';     
   
   INSERT INTO `fza_metadatos` (`CODIGO_METADATO`, 
                                `PARENT_METADATO`, 
                                `NOMBRE_METADATO`) 
                        VALUES (1, '-1','Tablas');  
   INSERT INTO `fza_metadatos` (`CODIGO_METADATO`, 
                                `PARENT_METADATO`, 
                                `NOMBRE_METADATO`) 
                        VALUES (2, '-1','Vistas');
   INSERT INTO `fza_metadatos` (`CODIGO_METADATO`, 
                                `PARENT_METADATO`, 
                                `NOMBRE_METADATO`) 
                        VALUES (3, '-1','Procedimientos');
COMMIT;
END $$
DELIMITER ;


DELIMITER $$
DROP PROCEDURE IF EXISTS `PRC_CREAR_RECIBOS_FACTURA` $$
CREATE  PROCEDURE `PRC_CREAR_RECIBOS_FACTURA`(IN `pSERIE_FACTURA` varchar(12),
	                                        IN `pNRO_FACTURA` varchar(12),
																					IN `pUSUARIO`             varchar(100),
                                          IN `pINSTANTEMODIF`       TIMESTAMP)
BEGIN
  DECLARE pCODIGO_FORMAPAGO VARCHAR(10);
	DECLARE pFORMA_PAGO_FACTURA VARCHAR(100);
	DECLARE pN_PLAZOS int(10); 
	DECLARE I int(10);
	DECLARE pDIAS_ENTRE_PLAZOS int(10);
	DECLARE pPORCEN_ANTICIPO decimal(5,2);
	DECLARE pCODIGO_CLIENTE  varchar(20);
	DECLARE pIBAN varchar(34);
	DECLARE pRAZONSOCIAL_CLIENTE varchar(200);
	DECLARE pDIRECCION1_CLIENTE  varchar(200);
	DECLARE pPOBLACION_CLIENTE  varchar(200);
	DECLARE pPOBLACION_EMPRESA varchar(200);
	DECLARE pPROVINCIA_CLIENTE  varchar(200);
	DECLARE pCPOSTAL_CLIENTE  varchar(15);
	DECLARE pIMPORTE_LETRA  varchar(150);
	DECLARE pTOTAL_LIQUIDO_FACTURA decimal(18,6);
	DECLARE pIMPORTE_RECIBO decimal(18,6);
	DECLARE pIMPORTE_RESTO decimal(18,6);
	DECLARE pIMPORTE_ANTICIPO decimal(18,6);
	DECLARE pFECHA_VENCIMIENTO date;
	DECLARE pFECHA_FACTURA date;
	DECLARE finished INTEGER DEFAULT 0;
	/* DECLARE pTRATAMIENTO_LINEA VARCHAR(100); */
  /* DECLARE pTRATAMIENTOS varchar(1000) DEFAULT ""; */
  /* DECLARE curTratamientos 
        CURSOR FOR 
            SELECT DESCRIPCION_ARTICULO_LINEA 
						  FROM suboc_facturas_lineas 
						 WHERE SERIE_FACTURA_LINEA = pSERIE_FACTURA 
						   AND NRO_FACTURA_LINEA = pNRO_FACTURA;
  DECLARE CONTINUE HANDLER 
        FOR NOT FOUND SET finished = 1; */
	START TRANSACTION;
	DELETE FROM fza_recibos 
   WHERE NRO_FACTURA_RECIBO = pNRO_FACTURA
	   AND SERIE_FACTURA_RECIBO = pSERIE_FACTURA;	
  /* OPEN curTratamientos;
  getTratamientos: LOOP
		FETCH curTratamientos INTO pTRATAMIENTO_LINEA;
		IF finished = 1 THEN 
				LEAVE getTratamientos;
		END IF;
		-- build email list
		SET pTRATAMIENTOS = CONCAT(pTRATAMIENTOS,'\n',pTRATAMIENTO_LINEA);
  END LOOP getTratamientos;
	*/
	SELECT FORMA_PAGO_FACTURA, 
				 CODIGO_CLIENTE_FACTURA,
				 TOTAL_LIQUIDO_FACTURA,
				 RAZONSOCIAL_CLIENTE_FACTURA,
				 DIRECCION1_CLIENTE_FACTURA,
				 POBLACION_CLIENTE_FACTURA,
				 PROVINCIA_CLIENTE_FACTURA,
				 CPOSTAL_CLIENTE_FACTURA,
				 FECHA_FACTURA,
				 POBLACION_EMPRESA_FACTURA
		INTO pFORMA_PAGO_FACTURA,
				 pCODIGO_CLIENTE,
				 pTOTAL_LIQUIDO_FACTURA,
				 pRAZONSOCIAL_CLIENTE,
				 pDIRECCION1_CLIENTE,
				 pPOBLACION_CLIENTE,
				 pPROVINCIA_CLIENTE,
				 pCPOSTAL_CLIENTE,
				 pFECHA_FACTURA,
				 pPOBLACION_EMPRESA
		FROM fza_facturas
   WHERE SERIE_FACTURA = pSERIE_FACTURA
	   AND NRO_FACTURA = pNRO_FACTURA;
select pFORMA_PAGO_FACTURA;		 
		 SELECT IBAN_CLIENTE 
		  INTO pIBAN
		 FROM fza_clientes
		 WHERE CODIGO_CLIENTE = pCODIGO_CLIENTE;
		 /* select pforma_pago_factura; */
		 IF( EXISTS(
							 SELECT *
							 FROM fza_formapago
							 WHERE CODIGO_FORMAPAGO =  pFORMA_PAGO_FACTURA) ) THEN
		BEGIN
			SELECT CODIGO_FORMAPAGO, 
			       N_PLAZOS_FORMAPAGO, 
						 N_DIAS_ENTRE_PLAZOS_FORMAPAGO, 
						 PORCEN_ANTICIPO_FORMAPAGO 
				INTO pCODIGO_FORMAPAGO,
				     pN_PLAZOS, 
						 pDIAS_ENTRE_PLAZOS,  
						 pPORCEN_ANTICIPO
				FROM fza_formapago
				WHERE CODIGO_FORMAPAGO = pFORMA_PAGO_FACTURA;
				
			IF ((pPORCEN_ANTICIPO = 100)) THEN
			BEGIN
				CALL PRC_GET_NUMEROS_A_LETRAS(pTOTAL_LIQUIDO_FACTURA, pIMPORTE_LETRA);
				INSERT INTO  fza_recibos 
				       (NRO_FACTURA_RECIBO					        ,
								SERIE_FACTURA_RECIBO                ,
								NRO_PLAZO_RECIBO                    ,
								FORMA_PAGO_ORIGEN_RECIBO            ,
								FORMA_PAGO_DESCRIPCION_ORIGEN_RECIBO,								
								EUROS_RECIBO                        ,
								STADO_RECIBO                       ,
								FECHA_EXPEDICION_RECIBO             ,
								FECHA_VENCIMIENTO_RECIBO            ,
								IBAN_CLIENTE_RECIBO                 ,
								FECHA_PAGO_RECIBO                   ,
								LOCALIDAD_EXPEDICION_RECIBO         ,
								CODIGO_CLIENTE_RECIBO               ,
								RAZONSOCIAL_CLIENTE_RECIBO          ,
								DIRECCION1_CLIENTE_RECIBO           ,
								POBLACION_CLIENTE_RECIBO            ,
								PROVINCIA_CLIENTE_RECIBO            ,
								CPOSTAL_CLIENTE_RECIBO              ,
								IMPORTE_LETRA_RECIBO                ,
								INSTANTEALTA,
								USUARIOALTA,
								USUARIOMODIF	)
				VALUES( pNRO_FACTURA                        ,
				        pSERIE_FACTURA                      ,
								1                                   ,
								pCODIGO_FORMAPAGO                   ,
								pFORMA_PAGO_FACTURA                 ,
								pTOTAL_LIQUIDO_FACTURA              ,
								'Pagado'                            ,
								pFECHA_FACTURA                      ,
								pFECHA_FACTURA                      ,
								pIBAN                               ,
								pFECHA_FACTURA                      ,
								pPOBLACION_EMPRESA                  ,
								pCODIGO_CLIENTE                     ,
								pRAZONSOCIAL_CLIENTE                ,
								pDIRECCION1_CLIENTE                 ,
								pPOBLACION_CLIENTE                  ,
								pPROVINCIA_CLIENTE                  ,
								pCPOSTAL_CLIENTE                    ,
								pIMPORTE_LETRA                      ,
								pINSTANTEMODIF                      ,
								pUSUARIO                            ,
								pUSUARIO
							);
			END;
			ELSE 
			  IF (pN_PLAZOS >= 1) THEN
				BEGIN
			    SET I = 1;
					WHILE (I<=pN_PLAZOS) DO
					BEGIN
					      IF ((I = 1)) THEN 
								BEGIN
								  SET pFECHA_VENCIMIENTO  =  ADDDATE(pFECHA_FACTURA, INTERVAL pDIAS_ENTRE_PLAZOS DAY);
								  SET pIMPORTE_ANTICIPO = pTOTAL_LIQUIDO_FACTURA * (pPORCEN_ANTICIPO/100);
								  SET pIMPORTE_RESTO = (pTOTAL_LIQUIDO_FACTURA - pIMPORTE_ANTICIPO);
									/* SELECT pTOTAL_LIQUIDO_FACTURA, pIMPORTE_RESTO, pIMPORTE_ANTICIPO; */
								END;	
								END IF;									
								IF ((I= 1) AND (pPORCEN_ANTICIPO > 0)) THEN
									SET pIMPORTE_RECIBO = pIMPORTE_ANTICIPO;
								ELSE
								  IF pN_PLAZOS > 1 THEN 
									  /* SELECT pN_PLAZOS, pIMPORTE_RESTO, I AS iteracion; */
									  SET pIMPORTE_RECIBO = pIMPORTE_RESTO / (pN_PLAZOS);
									ELSE
										SET pIMPORTE_RECIBO = pIMPORTE_RESTO;
									END IF;
								END IF;
							  CALL PRC_GET_NUMEROS_A_LETRAS(pIMPORTE_RECIBO, pIMPORTE_LETRA);	
								IF (I <> 1) THEN
								  SET pFECHA_VENCIMIENTO = ADDDATE(pFECHA_VENCIMIENTO, INTERVAL pDIAS_ENTRE_PLAZOS DAY);
								END IF;
								INSERT INTO  fza_recibos 
												 (NRO_FACTURA_RECIBO					        ,
													SERIE_FACTURA_RECIBO                ,
													NRO_PLAZO_RECIBO                    ,
													FORMA_PAGO_ORIGEN_RECIBO            ,													
													FORMA_PAGO_DESCRIPCION_ORIGEN_RECIBO,
													EUROS_RECIBO                        ,
													STADO_RECIBO                       ,
													FECHA_EXPEDICION_RECIBO             ,
													FECHA_VENCIMIENTO_RECIBO            ,
													IBAN_CLIENTE_RECIBO                 ,
													FECHA_PAGO_RECIBO                   ,
													LOCALIDAD_EXPEDICION_RECIBO         ,
													CODIGO_CLIENTE_RECIBO               ,
													RAZONSOCIAL_CLIENTE_RECIBO          ,
													DIRECCION1_CLIENTE_RECIBO           ,
													POBLACION_CLIENTE_RECIBO            ,
													PROVINCIA_CLIENTE_RECIBO            ,
													CPOSTAL_CLIENTE_RECIBO              ,
													IMPORTE_LETRA_RECIBO                ,	
													INSTANTEALTA                        ,
          								USUARIOALTA                         ,
					          			USUARIOMODIF	)
								VALUES(   pNRO_FACTURA,
													pSERIE_FACTURA,
													I,
													pCODIGO_FORMAPAGO,										
													pFORMA_PAGO_FACTURA,
													pIMPORTE_RECIBO,
													'Emitido',
													pFECHA_FACTURA,
													pFECHA_VENCIMIENTO,
													pIBAN,
													NULL,
													pPOBLACION_EMPRESA,
													pCODIGO_CLIENTE,
													pRAZONSOCIAL_CLIENTE,
													pDIRECCION1_CLIENTE,
													pPOBLACION_CLIENTE,
													pPROVINCIA_CLIENTE,
													pCPOSTAL_CLIENTE,
													pIMPORTE_LETRA,
													pINSTANTEMODIF,
													pUSUARIO,
													PUSUARIO
												);
								SET I = I + 1;
					END;
					END WHILE;
				END;
				END IF;
			END IF;
		END;
		END IF;
		COMMIT;
END $$
DELIMITER ;


DELIMITER $$
DROP PROCEDURE IF EXISTS `PRC_FNC_GET_NEXT_LINEA_FACTURA` $$
CREATE  PROCEDURE `PRC_FNC_GET_NEXT_LINEA_FACTURA`(IN  `pnumfac` VARCHAR(12), 
                                                   IN  `pserie`  VARCHAR(12), 
                                                   OUT `presul`  VARCHAR(3))
BEGIN
  DECLARE `pnextnum` varchar(3);
  START TRANSACTION;
  SET `pnextnum` = ( SELECT lpad(((`CONTADOR_LINEAS_FACTURA`)),3,'0' )
                       FROM `fza_facturas`
                      WHERE `NRO_FACTURA`   = `pnumfac`
                        AND `SERIE_FACTURA` = `pserie`);
  IF (`pnextnum` IS NULL) THEN
    SET `presul` = '010';
  ELSE
    SET `presul` = `pnextnum`;
  END IF;
    UPDATE `fza_facturas`
       SET `CONTADOR_LINEAS_FACTURA` = LPAD(((`presul`)+10),3,'0' )
     WHERE `SERIE_FACTURA` = `pserie`
       AND `NRO_FACTURA` = `pnumfac`;
  COMMIT;
END $$
DELIMITER ;


DELIMITER $$
DROP PROCEDURE IF EXISTS `PRC_FNC_GET_NEXT_LINEA_PRESUPUESTO` $$
CREATE  PROCEDURE `PRC_FNC_GET_NEXT_LINEA_PRESUPUESTO`(`pnumfac` VARCHAR(12), `pserie` VARCHAR(12), `presul` VARCHAR(3))
BEGIN
DECLARE pnextnum varchar(3);
SET pnextnum = (select lpad((max(LINEA_PRESUPUESTO_LINEA)+10),3,'0' )
                   from suboc_presupuestos_lineas
                  where NRO_PRESUPUESTO = pnumfac
                    AND SERIE_PRESUPUESTO = pserie);
IF (pnextnum IS NULL) THEN
   SET presul = '010';
ELSE
   SET presul = pnextnum;
END IF;
END $$
DELIMITER ;


DELIMITER $$
DROP PROCEDURE IF EXISTS `PRC_FNC_GET_NEXT_NRO_DOC` $$
CREATE  PROCEDURE `PRC_FNC_GET_NEXT_NRO_DOC`(IN  `ptipodoc` VARCHAR(8), 
                                             OUT `presul`   BIGINT)
BEGIN
DECLARE `ppresul` BIGINT;
UPDATE `fza_contadores`
   SET `CONTADOR_CONTADOR` = CONTADOR_CONTADOR + 1
 WHERE `SERIE_CONTADOR` = '-'
   AND `TIPODOC_CONTADOR` = `pTipoDoc`;
  SET `ppresul` = (SELECT `CONTADOR_CONTADOR` - 1
                     FROM `fza_contadores`
                    WHERE `SERIE_CONTADOR` = '-'
                      AND `DEFAULT_CONTADOR` = 'S'
                      AND `TIPODOC_CONTADOR` = `pTipoDoc` 
                    LIMIT 1);
IF (`ppresul` IS NULL) THEN
   SET `ppresul` = 0;
END IF;


END $$
DELIMITER ;


DELIMITER $$
DROP PROCEDURE IF EXISTS `PRC_FNC_GET_SERIE_TIPODOC` $$
CREATE  PROCEDURE `PRC_FNC_GET_SERIE_TIPODOC`(IN `ptipodoc` VARCHAR(8), 
                                                OUT `presul` VARCHAR(3))
BEGIN


DECLARE pserie varchar(3);
SET pserie = (select SERIE_CONTADOR
FROM fza_contadores
  where DEFAULT_CONTADOR = 'S'
and TIPODOC_CONTADOR = ptipodoc);
IF (pserie IS NULL) THEN
   SET presul = '-';
ELSE
   SET presul = pserie;
END IF;
END $$
DELIMITER ;


DELIMITER $$
DROP PROCEDURE IF EXISTS `PRC_GET_DATA_ARTICULO` $$
CREATE  PROCEDURE `PRC_GET_DATA_ARTICULO`(IN `pidcodarticulo` varchar(200), 
                                         OUT `pidnomarticulo` varchar(200), 
                                         OUT `ptipoiva` varchar(2))
BEGIN
   IF( EXISTS(
             SELECT *
               FROM `fza_articulos`
              WHERE `CODIGO_ARTICULO` =  `pidcodarticulo`) ) THEN
  BEGIN
    SELECT `DESCRIPCION_ARTICULO`, `TIPOIVA_ARTICULO` 
      INTO `pidnomarticulo`, `ptipoiva`
      FROM `fza_articulos`
     WHERE `CODIGO_ARTICULO` = `pidcodarticulo`;
  END;
  ELSE
  BEGIN
    SET `pidnomarticulo` = 'NO EXISTE';
    SET `ptipoiva` = 'N';
  END;
  END IF;
END $$
DELIMITER ;


DELIMITER $$
DROP PROCEDURE IF EXISTS `PRC_GET_DATA_CLIENTE` $$
CREATE  PROCEDURE `PRC_GET_DATA_CLIENTE`(IN `pCODIGO_CLIENTE`                    varchar(10),
                         OUT `pRAZONSOCIAL_CLIENTE`               varchar(200),
                         OUT `pNIF_CLIENTE`                       varchar(50),
                         OUT `pCODIGO_ZONA_IVA_CLIENTE`           int,
                         OUT `pMOVIL_CLIENTE`                     varchar(40),
                         OUT `pESIVA_RECARGO_CLIENTE`             varchar(1),
                         OUT `pESRETENCIONES_CLIENTE`             varchar(1),
                         OUT `pESIVA_EXENTO_CLIENTE`              varchar(1),
                         OUT `pESINTRACOMUNITARIO_CLIENTE`        varchar(1),
                         OUT `pESREGIMENESPECIALAGRICOLA_CLIENTE` varchar(1),
                         OUT `pEMAIL_CLIENTE`                     varchar(200),
                         OUT `pDIRECCION1_CLIENTE`                varchar(200),
                         OUT `pDIRECCION2_CLIENTE`                varchar(200),
                         OUT `pPOBLACION_CLIENTE`                 varchar(200),
                         OUT `pPROVINCIA_CLIENTE`                 varchar(200),
                         OUT `pCPOSTAL_CLIENTE`                   varchar(15),
                         OUT `pTARIFA_ARTICULO_CLIENTE`           varchar(10),
                         OUT `pTEXTO_LEGAL_FACTURA_CLIENTE`       varchar(1000),
                         OUT `pPAIS_CLIENTE`                      varchar(150))
BEGIN
   IF( EXISTS(
             SELECT *
             FROM `fza_clientes`
             WHERE `CODIGO_CLIENTE` =  `pCODIGO_CLIENTE`) ) THEN
  BEGIN
    SELECT  `RAZONSOCIAL_CLIENTE`               ,
            `NIF_CLIENTE`                       ,
            `CODIGO_ZONA_IVA_CLIENTE`           ,
            `ESIVA_RECARGO_CLIENTE`             ,
            `ESRETENCIONES_CLIENTE`             ,
            `ESIVA_EXENTO_CLIENTE`              ,
            `ESINTRACOMUNITARIO_CLIENTE`        ,
            `ESREGIMENESPECIALAGRICOLA_CLIENTE` ,
            `MOVIL_CLIENTE`                     ,
            `EMAIL_CLIENTE`                     ,
            `DIRECCION1_CLIENTE`                ,
            `DIRECCION2_CLIENTE`                ,
            `POBLACION_CLIENTE`                 ,
            `PROVINCIA_CLIENTE`                 ,
            `CPOSTAL_CLIENTE`                   ,
            `TARIFA_ARTICULO_CLIENTE`           ,
            `TEXTO_LEGAL_FACTURA_CLIENTE`       ,
            `PAIS_CLIENTE`        
      INTO  `pRAZONSOCIAL_CLIENTE`              ,
            `pNIF_CLIENTE`                      ,
            `pCODIGO_ZONA_IVA_CLIENTE`          ,
            `pESIVA_RECARGO_CLIENTE`            ,
            `pESRETENCIONES_CLIENTE`            ,
            `pESIVA_EXENTO_CLIENTE`             ,
            `pESINTRACOMUNITARIO_CLIENTE`       ,
            `pESREGIMENESPECIALAGRICOLA_CLIENTE`,
            `pMOVIL_CLIENTE`                    ,
            `pEMAIL_CLIENTE`                    ,
            `pDIRECCION1_CLIENTE`               ,
            `pDIRECCION2_CLIENTE`               ,
            `pPOBLACION_CLIENTE`                ,
            `pPROVINCIA_CLIENTE`                ,
            `pCPOSTAL_CLIENTE`                  ,
            `pTARIFA_ARTICULO_CLIENTE`          ,
            `pTEXTO_LEGAL_FACTURA_CLIENTE`      ,
            `pPAIS_CLIENTE`
      FROM `fza_clientes`
     WHERE `CODIGO_CLIENTE` =  `pCODIGO_CLIENTE`;
  END;
  ELSE
  BEGIN
    SET `pRAZONSOCIAL_CLIENTE` = 'CLIENTE NO ENCONTRADO';
  END;
  END IF;
END $$
DELIMITER ;


DELIMITER $$
DROP PROCEDURE IF EXISTS `PRC_GET_IVA_ZONA_FECHA` $$
CREATE  PROCEDURE `PRC_GET_IVA_ZONA_FECHA`(IN `pFECHA` DATE, 
                                       IN `pZONA` INT, 
                                       OUT `pRESUL` INT, 
                                       OUT `pEXENTO_IVA` DECIMAL(18,6), 
                                       OUT `pEXENTO_RE_IVA` DECIMAL(18,6), 
                                       OUT `pNORMAL_IVA` DECIMAL(18,6), 
                                       OUT `pNORMAL_RE_IVA` DECIMAL(18,6), 
                                       OUT `pREDUCIDO_IVA` DECIMAL(18,6), 
                                       OUT `pREDUCIDO_RE_IVA` DECIMAL(18,6), 
                                       OUT `pSUPERREDUCIDO_IVA` DECIMAL(18,6), 
                                       OUT `pSUPERREDUCIDO_RE_IVA` DECIMAL(18,6))
BEGIN
    IF( EXISTS(
             SELECT *
               FROM fza_ivas
              WHERE FECHA_DESDE_IVA >=  FECHA
                AND (FECHA_HASTA_IVA <= FECHA 
                 OR FECHA_HASTA_IVA IS NULL)
                AND  GRUPO_ZONA_IVA = pZONA)) THEN
  SELECT `PORCENEXENTO_IVA` ,
         `PORCENEXENTO_RE_IVA`,
         `PORCENNORMAL_IVA` ,
         `PORCENNORMAL_RE_IVA`,
         `PORCENREDUCIDO_IVA` ,
         `PORCENREDUCIDO_RE_IVA` ,
         `PORCENSUPERREDUCIDO_IVA` ,
         `PORCENSUPERREDUCIDO_RE_IVA`
    INTO
         pEXENTO_IVA,
         pEXENTO_RE_IVA,
         pNORMAL_IVA ,
         pNORMAL_RE_IVA,
         pREDUCIDO_IVA,
         pREDUCIDO_RE_IVA ,
         pSUPERREDUCIDO_IVA,
         pSUPERREDUCIDO_RE_IVA
    FROM fza_ivas
   WHERE (FECHA_DESDE_IVA >=  FECHA
     AND (FECHA_HASTA_IVA <= FECHA OR 
          FECHA_HASTA_IVA IS NULL))
     AND CODIGO_ZONA_IVA = pZONA;
ELSE
    SELECT `PORCENEXENTO_IVA` ,
           `PORCENEXENTO_RE_IVA`,
           `PORCENNORMAL_IVA` ,
           `PORCENNORMAL_RE_IVA`,
           `PORCENREDUCIDO_IVA` ,
           `PORCENREDUCIDO_RE_IVA` ,
           `PORCENSUPERREDUCIDO_IVA` ,
           `PORCENSUPERREDUCIDO_RE_IVA`
       INTO
            pEXENTO_IVA,
            pEXENTO_RE_IVA,
            pNORMAL_IVA ,
            pNORMAL_RE_IVA,
            pREDUCIDO_IVA,
            pREDUCIDO_RE_IVA ,
            pSUPERREDUCIDO_IVA,
            pSUPERREDUCIDO_RE_IVA
      FROM  fza_ivas
     WHERE (FECHA_DESDE_IVA >=  FECHA
       AND FECHA_HASTA_IVA IS NULL )
       AND CODIGO_ZONA_IVA = pZONA;
  END IF;
END $$
DELIMITER ;


DELIMITER $$
DROP PROCEDURE IF EXISTS `PRC_GET_NEXT_CONT` $$
CREATE  PROCEDURE `PRC_GET_NEXT_CONT`(IN  pTipoDoc varchar(2), 
                                         IN  pUSUARIO_MODIF varchar(100),
                                         OUT pcont varchar(20))
BEGIN
DECLARE pPADD bigint;
DECLARE pEMPRESA_CONTADOR varchar(10);
START TRANSACTION;
  IF ( pEMPRESA_CONTADOR = '' OR pEMPRESA_CONTADOR IS NULL ) THEN 
	  SET pEMPRESA_CONTADOR = '-'; 
	END IF;

  IF( NOT( EXISTS(
             SELECT *
             FROM fza_contadores
             WHERE `TIPODOC_CONTADOR` =  pTipoDoc
						   AND EMPRESA_CONTADOR = pEMPRESA_CONTADOR) ) ) THEN
    BEGIN
      INSERT INTO fza_contadores (TIPODOC_CONTADOR, 
                                  SERIE_CONTADOR,
																  EMPRESA_CONTADOR,	
                                  CONTADOR_CONTADOR, 
                                  DEFAULT_CONTADOR,
                                  NUMDIGIT_CONTADOR,
                                  INSTANTEALTA, 
                                  USUARIOALTA,
                                  USUARIOMODIF) 
                          VALUES
                                 (pTipoDoc, 
                                  '-', 
																	pEMPRESA_CONTADOR,
                                   1, 
                                  'S', 
                                   3,
                                  CURRENT_TIMESTAMP,
                                  pUSUARIO_MODIF, 
                                  pUSUARIO_MODIF);
    END;
    END IF;
    SET pPADD = (SELECT NUMDIGIT_CONTADOR 
                   FROM fza_contadores 
                  WHERE TIPODOC_CONTADOR = pTipoDoc 
									  AND EMPRESA_CONTADOR = pEMPRESA_CONTADOR
                    AND DEFAULT_CONTADOR = 'S' 
                  LIMIT 1);
     
     UPDATE fza_contadores 
        SET CONTADOR_CONTADOR = CONTADOR_CONTADOR + 1,
            USUARIOMODIF = pUSUARIO_MODIF
      WHERE TIPODOC_CONTADOR = pTipoDoc
			  AND EMPRESA_CONTADOR = pEMPRESA_CONTADOR;            
      SELECT LPAD( (SELECT CONTADOR_CONTADOR - 1 
                      FROM fza_contadores         
                     WHERE TIPODOC_CONTADOR = pTipoDoc 
										   AND EMPRESA_CONTADOR = pEMPRESA_CONTADOR
                     LIMIT 1) , pPADD, '0') INTO pcont;
COMMIT;
END $$
DELIMITER ;


DELIMITER $$
DROP PROCEDURE IF EXISTS `PRC_GET_NEXT_CONT_FACT_SERIE` $$
CREATE  PROCEDURE `PRC_GET_NEXT_CONT_FACT_SERIE`(IN  `pserie` VARCHAR(12), 
                                                                           IN  `pTipoDoc` VARCHAR(2), 
																																					 IN  `pEMPRESA_CONTADOR` VARCHAR(10), 
																																					 IN  `pUSUARIOMODIF` varchar(100),
																																					 OUT `pcont` varchar(12))
BEGIN
DECLARE pNUMDIGIT varchar(12);
START TRANSACTION;
  IF ( pEMPRESA_CONTADOR = ''  OR pEMPRESA_CONTADOR IS NULL) THEN 
	  SET pEMPRESA_CONTADOR = '-'; 
	END IF;
  IF( NOT( EXISTS(
             SELECT *
             FROM fza_contadores
             WHERE `TIPODOC_CONTADOR` =  pTipoDoc
						   AND EMPRESA_CONTADOR = pEMPRESA_CONTADOR
						   AND `SERIE_CONTADOR` = pserie) ) ) THEN
	BEGIN
	   INSERT INTO fza_contadores (TIPODOC_CONTADOR, 
		                            SERIE_CONTADOR, 
																CONTADOR_CONTADOR, 
																EMPRESA_CONTADOR,
																DEFAULT_CONTADOR,
																NUMDIGIT_CONTADOR,
																INSTANTEALTA, 
																USUARIOALTA,
																USUARIOMODIF) 
												VALUES
																(pTipoDoc, 
																 pserie, 
																 1, 
																 pEMPRESA_CONTADOR,
																 'N', 
																 6,
																 CURRENT_TIMESTAMP,
																 pUSUARIOMODIF, 
																 pUSUARIOMODIF);
	END;
	END IF;

UPDATE fza_contadores
    SET CONTADOR_CONTADOR = CONTADOR_CONTADOR + 1
  WHERE SERIE_CONTADOR = pserie
		  AND EMPRESA_CONTADOR = pEMPRESA_CONTADOR
      AND TIPODOC_CONTADOR = pTipoDoc;
  
	SELECT CONTADOR_CONTADOR - 1 , 
 	 			 NUMDIGIT_CONTADOR
		INTO pcont,
				 pNUMDIGIT
	  from fza_contadores
	 where SERIE_CONTADOR = pserie
		 and TIPODOC_CONTADOR = pTipoDoc
		 AND EMPRESA_CONTADOR = pEMPRESA_CONTADOR 
		 LIMIT 1;
		 
 IF (NOT(pNUMDIGIT IS NULL) AND (pNUMDIGIT <> 0)) THEN
   SET pcont = LPAD(pcont, pNUMDIGIT, '0');
 END IF;								 

COMMIT;
END $$
DELIMITER ;


DELIMITER $$
DROP PROCEDURE IF EXISTS `PRC_GET_NUMEROS_A_LETRAS` $$
CREATE  PROCEDURE `PRC_GET_NUMEROS_A_LETRAS`(IN NUMERO DECIMAL(12,2), OUT pResul varchar(200))
BEGIN
	DECLARE MILLARES INT;
	DECLARE CENTENAS INT;
	DECLARE CENTIMOS INT;
	DECLARE CENTIMO_AUX VARCHAR(200);
	DECLARE CENTIMO_AUX_CON VARCHAR(200);
	DECLARE MIL_AUX VARCHAR(200);
	DECLARE EN_LETRAS VARCHAR(200);
	DECLARE ENTERO INT;
	DECLARE AUX VARCHAR(15);
	DECLARE INTER VARCHAR(200);
	
	SET EN_LETRAS = '';
	SET CENTIMO_AUX_CON = '';
	SET ENTERO = TRUNCATE(NUMERO,0);
	SET MILLARES = TRUNCATE(ENTERO / 1000,0);
	SET CENTENAS = ENTERO MOD 1000;
	SET CENTIMOS = (TRUNCATE(NUMERO,2) * 100) MOD 100;
	
	IF ((MILLARES = 1)) THEN
		SET EN_LETRAS = 'MIL ';
	ELSE 
		IF (MILLARES > 0) THEN
        CALL PRC_GET_NUMERO_MENOR_MIL(MILLARES, INTER); 
				SET EN_LETRAS = CONCAT(EN_LETRAS , INTER ,'MIL ');
				SET EN_LETRAS = REPLACE(EN_LETRAS,'UNO ','UN ');
		END IF;
	END IF;
	
	IF ((CENTENAS > 0) OR ((ENTERO = 0) AND (CENTIMOS = 0))) THEN
		BEGIN
      CALL PRC_GET_NUMERO_MENOR_MIL(CENTENAS, INTER);
			SET EN_LETRAS = CONCAT(EN_LETRAS, INTER);			
		END;
	END IF;
	IF (CENTIMOS > 0) THEN
	BEGIN
		IF (CENTIMOS = 1) THEN
			SET  AUX = 'CÉNTIMO ';
		ELSE
			SET AUX = 'CÉNTIMOS ';
		END IF;	
		IF (CENTIMOS > 0) THEN
            CALL PRC_GET_NUMERO_MENOR_MIL(CENTIMOS, INTER);
			SET CENTIMO_AUX = INTER;
			SET CENTIMO_AUX = REPLACE(CENTIMO_AUX,'UNO ','UN '); 
			IF ENTERO <> 0 THEN 
			  SET CENTIMO_AUX_CON = 'CON ' ; 
			END IF;
			SET EN_LETRAS = CONCAT(EN_LETRAS, CENTIMO_AUX_CON, CENTIMO_AUX , AUX);
		ELSE
			SET EN_LETRAS = CONCAT(EN_LETRAS, CENTIMO_AUX, AUX);		
		END IF;
	END;
	END IF;
	SET pResul = EN_LETRAS;
END $$
DELIMITER ;


DELIMITER $$
DROP PROCEDURE IF EXISTS `PRC_GET_NUMERO_MENOR_MIL` $$
CREATE  PROCEDURE `PRC_GET_NUMERO_MENOR_MIL`(IN NUMERO DECIMAL(4), OUT pResul varchar(100))
BEGIN
       DECLARE CENTENAS INT;
       DECLARE DECENAS INT;
       DECLARE UNIDADES INT;
       DECLARE EN_LETRAS VARCHAR(100);
       DECLARE UNIR VARCHAR(2);
			 SET EN_LETRAS = '';
        IF (NUMERO = 100) THEN
            SET pResul = ('CIEN ');
        ELSEIF NUMERO = 0 THEN
            SET pResul = ('CERO ');
        ELSEIF NUMERO = 1 THEN
            SET pResul = ('UNO ');
        ELSE
            SET CENTENAS = TRUNCATE(NUMERO / 100,0);
            SET DECENAS  = TRUNCATE((NUMERO MOD 100)/10,0);
            SET UNIDADES = NUMERO MOD 10;
            SET UNIR = 'Y ';
            
						IF CENTENAS = 1 THEN
                SET EN_LETRAS = 'CIENTO ';
            ELSEIF CENTENAS = 2 THEN
                SET EN_LETRAS = 'DOSCIENTOS ';
            ELSEIF CENTENAS = 3 THEN
                SET EN_LETRAS = 'TRESCIENTOS ';
            ELSEIF CENTENAS = 4 THEN
                SET EN_LETRAS = 'CUATROCIENTOS ';
            ELSEIF CENTENAS = 5 THEN
                SET EN_LETRAS = 'QUINIENTOS ';
            ELSEIF CENTENAS = 6 THEN
                SET EN_LETRAS = 'SEISCIENTOS ';
            ELSEIF CENTENAS = 7 THEN
                SET EN_LETRAS = 'SETECIENTOS ';
            ELSEIF CENTENAS = 8 THEN
                SET EN_LETRAS = 'OCHOCIENTOS ';
            ELSEIF CENTENAS = 9 THEN
                SET EN_LETRAS = 'NOVECIENTOS ';
            END IF;
            
						IF DECENAS = 3 THEN
                SET EN_LETRAS = CONCAT(EN_LETRAS , 'TREINTA ');
            ELSEIF DECENAS = 4 THEN
                SET EN_LETRAS = CONCAT(EN_LETRAS , 'CUARENTA ');
            ELSEIF DECENAS = 5 THEN
                SET EN_LETRAS = CONCAT(EN_LETRAS , 'CINCUENTA ');
            ELSEIF DECENAS = 6 THEN
                SET EN_LETRAS = CONCAT(EN_LETRAS , 'SESENTA ');
            ELSEIF DECENAS = 7 THEN
                SET EN_LETRAS = CONCAT(EN_LETRAS , 'SETENTA ');
            ELSEIF DECENAS = 8 THEN
                SET EN_LETRAS = CONCAT(EN_LETRAS , 'OCHENTA ');
            ELSEIF DECENAS = 9 THEN
                SET EN_LETRAS = CONCAT(EN_LETRAS , 'NOVENTA ');
            ELSEIF DECENAS = 1 THEN
                IF UNIDADES < 6 THEN
                    IF UNIDADES = 0 THEN
                        SET EN_LETRAS = CONCAT(EN_LETRAS , 'DIEZ ');
                    ELSEIF UNIDADES = 1 THEN
                        SET EN_LETRAS = CONCAT(EN_LETRAS , 'ONCE ');
                    ELSEIF UNIDADES = 2 THEN
                        SET EN_LETRAS = CONCAT(EN_LETRAS , 'DOCE ');
                    ELSEIF UNIDADES = 3 THEN
                        SET EN_LETRAS = CONCAT(EN_LETRAS , 'TRECE ');
                    ELSEIF UNIDADES = 4 THEN
                        SET EN_LETRAS = CONCAT(EN_LETRAS , 'CATORCE ');
                    ELSEIF UNIDADES = 5 THEN
                        SET EN_LETRAS = CONCAT(EN_LETRAS , 'QUINCE ');
                    END IF;
                    SET UNIDADES = 0;
                ELSE
                    SET EN_LETRAS = CONCAT(EN_LETRAS, 'DIECI');
                    SET UNIR = '';
                END IF;
            ELSEIF (DECENAS = 2) THEN
                IF (UNIDADES = 0) THEN
                    SET EN_LETRAS = CONCAT(EN_LETRAS, 'VEINTE ');
                ELSE
                    SET EN_LETRAS = CONCAT(EN_LETRAS, 'VEINTI');
                END IF;
                SET UNIR = '';
            ELSEIF (DECENAS = 0) THEN
                SET UNIR = '';
            END IF;
						
            IF (UNIDADES = 1) THEN
                SET EN_LETRAS = CONCAT(EN_LETRAS, UNIR, 'UNO ');
            ELSEIF UNIDADES = 2 THEN
                SET EN_LETRAS = CONCAT(EN_LETRAS, UNIR, 'DOS ');
            ELSEIF UNIDADES = 3 THEN
                SET EN_LETRAS = CONCAT(EN_LETRAS, UNIR, 'TRES ');
            ELSEIF UNIDADES = 4 THEN
                SET EN_LETRAS = CONCAT(EN_LETRAS, UNIR, 'CUATRO ');
            ELSEIF UNIDADES = 5 THEN
                SET EN_LETRAS = CONCAT(EN_LETRAS, UNIR, 'CINCO ');
            ELSEIF UNIDADES = 6 THEN
                SET EN_LETRAS = CONCAT(EN_LETRAS, UNIR, 'SEIS ');
            ELSEIF UNIDADES = 7 THEN
                SET EN_LETRAS = CONCAT(EN_LETRAS, UNIR, 'SIETE ');
            ELSEIF UNIDADES = 8 THEN
                SET EN_LETRAS = CONCAT(EN_LETRAS, UNIR, 'OCHO ');
            ELSEIF UNIDADES = 9 THEN
                SET EN_LETRAS = CONCAT(EN_LETRAS , UNIR , 'NUEVE ');
            END IF;
        END IF;
        SET pResul = EN_LETRAS;
    END $$
DELIMITER ;


DROP TABLE IF EXISTS `fza_articulos`;
CREATE TABLE `fza_articulos` (
  `CODIGO_ARTICULO` varchar(20) NOT NULL,
  `ACTIVO_ARTICULO` varchar(1) DEFAULT 'S',
  `ORDEN_ARTICULO` int(11) DEFAULT NULL,
  `DESCRIPCION_ARTICULO` varchar(100) DEFAULT NULL,
  `CODIGO_FAMILIA_ARTICULO` varchar(6) DEFAULT NULL,
  `TIPOIVA_ARTICULO` varchar(2) DEFAULT NULL,
  `ESACTIVO_FIJO_ARTICULO` varchar(1) DEFAULT 'N',
  `TIPO_CANTIDAD_ARTICULO` varchar(20) DEFAULT 'Uds',
  `CODIGO_VARIACION_ARTICULO` varchar(20) DEFAULT '000',
  `INSTANTEMODIF` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `INSTANTEALTA` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `USUARIOALTA` varchar(100) NOT NULL,
  `USUARIOMODIF` varchar(100) NOT NULL,
  PRIMARY KEY (`CODIGO_ARTICULO`) USING BTREE,
  KEY `CODIGO` (`CODIGO_ARTICULO`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci ROW_FORMAT=DYNAMIC;

INSERT INTO `fza_articulos`(`CODIGO_ARTICULO`, `ACTIVO_ARTICULO`, `ORDEN_ARTICULO`, `DESCRIPCION_ARTICULO`, `CODIGO_FAMILIA_ARTICULO`, `TIPOIVA_ARTICULO`, `ESACTIVO_FIJO_ARTICULO`, `TIPO_CANTIDAD_ARTICULO`, `CODIGO_VARIACION_ARTICULO`, `INSTANTEMODIF`, `INSTANTEALTA`, `USUARIOALTA`, `USUARIOMODIF`) VALUES
 ('003','S',1,'TORO DE LIDIA','ANI','N','N','Uds.','001','2023-11-11 15:25:17','2023-05-25 12:59:10','Administrador','Administrador'),
 ('004','S',3,'TRACTOR','MAQ','N','S','Uds.','000','2023-11-11 15:26:57','2023-11-04 10:52:35','Administrador','Administrador'),
 ('008','S',7,'PATOS','OTR','N','N','Uds.','000','2023-11-11 15:25:42','2023-11-04 11:49:02','Administrador','Administrador'),
 ('009','S',8,'FRESAS DE TEMPORADA','OTR','N','N','Uds.','000','2023-11-04 11:52:19','2023-11-04 11:52:19','Administrador','Administrador'),
 ('012','S',11,'REMOLACHA','OTR','N','N','Uds.','000','2023-11-04 12:23:13','2023-11-04 12:23:13','Administrador','Administrador'),
 ('013','S',12,'GALLINAS','ANI','N','N','Uds.','000','2023-11-04 12:29:22','2023-11-04 12:29:22','Administrador','Administrador'),
 ('014','S',13,'PETUNIAS COLORADAS','OTR','N','N','Uds.','000','2023-11-04 12:34:08','2023-11-04 12:34:08','Administrador','Administrador'),
 ('015','S',14,'MANO DE OBRA','OTR','N','N','Uds.','000','2023-11-16 22:17:31','2023-11-16 22:17:31','Administrador','Administrador'),
 ('016','S',15,'TRABAJOS AGRÍCOLAS','OTR','N','N','Uds.','000','2023-12-06 13:23:53','2023-12-06 13:23:53','Administrador','Administrador'),
 ('ALFALFA','S',1,'ALFALFA','CER','N','N','Kgs',NULL,'2023-11-11 15:25:46','2022-11-02 16:09:51','Administrador','Administrador'),
 ('CALABAZAS','S',4,'CALABAZA','HUE','N','N','Kgs',NULL,'2023-11-11 15:25:50','2022-11-02 16:10:47','Administrador','Administrador'),
 ('CEBADA','S',3,'CEBADA','CER','N','N','Uds',NULL,'2023-10-18 12:29:17','2023-03-16 16:20:24','Administrador','Administrador'),
 ('PATATAS','S',6,'PATATA','HUE','N','N','Kgs',NULL,'2023-11-11 15:25:52','2022-11-02 16:10:18','Administrador','Administrador'),
 ('TRIGO','S',2,'TRIGO','CER','N','N','Kgs',NULL,'2023-11-11 15:25:55','2022-11-02 16:07:57','Administrador','Administrador');

DROP TABLE IF EXISTS `fza_articulos_familias`;
CREATE TABLE `fza_articulos_familias` (
  `CODIGO_FAMILIA` varchar(10) NOT NULL,
  `ACTIVO_FAMILIA` varchar(1) DEFAULT 'S',
  `ORDEN_FAMILIA` int(11) DEFAULT NULL,
  `ESDEFAULT_FAMILIA` varchar(1) DEFAULT NULL,
  `CODIGO_SUBFAMILIA` varchar(10) DEFAULT NULL,
  `NOMBRE_FAMILIA` varchar(150) DEFAULT NULL,
  `DESCRIPCION_FAMILIA` varchar(150) DEFAULT NULL,
  `INSTANTEMODIF` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `INSTANTEALTA` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `USUARIOALTA` varchar(100) NOT NULL,
  `USUARIOMODIF` varchar(100) NOT NULL,
  PRIMARY KEY (`CODIGO_FAMILIA`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci ROW_FORMAT=DYNAMIC;

INSERT INTO `fza_articulos_familias`(`CODIGO_FAMILIA`, `ACTIVO_FAMILIA`, `ORDEN_FAMILIA`, `ESDEFAULT_FAMILIA`, `CODIGO_SUBFAMILIA`, `NOMBRE_FAMILIA`, `DESCRIPCION_FAMILIA`, `INSTANTEMODIF`, `INSTANTEALTA`, `USUARIOALTA`, `USUARIOMODIF`) VALUES
 ('ANI','S',5,NULL,NULL,'ANIMALES','Animales de granja como gallinas, conejos, cerdos','2022-11-02 16:06:06','2022-11-02 16:05:59','Administrador','Administrador'),
 ('APE','S',3,NULL,NULL,'APEROS','Aperos de labranza como empacadora, arados, susoladora','2022-11-02 16:05:05','2022-11-02 16:04:57','Adminstrador','Administrador'),
 ('CER','S',1,NULL,NULL,'CEREALES','Cereales como trigo, cebada, avena....','2022-11-02 16:02:56','2022-11-02 16:02:48','Administrador','Administrador'),
 ('FRU','S',1,'N','HUE','ARBOLES FRUTALES',NULL,'2023-07-07 13:46:30','2023-07-07 13:46:30','Administrador','Administrador'),
 ('HUE','S',2,NULL,NULL,'HUERTA','Productos de la huerta como tomates, lechugas, espinacas....','2022-11-02 16:03:46','2022-11-02 16:03:39','Administrador','Administrador'),
 ('MAQ','S',4,NULL,NULL,'MAQUINARIA','Maquinaria pesada para el cultivo como tractor, remolque','2022-11-02 16:05:40','2022-11-02 16:05:34','Administrador','Administrador'),
 ('OTR','S',6,'S',NULL,'OTROS','Otros articulos agrícolas','2023-05-25 12:28:16','2022-11-02 16:06:31','Administrador','Administrador');

DROP TABLE IF EXISTS `fza_articulos_movimientos`;
CREATE TABLE `fza_articulos_movimientos` (
  `CODIGO_UNICO_UNIDAD_VARIACION` varchar(20) NOT NULL,
  `CODIGO_ALMACEN_DESTINO` varchar(20) NOT NULL,
  `ORIGEN_MOVIMIENTO` varchar(20) NOT NULL,
  `CANTIDAD` varchar(100) DEFAULT NULL,
  `INSTANTEMODIF` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `INSTANTEALTA` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `USUARIOALTA` varchar(100) NOT NULL,
  `USUARIOMODIF` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci ROW_FORMAT=DYNAMIC;

DROP TABLE IF EXISTS `fza_articulos_proveedores`;
CREATE TABLE `fza_articulos_proveedores` (
  `CODIGO_PROVEEDOR_ARTICULO_PROVEEDOR` varchar(20) NOT NULL,
  `CODIGO_ARTICULO_ARTICULO_PROVEEDOR` varchar(20) NOT NULL,
  `PRECIO_ULT_COMPRA_ARTICULO_PROVEEDOR` decimal(19,6) DEFAULT NULL,
  `FECHA_VALIDEZ_ARTICULO_PROVEEDOR` datetime DEFAULT NULL,
  `ESPROVEEDORPRINCIPAL_ARTICULO_PROVEEDOR` varchar(1) DEFAULT NULL,
  `INSTANTEMODIF` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `INSTANTEALTA` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `USUARIOALTA` varchar(100) NOT NULL,
  `USUARIOMODIF` varchar(100) NOT NULL,
  PRIMARY KEY (`CODIGO_PROVEEDOR_ARTICULO_PROVEEDOR`,`CODIGO_ARTICULO_ARTICULO_PROVEEDOR`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci ROW_FORMAT=DYNAMIC;

INSERT INTO `fza_articulos_proveedores`(`CODIGO_PROVEEDOR_ARTICULO_PROVEEDOR`, `CODIGO_ARTICULO_ARTICULO_PROVEEDOR`, `PRECIO_ULT_COMPRA_ARTICULO_PROVEEDOR`, `FECHA_VALIDEZ_ARTICULO_PROVEEDOR`, `ESPROVEEDORPRINCIPAL_ARTICULO_PROVEEDOR`, `INSTANTEMODIF`, `INSTANTEALTA`, `USUARIOALTA`, `USUARIOMODIF`) VALUES
 ('10','CEBADA',0.080000,'2023-03-16 00:00:00','S','2023-11-04 17:27:48','2023-03-16 15:34:56','Administrador','Administrador'),
 ('11','ALFALFA',0.250000,'2023-05-03 00:00:00','S','2023-05-24 12:53:58','2023-03-04 13:40:00','Administrador','Administrador'),
 ('13','003',320.000000,'2023-05-03 00:00:00','S','2023-05-25 13:07:43','2023-05-25 13:07:43','Administrador','Administrador'),
 ('17','ALFALFA',0.170000,'2023-05-25 00:00:00','N','2023-03-03 14:30:45','2023-03-03 14:30:45','Administrador','Administrador'),
 ('20','ALFALFA',0.100000,'2023-03-02 00:00:00','N','2023-03-04 18:14:28','2023-03-03 14:02:47','Administrador','Administrador'),
 ('3','003',20.000000,'2023-05-31 00:00:00','N','2023-05-31 13:34:53','2023-05-31 13:34:53','Administrador','Administrador'),
 ('7','013',5.000000,'2023-10-20 00:00:00','S','2023-11-04 14:56:50','2023-11-04 14:56:50','Administrador','Administrador');

DROP TABLE IF EXISTS `fza_articulos_tarifas`;
CREATE TABLE `fza_articulos_tarifas` (
  `CODIGO_ARTICULO_TARIFA` varchar(20) NOT NULL,
  `CODIGO_UNICO_TARIFA` int(11) NOT NULL AUTO_INCREMENT,
  `CODIGO_TARIFA` varchar(10) DEFAULT NULL,
  `ACTIVO_TARIFA` varchar(1) DEFAULT 'S',
  `PRECIOSALIDA_TARIFA` decimal(18,6) DEFAULT NULL,
  `PRECIOFINAL_TARIFA` decimal(18,6) DEFAULT 0.000000,
  `PRECIO_DTO_TARIFA` decimal(18,6) DEFAULT NULL,
  `PORCEN_DTO_TARIFA` decimal(18,6) DEFAULT NULL,
  `FECHA_DESDE_TARIFA` date DEFAULT NULL,
  `FECHA_HASTA_TARIFA` date DEFAULT NULL,
  `INSTANTEMODIF` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `INSTANTEALTA` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `USUARIOALTA` varchar(100) NOT NULL,
  `USUARIOMODIF` varchar(100) NOT NULL,
  PRIMARY KEY (`CODIGO_UNICO_TARIFA`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci ROW_FORMAT=DYNAMIC;

INSERT INTO `fza_articulos_tarifas`(`CODIGO_ARTICULO_TARIFA`, `CODIGO_UNICO_TARIFA`, `CODIGO_TARIFA`, `ACTIVO_TARIFA`, `PRECIOSALIDA_TARIFA`, `PRECIOFINAL_TARIFA`, `PRECIO_DTO_TARIFA`, `PORCEN_DTO_TARIFA`, `FECHA_DESDE_TARIFA`, `FECHA_HASTA_TARIFA`, `INSTANTEMODIF`, `INSTANTEALTA`, `USUARIOALTA`, `USUARIOMODIF`) VALUES
 ('ALFALFA',1,'0','S',137.900000,103.425000,34.475000,25.000000,'2023-03-04','2023-03-16','2023-03-04 18:06:12','2023-03-04 18:06:09','Administrador','Administrador'),
 ('003',4,'0','S',20.000000,0.000000,2.330000,10.000000,'2023-05-31',NULL,'2023-05-31 13:24:49','2023-05-31 13:24:49','Administrador','Administrador'),
 ('ALFALFA',6,'1','S',120.000000,108.000000,12.000000,10.000000,'2023-06-01',NULL,'2023-06-01 12:28:54','2023-06-01 12:28:54','Administrador','Administrador'),
 ('013',16,'0','S',15.000000,15.000000,NULL,NULL,'2023-11-04',NULL,'2023-11-04 12:29:50','2023-11-04 12:29:50','Administrador','Administrador'),
 ('008',17,'0','S',0.000000,0.000000,NULL,NULL,'2023-11-04',NULL,'2023-11-04 12:30:31','2023-11-04 12:30:31','Administrador','Administrador'),
 ('014',18,'0','S',22.000000,22.000000,NULL,NULL,'2023-11-04',NULL,'2023-11-04 12:34:15','2023-11-04 12:34:15','Administrador','Administrador'),
 ('016',19,'1','S',45.000000,45.000000,NULL,NULL,'2023-12-06',NULL,'2023-12-06 13:24:03','2023-12-06 13:24:03','Administrador','Administrador');

DROP TABLE IF EXISTS `fza_articulos_variaciones_def`;
CREATE TABLE `fza_articulos_variaciones_def` (
  `CODIGO_VAR_DEF` varchar(20) NOT NULL,
  `CODIGO_ARTICULO_VAR_DEF` varchar(20) NOT NULL,
  `CODIGO_COLUMNA_VAR_DEF` varchar(20) NOT NULL,
  `CODIGO_UNIDAD_VAR_DEF` varchar(1000) NOT NULL,
  `VALOR_VARIACION_VAR_DEF` varchar(100) NOT NULL,
  `INSTANTEMODIF` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `INSTANTEALTA` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `USUARIOALTA` varchar(100) NOT NULL,
  `USUARIOMODIF` varchar(100) NOT NULL,
  PRIMARY KEY (`CODIGO_VAR_DEF`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci ROW_FORMAT=DYNAMIC;

INSERT INTO `fza_articulos_variaciones_def`(`CODIGO_VAR_DEF`, `CODIGO_ARTICULO_VAR_DEF`, `CODIGO_COLUMNA_VAR_DEF`, `CODIGO_UNIDAD_VAR_DEF`, `VALOR_VARIACION_VAR_DEF`, `INSTANTEMODIF`, `INSTANTEALTA`, `USUARIOALTA`, `USUARIOMODIF`) VALUES
 ('00000000000000000001','003','TALLA','003BLANCO45','45','2023-10-02 11:39:39','2023-09-11 20:56:31','Administrador','Administrador'),
 ('00000000000000000002','003','COLOR','003BLANCO45','BLANCO','2023-10-02 11:39:39','2023-09-11 20:57:11','Administrador','Administrador'),
 ('00000000000000000003','003','COLORPROV','003BLANCO45','BL6598','2023-10-02 11:39:41','2023-09-11 20:58:13','Administrador','Administrador');

DROP TABLE IF EXISTS `fza_clientes`;
CREATE TABLE `fza_clientes` (
  `CODIGO_CLIENTE` varchar(10) NOT NULL,
  `ACTIVO_CLIENTE` varchar(1) DEFAULT 'S',
  `ORDEN_CLIENTE` int(11) DEFAULT NULL,
  `RAZONSOCIAL_CLIENTE` varchar(200) NOT NULL,
  `NIF_CLIENTE` varchar(50) DEFAULT NULL,
  `MOVIL_CLIENTE` varchar(40) DEFAULT NULL,
  `EMAIL_CLIENTE` varchar(200) DEFAULT NULL,
  `DIRECCION1_CLIENTE` varchar(200) DEFAULT NULL,
  `DIRECCION2_CLIENTE` varchar(200) DEFAULT NULL,
  `POBLACION_CLIENTE` varchar(200) DEFAULT NULL,
  `PROVINCIA_CLIENTE` varchar(200) DEFAULT NULL,
  `CPOSTAL_CLIENTE` varchar(15) DEFAULT NULL,
  `PAIS_CLIENTE` varchar(150) DEFAULT NULL,
  `OBSERVACIONES_CLIENTE` text DEFAULT NULL,
  `REFERENCIA_CLIENTE` varchar(100) DEFAULT NULL,
  `CONTACTO_CLIENTE` varchar(100) DEFAULT NULL,
  `TELEFONO_CONTACTO_CLIENTE` varchar(100) DEFAULT NULL,
  `TELEFONO_CLIENTE` varchar(40) DEFAULT NULL,
  `IBAN_CLIENTE` varchar(100) DEFAULT NULL,
  `ESIVA_RECARGO_CLIENTE` varchar(1) DEFAULT 'N',
  `ESRETENCIONES_CLIENTE` varchar(1) DEFAULT 'S',
  `ESIVA_EXENTO_CLIENTE` varchar(1) DEFAULT 'N',
  `ESINTRACOMUNITARIO_CLIENTE` varchar(1) DEFAULT 'N',
  `ESREGIMENESPECIALAGRICOLA_CLIENTE` varchar(1) DEFAULT 'N',
  `CODIGO_FORMA_PAGO_CLIENTE` varchar(10) DEFAULT NULL,
  `TARIFA_ARTICULO_CLIENTE` varchar(10) DEFAULT NULL,
  `SERIE_CONTADOR_CLIENTE` varchar(8) DEFAULT NULL,
  `TEXTO_LEGAL_FACTURA_CLIENTE` varchar(1000) DEFAULT NULL,
  `INSTANTEMODIF` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `INSTANTEALTA` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `USUARIOALTA` varchar(100) NOT NULL,
  `USUARIOMODIF` varchar(100) NOT NULL,
  PRIMARY KEY (`CODIGO_CLIENTE`) USING BTREE,
  KEY `IDX_CLIENTES_EMAIL` (`EMAIL_CLIENTE`) USING BTREE,
  KEY `IDX_RAZONSOCIAL_CLIENTE` (`RAZONSOCIAL_CLIENTE`) USING BTREE,
  KEY `IDX_NIF_CLIENTE` (`EMAIL_CLIENTE`) USING BTREE,
  KEY `IDX_POBLACION_CLIENTE` (`NIF_CLIENTE`) USING BTREE,
  KEY `IDX_REFERENCIA_CLIENTE` (`REFERENCIA_CLIENTE`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci ROW_FORMAT=DYNAMIC;

INSERT INTO `fza_clientes`(`CODIGO_CLIENTE`, `ACTIVO_CLIENTE`, `ORDEN_CLIENTE`, `RAZONSOCIAL_CLIENTE`, `NIF_CLIENTE`, `MOVIL_CLIENTE`, `EMAIL_CLIENTE`, `DIRECCION1_CLIENTE`, `DIRECCION2_CLIENTE`, `POBLACION_CLIENTE`, `PROVINCIA_CLIENTE`, `CPOSTAL_CLIENTE`, `PAIS_CLIENTE`, `OBSERVACIONES_CLIENTE`, `REFERENCIA_CLIENTE`, `CONTACTO_CLIENTE`, `TELEFONO_CONTACTO_CLIENTE`, `TELEFONO_CLIENTE`, `IBAN_CLIENTE`, `ESIVA_RECARGO_CLIENTE`, `ESRETENCIONES_CLIENTE`, `ESIVA_EXENTO_CLIENTE`, `ESINTRACOMUNITARIO_CLIENTE`, `ESREGIMENESPECIALAGRICOLA_CLIENTE`, `CODIGO_FORMA_PAGO_CLIENTE`, `TARIFA_ARTICULO_CLIENTE`, `SERIE_CONTADOR_CLIENTE`, `TEXTO_LEGAL_FACTURA_CLIENTE`, `INSTANTEMODIF`, `INSTANTEALTA`, `USUARIOALTA`, `USUARIOMODIF`) VALUES
 ('293','S',5,'PEDRO COJOS','46589963j',NULL,'pedro.cojos@gmail.com','CALLE CAIDOS ',NULL,'VILLAVEZA DEL AGUA','ZAMORA','49760',NULL,NULL,NULL,NULL,NULL,NULL,'ES3201822305650206595350','N','N','N','N','S','60DIAS','1',NULL,NULL,'2023-12-19 19:28:21','2023-05-22 13:01:22','Administrador','Administrador'),
 ('294','S',4,'AGUSTIN SEGURADO','11632589R','623356689','agustin.segurado@gmail.com','CALLE EL RIEGO, 33','','ZAMORA','ZAMORA','49019','',NULL,NULL,NULL,NULL,NULL,NULL,'S','S','N','N','N',NULL,'1',NULL,NULL,'2023-11-11 15:27:57','2023-10-31 12:15:11','Administrador','Administrador'),
 ('295','S',6,'AZUCENA MARTIN (KIOSKO PERLA)','11356325E','658963321','cliente.nuevo@gmail.om','CALLE POZO AMARILLO, 3','','SALAMANCA','SALAMANCA','37003','',NULL,NULL,NULL,NULL,NULL,'ES50018256323656987201452','S','S','N','N','N',NULL,'1',NULL,NULL,'2023-12-09 18:24:01','2023-12-06 13:07:42','Administrador','Administrador'),
 ('PUBLICO','S',2,'PUBLICO','NIF CLIENTE','TFNO CLIENTE','EMAIL DEL CLIENTE','DIRECCION DEL CLIENTE','','POBLACION AGRICULTOR','PROVINCIA CLIENTE','POSCLI','PAIS DEL CLIENTE',NULL,NULL,NULL,NULL,NULL,'ES2101822356985665446552','N','N','S','N','N','CONTADO','0',NULL,NULL,'2023-12-18 13:49:35','2022-11-02 20:28:28','Administrador','Administrador'),
 ('TIENDA','S',1,'TIENDA DE ROSA','NIF','658963325','EMAIL','CALLE MAYOR, 2','','MORALES DEL VINO','ZAMORA','49190','España','',NULL,NULL,NULL,NULL,NULL,'S','S','N','N','N','CONTADO','1','ATIE','','2023-10-31 19:40:39','2022-11-02 16:13:41','Administrador','Administrador');

DROP TABLE IF EXISTS `fza_contadores`;
CREATE TABLE `fza_contadores` (
  `TIPODOC_CONTADOR` varchar(2) NOT NULL,
  `SERIE_CONTADOR` varchar(12) NOT NULL,
  `EMPRESA_CONTADOR` varchar(10) NOT NULL,
  `CONTADOR_CONTADOR` bigint(20) NOT NULL,
  `DEFAULT_CONTADOR` varchar(1) DEFAULT 'N',
  `NUMDIGIT_CONTADOR` int(11) NOT NULL DEFAULT 0,
  `ACTIVO_CONTADOR` varchar(1) NOT NULL DEFAULT 'S',
  `INSTANTEMODIF` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `INSTANTEALTA` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `USUARIOALTA` varchar(100) NOT NULL,
  `USUARIOMODIF` varchar(100) NOT NULL,
  PRIMARY KEY (`TIPODOC_CONTADOR`,`SERIE_CONTADOR`,`EMPRESA_CONTADOR`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci ROW_FORMAT=DYNAMIC;

INSERT INTO `fza_contadores`(`TIPODOC_CONTADOR`, `SERIE_CONTADOR`, `EMPRESA_CONTADOR`, `CONTADOR_CONTADOR`, `DEFAULT_CONTADOR`, `NUMDIGIT_CONTADOR`, `ACTIVO_CONTADOR`, `INSTANTEMODIF`, `INSTANTEALTA`, `USUARIOALTA`, `USUARIOMODIF`) VALUES
 ('AO','-','-',16,'S',3,'S','2023-12-06 13:23:53','2023-05-25 12:59:19','Administrador','Administrador'),
 ('AR','-','-',17,'S',3,'S','2023-12-06 13:23:53','2023-05-25 12:51:52','Administrador','Administrador'),
 ('CL','-','-',297,'S',3,'S','2023-12-06 13:26:05','0000-00-00 00:00:00','Administrador','Administrador'),
 ('CO','-','-',6,'S',3,'S','2023-06-30 12:49:26','2023-05-15 12:54:31','Administrador','Administrador'),
 ('EM','-','-',12,'S',3,'S','2023-12-06 12:59:23','0000-00-00 00:00:00','Administrador','Administrador'),
 ('EO','-','-',6,'S',3,'S','2023-12-06 12:59:23','2023-05-19 15:02:02','Administrador','Administrador'),
 ('ES','-','-',9,'S',3,'S','2023-12-06 14:08:33','2023-05-13 12:25:25','Administrador','Administrador'),
 ('FA','-','-',3,'S',3,'S','2023-07-07 13:54:00','2023-06-02 13:04:22','Administrador','Administrador'),
 ('FC','A1','1',25,'N',8,'S','2023-11-17 15:04:53','2022-09-13 15:47:45','Administrador','Administrador'),
 ('FC','A1.2023','011',3,'N',6,'S','2023-12-09 11:21:23','2023-12-06 13:07:54','Administrador','Administrador'),
 ('FC','A3','1',0,'N',8,'S','2023-10-21 12:22:05','2023-05-12 12:24:25','Administrador','Administrador'),
 ('FC','AGRO','1',8,'N',6,'S','2023-10-26 15:57:56','2023-06-01 13:45:24','Administrador','Administrador'),
 ('FC','AGRO/2023','1',2,'N',6,'S','2023-12-06 13:26:05','2023-12-06 13:26:05','Administrador','Administrador'),
 ('FC','ANA/2023','008',5,'N',6,'S','2023-12-14 17:42:14','2023-10-31 18:12:26','Administrador','Administrador'),
 ('FC','ATIE','1',2,'N',6,'S','2023-10-21 12:22:08','2023-05-17 14:12:45','Administrador','Administrador'),
 ('FO','-','-',2,'S',3,'S','2023-07-07 13:54:00','2023-07-07 13:54:00','Administrador','Administrador'),
 ('GO','-','-',5,'S',3,'S','2023-12-08 22:33:27','2023-11-08 21:12:56','Administrador','Administrador'),
 ('GP','-','-',12,'S',3,'S','2023-10-28 13:39:47','2023-04-27 12:30:24','Administrador','Administrador'),
 ('IG','-','-',4,'S',3,'S','2023-11-17 12:36:00','2023-01-19 10:41:29','Administrador','Administrador'),
 ('IV','-','-',18,'S',3,'S','2023-11-17 12:36:55','2021-06-10 20:11:25','Administrador','Administrador'),
 ('PG','-','-',3,'S',3,'S','2023-12-06 18:58:55','2023-11-08 21:12:56','Administrador','Administrador'),
 ('PV','-','-',25,'S',3,'S','2023-06-30 12:49:26','2021-06-10 18:47:22','Administrador','Administrador'),
 ('RT','-','-',5,'S',3,'S','2023-12-06 12:59:57','2023-10-26 16:34:31','Administrador','Administrador');

DROP TABLE IF EXISTS `fza_empresas`;
CREATE TABLE `fza_empresas` (
  `CODIGO_EMPRESA` varchar(10) NOT NULL,
  `ORDEN_EMPRESA` int(11) DEFAULT NULL,
  `ACTIVO_EMPRESA` varchar(1) DEFAULT 'S',
  `RAZONSOCIAL_EMPRESA` varchar(200) DEFAULT NULL,
  `NIF_EMPRESA` varchar(50) DEFAULT NULL,
  `MOVIL_EMPRESA` varchar(40) DEFAULT NULL,
  `EMAIL_EMPRESA` varchar(200) DEFAULT NULL,
  `DIRECCION1_EMPRESA` varchar(200) DEFAULT NULL,
  `DIRECCION2_EMPRESA` varchar(200) DEFAULT NULL,
  `CPOSTAL_EMPRESA` varchar(15) DEFAULT NULL,
  `POBLACION_EMPRESA` varchar(200) DEFAULT NULL,
  `PROVINCIA_EMPRESA` varchar(200) DEFAULT NULL,
  `PAIS_EMPRESA` varchar(150) DEFAULT NULL,
  `IBAN_EMPRESA` varchar(100) DEFAULT NULL,
  `GRUPO_ZONA_IVA_EMPRESA` varchar(10) DEFAULT NULL,
  `ESRETENCIONES_EMPRESA` varchar(1) DEFAULT 'S',
  `ESREGIMENESPECIALAGRICOLA_EMPRESA` varchar(1) DEFAULT 'N',
  `SERIE_CONTADOR_EMPRESA` varchar(8) DEFAULT NULL,
  `TEXTO_LEGAL_FACTURA_EMPRESA` varchar(1000) DEFAULT NULL,
  `INSTANTEMODIF` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `INSTANTEALTA` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `USUARIOALTA` varchar(100) NOT NULL,
  `USUARIOMODIF` varchar(100) NOT NULL,
  PRIMARY KEY (`CODIGO_EMPRESA`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci ROW_FORMAT=DYNAMIC;

INSERT INTO `fza_empresas`(`CODIGO_EMPRESA`, `ORDEN_EMPRESA`, `ACTIVO_EMPRESA`, `RAZONSOCIAL_EMPRESA`, `NIF_EMPRESA`, `MOVIL_EMPRESA`, `EMAIL_EMPRESA`, `DIRECCION1_EMPRESA`, `DIRECCION2_EMPRESA`, `CPOSTAL_EMPRESA`, `POBLACION_EMPRESA`, `PROVINCIA_EMPRESA`, `PAIS_EMPRESA`, `IBAN_EMPRESA`, `GRUPO_ZONA_IVA_EMPRESA`, `ESRETENCIONES_EMPRESA`, `ESREGIMENESPECIALAGRICOLA_EMPRESA`, `SERIE_CONTADOR_EMPRESA`, `TEXTO_LEGAL_FACTURA_EMPRESA`, `INSTANTEMODIF`, `INSTANTEALTA`, `USUARIOALTA`, `USUARIOMODIF`) VALUES
 ('007',3,'S','PABLO VALPARON','11526321J','658965235',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','S','N',NULL,NULL,'2023-11-11 15:28:35','2023-01-30 10:34:23','Administrador','Administrador'),
 ('008',1,'S','ANA MARTIN','45684135Q','66533256','ana@hotmail.com','CALLE SANTA CLARA, 2','','49190','MORALES DEL VINO','ZAMORA','ESPAÑA',NULL,'1','S','N',NULL,NULL,'2023-10-31 12:13:47','2023-05-19 15:02:02','Administrador','Administrador'),
 ('009',2,'S','PEPITO GRILLO',NULL,'66999669',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','S','N',NULL,NULL,'2023-05-20 12:39:14','2023-05-20 12:39:14','Administrador','Administrador'),
 ('011',5,'S','ALBERTO GONZÁLEZ','4587545EQ','65869556','miemail@gmail.com','CALLE POZO BLANCO, 2',NULL,'49750','SANTOVENIA','ZAMORA',NULL,'ES5001820245365632','1','S','N',NULL,NULL,'2023-12-09 18:10:43','2023-12-06 12:59:22','Administrador','Administrador'),
 ('1',1,'S','AGRICULTOR','NIF DEL AGRICULTOR','TFNO DEL AGRICULTOR','EMAIL DEL AGRICULTOR','DIRECCION DEL AGRICULTOR','','POSAGRI','POBLACION DEL AGRICULTOR','PROVINCIA DEL AGRICULTOR','PAIS DEL AGRICULTOR','ES5001825695365423253','2','S','S',NULL,'Empresario emisor acogido al régimen especial de agricultura ganadería y pesca','2023-12-09 18:37:41','2021-05-14 20:07:06','Administrador','Administrador');

DROP TABLE IF EXISTS `fza_empresas_retenciones`;
CREATE TABLE `fza_empresas_retenciones` (
  `CODIGO_RETENCION` varchar(8) NOT NULL,
  `CODIGO_EMPRESA_RETENCION` varchar(8) NOT NULL,
  `PORCENRETENCION_RETENCION` decimal(18,6) DEFAULT NULL,
  `FECHA_DESDE_RETENCION` date DEFAULT NULL,
  `FECHA_HASTA_RETENCION` date DEFAULT NULL,
  `INSTANTEMODIF` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `INSTANTEALTA` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `USUARIOALTA` varchar(100) NOT NULL,
  `USUARIOMODIF` varchar(100) NOT NULL,
  PRIMARY KEY (`CODIGO_RETENCION`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci ROW_FORMAT=DYNAMIC;

INSERT INTO `fza_empresas_retenciones`(`CODIGO_RETENCION`, `CODIGO_EMPRESA_RETENCION`, `PORCENRETENCION_RETENCION`, `FECHA_DESDE_RETENCION`, `FECHA_HASTA_RETENCION`, `INSTANTEMODIF`, `INSTANTEALTA`, `USUARIOALTA`, `USUARIOMODIF`) VALUES
 ('003','011',2.500000,'2023-12-06','2024-12-06','2023-12-06 12:59:43','2023-12-06 12:59:43','Administrador','Administrador'),
 ('004','011',15.000000,'2024-12-07',NULL,'2023-12-06 12:59:57','2023-12-06 12:59:57','Administrador','Administrador'),
 ('10','1',1.000000,'1999-12-31','2023-10-01','2023-10-31 18:20:15','2023-01-29 10:31:19','Administrador','Administrador'),
 ('11','007',18.000000,'2022-12-01',NULL,'2023-02-01 09:53:16','2023-02-01 09:53:16','Administrador','Administrador'),
 ('2','1',2.500000,'2023-10-01',NULL,'2022-10-17 16:19:29','2021-05-14 19:57:40','Administrador','Administrador');

DROP TABLE IF EXISTS `fza_empresas_series`;
CREATE TABLE `fza_empresas_series` (
  `CODIGO_SERIE` varchar(8) NOT NULL,
  `CODIGO_EMPRESA_SERIE` varchar(8) NOT NULL,
  `SERIE_SERIE` varchar(12) NOT NULL,
  `FECHA_DESDE_SERIE` date DEFAULT NULL,
  `FECHA_HASTA_SERIE` date DEFAULT NULL,
  `INSTANTEMODIF` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `INSTANTEALTA` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `USUARIOALTA` varchar(100) NOT NULL,
  `USUARIOMODIF` varchar(100) NOT NULL,
  PRIMARY KEY (`CODIGO_SERIE`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci ROW_FORMAT=DYNAMIC;

INSERT INTO `fza_empresas_series`(`CODIGO_SERIE`, `CODIGO_EMPRESA_SERIE`, `SERIE_SERIE`, `FECHA_DESDE_SERIE`, `FECHA_HASTA_SERIE`, `INSTANTEMODIF`, `INSTANTEALTA`, `USUARIOALTA`, `USUARIOMODIF`) VALUES
 ('003','007','A7/2023','2023-05-01','2023-05-31','2023-05-15 12:36:23','2023-05-13 12:44:21','Administrador','Administrador'),
 ('004','1','AGRO/2023','2023-01-01',NULL,'2023-06-01 13:44:51','2023-06-01 13:44:51','Administrador','Administrador'),
 ('005','011','A1.2023','2023-12-06','2023-12-31','2023-12-06 13:00:47','2023-12-06 13:00:47','Administrador','Administrador'),
 ('006','011','A1/1T/2024','2024-01-01','2024-03-31','2023-12-06 13:01:26','2023-12-06 13:01:26','Administrador','Administrador'),
 ('007','011','A1/2T/2024','2024-04-01','2024-06-30','2023-12-06 13:56:28','2023-12-06 13:56:28','Administrador','Administrador'),
 ('008','011','A1/3T/2024','2024-07-01','2024-09-30','2023-12-06 14:08:33','2023-12-06 14:08:33','Administrador','Administrador');

DROP TABLE IF EXISTS `fza_facturas`;
CREATE TABLE `fza_facturas` (
  `NRO_FACTURA` varchar(12) NOT NULL,
  `SERIE_FACTURA` varchar(12) NOT NULL,
  `FECHA_FACTURA` date DEFAULT NULL,
  `CODIGO_EMPRESA_FACTURA` varchar(8) DEFAULT NULL,
  `RAZONSOCIAL_EMPRESA_FACTURA` varchar(200) DEFAULT NULL,
  `NIF_EMPRESA_FACTURA` varchar(50) DEFAULT NULL,
  `MOVIL_EMPRESA_FACTURA` varchar(40) DEFAULT NULL,
  `EMAIL_EMPRESA_FACTURA` varchar(200) DEFAULT NULL,
  `DIRECCION1_EMPRESA_FACTURA` varchar(200) DEFAULT NULL,
  `DIRECCION2_EMPRESA_FACTURA` varchar(200) DEFAULT NULL,
  `POBLACION_EMPRESA_FACTURA` varchar(200) DEFAULT NULL,
  `PROVINCIA_EMPRESA_FACTURA` varchar(200) DEFAULT NULL,
  `PAIS_EMPRESA_FACTURA` varchar(150) DEFAULT NULL,
  `CPOSTAL_EMPRESA_FACTURA` varchar(15) DEFAULT NULL,
  `ESRETENCIONES_EMPRESA_FACTURA` varchar(1) DEFAULT 'S' COMMENT 'S o N si la empresa aplica retenciones como autónomos',
  `GRUPO_ZONA_IVA_EMPRESA_FACTURA` varchar(10) DEFAULT NULL,
  `ESREGIMENESPECIALAGRICOLA_EMPRESA_FACTURA` varchar(1) DEFAULT 'N',
  `CODIGO_CLIENTE_FACTURA` varchar(10) DEFAULT NULL,
  `RAZONSOCIAL_CLIENTE_FACTURA` varchar(200) DEFAULT NULL,
  `NIF_CLIENTE_FACTURA` varchar(50) DEFAULT NULL,
  `MOVIL_CLIENTE_FACTURA` varchar(40) DEFAULT NULL,
  `EMAIL_CLIENTE_FACTURA` varchar(200) DEFAULT NULL,
  `DIRECCION1_CLIENTE_FACTURA` varchar(200) DEFAULT NULL,
  `DIRECCION2_CLIENTE_FACTURA` varchar(200) DEFAULT NULL,
  `POBLACION_CLIENTE_FACTURA` varchar(200) DEFAULT NULL,
  `PROVINCIA_CLIENTE_FACTURA` varchar(200) DEFAULT NULL,
  `CPOSTAL_CLIENTE_FACTURA` varchar(15) DEFAULT NULL,
  `PAIS_CLIENTE_FACTURA` varchar(150) DEFAULT NULL,
  `ESIVA_RECARGO_CLIENTE_FACTURA` varchar(1) DEFAULT 'N',
  `ESIVA_EXENTO_CLIENTE_FACTURA` varchar(1) DEFAULT 'N',
  `ESREGIMENESPECIALAGRICOLA_CLIENTE_FACTURA` varchar(1) DEFAULT 'N',
  `ESRETENCIONES_CLIENTE_FACTURA` varchar(1) DEFAULT 'S' COMMENT 'S o N Si el cliente aplica retenciones',
  `TARIFA_ARTICULO_CLIENTE_FACTURA` varchar(10) DEFAULT NULL COMMENT 'Código de la tarifa que viene del cliente o configurada por el usuario',
  `ESIMP_INCL_TARIFA_CLIENTE_FACTURA` varchar(1) DEFAULT 'S' COMMENT 'Si el precio de la tarifa del cliente es con impuestos incl o no',
  `ESINTRACOMUNITARIO_CLIENTE_FACTURA` varchar(1) DEFAULT 'N' COMMENT 'Si la venta es hacia un país de la UE',
  `ESIRPF_IMP_INCL_ZONA_IVA_FACTURA` varchar(1) DEFAULT 'N' COMMENT 'Si la base del cáculo del irpf se hace desde BI o BI con impuestos',
  `ESAPLICA_RE_ZONA_IVA_FACTURA` varchar(1) DEFAULT 'S' COMMENT 'Si el tipo de IVA aplica Recargo de Equivalencia o no',
  `ESIVAAGRICOLA_ZONA_IVA_FACTURA` varchar(1) DEFAULT 'N' COMMENT 'Si el tipo de IVA es compatible con REAGP',
  `PALABRA_REPORTS_ZONA_IVA_FACTURA` varchar(10) DEFAULT 'IVA' COMMENT 'Palabra que sustituye a IVA desde la tabla de fza_ivas_grupos',
  `CODIGO_IVA_FACTURA` varchar(20) DEFAULT NULL COMMENT 'Código de IVA de la tabla fza_ivas',
  `ESVENTA_ACTIVO_FIJO_FACTURA` varchar(1) DEFAULT 'N' COMMENT 'Sólo REAGP cuando se vende activos fijos, exime irpf',
  `PORCEN_IVAN_FACTURA` decimal(19,6) DEFAULT NULL COMMENT 'Porcentaje IVA Normal',
  `TOTAL_IVAN_FACTURA` decimal(18,6) DEFAULT NULL COMMENT 'Total IVA Normal',
  `PORCEN_REN_FACTURA` decimal(19,6) DEFAULT NULL COMMENT 'Porcentaje RE Normal',
  `TOTAL_REN_FACTURA` decimal(19,6) DEFAULT NULL COMMENT 'Total RE Normal',
  `TOTAL_BASEI_IVAN_FACTURA` decimal(18,6) DEFAULT NULL COMMENT 'Total Base Imponible IVA Normal',
  `PORCEN_IVAR_FACTURA` decimal(19,6) DEFAULT NULL COMMENT 'Porcentaje IVA Reducido',
  `TOTAL_IVAR_FACTURA` decimal(18,6) DEFAULT NULL COMMENT 'TotaL IVA Reducido',
  `PORCEN_RER_FACTURA` decimal(19,6) DEFAULT NULL COMMENT 'Porcentaje RE Reducido',
  `TOTAL_RER_FACTURA` decimal(19,6) DEFAULT NULL COMMENT 'Total RE Reducido',
  `TOTAL_BASEI_IVAR_FACTURA` decimal(18,6) DEFAULT NULL COMMENT 'Total Base Imponible IVA Reducido',
  `PORCEN_IVAS_FACTURA` decimal(19,6) DEFAULT NULL COMMENT 'Porcentaje IVA SuperReducido',
  `TOTAL_IVAS_FACTURA` decimal(18,6) DEFAULT NULL COMMENT 'Total IVA SuperReducido',
  `PORCEN_RES_FACTURA` decimal(19,6) DEFAULT NULL COMMENT 'Porcentaje IVA SuperReducido',
  `TOTAL_RES_FACTURA` decimal(19,6) DEFAULT NULL COMMENT 'Total RE SuperReducido',
  `TOTAL_BASEI_IVAS_FACTURA` decimal(18,6) DEFAULT NULL COMMENT 'Total sin IVA SuperReducido',
  `PORCEN_IVAE_FACTURA` decimal(19,6) DEFAULT NULL COMMENT 'Porcentaje IVA Exento',
  `TOTAL_IVAE_FACTURA` decimal(18,6) DEFAULT NULL COMMENT 'Total IVA Exento',
  `PORCEN_REE_FACTURA` decimal(19,6) DEFAULT NULL COMMENT 'Porcentaje IVA1 Exento',
  `TOTAL_REE_FACTURA` decimal(19,6) DEFAULT NULL COMMENT 'Total RE Exento',
  `TOTAL_BASEI_IVAE_FACTURA` decimal(18,6) DEFAULT NULL COMMENT 'Total sin IVA Exento',
  `TOTAL_BASES_FACTURA` decimal(18,6) DEFAULT NULL COMMENT 'Total Todas las bases imponibles',
  `TOTAL_IMPUESTOS_FACTURA` decimal(18,6) DEFAULT NULL COMMENT 'Total de todos los impuestos iva + re',
  `FORMA_PAGO_FACTURA` varchar(200) DEFAULT NULL COMMENT 'Codigo Forma de Pago',
  `PORCEN_RETENCION_FACTURA` decimal(19,6) DEFAULT NULL COMMENT 'Porcentaje Retenciones',
  `TOTAL_RETENCION_FACTURA` decimal(18,6) DEFAULT NULL COMMENT 'Total Retenciones Factura',
  `TOTAL_LIQUIDO_FACTURA` decimal(18,6) DEFAULT NULL COMMENT 'Total Factura a pagar',
  `NRO_FACTURA_ABONO_FACTURA` varchar(8) DEFAULT NULL COMMENT 'Nro Factura Abono',
  `SERIE_FACTURA_ABONO_FACTURA` varchar(8) DEFAULT NULL COMMENT 'Serie Factura Abono',
  `TEXTO_LEGAL_FACTURA_CLIENTE_FACTURA` varchar(1000) DEFAULT '',
  `TEXTO_LEGAL_FACTURA_EMPRESA_FACTURA` varchar(1000) DEFAULT '',
  `DOCUMENTO_FACTURA` blob DEFAULT NULL COMMENT 'Copia en PDF del documento final',
  `COMENTARIOS_FACTURA` varchar(1000) DEFAULT '',
  `CONTADOR_LINEAS_FACTURA` varchar(8) DEFAULT NULL COMMENT 'Contador de lineas para lineas de factura',
  `ESCREARARTICULOS_FACTURA` varchar(1) DEFAULT NULL COMMENT 'S o N si se crean articulos desde el detalle',
  `ESDESCRIPCIONES_AMP_FACTURA` varchar(1) DEFAULT 'S' COMMENT 'S o N si la factura contiene una descripción larga',
  `ESFECHADEENTREGA_FACTURA` varchar(1) DEFAULT NULL COMMENT 'S o N si las descripciones tienen fecha de entrega',
  `INSTANTEMODIF` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `INSTANTEALTA` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `USUARIOALTA` varchar(100) NOT NULL,
  `USUARIOMODIF` varchar(100) NOT NULL,
  PRIMARY KEY (`SERIE_FACTURA`,`NRO_FACTURA`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci ROW_FORMAT=DYNAMIC;

INSERT INTO `fza_facturas`(`NRO_FACTURA`, `SERIE_FACTURA`, `FECHA_FACTURA`, `CODIGO_EMPRESA_FACTURA`, `RAZONSOCIAL_EMPRESA_FACTURA`, `NIF_EMPRESA_FACTURA`, `MOVIL_EMPRESA_FACTURA`, `EMAIL_EMPRESA_FACTURA`, `DIRECCION1_EMPRESA_FACTURA`, `DIRECCION2_EMPRESA_FACTURA`, `POBLACION_EMPRESA_FACTURA`, `PROVINCIA_EMPRESA_FACTURA`, `PAIS_EMPRESA_FACTURA`, `CPOSTAL_EMPRESA_FACTURA`, `ESRETENCIONES_EMPRESA_FACTURA`, `GRUPO_ZONA_IVA_EMPRESA_FACTURA`, `ESREGIMENESPECIALAGRICOLA_EMPRESA_FACTURA`, `CODIGO_CLIENTE_FACTURA`, `RAZONSOCIAL_CLIENTE_FACTURA`, `NIF_CLIENTE_FACTURA`, `MOVIL_CLIENTE_FACTURA`, `EMAIL_CLIENTE_FACTURA`, `DIRECCION1_CLIENTE_FACTURA`, `DIRECCION2_CLIENTE_FACTURA`, `POBLACION_CLIENTE_FACTURA`, `PROVINCIA_CLIENTE_FACTURA`, `CPOSTAL_CLIENTE_FACTURA`, `PAIS_CLIENTE_FACTURA`, `ESIVA_RECARGO_CLIENTE_FACTURA`, `ESIVA_EXENTO_CLIENTE_FACTURA`, `ESREGIMENESPECIALAGRICOLA_CLIENTE_FACTURA`, `ESRETENCIONES_CLIENTE_FACTURA`, `TARIFA_ARTICULO_CLIENTE_FACTURA`, `ESIMP_INCL_TARIFA_CLIENTE_FACTURA`, `ESINTRACOMUNITARIO_CLIENTE_FACTURA`, `ESIRPF_IMP_INCL_ZONA_IVA_FACTURA`, `ESAPLICA_RE_ZONA_IVA_FACTURA`, `ESIVAAGRICOLA_ZONA_IVA_FACTURA`, `PALABRA_REPORTS_ZONA_IVA_FACTURA`, `CODIGO_IVA_FACTURA`, `ESVENTA_ACTIVO_FIJO_FACTURA`, `PORCEN_IVAN_FACTURA`, `TOTAL_IVAN_FACTURA`, `PORCEN_REN_FACTURA`, `TOTAL_REN_FACTURA`, `TOTAL_BASEI_IVAN_FACTURA`, `PORCEN_IVAR_FACTURA`, `TOTAL_IVAR_FACTURA`, `PORCEN_RER_FACTURA`, `TOTAL_RER_FACTURA`, `TOTAL_BASEI_IVAR_FACTURA`, `PORCEN_IVAS_FACTURA`, `TOTAL_IVAS_FACTURA`, `PORCEN_RES_FACTURA`, `TOTAL_RES_FACTURA`, `TOTAL_BASEI_IVAS_FACTURA`, `PORCEN_IVAE_FACTURA`, `TOTAL_IVAE_FACTURA`, `PORCEN_REE_FACTURA`, `TOTAL_REE_FACTURA`, `TOTAL_BASEI_IVAE_FACTURA`, `TOTAL_BASES_FACTURA`, `TOTAL_IMPUESTOS_FACTURA`, `FORMA_PAGO_FACTURA`, `PORCEN_RETENCION_FACTURA`, `TOTAL_RETENCION_FACTURA`, `TOTAL_LIQUIDO_FACTURA`, `NRO_FACTURA_ABONO_FACTURA`, `SERIE_FACTURA_ABONO_FACTURA`, `TEXTO_LEGAL_FACTURA_CLIENTE_FACTURA`, `TEXTO_LEGAL_FACTURA_EMPRESA_FACTURA`, `DOCUMENTO_FACTURA`, `COMENTARIOS_FACTURA`, `CONTADOR_LINEAS_FACTURA`, `ESCREARARTICULOS_FACTURA`, `ESDESCRIPCIONES_AMP_FACTURA`, `ESFECHADEENTREGA_FACTURA`, `INSTANTEMODIF`, `INSTANTEALTA`, `USUARIOALTA`, `USUARIOMODIF`) VALUES
 ('00000021','A1','2023-05-12','1','AGRICULTOR','NIF DEL AGRICULTOR','TFNO DEL AGRICULTOR','EMAIL DEL AGRICULTOR','DIRECCION DEL AGRICULTOR','','POBLACION DEL AGRICULTOR','PROVINCIA DEL AGRICULTOR','PAIS DEL AGRICULTOR','POSAGRI','S','2','S','PUBLICO','PUBLICO','NIF CLIENTE','TFNO CLIENTE','EMAIL DEL CLIENTE','DIRECCION DEL CLIENTE','','POBLACION AGRICULTOR','PROVINCIA CLIENTE','POSCLI','PAIS DEL CLIENTE','N','S','N','N','0','S','N','S','N','S','REAGP','2','N',0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,5327.771800,5327.771800,0.000000,'30Y60',0.000000,0.000000,5327.771800,NULL,NULL,'','Empresario emisor acogido al régimen especial de agricultura ganadería y pesca',NULL,'','060','N','S','S','2023-11-08 20:50:28','2023-01-25 10:32:24','Administrador','Administrador'),
 ('00000022','A1','2023-01-28','1','AGRICULTOR','NIF','TFNO','EMAIL','DIRECCION','','POBLACION','PROVINCIA','','CODPOSTAL','S','2','S','TIENDA','TIENDA','NIF','658963325','EMAIL','DIRECCION','','POBLACION','PROVINCIA','CODPOSTAL','España','N','N','N','S','0','S','N','S','N','S','REAGP','2','N',12.000000,2.357143,0.000000,0.000000,19.642857,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,19.642857,2.357143,'CONTADO',25.000000,5.500000,16.500000,NULL,NULL,'','Empresario emisor acogido al régimen especial de agricultura ganadería y pesca',NULL,'','030','N','N','N','2023-10-25 16:18:28','2023-01-28 10:24:06','Administrador','Administrador'),
 ('000001','A1.2023','2023-12-07','011','ALBERTO GONZÁLEZ','4587545EQ','65869556','miemail@gmail.com','CALLE POZO BLANCO, 2','','SANTOVENIA','ZAMORA','','49750','S','1','N','295','AZUCENA MARTIN (KIOSKO PERLA)','11356325E','658963321','cliente.nuevo@gmail.om','CALLE POZO AMARILLO, 3',NULL,'SALAMANCA','SALAMANCA','37003',NULL,'S','N','N','S','1','N','N','N','S','N','IVA','1','N',21.000000,4.830000,5.200000,1.196000,23.000000,10.000000,32.902000,1.400000,4.606280,329.020000,4.000000,0.000000,0.500000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,352.020000,43.534280,'30_60_90',2.500000,8.800500,386.753780,NULL,NULL,NULL,'',NULL,NULL,'150','N','S','N','2023-12-09 18:31:22','2023-12-06 13:07:54','Administrador','Administrador'),
 ('000002','A1.2023','2023-12-09','011','ALBERTO GONZÁLEZ','4587545EQ','65869556','miemail@gmail.com','CALLE POZO BLANCO, 2','','SANTOVENIA','ZAMORA','','49750','S','1','N','TIENDA','TIENDA DE ROSA','NIF','658963325','EMAIL','CALLE MAYOR, 2','','MORALES DEL VINO','ZAMORA','49190','España','S','N','N','S','1','N','N','N','S','N','IVA','1','N',21.000000,0.529200,5.200000,0.131040,2.520000,10.000000,0.000000,1.400000,0.000000,0.000000,4.000000,0.000000,0.500000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,2.520000,0.660240,'CONTADO',2.500000,0.063000,3.117240,NULL,NULL,NULL,'',NULL,NULL,'020','N','N','N','2023-12-09 11:21:40','2023-12-09 11:21:23','Administrador','Administrador'),
 ('000006','AGRO','2023-10-22','1','AGRICULTOR','NIF AGRICULTOR','TFNO AGRICULTOR','EMAIL AGRICULTOR','DIRECCION AGRICULTOR','','POBLACION AGRICULTOR','PROVINCIA AGRICULTOR','PAIS AGRICULTOR','49190','S','2','S','293','PEDRO COJOS','46589963j','','pedro.cojos@gmail.com','CALLE CAIDOS ','','VILLAVEZA DEL AGUA','ZAMORA','49760','','N','N','N','S','1','N','N','S','N','S','REAGP','2','N',12.000000,1008.000000,0.000000,0.000000,8400.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,8400.000000,1008.000000,'30DIAS',1.000000,94.080000,9313.920000,NULL,NULL,'','Empresario emisor acogido al régimen especial de agricultura ganadería y pesca',NULL,'','100','N','N','N','2023-11-01 17:32:13','2023-10-22 14:28:40','Administrador','Administrador'),
 ('000007','AGRO','2023-10-26','1','AGRICULTOR','NIF','TFNO','EMAIL','DIRECCION','','POBLACION','PROVINCIA','','CODPOSTAL','S','2','S','TIENDA','TIENDA DE ROSA','NIF','658963325','EMAIL','CALLE MAYOR, 2','','MORALES DEL VINO','ZAMORA','49190','España','S','N','N','S','0','S','N','S','N','S','REAGP','2','N',0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,20648.000000,20648.000000,0.000000,'CONTADO',0.000000,0.000000,20648.000000,NULL,NULL,NULL,'Empresario emisor acogido al régimen especial de agricultura ganadería y pesca',NULL,NULL,'020','N','N','N','2023-11-17 15:17:18','2023-10-26 15:57:56','Administrador','Administrador'),
 ('000001','AGRO/2023','2023-12-06','1','AGRICULTOR','NIF DEL AGRICULTOR','TFNO DEL AGRICULTOR','EMAIL DEL AGRICULTOR','DIRECCION DEL AGRICULTOR','','POBLACION DEL AGRICULTOR','PROVINCIA DEL AGRICULTOR','PAIS DEL AGRICULTOR','POSAGRI','S','2','S','296','ANGEL MARTIN','11356689E','62335685',NULL,'CL TRES CRUCES, 23, 3C',NULL,'ZAMORA','ZAMORA','49002',NULL,'N','S','S','S','1','S','N','S','N','S','REAGP','2','N',0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,604.800000,604.800000,0.000000,'TRANSFERENCIA',2.500000,15.120000,589.680000,NULL,NULL,NULL,'Empresario emisor acogido al régimen especial de agricultura ganadería y pesca',NULL,NULL,'020','N','N','S','2023-12-06 13:26:24','2023-12-06 13:26:05','Administrador','Administrador'),
 ('000002','ANA/2023','2023-10-31','008','ANA MARTIN','45684135Q','66533256','ana@hotmail.com','CALLE SANTA CLARA, 2','','MORALES DEL VINO','ZAMORA','ESPAÑA','49190','S','1','N','TIENDA','TIENDA DE ROSA','11256658R','658963325','EMAIL','CALLE MAYOR, 2','','MORALES DEL VINO','ZAMORA','49190','España','S','N','N','S','1','N','N','N','S','N','IVA','1','N',21.000000,21.000000,5.200000,5.200000,100.000000,10.000000,100.000000,1.400000,14.000000,1000.000000,4.000000,4.000000,0.500000,0.500000,100.000000,0.000000,0.000000,0.000000,0.000000,35.000000,1235.000000,144.700000,'CONTADO',15.000000,185.250000,1194.450000,NULL,NULL,NULL,'',NULL,NULL,'050','N','N','N','2023-12-04 14:16:51','2023-10-31 19:35:00','Administrador','Administrador'),
 ('000003','ANA/2023','2023-12-04','008','ANA MARTIN','45684135Q','66533256','ana@hotmail.com','CALLE SANTA CLARA, 2','','MORALES DEL VINO','ZAMORA','ESPAÑA','49190','S','1','N','294','AGUSTIN SEGURADO','11632589R','623356689','agustin.segurado@gmail.com','CALLE EL RIEGO, 33','','ZAMORA','ZAMORA','49019','','N','N','N','S','1','N','N','N','S','N','IVA','1','N',21.000000,28.350000,5.200000,0.000000,135.000000,10.000000,0.000000,1.400000,0.000000,0.000000,4.000000,9.560000,0.500000,0.000000,239.000000,0.000000,0.000000,0.000000,0.000000,0.000000,374.000000,37.910000,'CONTADO',2.500000,9.350000,402.560000,NULL,NULL,NULL,'',NULL,NULL,'070','N','N','N','2023-12-05 14:59:51','2023-12-04 21:51:50','Administrador','Administrador');

DROP TABLE IF EXISTS `fza_facturas_lineas`;
CREATE TABLE `fza_facturas_lineas` (
  `NRO_FACTURA_LINEA` varchar(12) NOT NULL,
  `SERIE_FACTURA_LINEA` varchar(12) NOT NULL,
  `LINEA_FACTURA_LINEA` varchar(3) NOT NULL,
  `CODIGO_ARTICULO_FACTURA_LINEA` varchar(20) DEFAULT NULL,
  `CODIGO_FAMILIA_FACTURA_LINEA` varchar(10) DEFAULT NULL,
  `NOMBRE_FAMILIA_FACTURA_LINEA` varchar(150) DEFAULT NULL,
  `FECHA_ENTREGA_FACTURA_LINEA` datetime DEFAULT NULL,
  `TIPO_CANTIDAD_ARTICULO_FACTURA_LINEA` varchar(20) DEFAULT 'Uds',
  `ESIMP_INCL_TARIFA_FACTURA_LINEA` varchar(1) DEFAULT 'S',
  `TIPOIVA_ARTICULO_FACTURA_LINEA` varchar(2) DEFAULT 'N',
  `DESCRIPCION_ARTICULO_FACTURA_LINEA` varchar(100) DEFAULT NULL,
  `CODIGO_TARIFA_FACTURA_LINEA` varchar(10) DEFAULT NULL,
  `CANTIDAD_FACTURA_LINEA` decimal(19,6) DEFAULT 1.000000,
  `PRECIOSALIDA_FACTURA_LINEA` decimal(18,6) DEFAULT NULL,
  `PORCEN_DTO_FACTURA_LINEA` decimal(18,6) DEFAULT NULL,
  `PRECIO_DTO_FACTURA_LINEA` decimal(18,6) DEFAULT NULL,
  `PRECIOVENTA_SIVA_ARTICULO_FACTURA_LINEA` decimal(19,6) DEFAULT 0.000000,
  `PORCEN_IVA_FACTURA_LINEA` decimal(19,6) DEFAULT 0.000000,
  `PRECIOVENTA_CIVA_ARTICULO_FACTURA_LINEA` decimal(19,6) DEFAULT 0.000000,
  `TOTAL_FACTURA_LINEA` decimal(19,6) DEFAULT 0.000000,
  `INSTANTEMODIF` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `INSTANTEALTA` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `USUARIOALTA` varchar(100) NOT NULL,
  `USUARIOMODIF` varchar(100) NOT NULL,
  PRIMARY KEY (`SERIE_FACTURA_LINEA`,`NRO_FACTURA_LINEA`,`LINEA_FACTURA_LINEA`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci ROW_FORMAT=DYNAMIC;

INSERT INTO `fza_facturas_lineas`(`NRO_FACTURA_LINEA`, `SERIE_FACTURA_LINEA`, `LINEA_FACTURA_LINEA`, `CODIGO_ARTICULO_FACTURA_LINEA`, `CODIGO_FAMILIA_FACTURA_LINEA`, `NOMBRE_FAMILIA_FACTURA_LINEA`, `FECHA_ENTREGA_FACTURA_LINEA`, `TIPO_CANTIDAD_ARTICULO_FACTURA_LINEA`, `ESIMP_INCL_TARIFA_FACTURA_LINEA`, `TIPOIVA_ARTICULO_FACTURA_LINEA`, `DESCRIPCION_ARTICULO_FACTURA_LINEA`, `CODIGO_TARIFA_FACTURA_LINEA`, `CANTIDAD_FACTURA_LINEA`, `PRECIOSALIDA_FACTURA_LINEA`, `PORCEN_DTO_FACTURA_LINEA`, `PRECIO_DTO_FACTURA_LINEA`, `PRECIOVENTA_SIVA_ARTICULO_FACTURA_LINEA`, `PORCEN_IVA_FACTURA_LINEA`, `PRECIOVENTA_CIVA_ARTICULO_FACTURA_LINEA`, `TOTAL_FACTURA_LINEA`, `INSTANTEMODIF`, `INSTANTEALTA`, `USUARIOALTA`, `USUARIOMODIF`) VALUES
 ('00000021','A1','010','CEBADA',NULL,NULL,'2023-05-09 14:11:34','KGS.','S','E','Cebada bonita para todos los niños que quieran comer carne y fiestas de guardar, es lo que hay en es',NULL,1.000000,NULL,NULL,NULL,21.000000,0.000000,21.000000,21.000000,'2023-10-26 12:44:30','2023-01-25 10:34:49','Administrador','Administrador'),
 ('00000021','A1','050','CALABAZAS',NULL,NULL,NULL,'Kgs','S','E','Calabazas para jalogüin y para después hacer una cremita.',NULL,100.090000,NULL,NULL,NULL,53.020000,0.000000,53.020000,5306.771800,'2023-10-26 12:44:30','2023-10-25 19:31:19','Administrador','Administrador'),
 ('00000022','A1','010','CEBADA',NULL,NULL,'2023-05-12 14:11:39',NULL,'S','N','Cebada',NULL,1.000000,NULL,NULL,NULL,19.642857,12.000000,22.000000,22.000000,'2023-10-25 16:18:28','2023-01-28 10:24:06','Administrador','Administrador'),
 ('000001','A1.2023','010','PETAZETAS',NULL,NULL,NULL,'Uds.','N','R','BOLSAS DE PETAZETAS KOLA',NULL,1.000000,NULL,NULL,NULL,27.900000,10.000000,30.690000,30.690000,'2023-12-09 09:35:43','2023-12-06 13:10:37','Administrador','Administrador'),
 ('000001','A1.2023','020','ESCALOFRÍOS',NULL,NULL,NULL,'Uds.','N','R','ESCALOFRIOS DE FRESA',NULL,10.000000,NULL,NULL,NULL,3.790000,10.000000,4.169000,41.690000,'2023-12-09 09:35:44','2023-12-06 15:41:12','Administrador','Administrador'),
 ('000001','A1.2023','030','COLAJETS',NULL,NULL,NULL,'Uds.','N','R','HELADO COJALET',NULL,1.000000,NULL,NULL,NULL,1.380000,10.000000,1.518000,1.518000,'2023-12-09 09:35:44','2023-12-06 15:41:23','Administrador','Administrador'),
 ('000001','A1.2023','040','MONCHITOS',NULL,NULL,NULL,'Uds.','N','R','ARROZ FRITO HINCHADO',NULL,100.000000,NULL,NULL,NULL,0.170000,10.000000,0.187000,18.700000,'2023-12-09 09:35:45','2023-12-06 15:42:02','Administrador','Administrador'),
 ('000001','A1.2023','050','PIPAS',NULL,NULL,NULL,'Uds.','N','R','PIPAS FACUNDO',NULL,100.000000,NULL,NULL,NULL,0.640000,10.000000,0.704000,70.400000,'2023-12-09 09:35:47','2023-12-06 15:42:34','Administrador','Administrador'),
 ('000001','A1.2023','060','PALOTES',NULL,NULL,NULL,'Uds.','N','R','PALOTES DE FRESA',NULL,25.000000,NULL,NULL,NULL,0.060000,10.000000,0.066000,1.650000,'2023-12-09 09:35:45','2023-12-06 15:42:59','Administrador','Administrador'),
 ('000001','A1.2023','070','GATOS',NULL,NULL,NULL,'Uds.','N','R','GATOS REGALIZ',NULL,25.000000,NULL,NULL,NULL,0.040000,10.000000,0.044000,1.100000,'2023-12-09 09:35:46','2023-12-06 15:43:38','Administrador','Administrador'),
 ('000001','A1.2023','080','JAMONES',NULL,NULL,NULL,'Uds.','N','R','JAMONES NUBES DE FRESA',NULL,20.000000,NULL,NULL,NULL,0.020000,10.000000,0.022000,0.440000,'2023-12-09 09:35:48','2023-12-06 15:44:49','Administrador','Administrador'),
 ('000001','A1.2023','090','FANTA',NULL,NULL,NULL,'Uds.','N','R','FANTA NARANJA 5% ZUMO',NULL,1.000000,NULL,NULL,NULL,0.940000,10.000000,1.034000,1.034000,'2023-12-09 09:35:48','2023-12-06 15:48:33','Administrador','Administrador'),
 ('000001','A1.2023','100','COCA COLA',NULL,NULL,NULL,'Uds.','N','R','BOTELLA DE COCA COLA 20 ML',NULL,500.000000,NULL,NULL,NULL,0.250000,10.000000,0.275000,137.500000,'2023-12-09 09:35:48','2023-12-06 15:48:59','Administrador','Administrador'),
 ('000001','A1.2023','110','PIRULETAS',NULL,NULL,NULL,'Uds.','N','R','PIRULETAS FIESTA',NULL,100.000000,NULL,NULL,NULL,0.100000,10.000000,0.110000,11.000000,'2023-12-09 09:35:50','2023-12-06 15:50:37','Administrador','Administrador'),
 ('000001','A1.2023','120','GUSANITOS',NULL,NULL,NULL,'Uds.','N','R','GUSANITOS RISI',NULL,100.000000,NULL,NULL,NULL,0.170000,10.000000,0.187000,18.700000,'2023-12-09 09:35:50','2023-12-06 16:11:08','Administrador','Administrador'),
 ('000001','A1.2023','130','PATATASFRITAS',NULL,NULL,NULL,'Uds.','N','R','PATATAS FRITAS MATUTANO',NULL,100.000000,NULL,NULL,NULL,0.250000,10.000000,0.275000,27.500000,'2023-12-09 09:35:50','2023-12-06 16:11:29','Administrador','Administrador'),
 ('000001','A1.2023','140','GINTONIC',NULL,NULL,NULL,'Uds.','N','N','GINTONIC CON HIELO',NULL,10.000000,NULL,NULL,NULL,2.300000,21.000000,2.783000,27.830000,'2023-12-09 09:35:52','2023-12-06 16:11:50','Administrador','Administrador'),
 ('000002','A1.2023','010','PATITOS',NULL,NULL,NULL,'Uds.','N','N','PATITOS DE GOMA PARA BAÑARSE',NULL,1.000000,NULL,NULL,NULL,2.520000,21.000000,3.049200,3.049200,'2023-12-09 11:21:40','2023-12-09 11:21:40','Administrador','Administrador'),
 ('000006','AGRO','010','CEBADA',NULL,NULL,NULL,'Tns','S','N','CEBADA',NULL,35.000000,NULL,NULL,NULL,240.000000,12.000000,268.800000,9408.000000,'2023-12-09 09:35:59','2023-10-22 14:29:32','Administrador','Administrador'),
 ('000007','AGRO','010','ALFALFA',NULL,NULL,NULL,'Kgs','S','E','Alfalfa de la finca',NULL,200.000000,NULL,NULL,NULL,103.240000,0.000000,103.240000,20648.000000,'2023-10-26 15:58:08','2023-10-26 15:58:08','Administrador','Administrador'),
 ('000001','AGRO/2023','010','016',NULL,NULL,'2023-11-02 00:00:00','Horas','S','E','TRABAJOS AGRÍCOLAS',NULL,12.000000,NULL,NULL,NULL,50.400000,0.000000,50.400000,604.800000,'2023-12-06 13:26:24','2023-12-06 13:26:24','Administrador','Administrador'),
 ('000002','ANA/2023','010','CHUPITANGAS',NULL,NULL,NULL,'Uds.','N','R','CHUCHES VARIADAS',NULL,1000.000000,NULL,NULL,NULL,1.000000,10.000000,1.100000,1100.000000,'2023-10-31 19:35:34','2023-10-31 19:35:34','Administrador','Administrador'),
 ('000002','ANA/2023','020','PANDEPUEBLO',NULL,NULL,NULL,'Uds.','N','S','CHAPATAS',NULL,100.000000,NULL,NULL,NULL,1.000000,4.000000,1.040000,104.000000,'2023-10-31 19:36:03','2023-10-31 19:36:02','Administrador','Administrador'),
 ('000002','ANA/2023','030','LITRONAS',NULL,NULL,NULL,'Uds.','N','N','LITRONA MAHOU 1L.',NULL,100.000000,NULL,NULL,NULL,1.000000,21.000000,1.210000,121.000000,'2023-10-31 19:36:32','2023-10-31 19:36:32','Administrador','Administrador'),
 ('000002','ANA/2023','040','FRUTA',NULL,NULL,NULL,'Kgs.','N','E','MELONES',NULL,100.000000,NULL,NULL,NULL,0.350000,0.000000,0.350000,35.000000,'2023-10-31 19:42:27','2023-10-31 19:42:27','Administrador','Administrador'),
 ('000003','ANA/2023','010','015',NULL,NULL,NULL,'Horas','N','N','MANO DE OBRA',NULL,3.000000,NULL,NULL,NULL,45.000000,21.000000,54.450000,163.350000,'2023-12-04 21:52:29','2023-12-04 21:52:29','Administrador','Administrador'),
 ('000003','ANA/2023','020','PATATAS',NULL,NULL,NULL,'Kgs','N','S','PATATA',NULL,1.000000,NULL,NULL,NULL,22.000000,4.000000,22.880000,22.880000,'2023-12-05 12:17:22','2023-12-05 12:17:04','Administrador','Administrador'),
 ('000003','ANA/2023','030','555',NULL,NULL,NULL,'Uds.','N','S','PIMIENTOS',NULL,5.000000,NULL,NULL,NULL,20.000000,4.000000,20.800000,104.000000,'2023-12-05 12:36:22','2023-12-05 12:36:22','Administrador','Administrador'),
 ('000003','ANA/2023','040','200',NULL,NULL,NULL,'Uds.','N','S','PIMIENTOS DEL PADRÓN',NULL,10.000000,NULL,NULL,NULL,10.000000,4.000000,10.400000,104.000000,'2023-12-05 14:40:56','2023-12-05 14:40:56','Administrador','Administrador'),
 ('000003','ANA/2023','050','PERAS',NULL,NULL,NULL,'Uds.','N','S','PERAS HERMOSAS',NULL,12.000000,NULL,NULL,NULL,1.000000,4.000000,1.040000,12.480000,'2023-12-05 14:47:57','2023-12-05 14:47:57','Administrador','Administrador'),
 ('000003','ANA/2023','060','PEPINOS',NULL,NULL,NULL,'Uds.','N','S','PEPINOS BUENOS',NULL,2.000000,NULL,NULL,NULL,2.500000,4.000000,2.600000,5.200000,'2023-12-05 14:59:01','2023-12-05 14:59:01','Administrador','Administrador');

DROP TABLE IF EXISTS `fza_formapago`;
CREATE TABLE `fza_formapago` (
  `CODIGO_FORMAPAGO` varchar(20) NOT NULL,
  `ACTIVO_FORMAPAGO` varchar(1) DEFAULT NULL,
  `ORDEN_FORMAPAGO` int(11) DEFAULT NULL,
  `DESCRIPCION_FORMAPAGO` varchar(100) DEFAULT NULL,
  `N_PLAZOS_FORMAPAGO` int(11) DEFAULT 1,
  `N_DIAS_ENTRE_PLAZOS_FORMAPAGO` int(11) DEFAULT 0,
  `PORCEN_ANTICIPO_FORMAPAGO` int(11) DEFAULT NULL,
  `ESVERBANCOEMPRESA_FORMAPAGO` varchar(1) DEFAULT NULL,
  `ESCONTADO_FORMAPAGO` varchar(1) DEFAULT NULL,
  `ESDEFAULT_FORMAPAGO` varchar(1) DEFAULT 'N',
  `INSTANTEMODIF` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `INSTANTEALTA` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `USUARIOALTA` varchar(100) NOT NULL,
  `USUARIOMODIF` varchar(100) NOT NULL,
  PRIMARY KEY (`CODIGO_FORMAPAGO`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci ROW_FORMAT=DYNAMIC;

INSERT INTO `fza_formapago`(`CODIGO_FORMAPAGO`, `ACTIVO_FORMAPAGO`, `ORDEN_FORMAPAGO`, `DESCRIPCION_FORMAPAGO`, `N_PLAZOS_FORMAPAGO`, `N_DIAS_ENTRE_PLAZOS_FORMAPAGO`, `PORCEN_ANTICIPO_FORMAPAGO`, `ESVERBANCOEMPRESA_FORMAPAGO`, `ESCONTADO_FORMAPAGO`, `ESDEFAULT_FORMAPAGO`, `INSTANTEMODIF`, `INSTANTEALTA`, `USUARIOALTA`, `USUARIOMODIF`) VALUES
 ('30_60_90','S',4,'RECIBO A 30, 60 y 90 DIAS',3,30,0,'N','N','N','2023-12-14 12:04:03','2023-12-08 22:33:27','Administrador','Administrador'),
 ('30DIAS','S',2,'RECIBO A 30 DIAS',1,30,0,'N','N','N','2023-12-09 18:25:02','2022-11-02 16:13:08','Administrador','Administrador'),
 ('30Y60','S',1,'RECIBO 30 DIAS Y 60 DIAS',2,30,0,'N','N','N','2023-12-09 18:25:01','2023-11-08 21:12:56','Administrador','Administrador'),
 ('60DIAS','S',3,'RECIBO A 60 DIAS',1,60,0,'N','N','N','2023-12-09 18:25:00','2022-10-06 17:58:14','Administrador','Administrador'),
 ('CONTADO','S',1,'CONTADO',1,0,100,'N','S','S','2023-12-14 12:04:29','2021-05-14 20:08:58','Administrador','Administrador'),
 ('TRANSFERENCIA','S',3,'TRANSFERENCIA',1,0,100,'S','N','N','2023-12-14 12:04:13','2023-12-06 18:59:38','Administrador','Administrador');

DROP TABLE IF EXISTS `fza_generadorprocesos`;
CREATE TABLE `fza_generadorprocesos` (
  `CODIGO_GENERADORPROCESO` varchar(20) NOT NULL,
  `NOMBRE_GENERADORPROCESO` varchar(100) DEFAULT NULL,
  `PROCESO_GENERADORPROCESO` text DEFAULT NULL,
  `INSTANTEMODIF` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `INSTANTEALTA` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `USUARIOALTA` varchar(100) NOT NULL,
  `USUARIOMODIF` varchar(100) NOT NULL,
  PRIMARY KEY (`CODIGO_GENERADORPROCESO`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci ROW_FORMAT=DYNAMIC;

INSERT INTO `fza_generadorprocesos`(`CODIGO_GENERADORPROCESO`, `NOMBRE_GENERADORPROCESO`, `PROCESO_GENERADORPROCESO`, `INSTANTEMODIF`, `INSTANTEALTA`, `USUARIOALTA`, `USUARIOMODIF`) VALUES
 ('001','INSERTAR CAMPOS GRID POR MTO','  Select        USUARIO_GRUPO_PERFILES,\r\n                \'frmMtoFormasdePago\' AS KEY_PERFILES,\r\n                SUBKEY_PERFILES,\r\n                VALUE_PERFILES,\r\n                VALUE_TEXT_PERFILES,\r\n                TYPE_BLOB_PERFILES,\r\n                VALUE_BLOB_PERFILES,\r\n                INSTANTEMODIF,\r\n                INSTANTEALTA,\r\n                USUARIOMODIF,\r\n                USUARIOALTA\r\n	  from fza_usuarios_perfiles \r\n	 where KEY_PERFILES = \'frmMtoEmpresas\' \r\n	   and (SUBKEY_PERFILES like \'%tvFacturacion%\' or\r\n         SUBKEY_PERFILES like \'%tvLineasFacturacion%\') ','2023-11-17 15:03:37','2023-04-27 12:30:24','Administrador','Administrador'),
 ('002','update cosas','UPDATE fza_ivas\r\n   SET PORCENEXENTO_RE_IVA = 0','2023-04-28 21:13:07','2023-04-28 12:28:56','Administrador','Administrador'),
 ('003','ACTUALIZACION DE CAMPO FZA_IVAS','           ALTER TABLE FZA_IVAS    MODIFY COLUMN   `GRUPO_ZONA_IVA` varchar(10) NOT NULL;','2023-04-28 12:46:20','2023-04-28 12:45:28','Administrador','Administrador'),
 ('004','SELECT FACTURAS','SELECT * FROM FZA_USUARIOS_PERFILES\r\nWHERE KEY_PERFILES = \'frmMtoFormasdePago\'','2023-05-08 13:44:52','2023-04-29 12:04:43','Administrador','Administrador'),
 ('005','borrado perfiles por mto','delete from fza_usuarios_perfiles \r\n      where key_perfiles = \'frmMtoFormasdePago\'\r\n        and subkey_perfiles like \'tvLineasFacturacion%\'','2023-05-27 16:56:53','2023-05-08 13:41:02','Administrador','Administrador'),
 ('006','combo facturas','   \r\nSELECT SERIE_CONTADOR_CLIENTE AS SERIE_CONTADOR \r\n  FROM vi_clientes                              \r\n WHERE SERIE_CONTADOR_CLIENTE IS NOT NULL       \r\n   AND CODIGO_CLIENTE = \'AGRICULTOR\'                \r\n UNION                                          \r\nSELECT SERIE_SERIE AS SERIE_CONTADOR            \r\n  FROM vi_empresas_series                       \r\n WHERE CODIGO_EMPRESA_SERIE = \'007\'          \r\n   AND (FECHA_DESDE_SERIE >= \'12-05-2023\'             \r\n        AND (FECHA_HASTA_SERIE <= \'12-05-2023\'        \r\n             OR FECHA_HASTA_SERIE IS NULL ))    \r\n UNION                                          \r\nSELECT SERIE_CONTADOR_EMPRESA AS SERIE_CONTADOR \r\n  FROM vi_empresas                              \r\n WHERE SERIE_CONTADOR_EMPRESA IS NOT NULL       \r\n   AND  CODIGO_EMPRESA = \'007\'               \r\n UNION                                          \r\n SELECT SERIE_CONTADOR                          \r\n   FROM vi_contadores                           \r\n  WHERE tipodoc_contador = \'FC\'\r\n  ','2023-05-13 13:53:12','2023-05-13 13:47:20','Administrador','Administrador'),
 ('007','BORRADO DE SKINS EN PERFILES','DELETE FROM fza_usuarios_perfiles\r\nwhere SUBKEY_PERFILES LIKE \'%skin%\'                                               ','2023-10-19 11:51:26','2023-10-19 11:50:25','Administrador','Administrador'),
 ('008','PROCEDURE CALCULAR NETOS','ALTER PROCEDURE `PRC_CALCULAR_FACTURA_NETOS` (IN `pSERIE_FACTURA` VARCHAR(8), \r\n                                              IN `pNRO_FACTURA` VARCHAR(12))\r\nBEGIN\r\n  DECLARE pPRECIOSIVA decimal(19,6);\r\n  DECLARE pPRECIOCIVA decimal(19,6);\r\n  DECLARE pPORCEN decimal(19,6);\r\n  DECLARE pTIPO VARCHAR(2);\r\n  DECLARE pIVA_RECARGO varchar(1) DEFAULT \'\';\r\n  DECLARE pAPLICA_RECARGO varchar(1) DEFAULT \'\';\r\n  DECLARE pIVA_EXENTO varchar(1) DEFAULT \'\';\r\n  DECLARE pREG_AG_EMP varchar(1) DEFAULT \'\';\r\n  DECLARE pREG_AG_CLI varchar(1) DEFAULT \'\';\r\n  DECLARE pINTRACOMUNITARIO varchar(1) DEFAULT \'\';\r\n  DECLARE pAPLICA_RETENCIONES_CLI varchar(1) DEFAULT \'\';\r\n  DECLARE pAPLICA_RETENCIONES_EMP varchar(1) DEFAULT \'\';\r\n  DECLARE pPORCENREN decimal(19,6) DEFAULT 0;\r\n  DECLARE pPORCENRER decimal(19,6) DEFAULT 0;\r\n  DECLARE pPORCENRES decimal(19,6) DEFAULT 0;\r\n  DECLARE pPORCENREE decimal(19,6) DEFAULT 0;\r\n  DECLARE pSUMBASEN decimal(19,6) DEFAULT 0;\r\n  DECLARE pSUMBASER decimal(19,6) DEFAULT 0;\r\n  DECLARE pSUMBASES decimal(19,6) DEFAULT 0;\r\n  DECLARE pSUMBASEE decimal(19,6) DEFAULT 0;\r\n  DECLARE pTOTN decimal(19,6) DEFAULT 0;\r\n  DECLARE pTOTR decimal(19,6) DEFAULT 0;\r\n  DECLARE pTOTS decimal(19,6) DEFAULT 0;\r\n  DECLARE pTOTE decimal(19,6) DEFAULT 0;\r\n  DECLARE pTOTRECN decimal(19,6) DEFAULT 0;\r\n  DECLARE pTOTRECR decimal(19,6) DEFAULT 0;\r\n  DECLARE pTOTRECS decimal(19,6) DEFAULT 0;\r\n  DECLARE pTOTRECE decimal(19,6) DEFAULT 0;\r\n  DECLARE pSUMTOTREC decimal(19,6) DEFAULT 0;\r\n  DECLARE pSUMTOT decimal(19,6) DEFAULT 0;\r\n  DECLARE pPORCENN decimal(19,6) DEFAULT 0;\r\n  DECLARE pTOTBASES decimal(19,6) DEFAULT 0;\r\n  DECLARE pPORCENR decimal(19,6) DEFAULT 0;\r\n  DECLARE pPORCENS decimal(19,6) DEFAULT 0;\r\n  DECLARE pPORCENE decimal(19,6) DEFAULT 0;\r\n  DECLARE pPORCENRET decimal(19,6) DEFAULT 0;\r\n  DECLARE pGRUPO_ZONA_IVA int;\r\n  DECLARE pCODIGO_IVA int;\r\n  DECLARE pTOTALRET decimal(19,6) DEFAULT 0;\r\n  DECLARE pFECHA datetime;\r\n  DECLARE pLINEA varchar(3);\r\n  DECLARE pIMP_INCL varchar(1);\r\n  DECLARE pCANTIDAD decimal(19,6) DEFAULT 0;\r\n  DECLARE pCODART varchar(20);\r\n  DECLARE pTIPOIVAF varchar(1) DEFAULT \'X\';\r\n  DECLARE pIRPF_IMP_INCL VARCHAR(1);\r\n  DECLARE pVENTA_ACT_FIJ VARCHAR(1);\r\n  DECLARE finished INTEGER DEFAULT 0;\r\n  DECLARE pCODEMPRESA varchar(8);\r\n  DECLARE CUR_LINEAS \r\n          CURSOR FOR \r\n              SELECT LINEA_FACTURA_LINEA,\r\n                     CODIGO_ARTICULO_FACTURA_LINEA,\r\n                     PRECIOVENTA_SIVA_ARTICULO_FACTURA_LINEA AS PRECIOSIVA,\r\n                     PRECIOVENTA_CIVA_ARTICULO_FACTURA_LINEA AS PRECIOCIVA,\r\n                     PORCEN_IVA_FACTURA_LINEA AS PORCEN,\r\n                     TIPOIVA_ARTICULO_FACTURA_LINEA AS TIPO,\r\n                     ESIMP_INCL_TARIFA_FACTURA_LINEA AS IMP_INCL,\r\n                     CANTIDAD_FACTURA_LINEA as CANTIDAD\r\n                FROM FZA_FACTURAS_LINEAS \r\n               WHERE SERIE_FACTURA_LINEA = pSERIE_FACTURA \r\n                 AND NRO_FACTURA_LINEA = pNRO_FACTURA;\r\n  DECLARE CONTINUE HANDLER \r\n          FOR NOT FOUND SET finished = 1;\r\n  SELECT PORCEN_IVAN_FACTURA,\r\n         PORCEN_IVAR_FACTURA,\r\n         PORCEN_IVAS_FACTURA,\r\n         PORCEN_IVAE_FACTURA,\r\n         PORCEN_RETENCION_FACTURA,\r\n         ESAPLICA_RE_ZONA_IVA_FACTURA,\r\n         ESIVA_RECARGO_CLIENTE_FACTURA,\r\n         ESIVA_EXENTO_CLIENTE_FACTURA,\r\n         ESRETENCIONES_CLIENTE_FACTURA,\r\n         ESRETENCIONES_EMPRESA_FACTURA,\r\n         ESIRPF_IMP_INCL_ZONA_IVA_FACTURA,\r\n         PORCEN_REN_FACTURA,\r\n         PORCEN_RER_FACTURA,\r\n         PORCEN_RES_FACTURA,\r\n         PORCEN_REE_FACTURA,\r\n         ESREGIMENESPECIALAGRICOLA_EMPRESA_FACTURA,\r\n         ESREGIMENESPECIALAGRICOLA_CLIENTE_FACTURA,\r\n         GRUPO_ZONA_IVA_EMPRESA_FACTURA,\r\n         CODIGO_IVA_FACTURA,\r\n         ESINTRACOMUNITARIO_CLIENTE_FACTURA,\r\n         FECHA_FACTURA,\r\n         CODIGO_EMPRESA_FACTURA,\r\n         ESVENTA_ACTIVO_FIJO_FACTURA\r\n    INTO pPORCENN,\r\n         pPORCENR,\r\n         pPORCENS,\r\n         pPORCENE,\r\n         pPORCENRET,\r\n         pIVA_RECARGO,\r\n         pAPLICA_RECARGO,\r\n         pIVA_EXENTO,\r\n         pAPLICA_RETENCIONES_CLI,\r\n         pAPLICA_RETENCIONES_EMP,\r\n         pIRPF_IMP_INCL,\r\n         pPORCENREN,\r\n         pPORCENRER,\r\n         pPORCENRES,\r\n         pPORCENREE,\r\n         pREG_AG_EMP,\r\n         pREG_AG_CLI,\r\n         pGRUPO_ZONA_IVA,\r\n         pCODIGO_IVA,\r\n         pINTRACOMUNITARIO,\r\n         pFECHA,\r\n         pCODEMPRESA,\r\n         pVENTA_ACT_FIJ\r\n    FROM fza_facturas\r\n   WHERE SERIE_FACTURA = pSERIE_FACTURA\r\n     AND NRO_FACTURA = pNRO_FACTURA;\r\n  IF (pREG_AG_EMP = \'S\') THEN\r\n    SET pAPLICA_RETENCIONES_EMP = \'S\';\r\n    SET pAPLICA_RECARGO = \'N\';\r\n    IF ( EXISTS(SELECT CODIGO_EMPRESA \r\n                  FROM vi_ivas_empresa \r\n                 WHERE CODIGO_EMPRESA = pcodempresa \r\n                   AND ESIVAAGRICOLA_ZONA_IVA = \'S\') ) THEN\r\n      SELECT GRUPO_ZONA_IVA,\r\n             CODIGO_IVA, \r\n             PORCENNORMAL_IVA,\r\n             PORCENEXENTO_IVA,\r\n             PORCENREDUCIDO_IVA,\r\n             PORCENSUPERREDUCIDO_IVA\r\n        INTO pGRUPO_ZONA_IVA,\r\n             pCODIGO_IVA,\r\n             pPORCENN,\r\n             pPORCENE,\r\n             pPORCENR,\r\n             pPORCENS\r\n        FROM vi_ivas_empresa \r\n       WHERE ESIVAAGRICOLA_ZONA_IVA =\'S\'\r\n         AND CODIGO_EMPRESA = pCODEMPRESA\r\n         AND FECHA_DESDE_IVA <= pFECHA\r\n         AND (FECHA_HASTA_IVA IS NULL \r\n              OR FECHA_HASTA_IVA >= pFECHA);\r\n    END IF;\r\n  END IF;\r\n  IF (pINTRACOMUNITARIO = \'S\') THEN\r\n    SET pIVA_EXENTO = \'S\';\r\n    SET pAPLICA_RETENCIONES_CLI = \'N\';\r\n    SET pREG_AG_CLI = \'N\';\r\n  END IF;\r\n  IF ((pVENTA_ACT_FIJ = \'S\') AND (pREG_AG_EMP = \'S\')) THEN\r\n    SET pIVA_EXENTO = \'S\';   \r\n  END IF;    \r\n  IF ((pREG_AG_EMP = \'S\') AND (pREG_AG_CLI = \'S\')) THEN\r\n    SET pAPLICA_RETENCIONES_CLI = \'S\';\r\n    SET pIVA_EXENTO = \'S\';\r\n  END IF;\r\n  IF ((pREG_AG_EMP = \'S\') AND (pREG_AG_CLI = \'N\') AND \r\n      (pAPLICA_RETENCIONES_CLI=\'N\' )) THEN\r\n    SET pIVA_EXENTO = \'S\';\r\n  END IF;    \r\n  IF ((pREG_AG_EMP = \'S\') AND (pREG_AG_CLI = \'N\') AND \r\n      (pAPLICA_RETENCIONES_CLI=\'S\' )) THEN\r\n    SET pTIPOIVAF = \'N\';\r\n  END IF;\r\n  IF (pIVA_EXENTO = \'S\') THEN\r\n    SET pPORCENN = pPORCENE;\r\n    SET pPORCENR = pPORCENE;\r\n    SET pPORCENS = pPORCENE;\r\n    SET pPORCENE = pPORCENE;\r\n    SET pPORCENREN = 0;\r\n    SET pPORCENRER = 0;\r\n    SET pPORCENRES = 0;\r\n    SET pPORCENREE = 0;\r\n    SET pTIPOIVAF = \'E\';\r\n    SET pSUMBASEN = 0;\r\n    SET pSUMBASER = 0;\r\n    SET pSUMBASES = 0;\r\n    SET pSUMBASEE = pSUMBASEE +\r\n                    pSUMBASEN +\r\n                    pSUMBASER +\r\n                    pSUMBASES;\r\n  END IF;\r\n  OPEN CUR_LINEAS;\r\n  GETLINEAS: LOOP\r\n    FETCH CUR_LINEAS INTO pLINEA, \r\n                          pCODART, \r\n                          pPRECIOSIVA, \r\n                          pPRECIOCIVA, \r\n                          pPORCEN, \r\n                          pTIPO, \r\n                          pIMP_INCL, \r\n                          pCANTIDAD ;\r\n    IF finished = 1 THEN \r\n      LEAVE GETLINEAS;\r\n    END IF;\r\n    IF (pTIPOIVAF <> \'X\') THEN\r\n      SET pTIPO = pTIPOIVAF;\r\n    ELSE\r\n      IF (EXISTS( SELECT * \r\n                    FROM fza_articulos \r\n                   WHERE CODIGO_ARTICULO = pCODART ) ) THEN\r\n        SET pTIPO = (SELECT TIPOIVA_ARTICULO \r\n                       FROM fza_articulos \r\n                      WHERE CODIGO_ARTICULO = pCODART);\r\n      END IF;\r\n    END IF;\r\n    CASE pTIPO\r\n    WHEN  \'N\' THEN\r\n      SET pPORCEN = pPORCENN;\r\n      IF (pIMP_INCL = \'S\') THEN\r\n        SET pPRECIOSIVA = pPRECIOCIVA/(1+pPORCEN/100)*pCANTIDAD;\r\n      END IF;\r\n      SET pSUMBASEN = PSUMBASEN + pPRECIOSIVA;\r\n    WHEN \'R\' THEN\r\n      SET pPORCEN = pPORCENR;\r\n      IF (pIMP_INCL = \'S\') THEN\r\n        SET pPRECIOSIVA = pPRECIOCIVA/(1+pPORCEN/100)*pCANTIDAD;\r\n      END IF;\r\n      SET pSUMBASER = PSUMBASER + pPRECIOSIVA;\r\n    WHEN \'S\' THEN\r\n      SET pPORCEN = pPORCENS;\r\n      IF (pIMP_INCL = \'S\') THEN\r\n        SET pPRECIOSIVA = pPRECIOCIVA/(1+pPORCEN/100)*pCANTIDAD;\r\n      END IF;\r\n      SET pSUMBASES = PSUMBASES + pPRECIOSIVA;\r\n    WHEN \'E\' THEN\r\n       SET pPORCEN = pPORCENE;\r\n        IF (pIMP_INCL = \'S\') THEN\r\n          SET pPRECIOSIVA = pPRECIOCIVA/(1+pPORCEN/100)*pCANTIDAD;\r\n        END IF;\r\n        SET pSUMBASEE = PSUMBASEE + pPRECIOSIVA;\r\n    END CASE;\r\n    IF (pIMP_INCL = \'S\') THEN\r\n      UPDATE FZA_FACTURAS_LINEAS \r\n         SET PORCEN_IVA_FACTURA_LINEA = pPORCEN,\r\n             TIPOIVA_ARTICULO_FACTURA_LINEA = pTIPO,\r\n             PRECIOVENTA_SIVA_ARTICULO_FACTURA_LINEA = \r\n                       PRECIOVENTA_CIVA_ARTICULO_FACTURA_LINEA/(1+pPORCEN/100),\r\n             TOTAL_FACTURA_LINEA = \r\n               CANTIDAD_FACTURA_LINEA * PRECIOVENTA_CIVA_ARTICULO_FACTURA_LINEA\r\n       WHERE SERIE_FACTURA_LINEA = pSERIE_FACTURA \r\n         AND NRO_FACTURA_LINEA = pNRO_FACTURA\r\n             AND LINEA_FACTURA_LINEA = pLINEA; \r\n    ELSE\r\n      UPDATE FZA_FACTURAS_LINEAS \r\n         SET PORCEN_IVA_FACTURA_LINEA = pPORCEN,\r\n             TIPOIVA_ARTICULO_FACTURA_LINEA = pTIPO,\r\n             PRECIOVENTA_CIVA_ARTICULO_FACTURA_LINEA = \r\n                      PRECIOVENTA_SIVA_ARTICULO_FACTURA_LINEA*(1+pPORCEN/100) ,\r\n             TOTAL_FACTURA_LINEA = \r\n               CANTIDAD_FACTURA_LINEA * PRECIOVENTA_CIVA_ARTICULO_FACTURA_LINEA\r\n        WHERE SERIE_FACTURA_LINEA = pSERIE_FACTURA \r\n          AND NRO_FACTURA_LINEA = pNRO_FACTURA\r\n          AND LINEA_FACTURA_LINEA = pLINEA; \r\n    END IF;\r\n  END LOOP GETLINEAS;\r\n  SET PTOTBASES = pSUMBASEN + pSUMBASER + pSUMBASES + pSUMBASEE;\r\n  SET pTOTN = pSUMBASEN * (1 + pPORCENN/100) - pSUMBASEN;\r\n  SET pTOTR = pSUMBASER * (1 + pPORCENR/100) - pSUMBASER;\r\n  SET pTOTS = pSUMBASES * (1 + pPORCENS/100) - pSUMBASES;\r\n  SET pTOTE = pSUMBASEE * (1 + pPORCENE/100) - pSUMBASEE;\r\n  SET pSUMTOT = pTOTN + pTOTR + pTOTS + pTOTE;\r\n  IF ( (pIVA_RECARGO =\'S\') AND (pAPLICA_RECARGO = \'S\') ) THEN\r\n    SET pTOTRECN = pSUMBASEN * (1 + pPORCENREN/100) - pSUMBASEN;\r\n    SET pTOTRECS = pSUMBASES * (1 + pPORCENRES/100) - pSUMBASES;\r\n    SET pTOTRECE = pSUMBASEE * (1 + pPORCENREE/100) - pSUMBASEE;\r\n    SET pSUMTOTREC = pTOTRECN + pTOTRECR + pTOTRECS + pTOTRECE;\r\n  ELSE \r\n    SET pTOTRECN = 0;\r\n    SET pTOTRECR = 0;\r\n    SET pTOTRECS = 0;\r\n    SET pTOTRECE = 0;\r\n    SET pSUMTOTREC = 0;\r\n  END IF;\r\n  IF ( (pAPLICA_RETENCIONES_CLI = \'S\') AND\r\n       (pAPLICA_RETENCIONES_EMP = \'S\')        \r\n     ) THEN \r\n    IF (pPORCENRET = 0) THEN \r\n      SET pPORCENRET = (SELECT PORCENRETENCION_RETENCION \r\n                          FROM fza_empresas_retenciones \r\n                         WHERE CODIGO_EMPRESA_RETENCION = pCODEMPRESA\r\n                           AND FECHA_DESDE_RETENCION <= pFECHA\r\n                           AND (    FECHA_HASTA_RETENCION >= pFECHA\r\n                                OR FECHA_HASTA_RETENCION IS NULL) LIMIT 1); \r\n    END IF;\r\n    IF (pIRPF_IMP_INCL = \'S\') THEN\r\n      SET pTOTALRET = (pTOTBASES + pSUMTOT ) * (pPORCENRET/100);\r\n    ELSE\r\n      SET pTOTALRET = pTOTBASES * (pPORCENRET/100);\r\n    END IF;\r\n    IF ((pVENTA_ACT_FIJ = \'S\') AND (pREG_AG_EMP = \'S\')) THEN\r\n      SET pPORCENRET = 0;\r\n      SET PTOTALRET = 0;\r\n    END IF;\r\n  ELSE\r\n    SET pPORCENRET = 0;\r\n    SET PTOTALRET = 0;\r\n  END IF;\r\n  UPDATE fza_facturas \r\n     SET TOTAL_BASEI_IVAN_FACTURA = pSUMBASEN,\r\n         TOTAL_BASEI_IVAR_FACTURA = pSUMBASER,\r\n         TOTAL_BASEI_IVAS_FACTURA = pSUMBASES,\r\n         TOTAL_BASEI_IVAE_FACTURA = pSUMBASEE,\r\n         TOTAL_IVAN_FACTURA = pTOTN,\r\n         TOTAL_IVAR_FACTURA = pTOTR,\r\n         TOTAL_IVAS_FACTURA = pTOTS,\r\n         TOTAL_IVAE_FACTURA = pTOTE,\r\n         TOTAL_REN_FACTURA = PTOTRECN,\r\n         TOTAL_RER_FACTURA = PTOTRECR,\r\n         TOTAL_RES_FACTURA = PTOTRECS,\r\n         TOTAL_REE_FACTURA = PTOTRECE,\r\n         TOTAL_BASES_FACTURA = pTOTBASES,\r\n         TOTAL_RETENCION_FACTURA = pTOTALRET,\r\n         TOTAL_LIQUIDO_FACTURA = pTOTBASES + \r\n                                 pSUMTOT - \r\n                                 PTOTALRET + \r\n                                 pSUMTOTREC,\r\n         ESIVA_EXENTO_CLIENTE_FACTURA = pIVA_EXENTO,\r\n         ESRETENCIONES_CLIENTE_FACTURA = pAPLICA_RETENCIONES_CLI,\r\n         ESRETENCIONES_EMPRESA_FACTURA = pAPLICA_RETENCIONES_EMP,\r\n         ESIVA_RECARGO_CLIENTE_FACTURA = pAPLICA_RECARGO,\r\n         TOTAL_IMPUESTOS_FACTURA = pSUMTOTREC + pSUMTOT,\r\n         GRUPO_ZONA_IVA_EMPRESA_FACTURA = pGRUPO_ZONA_IVA,\r\n         CODIGO_IVA_FACTURA = pCODIGO_IVA,\r\n         PORCEN_IVAN_FACTURA = pPORCENN,\r\n         PORCEN_IVAE_FACTURA = pPORCENE,\r\n         PORCEN_IVAR_FACTURA = pPORCENR,\r\n         PORCEN_IVAS_FACTURA = pPORCENS,\r\n         PORCEN_RETENCION_FACTURA = pPORCENRET\r\n   WHERE NRO_FACTURA = pNRO_FACTURA \r\n     AND SERIE_FACTURA = pSERIE_FACTURA;\r\nEND','2023-10-22 13:34:17','2023-10-19 13:28:35','Administrador','Administrador');
INSERT INTO `fza_generadorprocesos`(`CODIGO_GENERADORPROCESO`, `NOMBRE_GENERADORPROCESO`, `PROCESO_GENERADORPROCESO`, `INSTANTEMODIF`, `INSTANTEALTA`, `USUARIOALTA`, `USUARIOMODIF`) VALUES
 ('009','BORRADO PERFILES PANTALLAS','DELETE \r\n  FROM fza_usuarios_perfiles \r\n where KEY_PERFILES IN (\'frmMtoArticulos\', \r\n                        \'dmArticulos\', \r\n                        \'frmMtoEmpresas\', \r\n                        \'dmEmpresas\',\r\n                        \'frmMtoClientes\',\r\n                        \'dmClientes\',\r\n                        \'frmMtoFacturas\',\r\n                        \'dmFacturas\', \r\n                        \'frmMtoFamilias\',\r\n                        \'dmFamilias\', \r\n                        \'frmMtoUsuarios\',\r\n                        \'dmUsuarios\', \r\n                        \'frmMtoProveedores\',\r\n                        \'dmProveedores\', \r\n                        \'frmMtoFormasdePago\',\r\n                        \'dmFormasdePago\',\r\n                        \'frmMtoGeneradorProcesos\',\r\n                        \'frmMtoIvas\',\r\n                        \'dmIvas\', \r\n                        \'frmMtoContadores\',\r\n                        \'dmContadores\',\r\n                        \'frmMtoGrupos\',\r\n                        \'dmGrupos\',\r\n                        \'frmMtoIvasGrupos\',\r\n                        \'dmIvasGrupos\')\r\n                         ','2023-12-14 11:58:15','2023-10-22 13:29:02','Administrador','Administrador'),
 ('010','MODICACION VISTA vi_fac_lin_busquedas','ALTER ALGORITHM = UNDEFINED DEFINER = `root`@`localhost`SQL SECURITY DEFINER VIEW`vi_fac_lin_busquedas`AS\r\nSELECT\r\n  `fza_facturas_lineas`.`NRO_FACTURA_LINEA` AS `NRO_FACTURA_LINEA`\r\n, `fza_facturas_lineas`.`SERIE_FACTURA_LINEA`AS`SERIE_FACTURA_LINEA`\r\n, `fza_facturas_lineas`.`LINEA_FACTURA_LINEA`AS`LINEA_FACTURA_LINEA`\r\n, `fza_facturas_lineas`.`CODIGO_ARTICULO_FACTURA_LINEA`AS`CODIGO_ARTICULO_FACTURA_LINEA`\r\n, `fza_facturas_lineas`.`CODIGO_FAMILIA_FACTURA_LINEA`AS`CODIGO_FAMILIA_FACTURA_LINEA`\r\n, `fza_facturas_lineas`.`NOMBRE_FAMILIA_FACTURA_LINEA`AS`NOMBRE_FAMILIA_FACTURA_LINEA`\r\n, `fza_facturas_lineas`.`FECHA_ENTREGA_FACTURA_LINEA`AS`FECHA_ENTREGA_FACTURA_LINEA`\r\n, `fza_facturas_lineas`.`TIPO_CANTIDAD_ARTICULO_FACTURA_LINEA`AS`TIPO_CANTIDAD_ARTICULO_FACTURA_LINEA`\r\n, `fza_facturas_lineas`.`ESIMP_INCL_TARIFA_FACTURA_LINEA`AS`ESIMP_INCL_TARIFA_FACTURA_LINEA`\r\n, `fza_facturas_lineas`.`TIPOIVA_ARTICULO_FACTURA_LINEA`AS`TIPOIVA_ARTICULO_FACTURA_LINEA`\r\n, `fza_ivas_tipos`.`NOMBRE_TIPO_IVA`AS`NOMBRE_TIPO_IVA`\r\n, `fza_facturas_lineas`.`DESCRIPCION_ARTICULO_FACTURA_LINEA`AS`DESCRIPCION_ARTICULO_FACTURA_LINEA`\r\n, `fza_facturas_lineas`.`CODIGO_TARIFA_FACTURA_LINEA`AS`CODIGO_TARIFA_FACTURA_LINEA`\r\n, `fza_facturas_lineas`.`CANTIDAD_FACTURA_LINEA`AS`CANTIDAD_FACTURA_LINEA`\r\n, `fza_facturas_lineas`.`PRECIOVENTA_SIVA_ARTICULO_FACTURA_LINEA`AS`PRECIOVENTA_SIVA_ARTICULO_FACTURA_LINEA`\r\n, `fza_facturas_lineas`.`PORCEN_IVA_FACTURA_LINEA`AS`PORCEN_IVA_FACTURA_LINEA`\r\n, `fza_facturas_lineas`.`PRECIOVENTA_CIVA_ARTICULO_FACTURA_LINEA`AS`PRECIOVENTA_CIVA_ARTICULO_FACTURA_LINEA`\r\n, `fza_facturas_lineas`.`TOTAL_FACTURA_LINEA`AS`TOTAL_FACTURA_LINEA`\r\n, `fza_facturas`.`CODIGO_CLIENTE_FACTURA` AS `CODIGO_CLIENTE_FACTURA`\r\n, `fza_facturas`.CODIGO_EMPRESA_FACTURA AS `CODIGO_EMPRESA_FACTURA`\r\nFROM (`fza_facturas_lineas`\r\nLEFT JOIN fza_facturas \r\nON (fza_facturas_lineas.NRO_FACTURA_LINEA = fza_facturas.NRO_FACTURA AND fza_facturas_lineas.SERIE_FACTURA_LINEA = fza_facturas.SERIE_FACTURA)\r\nLEFT JOIN `fza_ivas_tipos`\r\n ON (`fza_facturas_lineas`.`TIPOIVA_ARTICULO_FACTURA_LINEA` = `fza_ivas_tipos`.`CODIGO_ABREVIATURA_TIPO_IVA`) )','2023-10-28 13:44:21','2023-10-28 13:37:20','Administrador','Administrador'),
 ('011','SELECT','SELECT * FROM vi_fac_lin_busquedas','2023-10-28 13:40:27','2023-10-28 13:39:47','Administrador','Administrador');

DROP TABLE IF EXISTS `fza_ivas`;
CREATE TABLE `fza_ivas` (
  `CODIGO_IVA` varchar(20) NOT NULL DEFAULT '0',
  `GRUPO_ZONA_IVA` varchar(10) NOT NULL,
  `DESCRIPCION_ZONA_IVA` varchar(100) NOT NULL,
  `PORCENEXENTO_IVA` decimal(18,6) unsigned NOT NULL DEFAULT 0.000000,
  `PORCENEXENTO_RE_IVA` decimal(18,6) unsigned NOT NULL DEFAULT 0.000000,
  `PORCENNORMAL_IVA` decimal(18,6) unsigned NOT NULL DEFAULT 0.000000,
  `PORCENNORMAL_RE_IVA` decimal(18,6) unsigned NOT NULL DEFAULT 0.000000,
  `PORCENREDUCIDO_IVA` decimal(18,6) unsigned NOT NULL DEFAULT 0.000000,
  `PORCENREDUCIDO_RE_IVA` decimal(18,6) unsigned NOT NULL DEFAULT 0.000000,
  `PORCENSUPERREDUCIDO_IVA` decimal(18,6) unsigned NOT NULL DEFAULT 0.000000,
  `PORCENSUPERREDUCIDO_RE_IVA` decimal(18,6) unsigned NOT NULL DEFAULT 0.000000,
  `FECHA_DESDE_IVA` date NOT NULL,
  `FECHA_HASTA_IVA` date DEFAULT NULL,
  `INSTANTEMODIF` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `INSTANTEALTA` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `USUARIOALTA` varchar(100) NOT NULL,
  `USUARIOMODIF` varchar(100) NOT NULL,
  PRIMARY KEY (`CODIGO_IVA`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci ROW_FORMAT=DYNAMIC;

INSERT INTO `fza_ivas`(`CODIGO_IVA`, `GRUPO_ZONA_IVA`, `DESCRIPCION_ZONA_IVA`, `PORCENEXENTO_IVA`, `PORCENEXENTO_RE_IVA`, `PORCENNORMAL_IVA`, `PORCENNORMAL_RE_IVA`, `PORCENREDUCIDO_IVA`, `PORCENREDUCIDO_RE_IVA`, `PORCENSUPERREDUCIDO_IVA`, `PORCENSUPERREDUCIDO_RE_IVA`, `FECHA_DESDE_IVA`, `FECHA_HASTA_IVA`, `INSTANTEMODIF`, `INSTANTEALTA`, `USUARIOALTA`, `USUARIOMODIF`) VALUES
 ('017','003','IVA PORTUGAL',0.000000,0.000000,20.000000,2.000000,9.000000,1.000000,2.000000,1.000000,'1999-08-01',NULL,'2023-11-17 12:37:19','2023-11-17 12:37:19','Administrador','Administrador'),
 ('1','1','ESPAÑA PENINSULA',0.000000,0.000000,21.000000,5.200000,10.000000,1.400000,4.000000,0.500000,'1999-04-28',NULL,'2023-10-22 14:16:22','2021-04-28 21:03:03','Administrador','Administrador'),
 ('2','2','COMPENSACIÓN AGRARIA',0.000000,0.000000,12.000000,0.000000,0.000000,0.000000,0.000000,0.000000,'1999-08-01',NULL,'2023-10-22 14:16:16','2022-05-27 20:04:13','Administrador','Administrador'),
 ('3','5','IGIC CANARIAS',0.000000,0.000000,5.000000,0.000000,0.000000,0.000000,0.000000,0.000000,'1999-08-01',NULL,'2023-04-28 12:43:22','2022-05-27 20:05:09','Administrador','Administrador'),
 ('4','3','IPSI CEUTA Y MELILLA',0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,'1999-08-01',NULL,'2023-05-12 13:58:57','2023-01-19 10:27:01','Administrador','Administrador');

DROP TABLE IF EXISTS `fza_ivas_grupos`;
CREATE TABLE `fza_ivas_grupos` (
  `GRUPO_ZONA_IVA` varchar(10) NOT NULL DEFAULT '0',
  `DESCRIPCION_ZONA_IVA` varchar(100) NOT NULL,
  `ESIRPF_IMP_INCL_ZONA_IVA` varchar(1) DEFAULT 'N',
  `ESIVAAGRICOLA_ZONA_IVA` varchar(1) DEFAULT 'N',
  `ESAPLICA_RE_ZONA_IVA` varchar(1) DEFAULT 'S' COMMENT 'Cuando el grupo de iva no aplica RE en sus documentos',
  `ESDEFAULT_ZONA_IVA` varchar(1) DEFAULT 'N',
  `PALABRA_REPORTS_ZONA_IVA` varchar(10) DEFAULT 'IVA',
  `INSTANTEMODIF` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `INSTANTEALTA` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `USUARIOALTA` varchar(100) NOT NULL,
  `USUARIOMODIF` varchar(100) NOT NULL,
  PRIMARY KEY (`GRUPO_ZONA_IVA`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci ROW_FORMAT=DYNAMIC;

INSERT INTO `fza_ivas_grupos`(`GRUPO_ZONA_IVA`, `DESCRIPCION_ZONA_IVA`, `ESIRPF_IMP_INCL_ZONA_IVA`, `ESIVAAGRICOLA_ZONA_IVA`, `ESAPLICA_RE_ZONA_IVA`, `ESDEFAULT_ZONA_IVA`, `PALABRA_REPORTS_ZONA_IVA`, `INSTANTEMODIF`, `INSTANTEALTA`, `USUARIOALTA`, `USUARIOMODIF`) VALUES
 ('003','IVA PORTUGUES','N','N','S','N','IVAÇ','2023-11-17 12:36:00','2023-11-17 12:36:00','Administrador','Administrador'),
 ('1','ESPAÑA PENINSULA','N','N','S','S','IVA','2023-01-29 10:01:39','2022-08-31 15:18:11','Administrador','Administrador'),
 ('2','COMPENSACIÓN AGRARIA Y FORESTAL','S','S','N','N','REAGP','2023-04-24 13:07:34','2022-08-31 15:18:41','Administrador','Administrador'),
 ('3','IGIC CANARIAS','N','N','S','N','IGIC','2022-10-26 15:03:54','2022-08-31 15:19:52','Administrador','Administrador'),
 ('5','CEUTA Y MELILLA','N','N','S','N','IPSI','2023-01-27 10:05:22','2023-01-19 10:24:36','Administrador','Administrador');

DROP TABLE IF EXISTS `fza_ivas_tipos`;
CREATE TABLE `fza_ivas_tipos` (
  `CODIGO_ABREVIATURA_TIPO_IVA` varchar(1) DEFAULT NULL,
  `NOMBRE_TIPO_IVA` varchar(20) DEFAULT NULL,
  `INSTANTEMODIF` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `INSTANTEALTA` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `USUARIOALTA` varchar(100) NOT NULL,
  `USUARIOMODIF` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci ROW_FORMAT=DYNAMIC;

INSERT INTO `fza_ivas_tipos`(`CODIGO_ABREVIATURA_TIPO_IVA`, `NOMBRE_TIPO_IVA`, `INSTANTEMODIF`, `INSTANTEALTA`, `USUARIOALTA`, `USUARIOMODIF`) VALUES
 ('N','Normal','2023-03-09 18:12:55','2023-03-09 18:12:47','Administrador','Administrador'),
 ('R','Reducido','2023-03-09 18:13:09','2023-03-09 18:13:03','Administrador','Administrador'),
 ('S','Súper Reducido','2023-03-09 18:13:31','2023-03-09 18:13:24','Administrador','Administrador'),
 ('E','Exento','2023-03-09 18:13:48','2023-03-09 18:13:40','Administrador','Administrador');

DROP TABLE IF EXISTS `fza_ivas_zonas`;
CREATE TABLE `fza_ivas_zonas` (
  `CODIGO_ZONA_IVA` int(11) NOT NULL,
  `DESCRIPCION_ZONA_IVA` varchar(100) DEFAULT NULL,
  `ESDEFAULT_ZONA_IVA` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`CODIGO_ZONA_IVA`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci ROW_FORMAT=DYNAMIC;

INSERT INTO `fza_ivas_zonas`(`CODIGO_ZONA_IVA`, `DESCRIPCION_ZONA_IVA`, `ESDEFAULT_ZONA_IVA`) VALUES
 (0,'ESPAÑA PENÍNSULA','S'),
 (1,'INTRACOMUNITARIA','N');

DROP TABLE IF EXISTS `fza_log`;
CREATE TABLE `fza_log` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `FECHAHORA_LOG` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `FECHAHORA_MACHINE_LOG` datetime DEFAULT NULL,
  `USUARIO_LOG` varchar(100) DEFAULT NULL,
  `CLASS_ERROR_LOG` varchar(20) DEFAULT NULL,
  `TIPO_MENSAJE_LOG` varchar(25) DEFAULT NULL,
  `MENSAJE_LOG` varchar(200) DEFAULT NULL,
  `FORM_LOG` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=453 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci ROW_FORMAT=DYNAMIC;

DROP TABLE IF EXISTS `fza_metadatos`;
CREATE TABLE `fza_metadatos` (
  `CODIGO_METADATO` int(20) NOT NULL AUTO_INCREMENT,
  `NOMBRE_METADATO` varchar(100) NOT NULL,
  `PARENT_METADATO` varchar(20) NOT NULL,
  PRIMARY KEY (`CODIGO_METADATO`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=149 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci ROW_FORMAT=DYNAMIC;

INSERT INTO `fza_metadatos`(`CODIGO_METADATO`, `NOMBRE_METADATO`, `PARENT_METADATO`) VALUES
 (1,'Tablas','-1'),
 (2,'Vistas','-1'),
 (3,'Procedimientos','-1'),
 (4,'fza_articulos','1'),
 (5,'fza_articulos_familias','1'),
 (6,'fza_articulos_movimientos','1'),
 (7,'fza_articulos_proveedores','1'),
 (8,'fza_articulos_tarifas','1'),
 (9,'fza_articulos_variaciones_def','1'),
 (10,'fza_clientes','1'),
 (11,'fza_contadores','1'),
 (12,'fza_empresas','1'),
 (13,'fza_empresas_retenciones','1'),
 (14,'fza_empresas_series','1'),
 (15,'fza_facturas','1'),
 (16,'fza_facturas_lineas','1'),
 (17,'fza_formapago','1'),
 (18,'fza_generadorprocesos','1'),
 (19,'fza_ivas','1'),
 (20,'fza_ivas_grupos','1'),
 (21,'fza_ivas_tipos','1'),
 (22,'fza_ivas_zonas','1'),
 (23,'fza_log','1'),
 (24,'fza_metadatos','1'),
 (25,'fza_pedidos','1'),
 (26,'fza_pedidos_lineas','1'),
 (27,'fza_pedidos_mensajes','1'),
 (28,'fza_proveedores','1'),
 (29,'fza_recibos','1'),
 (30,'fza_tarifas','1'),
 (31,'fza_tipos_documentos','1'),
 (32,'fza_usuarios','1'),
 (33,'fza_usuarios_grupos','1'),
 (34,'fza_usuarios_perfiles','1'),
 (35,'fza_variaciones','1'),
 (36,'fza_variaciones_columnas','1'),
 (37,'fza_winforms','1'),
 (67,'vi_art_busquedas','2'),
 (68,'vi_articulos','2'),
 (69,'vi_articulos_familias','2'),
 (70,'vi_articulos_familias_list','2'),
 (71,'vi_articulos_list','2'),
 (72,'vi_articulos_proveedores','2'),
 (73,'vi_articulos_tarifas','2'),
 (74,'vi_cli_busquedas','2'),
 (75,'vi_clientes','2'),
 (76,'vi_contadores','2'),
 (77,'vi_emp_busquedas','2'),
 (78,'vi_empresas','2'),
 (79,'vi_empresas_retenciones','2'),
 (80,'vi_empresas_series','2'),
 (81,'vi_fac_busquedas','2'),
 (82,'vi_fac_lin_busquedas','2'),
 (83,'vi_facturas','2'),
 (84,'vi_facturas_lineas','2'),
 (85,'vi_facturas_print','2'),
 (86,'vi_formapago','2'),
 (87,'vi_ivas','2'),
 (88,'vi_ivas_empresa','2'),
 (89,'vi_ivas_grupos','2'),
 (90,'vi_ivas_zonas','2'),
 (91,'vi_proveedores','2'),
 (92,'vi_proveedores_articulos','2'),
 (93,'vi_recibos','2'),
 (94,'vi_tarifas','2'),
 (95,'vi_usuarios','2'),
 (96,'vi_usuarios_grupos','2'),
 (97,'vi_usuarios_perfiles','2'),
 (98,'vi_variaciones','2'),
 (130,'PRC_CALCULAR_FACTURA_NETOS','3'),
 (131,'PRC_CREAR_ACTUALIZAR_CLIENTE','3'),
 (132,'PRC_CREAR_ACTUALIZAR_EMPRESA','3'),
 (133,'PRC_CREAR_ACTUALIZAR_KEY','3'),
 (134,'PRC_CREAR_FACTURA_ABONO','3'),
 (135,'PRC_CREAR_FACTURA_DUPLICADA','3'),
 (136,'PRC_CREAR_METADATOS','3'),
 (137,'PRC_CREAR_RECIBOS_FACTURA','3'),
 (138,'PRC_FNC_GET_NEXT_LINEA_FACTURA','3'),
 (139,'PRC_FNC_GET_NEXT_LINEA_PRESUPUESTO','3'),
 (140,'PRC_FNC_GET_NEXT_NRO_DOC','3'),
 (141,'PRC_FNC_GET_SERIE_TIPODOC','3'),
 (142,'PRC_GET_DATA_ARTICULO','3'),
 (143,'PRC_GET_DATA_CLIENTE','3'),
 (144,'PRC_GET_IVA_ZONA_FECHA','3'),
 (145,'PRC_GET_NEXT_CONT','3'),
 (146,'PRC_GET_NEXT_CONT_FACT_SERIE','3'),
 (147,'PRC_GET_NUMEROS_A_LETRAS','3'),
 (148,'PRC_GET_NUMERO_MENOR_MIL','3');

DROP TABLE IF EXISTS `fza_pedidos`;
CREATE TABLE `fza_pedidos` (
  `NRO_PEDIDO` varchar(12) NOT NULL,
  `SERIE_PEDIDO` varchar(12) NOT NULL,
  `FECHA_PEDIDO` date DEFAULT NULL,
  `CODIGO_EMPRESA_PEDIDO` varchar(8) DEFAULT NULL,
  `RAZONSOCIAL_EMPRESA_PEDIDO` varchar(200) DEFAULT NULL,
  `NIF_EMPRESA_PEDIDO` varchar(50) DEFAULT NULL,
  `MOVIL_EMPRESA_PEDIDO` varchar(40) DEFAULT NULL,
  `EMAIL_EMPRESA_PEDIDO` varchar(200) DEFAULT NULL,
  `DIRECCION1_EMPRESA_PEDIDO` varchar(200) DEFAULT NULL,
  `DIRECCION2_EMPRESA_PEDIDO` varchar(200) DEFAULT NULL,
  `POBLACION_EMPRESA_PEDIDO` varchar(200) DEFAULT NULL,
  `PROVINCIA_EMPRESA_PEDIDO` varchar(200) DEFAULT NULL,
  `PAIS_EMPRESA_PEDIDO` varchar(150) DEFAULT NULL,
  `CPOSTAL_EMPRESA_PEDIDO` varchar(15) DEFAULT NULL,
  `ESRETENCIONES_EMPRESA_PEDIDO` varchar(1) DEFAULT 'N' COMMENT 'S o N si la empresa aplica retenciones como autónomos',
  `GRUPO_ZONA_IVA_EMPRESA_PEDIDO` varchar(10) DEFAULT NULL,
  `ESREGIMENESPECIALAGRICOLA_EMPRESA_PEDIDO` varchar(1) DEFAULT 'N',
  `CODIGO_CLIENTE_PEDIDO` varchar(10) DEFAULT NULL,
  `NIF_CLIENTE_PEDIDO` varchar(50) DEFAULT NULL,
  `EMAIL_CLIENTE_PEDIDO` varchar(200) DEFAULT NULL,
  `REFERENCIAPS_PEDIDO` varchar(20) DEFAULT NULL,
  `IDPS_PEDIDO` varchar(20) DEFAULT NULL,
  `FECHAPS_PEDIDO` datetime DEFAULT NULL,
  `FORMAPAGOPS_PEDIDO` varchar(200) DEFAULT NULL,
  `TRANSPORTISTAPS_PEDIDO` varchar(200) DEFAULT NULL,
  `ESTADOPEDIDOPS_PEDIDO` varchar(300) DEFAULT NULL,
  `ESTADOMENSAJEPS_PEDIDO` varchar(300) DEFAULT NULL,
  `IDHILOPS_MENSAJES_PEDIDO` varchar(20) DEFAULT NULL,
  `NOMBRE_CLIENTE_ENVIO_PEDIDO` varchar(200) DEFAULT NULL,
  `MOVIL_CLIENTE_ENVIO_PEDIDO` varchar(40) DEFAULT NULL,
  `DIRECCION1_CLIENTE_ENVIO_PEDIDO` varchar(200) DEFAULT NULL,
  `DIRECCION2_CLIENTE_ENVIO_PEDIDO` varchar(200) DEFAULT NULL,
  `POBLACION_CLIENTE_ENVIO_PEDIDO` varchar(200) DEFAULT NULL,
  `PROVINCIA_CLIENTE_ENVIO_PEDIDO` varchar(200) DEFAULT NULL,
  `CPOSTAL_CLIENTE_ENVIO_PEDIDO` varchar(15) DEFAULT NULL,
  `PAIS_CLIENTE_ENVIO_PEDIDO` varchar(150) DEFAULT NULL,
  `RAZONSOCIAL_CLIENTE_FISCAL_PEDIDO` varchar(200) DEFAULT NULL,
  `MOVIL_CLIENTE_FISCAL_PEDIDO` varchar(40) DEFAULT NULL,
  `EMAIL_CLIENTE_FISCAL_PEDIDO` varchar(200) DEFAULT NULL,
  `DIRECCION1_CLIENTE_FISCAL_PEDIDO` varchar(200) DEFAULT NULL,
  `DIRECCION2_CLIENTE_FISCAL_PEDIDO` varchar(200) DEFAULT NULL,
  `POBLACION_CLIENTE_FISCAL_PEDIDO` varchar(200) DEFAULT NULL,
  `PROVINCIA_CLIENTE_FISCAL_PEDIDO` varchar(200) DEFAULT NULL,
  `CPOSTAL_CLIENTE_FISCAL_PEDIDO` varchar(15) DEFAULT NULL,
  `PAIS_CLIENTE_FISCAL_PEDIDO` varchar(150) DEFAULT NULL,
  `ESIVA_RECARGO_CLIENTE_PEDIDO` varchar(1) DEFAULT 'N',
  `ESIVA_EXENTO_CLIENTE_PEDIDO` varchar(1) DEFAULT 'N',
  `ESREGIMENESPECIALAGRICOLA_CLIENTE_PEDIDO` varchar(1) DEFAULT 'N',
  `ESRETENCIONES_CLIENTE_PEDIDO` varchar(1) DEFAULT 'S' COMMENT 'S o N Si el cliente aplica retenciones',
  `TARIFA_ARTICULO_CLIENTE_PEDIDO` varchar(10) DEFAULT NULL COMMENT 'Código de la tarifa que viene del cliente o configurada por el usuario',
  `ESIMP_INCL_TARIFA_CLIENTE_PEDIDO` varchar(1) DEFAULT 'S' COMMENT 'Si el precio de la tarifa del cliente es con impuestos incl o no',
  `ESINTRACOMUNITARIO_CLIENTE_PEDIDO` varchar(1) DEFAULT 'N' COMMENT 'Si la venta es hacia un país de la UE',
  `ESIRPF_IMP_INCL_ZONA_IVA_PEDIDO` varchar(1) DEFAULT 'N' COMMENT 'Si la base del cáculo del irpf se hace desde BI o BI con impuestos',
  `ESAPLICA_RE_ZONA_IVA_PEDIDO` varchar(1) DEFAULT 'S' COMMENT 'Si el tipo de IVA aplica Recargo de Equivalencia o no',
  `ESIVAAGRICOLA_ZONA_IVA_PEDIDO` varchar(1) DEFAULT 'N' COMMENT 'Si el tipo de IVA es compatible con REAGP',
  `PALABRA_REPORTS_ZONA_IVA_PEDIDO` varchar(10) DEFAULT 'IVA' COMMENT 'Palabra que sustituye a IVA desde la tabla de fza_ivas_grupos',
  `CODIGO_IVA_PEDIDO` varchar(20) DEFAULT NULL COMMENT 'Código de IVA de la tabla fza_ivas',
  `ESVENTA_ACTIVO_FIJO_PEDIDO` varchar(1) DEFAULT 'N' COMMENT 'Sólo REAGP cuando se vende activos fijos, exime irpf',
  `PORCEN_IVAN_PEDIDO` decimal(19,6) DEFAULT NULL COMMENT 'Porcentaje IVA Normal',
  `TOTAL_IVAN_PEDIDO` decimal(18,6) DEFAULT NULL COMMENT 'Total IVA Normal',
  `PORCEN_REN_PEDIDO` decimal(19,6) DEFAULT NULL COMMENT 'Porcentaje RE Normal',
  `TOTAL_REN_PEDIDO` decimal(19,6) DEFAULT NULL COMMENT 'Total RE Normal',
  `TOTAL_BASEI_IVAN_PEDIDO` decimal(18,6) DEFAULT NULL COMMENT 'Total Base Imponible IVA Normal',
  `PORCEN_IVAR_PEDIDO` decimal(19,6) DEFAULT NULL COMMENT 'Porcentaje IVA Reducido',
  `TOTAL_IVAR_PEDIDO` decimal(18,6) DEFAULT NULL COMMENT 'TotaL IVA Reducido',
  `PORCEN_RER_PEDIDO` decimal(19,6) DEFAULT NULL COMMENT 'Porcentaje RE Reducido',
  `TOTAL_RER_PEDIDO` decimal(19,6) DEFAULT NULL COMMENT 'Total RE Reducido',
  `TOTAL_BASEI_IVAR_PEDIDO` decimal(18,6) DEFAULT NULL COMMENT 'Total Base Imponible IVA Reducido',
  `PORCEN_IVAS_PEDIDO` decimal(19,6) DEFAULT NULL COMMENT 'Porcentaje IVA SuperReducido',
  `TOTAL_IVAS_PEDIDO` decimal(18,6) DEFAULT NULL COMMENT 'Total IVA SuperReducido',
  `PORCEN_RES_PEDIDO` decimal(19,6) DEFAULT NULL COMMENT 'Porcentaje IVA SuperReducido',
  `TOTAL_RES_PEDIDO` decimal(19,6) DEFAULT NULL COMMENT 'Total RE SuperReducido',
  `TOTAL_BASEI_IVAS_PEDIDO` decimal(18,6) DEFAULT NULL COMMENT 'Total sin IVA SuperReducido',
  `PORCEN_IVAE_PEDIDO` decimal(19,6) DEFAULT NULL COMMENT 'Porcentaje IVA Exento',
  `TOTAL_IVAE_PEDIDO` decimal(18,6) DEFAULT NULL COMMENT 'Total IVA Exento',
  `PORCEN_REE_PEDIDO` decimal(19,6) DEFAULT NULL COMMENT 'Porcentaje IVA1 Exento',
  `TOTAL_REE_PEDIDO` decimal(19,6) DEFAULT NULL COMMENT 'Total RE Exento',
  `TOTAL_BASEI_IVAE_PEDIDO` decimal(18,6) DEFAULT NULL COMMENT 'Total sin IVA Exento',
  `TOTAL_BASES_PEDIDO` decimal(18,6) DEFAULT NULL COMMENT 'Total Todas las bases imponibles',
  `TOTAL_IMPUESTOS_PEDIDO` decimal(18,6) DEFAULT NULL COMMENT 'Total de todos los impuestos iva + re',
  `FORMA_PAGO_PEDIDO` varchar(200) DEFAULT NULL COMMENT 'Codigo Forma de Pago',
  `PORCEN_RETENCION_PEDIDO` decimal(19,6) DEFAULT NULL COMMENT 'Porcentaje Retenciones',
  `TOTAL_RETENCION_PEDIDO` decimal(18,6) DEFAULT NULL COMMENT 'Total Retenciones PEDIDO',
  `TOTAL_LIQUIDO_PEDIDO` decimal(18,6) DEFAULT NULL COMMENT 'Total PEDIDO a pagar',
  `TOTAL_PAGADOREALPS_PEDIDO` decimal(18,6) DEFAULT NULL COMMENT 'Total pagado cliente',
  `NRO_PEDIDO_ABONO_PEDIDO` varchar(8) DEFAULT NULL COMMENT 'Nro PEDIDO Abono',
  `SERIE_PEDIDO_ABONO_PEDIDO` varchar(8) DEFAULT NULL COMMENT 'Serie PEDIDO Abono',
  `TEXTO_LEGAL_PEDIDO_CLIENTE_PEDIDO` varchar(1000) DEFAULT '',
  `TEXTO_LEGAL_PEDIDO_EMPRESA_PEDIDO` varchar(1000) DEFAULT '',
  `DOCUMENTO_PEDIDO` blob DEFAULT NULL COMMENT 'Copia en PDF del documento final',
  `COMENTARIOS_PEDIDO` varchar(1000) DEFAULT '',
  `CONTADOR_LINEAS_PEDIDO` varchar(8) DEFAULT NULL COMMENT 'Contador de lineas para lineas de PEDIDO',
  `ESCREARARTICULOS_PEDIDO` varchar(1) DEFAULT NULL COMMENT 'S o N si se crean articulos desde el detalle',
  `ESDESCRIPCIONES_AMP_PEDIDO` varchar(1) DEFAULT 'S' COMMENT 'S o N si la PEDIDO contiene una descripción larga',
  `ESFECHADEENTREGA_PEDIDO` varchar(1) DEFAULT NULL COMMENT 'S o N si las descripciones tienen fecha de entrega',
  `INSTANTEMODIF` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `INSTANTEALTA` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `USUARIOALTA` varchar(100) NOT NULL,
  `USUARIOMODIF` varchar(100) NOT NULL,
  PRIMARY KEY (`SERIE_PEDIDO`,`NRO_PEDIDO`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci ROW_FORMAT=DYNAMIC;

DROP TABLE IF EXISTS `fza_pedidos_lineas`;
CREATE TABLE `fza_pedidos_lineas` (
  `NRO_PEDIDO_LINEA` varchar(12) NOT NULL,
  `SERIE_PEDIDO_LINEA` varchar(12) NOT NULL,
  `LINEA_PEDIDO_LINEA` varchar(3) NOT NULL,
  `IDLINEAPS_PEDIDO_LINEA` varchar(12) DEFAULT NULL,
  `IDPRODPS_PEDIDO_LINEA` varchar(20) DEFAULT NULL,
  `CODIGOPRODPS_PEDIDO_LINEA` varchar(200) DEFAULT NULL,
  `IDATRIBPRODPS_PEDIDO_LINEA` varchar(20) DEFAULT NULL,
  `CODEAN13PRODPS_PEDIDO_LINEA` varchar(20) DEFAULT NULL,
  `CODIGO_ARTICULO_PEDIDO_LINEA` varchar(20) DEFAULT NULL,
  `CODIGO_FAMILIA_PEDIDO_LINEA` varchar(10) DEFAULT NULL,
  `NOMBRE_FAMILIA_PEDIDO_LINEA` varchar(150) DEFAULT NULL,
  `FECHA_ENTREGA_PEDIDO_LINEA` datetime DEFAULT NULL,
  `TIPO_CANTIDAD_ARTICULO_PEDIDO_LINEA` varchar(20) DEFAULT 'Uds',
  `ESIMP_INCL_TARIFA_PEDIDO_LINEA` varchar(1) DEFAULT 'S',
  `TIPOIVA_ARTICULO_PEDIDO_LINEA` varchar(2) DEFAULT 'N',
  `DESCRIPCION_ARTICULO_PEDIDO_LINEA` varchar(100) DEFAULT NULL,
  `CODIGO_TARIFA_PEDIDO_LINEA` varchar(10) DEFAULT NULL,
  `CANTIDAD_PEDIDO_LINEA` decimal(19,6) DEFAULT 1.000000,
  `PRECIOVENTA_SIVA_ARTICULO_PEDIDO_LINEA` decimal(19,6) DEFAULT 0.000000,
  `PORCEN_IVA_PEDIDO_LINEA` decimal(19,6) DEFAULT 0.000000,
  `PRECIOVENTA_CIVA_ARTICULO_PEDIDO_LINEA` decimal(19,6) DEFAULT 0.000000,
  `TOTAL_PEDIDO_LINEA` decimal(19,6) DEFAULT 0.000000,
  `INSTANTEMODIF` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `INSTANTEALTA` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `USUARIOALTA` varchar(100) NOT NULL,
  `USUARIOMODIF` varchar(100) NOT NULL,
  PRIMARY KEY (`SERIE_PEDIDO_LINEA`,`NRO_PEDIDO_LINEA`,`LINEA_PEDIDO_LINEA`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci ROW_FORMAT=DYNAMIC;

DROP TABLE IF EXISTS `fza_pedidos_mensajes`;
CREATE TABLE `fza_pedidos_mensajes` (
  `IDPS_MENSAJES_PEDIDO` varchar(20) NOT NULL,
  `IDMENSAJEPS_MENSAJE_PEDIDO` varchar(20) DEFAULT NULL,
  `IDEMPLEADOPS_MENSAJE_PEDIDO` varchar(20) DEFAULT NULL,
  `MENSAJEPS_MENSAJE_PEDIDO` varchar(1000) DEFAULT NULL,
  `FECHAPS_MENSAJE_PEDIDO` datetime DEFAULT NULL,
  `INSTANTEMODIF` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `INSTANTEALTA` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `USUARIOALTA` varchar(100) NOT NULL,
  `USUARIOMODIF` varchar(100) NOT NULL,
  PRIMARY KEY (`IDPS_MENSAJES_PEDIDO`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci ROW_FORMAT=DYNAMIC;

DROP TABLE IF EXISTS `fza_proveedores`;
CREATE TABLE `fza_proveedores` (
  `CODIGO_PROVEEDOR` int(11) NOT NULL,
  `ACTIVO_PROVEEDOR` varchar(1) DEFAULT 'S',
  `RAZONSOCIAL_PROVEEDOR` varchar(200) DEFAULT NULL,
  `NIF_PROVEEDOR` varchar(50) DEFAULT NULL,
  `MOVIL_PROVEEDOR` varchar(40) DEFAULT NULL,
  `EMAIL_PROVEEDOR` varchar(200) DEFAULT NULL,
  `DIRECCION1_PROVEEDOR` varchar(200) DEFAULT NULL,
  `DIRECCION2_PROVEEDOR` varchar(200) DEFAULT NULL,
  `POBLACION_PROVEEDOR` varchar(200) DEFAULT NULL,
  `PROVINCIA_PROVEEDOR` varchar(200) DEFAULT NULL,
  `CPOSTAL_PROVEEDOR` varchar(15) DEFAULT NULL,
  `PAIS_PROVEEDOR` varchar(150) DEFAULT NULL,
  `OBSERVACIONES_PROVEEDOR` text DEFAULT NULL,
  `REFERENCIA_PROVEEDOR` varchar(100) DEFAULT NULL,
  `CONTACTO_PROVEEDOR` varchar(100) DEFAULT NULL,
  `TELEFONO_CONTACTO_PROVEEDOR` varchar(100) DEFAULT NULL,
  `TELEFONO_PROVEEDOR` varchar(40) DEFAULT NULL,
  `IBAN_PROVEEDOR` varchar(100) DEFAULT NULL,
  `INSTANTEMODIF` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `INSTANTEALTA` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `USUARIOALTA` varchar(100) NOT NULL,
  `USUARIOMODIF` varchar(100) NOT NULL,
  PRIMARY KEY (`CODIGO_PROVEEDOR`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci ROW_FORMAT=DYNAMIC;

INSERT INTO `fza_proveedores`(`CODIGO_PROVEEDOR`, `ACTIVO_PROVEEDOR`, `RAZONSOCIAL_PROVEEDOR`, `NIF_PROVEEDOR`, `MOVIL_PROVEEDOR`, `EMAIL_PROVEEDOR`, `DIRECCION1_PROVEEDOR`, `DIRECCION2_PROVEEDOR`, `POBLACION_PROVEEDOR`, `PROVINCIA_PROVEEDOR`, `CPOSTAL_PROVEEDOR`, `PAIS_PROVEEDOR`, `OBSERVACIONES_PROVEEDOR`, `REFERENCIA_PROVEEDOR`, `CONTACTO_PROVEEDOR`, `TELEFONO_CONTACTO_PROVEEDOR`, `TELEFONO_PROVEEDOR`, `IBAN_PROVEEDOR`, `INSTANTEMODIF`, `INSTANTEALTA`, `USUARIOALTA`, `USUARIOMODIF`) VALUES
 (3,'S','Exotic Liquids',NULL,'(171) 555-2222',NULL,'49 Gilbert St.',NULL,'London','','EC1 4SD','UK',NULL,NULL,'Charlotte Cooper',NULL,NULL,NULL,'2021-06-10 19:30:28','2021-06-10 19:30:28','Administrador','Administrador'),
 (4,'S','New Orleans Cajun Delights',NULL,'(100) 555-4822',NULL,'P.O. Box 78934',NULL,'New Orleans','LA','70117','USA',NULL,NULL,'Shelley Burke',NULL,NULL,NULL,'2021-06-10 19:30:28','2021-06-10 19:30:28','Administrador','Administrador'),
 (5,'S','Tokyo Traders',NULL,'(03) 3555-5011',NULL,'9-8 Sekimai Musashino-shi',NULL,'Tokyo','','100','Japan',NULL,NULL,'Yoshi Nagase',NULL,NULL,NULL,'2021-06-10 19:31:17','2021-06-10 19:31:17','Administrador','Administrador'),
 (6,'S','Mayumis',NULL,'(06) 431-7877',NULL,'92 Setsuko Chuo-ku',NULL,'Osaka','','545','Japan',NULL,NULL,'Mayumi Ohno',NULL,NULL,NULL,'2021-06-10 19:33:41','2021-06-10 19:33:41','Administrador','Administrador'),
 (7,'S','Pavlova, Ltd.',NULL,'(03) 444-2343',NULL,'74 Rose St. Moonie Ponds',NULL,'Melbourne','Victoria','3058','Australia',NULL,NULL,'Ian Devling',NULL,NULL,NULL,'2021-06-10 19:33:48','2021-06-10 19:33:48','Administrador','Administrador'),
 (8,'S','Cooperativa de Quesos Las Cabras',NULL,'(98) 598 76 54',NULL,'Calle del Rosal 4',NULL,'Oviedo','Asturias','33007','Spain',NULL,NULL,'Antonio del Valle Saavedra',NULL,NULL,NULL,'2021-06-10 19:34:56','2021-06-10 19:34:56','Administrador','Administrador'),
 (9,'S','Forêts dérables',NULL,'(514) 555-2955',NULL,'148 rue Chasseur',NULL,'Ste-Hyacinthe','Québec','J2S 7S8','Canada',NULL,NULL,'Chantal Goulet',NULL,NULL,NULL,'2021-06-10 19:36:14','2021-06-10 19:36:14','Administrador','Administrador'),
 (10,'S','Gai pâturage',NULL,'38.76.98.06',NULL,'Bat. B 3, rue des Alpes',NULL,'Annecy','','74000','France',NULL,NULL,'Eliane Noz',NULL,NULL,NULL,'2021-06-10 19:36:20','2021-06-10 19:36:20','Administrador','Administrador'),
 (11,'S','Escargots Nouveaux',NULL,'85.57.00.07',NULL,'22, rue H. Voiron',NULL,'Montceau','','71300','France',NULL,NULL,'Marie Delamare',NULL,NULL,NULL,'2021-06-10 19:36:25','2021-06-10 19:36:25','Administrador','Administrador'),
 (12,'S','Pasta Buttini s.r.l.',NULL,'(089) 6547665',NULL,'Via dei Gelsomini, 153',NULL,'Salerno','','84100','Italy',NULL,NULL,'Giovanni Giudici',NULL,NULL,NULL,'2021-06-10 19:36:35','2021-06-10 19:36:35','Administrador','Administrador'),
 (13,'S','Ma Maison',NULL,'(514) 555-9022',NULL,'2960 Rue St. Laurent',NULL,'Montréal','Québec','H1J 1C3','Canada',NULL,NULL,'Jean-Guy Lauzon',NULL,NULL,NULL,'2021-06-10 19:36:46','2021-06-10 19:36:46','Administrador','Administrador'),
 (14,'S','Karkki Oy',NULL,'(953) 10956',NULL,'Valtakatu 12',NULL,'Lappeenranta','','53120','Finland',NULL,NULL,'Anne Heikkonen',NULL,NULL,NULL,'2021-06-10 19:37:22','2021-06-10 19:37:22','Administrador','Administrador'),
 (15,'S','Leka Trading',NULL,'555-8787',NULL,'471 Serangoon Loop, Suite #402',NULL,'Singapore','','0512','Singapore',NULL,NULL,'Chandra Leka',NULL,NULL,NULL,'2021-06-10 19:37:28','2021-06-10 19:37:28','Administrador','Administrador'),
 (16,'S','Lyngbysild',NULL,'43844108',NULL,'Lyngbysild Fiskebakken 10',NULL,'Lyngby','','2800','Denmark',NULL,NULL,'Niels Petersen',NULL,NULL,NULL,'2021-06-10 19:37:28','2021-06-10 19:37:28','Administrador','Administrador'),
 (17,'S','Zaanse Snoepfabriek',NULL,'(12345) 1212',NULL,'Verkoop Rijnweg 22',NULL,'Zaandam','','9999 ZZ','Netherlands',NULL,NULL,'Dirk Luchte',NULL,NULL,NULL,'2021-06-10 19:37:28','2021-06-10 19:37:28','Administrador','Administrador'),
 (18,'S','Formaggi Fortini s.r.l.',NULL,'(0544) 60323',NULL,'Viale Dante, 75',NULL,'Ravenna','','48100','Italy',NULL,NULL,'Elio Rossi',NULL,NULL,NULL,'2021-06-10 19:37:39','2021-06-10 19:37:39','Administrador','Administrador'),
 (19,'S','Norske Meierier',NULL,'(0)2-953010',NULL,'Hatlevegen 5',NULL,'Sandvika','','1320','Norway',NULL,NULL,'Beate Vileid',NULL,NULL,NULL,'2021-06-10 19:37:39','2021-06-10 19:37:39','Administrador','Administrador'),
 (20,'S','Bigfoot Breweries',NULL,'(503) 555-9931',NULL,'3400 - 8th Avenue Suite 210',NULL,'Bend','OR','97101','USA',NULL,NULL,'Cheryl Saylor',NULL,NULL,NULL,'2021-06-10 19:37:39','2021-06-10 19:37:39','Administrador','Administrador'),
 (21,'S','Svensk Sjöföda AB',NULL,'08-123 45 67',NULL,'Brovallavägen 231',NULL,'Stockholm','','S-123 45','Sweden',NULL,NULL,'Michael Björn',NULL,NULL,NULL,'2021-06-10 19:37:39','2021-06-10 19:37:39','Administrador','Administrador'),
 (22,'S','Aux joyeux ecclésiastiques',NULL,'(1) 03.83.00.68',NULL,'203, Rue des Francs-Bourgeois',NULL,'Paris','','75004','France',NULL,NULL,'Guylène Nodier',NULL,NULL,NULL,'2021-06-10 19:37:39','2021-06-10 19:37:39','Administrador','Administrador'),
 (23,'S','New England Seafood Cannery',NULL,'(617) 555-3267',NULL,'Order Processing Dept. 2100 Paul Revere Blvd.',NULL,'Boston','MA','02134','USA',NULL,NULL,'Robb Merchant',NULL,NULL,NULL,'2021-06-15 19:40:07','2021-06-10 19:37:39','Administrador','Administrador');

DROP TABLE IF EXISTS `fza_recibos`;
CREATE TABLE `fza_recibos` (
  `NRO_FACTURA_RECIBO` varchar(12) NOT NULL,
  `SERIE_FACTURA_RECIBO` varchar(12) NOT NULL,
  `NRO_PLAZO_RECIBO` int(11) NOT NULL,
  `FORMA_PAGO_ORIGEN_RECIBO` varchar(10) DEFAULT NULL,
  `FORMA_PAGO_DESCRIPCION_ORIGEN_RECIBO` varchar(100) DEFAULT NULL,
  `EUROS_RECIBO` decimal(18,6) DEFAULT NULL,
  `STADO_RECIBO` varchar(10) DEFAULT NULL,
  `FECHA_EXPEDICION_RECIBO` date DEFAULT NULL,
  `FECHA_VENCIMIENTO_RECIBO` date DEFAULT NULL,
  `IBAN_CLIENTE_RECIBO` varchar(34) DEFAULT NULL,
  `FECHA_PAGO_RECIBO` date DEFAULT NULL,
  `LOCALIDAD_EXPEDICION_RECIBO` varchar(200) DEFAULT NULL,
  `CODIGO_CLIENTE_RECIBO` varchar(20) DEFAULT NULL,
  `RAZONSOCIAL_CLIENTE_RECIBO` varchar(200) DEFAULT NULL,
  `DIRECCION1_CLIENTE_RECIBO` varchar(200) DEFAULT NULL,
  `POBLACION_CLIENTE_RECIBO` varchar(200) DEFAULT NULL,
  `PROVINCIA_CLIENTE_RECIBO` varchar(200) DEFAULT NULL,
  `CPOSTAL_CLIENTE_RECIBO` varchar(15) DEFAULT NULL,
  `IMPORTE_LETRA_RECIBO` varchar(150) DEFAULT NULL,
  `INSTANTEMODIF` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `INSTANTEALTA` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `USUARIOALTA` varchar(100) NOT NULL,
  `USUARIOMODIF` varchar(100) NOT NULL,
  PRIMARY KEY (`NRO_FACTURA_RECIBO`,`SERIE_FACTURA_RECIBO`,`NRO_PLAZO_RECIBO`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci ROW_FORMAT=DYNAMIC;

INSERT INTO `fza_recibos`(`NRO_FACTURA_RECIBO`, `SERIE_FACTURA_RECIBO`, `NRO_PLAZO_RECIBO`, `FORMA_PAGO_ORIGEN_RECIBO`, `FORMA_PAGO_DESCRIPCION_ORIGEN_RECIBO`, `EUROS_RECIBO`, `STADO_RECIBO`, `FECHA_EXPEDICION_RECIBO`, `FECHA_VENCIMIENTO_RECIBO`, `IBAN_CLIENTE_RECIBO`, `FECHA_PAGO_RECIBO`, `LOCALIDAD_EXPEDICION_RECIBO`, `CODIGO_CLIENTE_RECIBO`, `RAZONSOCIAL_CLIENTE_RECIBO`, `DIRECCION1_CLIENTE_RECIBO`, `POBLACION_CLIENTE_RECIBO`, `PROVINCIA_CLIENTE_RECIBO`, `CPOSTAL_CLIENTE_RECIBO`, `IMPORTE_LETRA_RECIBO`, `INSTANTEMODIF`, `INSTANTEALTA`, `USUARIOALTA`, `USUARIOMODIF`) VALUES
 ('00000021','A1',1,'30Y60','30Y60',2663.885900,'Emitido','2023-05-12','2023-06-11',NULL,NULL,'POBLACION DEL AGRICULTOR','PUBLICO','PUBLICO','DIRECCION DEL CLIENTE','POBLACION AGRICULTOR','PROVINCIA CLIENTE','POSCLI','DOS MIL SEISCIENTOS SESENTA Y TRES CON OCHENTA Y NUEVE CÉNTIMOS ','2023-11-09 04:22:30','2023-11-09 04:22:30','Administrador','Administrador'),
 ('00000021','A1',2,'30Y60','30Y60',2663.885900,'Emitido','2023-05-12','2023-07-11',NULL,NULL,'POBLACION DEL AGRICULTOR','PUBLICO','PUBLICO','DIRECCION DEL CLIENTE','POBLACION AGRICULTOR','PROVINCIA CLIENTE','POSCLI','DOS MIL SEISCIENTOS SESENTA Y TRES CON OCHENTA Y NUEVE CÉNTIMOS ','2023-11-09 04:22:30','2023-11-09 04:22:30','Administrador','Administrador'),
 ('000001','A1.2023',1,'30_60_90','30_60_90',128.573440,'Emitido','2023-12-07','2024-01-06',NULL,NULL,'SANTOVENIA','295','AZUCENA MARTIN (KIOSKO PERLA)','CALLE POZO AMARILLO, 3','SALAMANCA','SALAMANCA','37003','CIENTO VEINTIOCHO CON CINCUENTA Y SIETE CÉNTIMOS ','2023-12-08 22:33:53','2023-12-08 22:33:53','Administrador','Administrador'),
 ('000001','A1.2023',2,'30_60_90','30_60_90',128.573440,'Emitido','2023-12-07','2024-02-05',NULL,NULL,'SANTOVENIA','295','AZUCENA MARTIN (KIOSKO PERLA)','CALLE POZO AMARILLO, 3','SALAMANCA','SALAMANCA','37003','CIENTO VEINTIOCHO CON CINCUENTA Y SIETE CÉNTIMOS ','2023-12-08 22:33:53','2023-12-08 22:33:53','Administrador','Administrador'),
 ('000001','A1.2023',3,'30_60_90','30_60_90',128.573440,'Emitido','2023-12-07','2024-03-06',NULL,NULL,'SANTOVENIA','295','AZUCENA MARTIN (KIOSKO PERLA)','CALLE POZO AMARILLO, 3','SALAMANCA','SALAMANCA','37003','CIENTO VEINTIOCHO CON CINCUENTA Y SIETE CÉNTIMOS ','2023-12-08 22:33:53','2023-12-08 22:33:53','Administrador','Administrador'),
 ('000001','AGRO/2023',1,'TRANSFEREN','TRANSFERENCIA',589.680000,'Pagado','2023-12-06','2023-12-06',NULL,'2023-12-06','POBLACION DEL AGRICULTOR','296','ANGEL MARTIN','CL TRES CRUCES, 23, 3C','ZAMORA','ZAMORA','49002','QUINIENTOS OCHENTA Y NUEVE CON SESENTA Y OCHO CÉNTIMOS ','2023-12-09 18:32:44','2023-12-09 18:32:44','Administrador','Administrador'),
 ('000002','ANA/2023',1,'CONTADO','CONTADO',1194.450000,'Pagado','2023-10-31','2023-10-31',NULL,'2023-10-31','MORALES DEL VINO','TIENDA','TIENDA DE ROSA','CALLE MAYOR, 2','MORALES DEL VINO','ZAMORA','49190','MIL CIENTO NOVENTA Y CUATRO CON CUARENTA Y CINCO CÉNTIMOS ','2023-12-04 14:16:59','2023-12-04 14:16:59','Administrador','Administrador'),
 ('000006','AGRO',1,'30DIAS','30DIAS',9313.920000,'Emitido','2023-10-22','2023-11-21',NULL,NULL,'POBLACION AGRICULTOR','293','PEDRO COJOS','CALLE CAIDOS ','VILLAVEZA DEL AGUA','ZAMORA','49760','NUEVE MIL TRESCIENTOS TRECE CON NOVENTA Y DOS CÉNTIMOS ','2023-11-08 22:45:00','2023-11-08 22:45:00','Administrador','Administrador'),
 ('000007','AGRO',1,'30_60_90','30_60_90',6882.666667,'Emitido','2023-10-26','2023-11-25',NULL,NULL,'POBLACION','PUBLICO','PUBLICO','DIRECCION','POBLACION','PROVINCIA','CODPOSTAL','SEIS MIL OCHOCIENTOS OCHENTA Y DOS CON SESENTA Y SIETE CÉNTIMOS ','2023-12-09 11:26:57','2023-12-09 11:26:57','Administrador','Administrador'),
 ('000007','AGRO',2,'30_60_90','30_60_90',6882.666667,'Emitido','2023-10-26','2023-12-25',NULL,NULL,'POBLACION','PUBLICO','PUBLICO','DIRECCION','POBLACION','PROVINCIA','CODPOSTAL','SEIS MIL OCHOCIENTOS OCHENTA Y DOS CON SESENTA Y SIETE CÉNTIMOS ','2023-12-09 11:26:57','2023-12-09 11:26:57','Administrador','Administrador'),
 ('000007','AGRO',3,'30_60_90','30_60_90',6882.666667,'Emitido','2023-10-26','2024-01-24',NULL,NULL,'POBLACION','PUBLICO','PUBLICO','DIRECCION','POBLACION','PROVINCIA','CODPOSTAL','SEIS MIL OCHOCIENTOS OCHENTA Y DOS CON SESENTA Y SIETE CÉNTIMOS ','2023-12-09 11:26:57','2023-12-09 11:26:57','Administrador','Administrador'),
 ('24','A1',1,'CONTADO','CONTADO',19.834711,'Pagado','2023-05-16','2023-05-16',NULL,'2023-05-16','','291','PEDRO CACHAS',NULL,NULL,NULL,NULL,'DIECINUEVE CON OCHENTA Y TRES CÉNTIMOS ','2023-05-17 13:12:06','2023-05-17 13:12:06','Administrador','Administrador');

DROP TABLE IF EXISTS `fza_tarifas`;
CREATE TABLE `fza_tarifas` (
  `CODIGO_TARIFA` varchar(10) NOT NULL,
  `ACTIVO_TARIFA` varchar(1) DEFAULT 'S',
  `ORDEN_TARIFA` int(11) DEFAULT NULL,
  `NOMBRE_TARIFA` varchar(100) DEFAULT NULL,
  `ESIMP_INCL_TARIFA` varchar(1) DEFAULT 'S',
  `ESDEFAULT_TARIFA` varchar(1) DEFAULT 'N',
  `INSTANTEMODIF` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `INSTANTEALTA` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `USUARIOALTA` varchar(100) NOT NULL,
  `USUARIOMODIF` varchar(100) NOT NULL,
  PRIMARY KEY (`CODIGO_TARIFA`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci ROW_FORMAT=DYNAMIC;

INSERT INTO `fza_tarifas`(`CODIGO_TARIFA`, `ACTIVO_TARIFA`, `ORDEN_TARIFA`, `NOMBRE_TARIFA`, `ESIMP_INCL_TARIFA`, `ESDEFAULT_TARIFA`, `INSTANTEMODIF`, `INSTANTEALTA`, `USUARIOALTA`, `USUARIOMODIF`) VALUES
 ('0','S',1,'PVP','S','S','2023-06-02 11:46:56','2022-09-05 09:30:49','Administrador','Administrador'),
 ('1','S',2,'VENTA MAYOR','N','N','2023-10-31 12:58:45','2022-09-05 09:31:19','Administrador','Administrador');

DROP TABLE IF EXISTS `fza_tipos_documentos`;
CREATE TABLE `fza_tipos_documentos` (
  `CODIGO_TIPODOCUMENTO` varchar(2) NOT NULL,
  `DESCRIPCION_TIPODOCUMENTO` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`CODIGO_TIPODOCUMENTO`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci ROW_FORMAT=DYNAMIC;

INSERT INTO `fza_tipos_documentos`(`CODIGO_TIPODOCUMENTO`, `DESCRIPCION_TIPODOCUMENTO`) VALUES
 ('AO','ORDEN ARTICULOS'),
 ('AR','ARTICULOS'),
 ('CL','CLIENTES'),
 ('CO','ORDEN CLIENTES'),
 ('EM','EMPRESAS'),
 ('EO','ORDEN EMPRESAS'),
 ('ES','SERIES POR EMPRESA'),
 ('FA','FAMILIAS'),
 ('FC','FACTURAS DE CLIENTE'),
 ('FO','ORDEN FAMILIAS'),
 ('GO','ORDEN DE FORMAS DE PAGO'),
 ('GP','GENERADOR DE PROCESOS'),
 ('IG','ZONAS IVA'),
 ('IV','IVAS'),
 ('PG','FORMAS DE PAGO'),
 ('PO','ORDEN PROVEEDORES'),
 ('PV','PROVEEDORES'),
 ('RT','RETENCIONES POR EMPRESA');

DROP TABLE IF EXISTS `fza_usuarios`;
CREATE TABLE `fza_usuarios` (
  `USUARIO_USUARIO` varchar(100) NOT NULL,
  `PASSWORD_USUARIO` varchar(100) DEFAULT NULL,
  `GRUPO_USUARIO` varchar(200) DEFAULT NULL,
  `EMPRESADEF_USUARIO` varchar(8) DEFAULT NULL,
  `ULTIMOLOGIN_USUARIO` timestamp NULL DEFAULT NULL,
  `INSTANTEMODIF` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `INSTANTEALTA` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `USUARIOALTA` varchar(100) NOT NULL,
  `USUARIOMODIF` varchar(100) NOT NULL,
  PRIMARY KEY (`USUARIO_USUARIO`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci ROW_FORMAT=DYNAMIC;

INSERT INTO `fza_usuarios`(`USUARIO_USUARIO`, `PASSWORD_USUARIO`, `GRUPO_USUARIO`, `EMPRESADEF_USUARIO`, `ULTIMOLOGIN_USUARIO`, `INSTANTEMODIF`, `INSTANTEALTA`, `USUARIOALTA`, `USUARIOMODIF`) VALUES
 ('Administrador','4F8239A5B05A0E22D3DD4D7853808AF3','Administradores','011','2023-12-21 19:03:02','2023-12-21 19:03:02','2021-05-14 19:54:29','Administrador','Administrador');

DROP TABLE IF EXISTS `fza_usuarios_grupos`;
CREATE TABLE `fza_usuarios_grupos` (
  `GRUPO_GRUPO` varchar(200) NOT NULL,
  `ESGRUPOADMINISTRADOR_GRUPO` varchar(1) DEFAULT 'N',
  `INSTANTEMODIF` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `INSTANTEALTA` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `USUARIOALTA` varchar(100) NOT NULL,
  `USUARIOMODIF` varchar(100) NOT NULL,
  PRIMARY KEY (`GRUPO_GRUPO`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci ROW_FORMAT=DYNAMIC;

INSERT INTO `fza_usuarios_grupos`(`GRUPO_GRUPO`, `ESGRUPOADMINISTRADOR_GRUPO`, `INSTANTEMODIF`, `INSTANTEALTA`, `USUARIOALTA`, `USUARIOMODIF`) VALUES
 ('Administradores','S','2023-01-21 08:29:44','2021-05-14 19:55:13','Administrador','Administrador'),
 ('Usuarios','N','2021-05-24 20:53:04','2021-05-24 20:52:52','Administrador','Administrador');

DROP TABLE IF EXISTS `fza_usuarios_perfiles`;
CREATE TABLE `fza_usuarios_perfiles` (
  `USUARIO_GRUPO_PERFILES` varchar(200) NOT NULL,
  `KEY_PERFILES` varchar(100) NOT NULL,
  `SUBKEY_PERFILES` varchar(100) NOT NULL,
  `VALUE_PERFILES` varchar(200) NOT NULL,
  `VALUE_TEXT_PERFILES` text DEFAULT NULL,
  `TYPE_BLOB_PERFILES` varchar(10) DEFAULT NULL,
  `VALUE_BLOB_PERFILES` blob DEFAULT NULL,
  `INSTANTEMODIF` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `INSTANTEALTA` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `USUARIOALTA` varchar(100) NOT NULL,
  `USUARIOMODIF` varchar(100) NOT NULL,
  PRIMARY KEY (`USUARIO_GRUPO_PERFILES`,`KEY_PERFILES`,`SUBKEY_PERFILES`) USING BTREE,
  KEY `IDX_KEYPERFIL` (`KEY_PERFILES`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci ROW_FORMAT=DYNAMIC;

INSERT INTO `fza_usuarios_perfiles`(`USUARIO_GRUPO_PERFILES`, `KEY_PERFILES`, `SUBKEY_PERFILES`, `VALUE_PERFILES`, `VALUE_TEXT_PERFILES`, `TYPE_BLOB_PERFILES`, `VALUE_BLOB_PERFILES`, `INSTANTEMODIF`, `INSTANTEALTA`, `USUARIOALTA`, `USUARIOMODIF`) VALUES
 ('Todos','frmLogon','DataBaseVersion','1.0.0.20231204.alpha',NULL,NULL,NULL,'2023-12-01 19:54:58','2023-12-01 19:54:49','Administrador','Administrador'),
 ('Todos','frmMtoArtFacSearch','btnAceptar_Caption','&Aceptar','',NULL,NULL,'2022-10-26 19:50:59','2022-10-26 19:50:59','Administrador','Administrador'),
 ('Todos','frmMtoArtFacSearch','btnCancelar_Caption','&Cancelar','',NULL,NULL,'2022-10-26 19:50:59','2022-10-26 19:50:59','Administrador','Administrador'),
 ('Todos','frmMtoArtFacSearch','btnCancelar1_Caption','&Cancelar','',NULL,NULL,'2022-10-26 19:50:59','2022-10-26 19:50:59','Administrador','Administrador'),
 ('Todos','frmMtoArtFacSearch','btnCargarCaptions_Caption','&Cargar captions','',NULL,NULL,'2022-10-26 19:50:59','2022-10-26 19:50:59','Administrador','Administrador'),
 ('Todos','frmMtoArtFacSearch','btnCargarColumnas_Caption','&Cargar columnas','',NULL,NULL,'2022-10-26 19:50:59','2022-10-26 19:50:59','Administrador','Administrador'),
 ('Todos','frmMtoArtFacSearch','btnCargarVblesGlob_Caption','&Cargar Vbles Globales','',NULL,NULL,'2022-10-26 19:50:59','2022-10-26 19:50:59','Administrador','Administrador'),
 ('Todos','frmMtoArtFacSearch','btnGrabar_Caption','&Grabar','',NULL,NULL,'2022-10-26 19:50:59','2022-10-26 19:50:59','Administrador','Administrador'),
 ('Todos','frmMtoArtFacSearch','btnSalir_Caption','出来','',NULL,NULL,'2023-08-28 14:49:47','2022-10-26 19:50:59','Administrador','Administrador'),
 ('Todos','frmMtoArtFacSearch','cxGrdDBTabPrin__oApplyWidth','True',NULL,NULL,NULL,'2023-05-16 13:10:31','2023-05-16 13:10:23','Administrador','Administrador'),
 ('Todos','frmMtoArtFacSearch','cxGrdDBTabPrin_ACTIVO_ARTICULO_Caption','ACTIVO_ARTICULO','',NULL,NULL,'2022-10-26 19:35:37','2022-10-26 19:35:37','Administrador','Administrador'),
 ('Todos','frmMtoArtFacSearch','cxGrdDBTabPrin_ACTIVO_ARTICULO_Index','1','',NULL,NULL,'2022-10-26 19:35:37','2022-10-26 19:35:37','Administrador','Administrador'),
 ('Todos','frmMtoArtFacSearch','cxGrdDBTabPrin_ACTIVO_ARTICULO_Visible','False','',NULL,NULL,'2023-01-25 13:19:33','2022-10-26 19:35:37','Administrador','Administrador'),
 ('Todos','frmMtoArtFacSearch','cxGrdDBTabPrin_ACTIVO_ARTICULO_Width','153','',NULL,NULL,'2023-01-25 13:19:18','2022-10-26 19:35:37','Administrador','Administrador'),
 ('Todos','frmMtoArtFacSearch','cxGrdDBTabPrin_CODIGO_ARTICULO_Caption','Código Artículo','',NULL,NULL,'2023-01-25 13:19:54','2022-10-26 19:35:27','Administrador','Administrador'),
 ('Todos','frmMtoArtFacSearch','cxGrdDBTabPrin_CODIGO_ARTICULO_Index','0','',NULL,NULL,'2022-10-26 19:35:12','2022-10-26 19:35:12','Administrador','Administrador'),
 ('Todos','frmMtoArtFacSearch','cxGrdDBTabPrin_CODIGO_ARTICULO_Visible','True','',NULL,NULL,'2022-10-26 19:35:07','2022-10-26 19:35:07','Administrador','Administrador'),
 ('Todos','frmMtoArtFacSearch','cxGrdDBTabPrin_CODIGO_ARTICULO_Width','156','',NULL,NULL,'2023-01-25 13:19:18','2022-10-26 19:35:27','Administrador','Administrador'),
 ('Todos','frmMtoArtFacSearch','cxGrdDBTabPrin_CODIGO_FAMILIA_ARTICULO_Caption','Código Familia','',NULL,NULL,'2023-01-25 13:22:04','2022-10-26 19:35:45','Administrador','Administrador'),
 ('Todos','frmMtoArtFacSearch','cxGrdDBTabPrin_CODIGO_FAMILIA_ARTICULO_Index','5','',NULL,NULL,'2023-01-25 13:27:23','2022-10-26 19:35:45','Administrador','Administrador'),
 ('Todos','frmMtoArtFacSearch','cxGrdDBTabPrin_CODIGO_FAMILIA_ARTICULO_Visible','True','',NULL,NULL,'2023-01-25 13:19:18','2022-10-26 19:35:45','Administrador','Administrador'),
 ('Todos','frmMtoArtFacSearch','cxGrdDBTabPrin_CODIGO_FAMILIA_ARTICULO_Width','118','',NULL,NULL,'2023-01-25 13:27:23','2022-10-26 19:35:45','Administrador','Administrador'),
 ('Todos','frmMtoArtFacSearch','cxGrdDBTabPrin_CODIGO_TARIFA_Caption','Tarifa','',NULL,NULL,'2023-01-25 13:26:26','2022-10-26 19:35:45','Administrador','Administrador'),
 ('Todos','frmMtoArtFacSearch','cxGrdDBTabPrin_CODIGO_TARIFA_Index','8','',NULL,NULL,'2023-01-25 13:27:23','2022-10-26 19:35:45','Administrador','Administrador'),
 ('Todos','frmMtoArtFacSearch','cxGrdDBTabPrin_CODIGO_TARIFA_Visible','True','',NULL,NULL,'2023-01-25 13:19:18','2022-10-26 19:35:45','Administrador','Administrador'),
 ('Todos','frmMtoArtFacSearch','cxGrdDBTabPrin_CODIGO_TARIFA_Width','134','',NULL,NULL,'2023-01-25 13:19:18','2022-10-26 19:35:45','Administrador','Administrador'),
 ('Todos','frmMtoArtFacSearch','cxGrdDBTabPrin_DESCRIPCION_ARTICULO_Caption','Descripción','',NULL,NULL,'2023-01-25 13:20:18','2022-10-26 19:35:40','Administrador','Administrador'),
 ('Todos','frmMtoArtFacSearch','cxGrdDBTabPrin_DESCRIPCION_ARTICULO_Index','2','',NULL,NULL,'2022-10-26 19:35:40','2022-10-26 19:35:40','Administrador','Administrador'),
 ('Todos','frmMtoArtFacSearch','cxGrdDBTabPrin_DESCRIPCION_ARTICULO_Visible','True','',NULL,NULL,'2022-10-26 19:35:40','2022-10-26 19:35:40','Administrador','Administrador'),
 ('Todos','frmMtoArtFacSearch','cxGrdDBTabPrin_DESCRIPCION_ARTICULO_Width','197','',NULL,NULL,'2023-01-25 13:19:18','2022-10-26 19:35:40','Administrador','Administrador'),
 ('Todos','frmMtoArtFacSearch','cxGrdDBTabPrin_DESCRIPCION_FAMILIA_Caption','Familia','',NULL,NULL,'2023-01-25 13:22:11','2022-10-26 19:35:45','Administrador','Administrador'),
 ('Todos','frmMtoArtFacSearch','cxGrdDBTabPrin_DESCRIPCION_FAMILIA_Index','6','',NULL,NULL,'2023-01-25 13:27:23','2022-10-26 19:35:45','Administrador','Administrador'),
 ('Todos','frmMtoArtFacSearch','cxGrdDBTabPrin_DESCRIPCION_FAMILIA_Visible','True','',NULL,NULL,'2022-10-26 19:35:45','2022-10-26 19:35:45','Administrador','Administrador'),
 ('Todos','frmMtoArtFacSearch','cxGrdDBTabPrin_DESCRIPCION_FAMILIA_Width','438','',NULL,NULL,'2023-01-25 13:19:18','2022-10-26 19:35:45','Administrador','Administrador'),
 ('Todos','frmMtoArtFacSearch','cxGrdDBTabPrin_IMP_INCL_TARIFA_Caption','Incluye IVA','',NULL,NULL,'2023-01-25 13:24:27','2022-10-26 19:35:45','Administrador','Administrador'),
 ('Todos','frmMtoArtFacSearch','cxGrdDBTabPrin_IMP_INCL_TARIFA_Index','9','',NULL,NULL,'2022-10-26 19:35:45','2022-10-26 19:35:45','Administrador','Administrador'),
 ('Todos','frmMtoArtFacSearch','cxGrdDBTabPrin_IMP_INCL_TARIFA_Visible','True','',NULL,NULL,'2023-01-25 13:19:18','2022-10-26 19:35:45','Administrador','Administrador'),
 ('Todos','frmMtoArtFacSearch','cxGrdDBTabPrin_IMP_INCL_TARIFA_Width','143','',NULL,NULL,'2023-01-25 13:19:18','2022-10-26 19:35:45','Administrador','Administrador'),
 ('Todos','frmMtoArtFacSearch','cxGrdDBTabPrin_INSTANTEALTA_Caption','INSTANTEALTA','',NULL,NULL,'2022-10-26 19:35:46','2022-10-26 19:35:46','Administrador','Administrador'),
 ('Todos','frmMtoArtFacSearch','cxGrdDBTabPrin_INSTANTEALTA_Index','11','',NULL,NULL,'2022-10-26 19:35:46','2022-10-26 19:35:46','Administrador','Administrador'),
 ('Todos','frmMtoArtFacSearch','cxGrdDBTabPrin_INSTANTEALTA_Visible','False','',NULL,NULL,'2023-01-25 13:20:37','2022-10-26 19:35:45','Administrador','Administrador'),
 ('Todos','frmMtoArtFacSearch','cxGrdDBTabPrin_INSTANTEALTA_Width','161','',NULL,NULL,'2023-01-25 13:19:18','2022-10-26 19:35:46','Administrador','Administrador'),
 ('Todos','frmMtoArtFacSearch','cxGrdDBTabPrin_INSTANTEMODIF_Caption','INSTANTEMODIF','',NULL,NULL,'2022-10-26 19:35:46','2022-10-26 19:35:46','Administrador','Administrador'),
 ('Todos','frmMtoArtFacSearch','cxGrdDBTabPrin_INSTANTEMODIF_Index','12','',NULL,NULL,'2022-10-26 19:35:46','2022-10-26 19:35:46','Administrador','Administrador'),
 ('Todos','frmMtoArtFacSearch','cxGrdDBTabPrin_INSTANTEMODIF_Visible','False','',NULL,NULL,'2023-01-25 13:20:41','2022-10-26 19:35:46','Administrador','Administrador'),
 ('Todos','frmMtoArtFacSearch','cxGrdDBTabPrin_INSTANTEMODIF_Width','161','',NULL,NULL,'2023-01-25 13:19:18','2022-10-26 19:35:46','Administrador','Administrador'),
 ('Todos','frmMtoArtFacSearch','cxGrdDBTabPrin_PRECIOFINAL_Caption','Precio','',NULL,NULL,'2023-01-25 13:23:38','2022-10-26 19:35:45','Administrador','Administrador'),
 ('Todos','frmMtoArtFacSearch','cxGrdDBTabPrin_PRECIOFINAL_Index','3','',NULL,NULL,'2023-01-25 13:27:23','2022-10-26 19:35:45','Administrador','Administrador'),
 ('Todos','frmMtoArtFacSearch','cxGrdDBTabPrin_PRECIOFINAL_Visible','True','',NULL,NULL,'2022-10-26 19:35:45','2022-10-26 19:35:45','Administrador','Administrador'),
 ('Todos','frmMtoArtFacSearch','cxGrdDBTabPrin_PRECIOFINAL_Width','107','',NULL,NULL,'2023-01-25 13:19:18','2022-10-26 19:35:45','Administrador','Administrador'),
 ('Todos','frmMtoArtFacSearch','cxGrdDBTabPrin_TIPO_CANTIDAD_ARTICULO_Caption','Tipo Cantidad','',NULL,NULL,'2023-01-25 13:22:57','2022-10-26 19:35:45','Administrador','Administrador'),
 ('Todos','frmMtoArtFacSearch','cxGrdDBTabPrin_TIPO_CANTIDAD_ARTICULO_Index','4','',NULL,NULL,'2023-01-25 13:27:23','2022-10-26 19:35:45','Administrador','Administrador'),
 ('Todos','frmMtoArtFacSearch','cxGrdDBTabPrin_TIPO_CANTIDAD_ARTICULO_Visible','True','',NULL,NULL,'2023-01-25 13:19:18','2022-10-26 19:35:45','Administrador','Administrador'),
 ('Todos','frmMtoArtFacSearch','cxGrdDBTabPrin_TIPO_CANTIDAD_ARTICULO_Width','113','',NULL,NULL,'2023-01-25 13:27:23','2022-10-26 19:35:45','Administrador','Administrador'),
 ('Todos','frmMtoArtFacSearch','cxGrdDBTabPrin_TIPOIVA_ARTICULO_Caption','Tipo IVA','',NULL,NULL,'2023-01-25 13:25:48','2022-10-26 19:35:45','Administrador','Administrador'),
 ('Todos','frmMtoArtFacSearch','cxGrdDBTabPrin_TIPOIVA_ARTICULO_Index','7','',NULL,NULL,'2023-01-25 13:27:23','2022-10-26 19:35:45','Administrador','Administrador'),
 ('Todos','frmMtoArtFacSearch','cxGrdDBTabPrin_TIPOIVA_ARTICULO_Visible','True','',NULL,NULL,'2022-10-26 19:35:45','2022-10-26 19:35:45','Administrador','Administrador'),
 ('Todos','frmMtoArtFacSearch','cxGrdDBTabPrin_TIPOIVA_ARTICULO_Width','158','',NULL,NULL,'2023-01-25 13:19:18','2022-10-26 19:35:45','Administrador','Administrador'),
 ('Todos','frmMtoArtFacSearch','cxGrdDBTabPrin_USUARIOALTA_Caption','USUARIOALTA','',NULL,NULL,'2022-10-26 19:35:46','2022-10-26 19:35:46','Administrador','Administrador'),
 ('Todos','frmMtoArtFacSearch','cxGrdDBTabPrin_USUARIOALTA_Index','13','',NULL,NULL,'2022-10-26 19:35:46','2022-10-26 19:35:46','Administrador','Administrador'),
 ('Todos','frmMtoArtFacSearch','cxGrdDBTabPrin_USUARIOALTA_Visible','False','',NULL,NULL,'2023-01-25 13:20:53','2022-10-26 19:35:46','Administrador','Administrador'),
 ('Todos','frmMtoArtFacSearch','cxGrdDBTabPrin_USUARIOALTA_Width','117','',NULL,NULL,'2023-01-25 13:19:18','2022-10-26 19:35:46','Administrador','Administrador'),
 ('Todos','frmMtoArtFacSearch','cxGrdDBTabPrin_USUARIOMODIF_Caption','USUARIOMODIF','',NULL,NULL,'2022-10-26 19:35:45','2022-10-26 19:35:45','Administrador','Administrador'),
 ('Todos','frmMtoArtFacSearch','cxGrdDBTabPrin_USUARIOMODIF_Index','10','',NULL,NULL,'2022-10-26 19:35:45','2022-10-26 19:35:45','Administrador','Administrador'),
 ('Todos','frmMtoArtFacSearch','cxGrdDBTabPrin_USUARIOMODIF_Visible','False','',NULL,NULL,'2023-01-25 13:20:56','2022-10-26 19:35:45','Administrador','Administrador'),
 ('Todos','frmMtoArtFacSearch','cxGrdDBTabPrin_USUARIOMODIF_Width','126','',NULL,NULL,'2023-01-25 13:19:18','2022-10-26 19:35:45','Administrador','Administrador'),
 ('Todos','frmMtoArtFacSearch','lblEditMode_Caption','Navegando','',NULL,NULL,'2022-10-26 19:50:59','2022-10-26 19:50:59','Administrador','Administrador'),
 ('Todos','frmMtoArtFacSearch','lblTablaOrigen_Caption','TablaOrigen','',NULL,NULL,'2022-10-26 19:50:59','2022-10-26 19:50:59','Administrador','Administrador'),
 ('Todos','frmMtoArtFacSearch','lblTextoaBuscar_Caption','Texto a buscar','',NULL,NULL,'2022-10-26 19:50:59','2022-10-26 19:50:59','Administrador','Administrador'),
 ('Todos','frmMtoArtFacSearch','lblTextoaBuscarPerfil_Caption','Texto a buscar','',NULL,NULL,'2022-10-26 19:50:59','2022-10-26 19:50:59','Administrador','Administrador'),
 ('Todos','frmMtoArtFacSearch','oApplyWidth','True','',NULL,NULL,'2023-01-25 13:21:22','2022-10-26 19:51:03','Administrador','Administrador'),
 ('Todos','frmMtoArtFacSearch','oBusqGlobal','Grid','',NULL,NULL,'2023-01-25 12:59:29','2022-10-26 19:51:03','Administrador','Administrador'),
 ('Todos','frmMtoArtFacSearch','oCreateItems','True','',NULL,NULL,'2023-01-25 13:19:10','2022-10-26 19:51:03','Administrador','Administrador'),
 ('Todos','frmMtoArtFacSearch','tsFicha_Caption','&Ficha','',NULL,NULL,'2022-10-26 19:50:59','2022-10-26 19:50:59','Administrador','Administrador'),
 ('Todos','frmMtoArtFacSearch','tsLista_Caption','&Lista','',NULL,NULL,'2022-10-26 19:50:59','2022-10-26 19:50:59','Administrador','Administrador'),
 ('Todos','frmMtoArtFacSearch','tsPerfil_Caption','Perfil','',NULL,NULL,'2022-10-26 19:50:59','2022-10-26 19:50:59','Administrador','Administrador'),
 ('Todos','frmMtoArtFacSerach','cxGrdDBTabPrin_PRECIOFINAL_PropertiesClass','TcxCurrencyEditProperties',NULL,NULL,NULL,'2022-10-26 20:39:55','2022-10-26 20:37:01','Administrador','Administrador'),
 ('Todos','frmMtoArtProvSearch','btnAceptar_Caption','&Aceptar','',NULL,NULL,'2023-05-25 13:01:17','2023-05-25 13:01:17','Administrador','Administrador'),
 ('Todos','frmMtoArtProvSearch','btnCancelar_Caption','&Cancelar','',NULL,NULL,'2023-05-25 13:01:17','2023-05-25 13:01:17','Administrador','Administrador'),
 ('Todos','frmMtoArtProvSearch','btnCancelar1_Caption','&Cancelar','',NULL,NULL,'2023-05-25 13:01:17','2023-05-25 13:01:17','Administrador','Administrador'),
 ('Todos','frmMtoArtProvSearch','btnCargarCaptions_Caption','&Cargar captions','',NULL,NULL,'2023-05-25 13:01:17','2023-05-25 13:01:17','Administrador','Administrador'),
 ('Todos','frmMtoArtProvSearch','btnCargarColumnas_Caption','&Cargar columnas','',NULL,NULL,'2023-05-25 13:01:17','2023-05-25 13:01:17','Administrador','Administrador'),
 ('Todos','frmMtoArtProvSearch','btnCargarVblesGlob_Caption','&Cargar Vbles Globales','',NULL,NULL,'2023-05-25 13:01:17','2023-05-25 13:01:17','Administrador','Administrador'),
 ('Todos','frmMtoArtProvSearch','btnGrabar_Caption','&Grabar','',NULL,NULL,'2023-05-25 13:01:17','2023-05-25 13:01:17','Administrador','Administrador'),
 ('Todos','frmMtoArtProvSearch','btnSalir_Caption','出来','',NULL,NULL,'2023-08-28 14:49:51','2023-05-25 13:01:17','Administrador','Administrador'),
 ('Todos','frmMtoArtProvSearch','cxGrdDBTabPrin__oApplyWidth','True',NULL,NULL,NULL,'2023-05-25 13:06:55','2023-05-25 13:05:19','Administrador','Administrador'),
 ('Todos','frmMtoArtProvSearch','cxGrdDBTabPrin_ACTIVO_PROVEEDOR_Caption','Activo','',NULL,NULL,'2023-05-25 13:01:53','2023-05-25 13:00:04','Administrador','Administrador'),
 ('Todos','frmMtoArtProvSearch','cxGrdDBTabPrin_ACTIVO_PROVEEDOR_Index','1','',NULL,NULL,'2023-05-25 13:00:04','2023-05-25 13:00:04','Administrador','Administrador'),
 ('Todos','frmMtoArtProvSearch','cxGrdDBTabPrin_ACTIVO_PROVEEDOR_Visible','True','',NULL,NULL,'2023-05-25 13:00:04','2023-05-25 13:00:04','Administrador','Administrador'),
 ('Todos','frmMtoArtProvSearch','cxGrdDBTabPrin_ACTIVO_PROVEEDOR_Width','175','',NULL,NULL,'2023-05-25 13:00:04','2023-05-25 13:00:04','Administrador','Administrador'),
 ('Todos','frmMtoArtProvSearch','cxGrdDBTabPrin_CODIGO_PROVEEDOR_Caption','Código Proveedor','',NULL,NULL,'2023-05-25 13:01:58','2023-05-25 13:00:04','Administrador','Administrador'),
 ('Todos','frmMtoArtProvSearch','cxGrdDBTabPrin_CODIGO_PROVEEDOR_Index','0','',NULL,NULL,'2023-05-25 13:00:04','2023-05-25 13:00:04','Administrador','Administrador'),
 ('Todos','frmMtoArtProvSearch','cxGrdDBTabPrin_CODIGO_PROVEEDOR_Visible','True','',NULL,NULL,'2023-05-25 13:00:04','2023-05-25 13:00:04','Administrador','Administrador'),
 ('Todos','frmMtoArtProvSearch','cxGrdDBTabPrin_CODIGO_PROVEEDOR_Width','181','',NULL,NULL,'2023-05-25 13:00:04','2023-05-25 13:00:04','Administrador','Administrador'),
 ('Todos','frmMtoArtProvSearch','cxGrdDBTabPrin_CONTACTO_PROVEEDOR_Caption','Contacto Proveedor','',NULL,NULL,'2023-05-25 13:02:03','2023-05-25 13:00:05','Administrador','Administrador');
INSERT INTO `fza_usuarios_perfiles`(`USUARIO_GRUPO_PERFILES`, `KEY_PERFILES`, `SUBKEY_PERFILES`, `VALUE_PERFILES`, `VALUE_TEXT_PERFILES`, `TYPE_BLOB_PERFILES`, `VALUE_BLOB_PERFILES`, `INSTANTEMODIF`, `INSTANTEALTA`, `USUARIOALTA`, `USUARIOMODIF`) VALUES
 ('Todos','frmMtoArtProvSearch','cxGrdDBTabPrin_CONTACTO_PROVEEDOR_Index','14','',NULL,NULL,'2023-05-25 13:00:05','2023-05-25 13:00:05','Administrador','Administrador'),
 ('Todos','frmMtoArtProvSearch','cxGrdDBTabPrin_CONTACTO_PROVEEDOR_Visible','True','',NULL,NULL,'2023-05-25 13:00:05','2023-05-25 13:00:05','Administrador','Administrador'),
 ('Todos','frmMtoArtProvSearch','cxGrdDBTabPrin_CONTACTO_PROVEEDOR_Width','227','',NULL,NULL,'2023-05-25 13:00:05','2023-05-25 13:00:05','Administrador','Administrador'),
 ('Todos','frmMtoArtProvSearch','cxGrdDBTabPrin_CPOSTAL_PROVEEDOR_Caption','Código Postal','',NULL,NULL,'2023-05-25 13:02:11','2023-05-25 13:00:04','Administrador','Administrador'),
 ('Todos','frmMtoArtProvSearch','cxGrdDBTabPrin_CPOSTAL_PROVEEDOR_Index','10','',NULL,NULL,'2023-05-25 13:00:04','2023-05-25 13:00:04','Administrador','Administrador'),
 ('Todos','frmMtoArtProvSearch','cxGrdDBTabPrin_CPOSTAL_PROVEEDOR_Visible','True','',NULL,NULL,'2023-05-25 13:00:04','2023-05-25 13:00:04','Administrador','Administrador'),
 ('Todos','frmMtoArtProvSearch','cxGrdDBTabPrin_CPOSTAL_PROVEEDOR_Width','185','',NULL,NULL,'2023-05-25 13:00:04','2023-05-25 13:00:04','Administrador','Administrador'),
 ('Todos','frmMtoArtProvSearch','cxGrdDBTabPrin_DIRECCION1_PROVEEDOR_Caption','Dirección','',NULL,NULL,'2023-05-25 13:02:14','2023-05-25 13:00:04','Administrador','Administrador'),
 ('Todos','frmMtoArtProvSearch','cxGrdDBTabPrin_DIRECCION1_PROVEEDOR_Index','6','',NULL,NULL,'2023-05-25 13:00:04','2023-05-25 13:00:04','Administrador','Administrador'),
 ('Todos','frmMtoArtProvSearch','cxGrdDBTabPrin_DIRECCION1_PROVEEDOR_Visible','True','',NULL,NULL,'2023-05-25 13:00:04','2023-05-25 13:00:04','Administrador','Administrador'),
 ('Todos','frmMtoArtProvSearch','cxGrdDBTabPrin_DIRECCION1_PROVEEDOR_Width','392','',NULL,NULL,'2023-05-25 13:00:04','2023-05-25 13:00:04','Administrador','Administrador'),
 ('Todos','frmMtoArtProvSearch','cxGrdDBTabPrin_DIRECCION2_PROVEEDOR_Caption','Dirección 2','',NULL,NULL,'2023-05-25 13:02:20','2023-05-25 13:00:04','Administrador','Administrador'),
 ('Todos','frmMtoArtProvSearch','cxGrdDBTabPrin_DIRECCION2_PROVEEDOR_Index','7','',NULL,NULL,'2023-05-25 13:00:04','2023-05-25 13:00:04','Administrador','Administrador'),
 ('Todos','frmMtoArtProvSearch','cxGrdDBTabPrin_DIRECCION2_PROVEEDOR_Visible','True','',NULL,NULL,'2023-05-25 13:00:04','2023-05-25 13:00:04','Administrador','Administrador'),
 ('Todos','frmMtoArtProvSearch','cxGrdDBTabPrin_DIRECCION2_PROVEEDOR_Width','218','',NULL,NULL,'2023-05-25 13:00:04','2023-05-25 13:00:04','Administrador','Administrador'),
 ('Todos','frmMtoArtProvSearch','cxGrdDBTabPrin_EMAIL_PROVEEDOR_Caption','Email','',NULL,NULL,'2023-05-25 13:02:23','2023-05-25 13:00:04','Administrador','Administrador'),
 ('Todos','frmMtoArtProvSearch','cxGrdDBTabPrin_EMAIL_PROVEEDOR_Index','5','',NULL,NULL,'2023-05-25 13:00:04','2023-05-25 13:00:04','Administrador','Administrador'),
 ('Todos','frmMtoArtProvSearch','cxGrdDBTabPrin_EMAIL_PROVEEDOR_Visible','True','',NULL,NULL,'2023-05-25 13:00:04','2023-05-25 13:00:04','Administrador','Administrador'),
 ('Todos','frmMtoArtProvSearch','cxGrdDBTabPrin_EMAIL_PROVEEDOR_Width','164','',NULL,NULL,'2023-05-25 13:00:04','2023-05-25 13:00:04','Administrador','Administrador'),
 ('Todos','frmMtoArtProvSearch','cxGrdDBTabPrin_IBAN_PROVEEDOR_Caption','IBAN','',NULL,NULL,'2023-05-25 13:02:26','2023-05-25 13:00:05','Administrador','Administrador'),
 ('Todos','frmMtoArtProvSearch','cxGrdDBTabPrin_IBAN_PROVEEDOR_Index','17','',NULL,NULL,'2023-05-25 13:00:05','2023-05-25 13:00:05','Administrador','Administrador'),
 ('Todos','frmMtoArtProvSearch','cxGrdDBTabPrin_IBAN_PROVEEDOR_Visible','True','',NULL,NULL,'2023-05-25 13:00:05','2023-05-25 13:00:05','Administrador','Administrador'),
 ('Todos','frmMtoArtProvSearch','cxGrdDBTabPrin_IBAN_PROVEEDOR_Width','152','',NULL,NULL,'2023-05-25 13:00:05','2023-05-25 13:00:05','Administrador','Administrador'),
 ('Todos','frmMtoArtProvSearch','cxGrdDBTabPrin_INSTANTEALTA_Caption','INSTANTEALTA','',NULL,NULL,'2023-05-25 13:00:05','2023-05-25 13:00:05','Administrador','Administrador'),
 ('Todos','frmMtoArtProvSearch','cxGrdDBTabPrin_INSTANTEALTA_Index','19','',NULL,NULL,'2023-05-25 13:00:05','2023-05-25 13:00:05','Administrador','Administrador'),
 ('Todos','frmMtoArtProvSearch','cxGrdDBTabPrin_INSTANTEALTA_Visible','False','',NULL,NULL,'2023-05-25 13:02:30','2023-05-25 13:00:05','Administrador','Administrador'),
 ('Todos','frmMtoArtProvSearch','cxGrdDBTabPrin_INSTANTEALTA_Width','193','',NULL,NULL,'2023-05-25 13:00:05','2023-05-25 13:00:05','Administrador','Administrador'),
 ('Todos','frmMtoArtProvSearch','cxGrdDBTabPrin_INSTANTEMODIF_Caption','INSTANTEMODIF','',NULL,NULL,'2023-05-25 13:00:05','2023-05-25 13:00:05','Administrador','Administrador'),
 ('Todos','frmMtoArtProvSearch','cxGrdDBTabPrin_INSTANTEMODIF_Index','18','',NULL,NULL,'2023-05-25 13:00:05','2023-05-25 13:00:05','Administrador','Administrador'),
 ('Todos','frmMtoArtProvSearch','cxGrdDBTabPrin_INSTANTEMODIF_Visible','False','',NULL,NULL,'2023-05-25 13:02:33','2023-05-25 13:00:05','Administrador','Administrador'),
 ('Todos','frmMtoArtProvSearch','cxGrdDBTabPrin_INSTANTEMODIF_Width','193','',NULL,NULL,'2023-05-25 13:00:05','2023-05-25 13:00:05','Administrador','Administrador'),
 ('Todos','frmMtoArtProvSearch','cxGrdDBTabPrin_MOVIL_PROVEEDOR_Caption','Móvil','',NULL,NULL,'2023-05-25 13:02:39','2023-05-25 13:00:04','Administrador','Administrador'),
 ('Todos','frmMtoArtProvSearch','cxGrdDBTabPrin_MOVIL_PROVEEDOR_Index','4','',NULL,NULL,'2023-05-25 13:00:04','2023-05-25 13:00:04','Administrador','Administrador'),
 ('Todos','frmMtoArtProvSearch','cxGrdDBTabPrin_MOVIL_PROVEEDOR_Visible','True','',NULL,NULL,'2023-05-25 13:00:04','2023-05-25 13:00:04','Administrador','Administrador'),
 ('Todos','frmMtoArtProvSearch','cxGrdDBTabPrin_MOVIL_PROVEEDOR_Width','168','',NULL,NULL,'2023-05-25 13:00:04','2023-05-25 13:00:04','Administrador','Administrador'),
 ('Todos','frmMtoArtProvSearch','cxGrdDBTabPrin_NIF_PROVEEDOR_Caption','Nif','',NULL,NULL,'2023-05-25 13:02:43','2023-05-25 13:00:04','Administrador','Administrador'),
 ('Todos','frmMtoArtProvSearch','cxGrdDBTabPrin_NIF_PROVEEDOR_Index','3','',NULL,NULL,'2023-05-25 13:00:04','2023-05-25 13:00:04','Administrador','Administrador'),
 ('Todos','frmMtoArtProvSearch','cxGrdDBTabPrin_NIF_PROVEEDOR_Visible','True','',NULL,NULL,'2023-05-25 13:00:04','2023-05-25 13:00:04','Administrador','Administrador'),
 ('Todos','frmMtoArtProvSearch','cxGrdDBTabPrin_NIF_PROVEEDOR_Width','141','',NULL,NULL,'2023-05-25 13:00:04','2023-05-25 13:00:04','Administrador','Administrador'),
 ('Todos','frmMtoArtProvSearch','cxGrdDBTabPrin_OBSERVACIONES_PROVEEDOR_Caption','Observaciones','',NULL,NULL,'2023-05-25 13:02:47','2023-05-25 13:00:05','Administrador','Administrador'),
 ('Todos','frmMtoArtProvSearch','cxGrdDBTabPrin_OBSERVACIONES_PROVEEDOR_Index','12','',NULL,NULL,'2023-05-25 13:00:05','2023-05-25 13:00:05','Administrador','Administrador'),
 ('Todos','frmMtoArtProvSearch','cxGrdDBTabPrin_OBSERVACIONES_PROVEEDOR_Visible','True','',NULL,NULL,'2023-05-25 13:00:04','2023-05-25 13:00:04','Administrador','Administrador'),
 ('Todos','frmMtoArtProvSearch','cxGrdDBTabPrin_OBSERVACIONES_PROVEEDOR_Width','248','',NULL,NULL,'2023-05-25 13:00:05','2023-05-25 13:00:05','Administrador','Administrador'),
 ('Todos','frmMtoArtProvSearch','cxGrdDBTabPrin_PAIS_PROVEEDOR_Caption','País','',NULL,NULL,'2023-05-25 13:02:55','2023-05-25 13:00:04','Administrador','Administrador'),
 ('Todos','frmMtoArtProvSearch','cxGrdDBTabPrin_PAIS_PROVEEDOR_Index','11','',NULL,NULL,'2023-05-25 13:00:04','2023-05-25 13:00:04','Administrador','Administrador'),
 ('Todos','frmMtoArtProvSearch','cxGrdDBTabPrin_PAIS_PROVEEDOR_Visible','True','',NULL,NULL,'2023-05-25 13:00:04','2023-05-25 13:00:04','Administrador','Administrador'),
 ('Todos','frmMtoArtProvSearch','cxGrdDBTabPrin_PAIS_PROVEEDOR_Width','147','',NULL,NULL,'2023-05-25 13:00:04','2023-05-25 13:00:04','Administrador','Administrador'),
 ('Todos','frmMtoArtProvSearch','cxGrdDBTabPrin_POBLACION_PROVEEDOR_Caption','Población','',NULL,NULL,'2023-05-25 13:02:59','2023-05-25 13:00:04','Administrador','Administrador'),
 ('Todos','frmMtoArtProvSearch','cxGrdDBTabPrin_POBLACION_PROVEEDOR_Index','8','',NULL,NULL,'2023-05-25 13:00:04','2023-05-25 13:00:04','Administrador','Administrador'),
 ('Todos','frmMtoArtProvSearch','cxGrdDBTabPrin_POBLACION_PROVEEDOR_Visible','True','',NULL,NULL,'2023-05-25 13:00:04','2023-05-25 13:00:04','Administrador','Administrador'),
 ('Todos','frmMtoArtProvSearch','cxGrdDBTabPrin_POBLACION_PROVEEDOR_Width','208','',NULL,NULL,'2023-05-25 13:00:04','2023-05-25 13:00:04','Administrador','Administrador'),
 ('Todos','frmMtoArtProvSearch','cxGrdDBTabPrin_PROVINCIA_PROVEEDOR_Caption','Provincia','',NULL,NULL,'2023-05-25 13:03:02','2023-05-25 13:00:04','Administrador','Administrador'),
 ('Todos','frmMtoArtProvSearch','cxGrdDBTabPrin_PROVINCIA_PROVEEDOR_Index','9','',NULL,NULL,'2023-05-25 13:00:04','2023-05-25 13:00:04','Administrador','Administrador'),
 ('Todos','frmMtoArtProvSearch','cxGrdDBTabPrin_PROVINCIA_PROVEEDOR_Visible','True','',NULL,NULL,'2023-05-25 13:00:04','2023-05-25 13:00:04','Administrador','Administrador'),
 ('Todos','frmMtoArtProvSearch','cxGrdDBTabPrin_PROVINCIA_PROVEEDOR_Width','204','',NULL,NULL,'2023-05-25 13:00:04','2023-05-25 13:00:04','Administrador','Administrador'),
 ('Todos','frmMtoArtProvSearch','cxGrdDBTabPrin_RAZONSOCIAL_PROVEEDOR_Caption','Razón Social','',NULL,NULL,'2023-05-25 13:03:05','2023-05-25 13:00:04','Administrador','Administrador'),
 ('Todos','frmMtoArtProvSearch','cxGrdDBTabPrin_RAZONSOCIAL_PROVEEDOR_Index','2','',NULL,NULL,'2023-05-25 13:00:04','2023-05-25 13:00:04','Administrador','Administrador'),
 ('Todos','frmMtoArtProvSearch','cxGrdDBTabPrin_RAZONSOCIAL_PROVEEDOR_Visible','True','',NULL,NULL,'2023-05-25 13:00:04','2023-05-25 13:00:04','Administrador','Administrador'),
 ('Todos','frmMtoArtProvSearch','cxGrdDBTabPrin_RAZONSOCIAL_PROVEEDOR_Width','292','',NULL,NULL,'2023-05-25 13:00:04','2023-05-25 13:00:04','Administrador','Administrador'),
 ('Todos','frmMtoArtProvSearch','cxGrdDBTabPrin_REFERENCIA_PROVEEDOR_Caption','Referencia','',NULL,NULL,'2023-05-25 13:03:08','2023-05-25 13:00:05','Administrador','Administrador'),
 ('Todos','frmMtoArtProvSearch','cxGrdDBTabPrin_REFERENCIA_PROVEEDOR_Index','13','',NULL,NULL,'2023-05-25 13:00:05','2023-05-25 13:00:05','Administrador','Administrador'),
 ('Todos','frmMtoArtProvSearch','cxGrdDBTabPrin_REFERENCIA_PROVEEDOR_Visible','True','',NULL,NULL,'2023-05-25 13:00:05','2023-05-25 13:00:05','Administrador','Administrador'),
 ('Todos','frmMtoArtProvSearch','cxGrdDBTabPrin_REFERENCIA_PROVEEDOR_Width','213','',NULL,NULL,'2023-05-25 13:00:05','2023-05-25 13:00:05','Administrador','Administrador'),
 ('Todos','frmMtoArtProvSearch','cxGrdDBTabPrin_TELEFONO_CONTACTO_PROVEEDOR_Caption','Teléfono Contacto','',NULL,NULL,'2023-05-25 13:03:30','2023-05-25 13:00:05','Administrador','Administrador'),
 ('Todos','frmMtoArtProvSearch','cxGrdDBTabPrin_TELEFONO_CONTACTO_PROVEEDOR_Index','15','',NULL,NULL,'2023-05-25 13:00:05','2023-05-25 13:00:05','Administrador','Administrador'),
 ('Todos','frmMtoArtProvSearch','cxGrdDBTabPrin_TELEFONO_CONTACTO_PROVEEDOR_Visible','True','',NULL,NULL,'2023-05-25 13:00:05','2023-05-25 13:00:05','Administrador','Administrador'),
 ('Todos','frmMtoArtProvSearch','cxGrdDBTabPrin_TELEFONO_CONTACTO_PROVEEDOR_Width','300','',NULL,NULL,'2023-05-25 13:00:05','2023-05-25 13:00:05','Administrador','Administrador'),
 ('Todos','frmMtoArtProvSearch','cxGrdDBTabPrin_TELEFONO_PROVEEDOR_Caption','Teléfono','',NULL,NULL,'2023-05-25 13:03:33','2023-05-25 13:00:05','Administrador','Administrador'),
 ('Todos','frmMtoArtProvSearch','cxGrdDBTabPrin_TELEFONO_PROVEEDOR_Index','16','',NULL,NULL,'2023-05-25 13:00:05','2023-05-25 13:00:05','Administrador','Administrador'),
 ('Todos','frmMtoArtProvSearch','cxGrdDBTabPrin_TELEFONO_PROVEEDOR_Visible','True','',NULL,NULL,'2023-05-25 13:00:05','2023-05-25 13:00:05','Administrador','Administrador'),
 ('Todos','frmMtoArtProvSearch','cxGrdDBTabPrin_TELEFONO_PROVEEDOR_Width','198','',NULL,NULL,'2023-05-25 13:00:05','2023-05-25 13:00:05','Administrador','Administrador'),
 ('Todos','frmMtoArtProvSearch','cxGrdDBTabPrin_USUARIOALTA_Caption','USUARIOALTA','',NULL,NULL,'2023-05-25 13:00:05','2023-05-25 13:00:05','Administrador','Administrador'),
 ('Todos','frmMtoArtProvSearch','cxGrdDBTabPrin_USUARIOALTA_Index','20','',NULL,NULL,'2023-05-25 13:00:05','2023-05-25 13:00:05','Administrador','Administrador'),
 ('Todos','frmMtoArtProvSearch','cxGrdDBTabPrin_USUARIOALTA_Visible','False','',NULL,NULL,'2023-05-25 13:03:37','2023-05-25 13:00:05','Administrador','Administrador'),
 ('Todos','frmMtoArtProvSearch','cxGrdDBTabPrin_USUARIOALTA_Width','127','',NULL,NULL,'2023-05-25 13:00:05','2023-05-25 13:00:05','Administrador','Administrador'),
 ('Todos','frmMtoArtProvSearch','cxGrdDBTabPrin_USUARIOMODIF_Caption','USUARIOMODIF','',NULL,NULL,'2023-05-25 13:00:05','2023-05-25 13:00:05','Administrador','Administrador'),
 ('Todos','frmMtoArtProvSearch','cxGrdDBTabPrin_USUARIOMODIF_Index','21','',NULL,NULL,'2023-05-25 13:00:05','2023-05-25 13:00:05','Administrador','Administrador'),
 ('Todos','frmMtoArtProvSearch','cxGrdDBTabPrin_USUARIOMODIF_Visible','False','',NULL,NULL,'2023-05-25 13:03:42','2023-05-25 13:00:05','Administrador','Administrador'),
 ('Todos','frmMtoArtProvSearch','cxGrdDBTabPrin_USUARIOMODIF_Width','140','',NULL,NULL,'2023-05-25 13:00:05','2023-05-25 13:00:05','Administrador','Administrador'),
 ('Todos','frmMtoArtProvSearch','lblEditMode_Caption','Navegando','',NULL,NULL,'2023-05-25 13:01:17','2023-05-25 13:01:17','Administrador','Administrador'),
 ('Todos','frmMtoArtProvSearch','lblTablaOrigen_Caption','vi_proveedores','',NULL,NULL,'2023-05-25 13:01:17','2023-05-25 13:01:17','Administrador','Administrador'),
 ('Todos','frmMtoArtProvSearch','lblTextoaBuscar_Caption','Texto a buscar','',NULL,NULL,'2023-05-25 13:01:17','2023-05-25 13:01:17','Administrador','Administrador'),
 ('Todos','frmMtoArtProvSearch','lblTextoaBuscarPerfil_Caption','Texto a buscar','',NULL,NULL,'2023-05-25 13:01:17','2023-05-25 13:01:17','Administrador','Administrador'),
 ('Todos','frmMtoArtProvSearch','oApplyWidth','True','',NULL,NULL,'2023-05-25 13:01:22','2023-05-25 13:01:22','Administrador','Administrador'),
 ('Todos','frmMtoArtProvSearch','oBusqGlobal','Grid','',NULL,NULL,'2023-05-25 13:01:22','2023-05-25 13:01:22','Administrador','Administrador'),
 ('Todos','frmMtoArtProvSearch','oCreateItems','False','',NULL,NULL,'2023-05-25 13:01:22','2023-05-25 13:01:22','Administrador','Administrador'),
 ('Todos','frmMtoArtProvSearch','tsFicha_Caption','&Ficha','',NULL,NULL,'2023-05-25 13:01:17','2023-05-25 13:01:17','Administrador','Administrador'),
 ('Todos','frmMtoArtProvSearch','tsLista_Caption','&Lista','',NULL,NULL,'2023-05-25 13:01:17','2023-05-25 13:01:17','Administrador','Administrador'),
 ('Todos','frmMtoArtProvSearch','tsPerfil_Caption','Perfil','',NULL,NULL,'2023-05-25 13:01:17','2023-05-25 13:01:17','Administrador','Administrador'),
 ('Todos','frmMtoArtProvSearch','tvPerfil_KEY_PERFILES_Caption','KEY_PERFILES','',NULL,NULL,'2023-05-25 13:00:05','2023-05-25 13:00:05','Administrador','Administrador'),
 ('Todos','frmMtoArtProvSearch','tvPerfil_KEY_PERFILES_Index','1','',NULL,NULL,'2023-05-25 13:00:05','2023-05-25 13:00:05','Administrador','Administrador'),
 ('Todos','frmMtoArtProvSearch','tvPerfil_KEY_PERFILES_Visible','True','',NULL,NULL,'2023-05-25 13:00:05','2023-05-25 13:00:05','Administrador','Administrador'),
 ('Todos','frmMtoArtProvSearch','tvPerfil_KEY_PERFILES_Width','132','',NULL,NULL,'2023-05-25 13:00:05','2023-05-25 13:00:05','Administrador','Administrador');
INSERT INTO `fza_usuarios_perfiles`(`USUARIO_GRUPO_PERFILES`, `KEY_PERFILES`, `SUBKEY_PERFILES`, `VALUE_PERFILES`, `VALUE_TEXT_PERFILES`, `TYPE_BLOB_PERFILES`, `VALUE_BLOB_PERFILES`, `INSTANTEMODIF`, `INSTANTEALTA`, `USUARIOALTA`, `USUARIOMODIF`) VALUES
 ('Todos','frmMtoArtProvSearch','tvPerfil_SUBKEY_PERFILES_Caption','SUBKEY_PERFILES','',NULL,NULL,'2023-05-25 13:00:05','2023-05-25 13:00:05','Administrador','Administrador'),
 ('Todos','frmMtoArtProvSearch','tvPerfil_SUBKEY_PERFILES_Index','2','',NULL,NULL,'2023-05-25 13:00:05','2023-05-25 13:00:05','Administrador','Administrador'),
 ('Todos','frmMtoArtProvSearch','tvPerfil_SUBKEY_PERFILES_Visible','True','',NULL,NULL,'2023-05-25 13:00:05','2023-05-25 13:00:05','Administrador','Administrador'),
 ('Todos','frmMtoArtProvSearch','tvPerfil_SUBKEY_PERFILES_Width','190','',NULL,NULL,'2023-05-25 13:00:05','2023-05-25 13:00:05','Administrador','Administrador'),
 ('Todos','frmMtoArtProvSearch','tvPerfil_TYPE_BLOB_PERFILES_Caption','TYPE_BLOB_PERFILES','',NULL,NULL,'2023-05-25 13:00:05','2023-05-25 13:00:05','Administrador','Administrador'),
 ('Todos','frmMtoArtProvSearch','tvPerfil_TYPE_BLOB_PERFILES_Index','5','',NULL,NULL,'2023-05-25 13:00:05','2023-05-25 13:00:05','Administrador','Administrador'),
 ('Todos','frmMtoArtProvSearch','tvPerfil_TYPE_BLOB_PERFILES_Visible','True','',NULL,NULL,'2023-05-25 13:00:05','2023-05-25 13:00:05','Administrador','Administrador'),
 ('Todos','frmMtoArtProvSearch','tvPerfil_TYPE_BLOB_PERFILES_Width','114','',NULL,NULL,'2023-05-25 13:00:05','2023-05-25 13:00:05','Administrador','Administrador'),
 ('Todos','frmMtoArtProvSearch','tvPerfil_USUARIO_GRUPO_PERFILES_Caption','USUARIO_GRUPO_PERFILES','',NULL,NULL,'2023-05-25 13:00:05','2023-05-25 13:00:05','Administrador','Administrador'),
 ('Todos','frmMtoArtProvSearch','tvPerfil_USUARIO_GRUPO_PERFILES_Index','0','',NULL,NULL,'2023-05-25 13:00:05','2023-05-25 13:00:05','Administrador','Administrador'),
 ('Todos','frmMtoArtProvSearch','tvPerfil_USUARIO_GRUPO_PERFILES_Visible','True','',NULL,NULL,'2023-05-25 13:00:05','2023-05-25 13:00:05','Administrador','Administrador'),
 ('Todos','frmMtoArtProvSearch','tvPerfil_USUARIO_GRUPO_PERFILES_Width','167','',NULL,NULL,'2023-05-25 13:00:05','2023-05-25 13:00:05','Administrador','Administrador'),
 ('Todos','frmMtoArtProvSearch','tvPerfil_VALUE_BLOB_PERFILES_Caption','VALUE_BLOB_PERFILES','',NULL,NULL,'2023-05-25 13:00:05','2023-05-25 13:00:05','Administrador','Administrador'),
 ('Todos','frmMtoArtProvSearch','tvPerfil_VALUE_BLOB_PERFILES_Index','6','',NULL,NULL,'2023-05-25 13:00:05','2023-05-25 13:00:05','Administrador','Administrador'),
 ('Todos','frmMtoArtProvSearch','tvPerfil_VALUE_BLOB_PERFILES_Visible','True','',NULL,NULL,'2023-05-25 13:00:05','2023-05-25 13:00:05','Administrador','Administrador'),
 ('Todos','frmMtoArtProvSearch','tvPerfil_VALUE_BLOB_PERFILES_Width','114','',NULL,NULL,'2023-05-25 13:00:05','2023-05-25 13:00:05','Administrador','Administrador'),
 ('Todos','frmMtoArtProvSearch','tvPerfil_VALUE_PERFILES_Caption','VALUE_PERFILES','',NULL,NULL,'2023-05-25 13:00:05','2023-05-25 13:00:05','Administrador','Administrador'),
 ('Todos','frmMtoArtProvSearch','tvPerfil_VALUE_PERFILES_Index','3','',NULL,NULL,'2023-05-25 13:00:05','2023-05-25 13:00:05','Administrador','Administrador'),
 ('Todos','frmMtoArtProvSearch','tvPerfil_VALUE_PERFILES_Visible','True','',NULL,NULL,'2023-05-25 13:00:05','2023-05-25 13:00:05','Administrador','Administrador'),
 ('Todos','frmMtoArtProvSearch','tvPerfil_VALUE_PERFILES_Width','112','',NULL,NULL,'2023-05-25 13:00:05','2023-05-25 13:00:05','Administrador','Administrador'),
 ('Todos','frmMtoArtProvSearch','tvPerfil_VALUE_TEXT_PERFILES_Caption','VALUE_TEXT_PERFILES','',NULL,NULL,'2023-05-25 13:00:05','2023-05-25 13:00:05','Administrador','Administrador'),
 ('Todos','frmMtoArtProvSearch','tvPerfil_VALUE_TEXT_PERFILES_Index','4','',NULL,NULL,'2023-05-25 13:00:05','2023-05-25 13:00:05','Administrador','Administrador'),
 ('Todos','frmMtoArtProvSearch','tvPerfil_VALUE_TEXT_PERFILES_Visible','True','',NULL,NULL,'2023-05-25 13:00:05','2023-05-25 13:00:05','Administrador','Administrador'),
 ('Todos','frmMtoArtProvSearch','tvPerfil_VALUE_TEXT_PERFILES_Width','140','',NULL,NULL,'2023-05-25 13:00:05','2023-05-25 13:00:05','Administrador','Administrador'),
 ('Todos','frmMtoCliFacSearch','btnAceptar_Caption','&Aceptar','',NULL,NULL,'2023-01-24 19:26:16','2023-01-24 19:26:16','Administrador','Administrador'),
 ('Todos','frmMtoCliFacSearch','btnCancelar_Caption','&Cancelar','',NULL,NULL,'2023-01-24 19:26:16','2023-01-24 19:26:16','Administrador','Administrador'),
 ('Todos','frmMtoCliFacSearch','btnCancelar1_Caption','&Cancelar','',NULL,NULL,'2023-01-24 19:26:16','2023-01-24 19:26:16','Administrador','Administrador'),
 ('Todos','frmMtoCliFacSearch','btnCargarCaptions_Caption','&Cargar captions','',NULL,NULL,'2023-01-24 19:26:16','2023-01-24 19:26:16','Administrador','Administrador'),
 ('Todos','frmMtoCliFacSearch','btnCargarColumnas_Caption','&Cargar columnas','',NULL,NULL,'2023-01-24 19:26:16','2023-01-24 19:26:16','Administrador','Administrador'),
 ('Todos','frmMtoCliFacSearch','btnCargarVblesGlob_Caption','&Cargar Vbles Globales','',NULL,NULL,'2023-01-24 19:26:16','2023-01-24 19:26:16','Administrador','Administrador'),
 ('Todos','frmMtoCliFacSearch','btnGrabar_Caption','&Grabar','',NULL,NULL,'2023-01-24 19:26:16','2023-01-24 19:26:16','Administrador','Administrador'),
 ('Todos','frmMtoCliFacSearch','btnSalir_Caption','出来','',NULL,NULL,'2023-08-28 14:49:56','2023-01-24 19:26:16','Administrador','Administrador'),
 ('Todos','frmMtoCliFacSearch','cxGrdDBTabPrin__oApplyWidth','True','',NULL,NULL,'2023-12-14 17:40:16','2023-12-14 17:40:16','Administrador','Administrador'),
 ('Todos','frmMtoCliFacSearch','cxGrdDBTabPrin_ACTIVO_CLIENTE_Index','1','',NULL,NULL,'2023-12-14 17:40:16','2023-12-14 17:40:16','Administrador','Administrador'),
 ('Todos','frmMtoCliFacSearch','cxGrdDBTabPrin_ACTIVO_CLIENTE_Visible','False','',NULL,NULL,'2023-12-14 17:40:16','2023-12-14 17:40:16','Administrador','Administrador'),
 ('Todos','frmMtoCliFacSearch','cxGrdDBTabPrin_CODIGO_CLIENTE_Caption','Código Cliente','',NULL,NULL,'2023-12-14 17:40:16','2023-12-14 17:40:16','Administrador','Administrador'),
 ('Todos','frmMtoCliFacSearch','cxGrdDBTabPrin_CODIGO_CLIENTE_Index','0','',NULL,NULL,'2023-12-14 17:40:16','2023-12-14 17:40:16','Administrador','Administrador'),
 ('Todos','frmMtoCliFacSearch','cxGrdDBTabPrin_CODIGO_CLIENTE_Visible','True','',NULL,NULL,'2023-12-14 17:40:16','2023-12-14 17:40:16','Administrador','Administrador'),
 ('Todos','frmMtoCliFacSearch','cxGrdDBTabPrin_CODIGO_CLIENTE_Width','131','',NULL,NULL,'2023-12-14 17:40:16','2023-12-14 17:40:16','Administrador','Administrador'),
 ('Todos','frmMtoCliFacSearch','cxGrdDBTabPrin_CODIGO_FORMA_PAGO_CLIENTE_Caption','Forma de Pago','',NULL,NULL,'2023-12-14 17:40:16','2023-12-14 17:40:16','Administrador','Administrador'),
 ('Todos','frmMtoCliFacSearch','cxGrdDBTabPrin_CODIGO_FORMA_PAGO_CLIENTE_Index','23','',NULL,NULL,'2023-12-14 17:40:16','2023-12-14 17:40:16','Administrador','Administrador'),
 ('Todos','frmMtoCliFacSearch','cxGrdDBTabPrin_CODIGO_FORMA_PAGO_CLIENTE_Visible','True','',NULL,NULL,'2023-12-14 17:40:16','2023-12-14 17:40:16','Administrador','Administrador'),
 ('Todos','frmMtoCliFacSearch','cxGrdDBTabPrin_CODIGO_FORMA_PAGO_CLIENTE_Width','139','',NULL,NULL,'2023-12-14 17:40:16','2023-12-14 17:40:16','Administrador','Administrador'),
 ('Todos','frmMtoCliFacSearch','cxGrdDBTabPrin_CONTACTO_CLIENTE_Caption','Contacto','',NULL,NULL,'2023-12-14 17:40:16','2023-12-14 17:40:16','Administrador','Administrador'),
 ('Todos','frmMtoCliFacSearch','cxGrdDBTabPrin_CONTACTO_CLIENTE_Index','14','',NULL,NULL,'2023-12-14 17:40:16','2023-12-14 17:40:16','Administrador','Administrador'),
 ('Todos','frmMtoCliFacSearch','cxGrdDBTabPrin_CONTACTO_CLIENTE_Visible','True','',NULL,NULL,'2023-12-14 17:40:16','2023-12-14 17:40:16','Administrador','Administrador'),
 ('Todos','frmMtoCliFacSearch','cxGrdDBTabPrin_CONTACTO_CLIENTE_Width','164','',NULL,NULL,'2023-12-14 17:40:16','2023-12-14 17:40:16','Administrador','Administrador'),
 ('Todos','frmMtoCliFacSearch','cxGrdDBTabPrin_CPOSTAL_CLIENTE_Caption','Código Postal','',NULL,NULL,'2023-12-14 17:40:16','2023-12-14 17:40:16','Administrador','Administrador'),
 ('Todos','frmMtoCliFacSearch','cxGrdDBTabPrin_CPOSTAL_CLIENTE_Index','10','',NULL,NULL,'2023-12-14 17:40:16','2023-12-14 17:40:16','Administrador','Administrador'),
 ('Todos','frmMtoCliFacSearch','cxGrdDBTabPrin_CPOSTAL_CLIENTE_Visible','True','',NULL,NULL,'2023-12-14 17:40:16','2023-12-14 17:40:16','Administrador','Administrador'),
 ('Todos','frmMtoCliFacSearch','cxGrdDBTabPrin_CPOSTAL_CLIENTE_Width','141','',NULL,NULL,'2023-12-14 17:40:16','2023-12-14 17:40:16','Administrador','Administrador'),
 ('Todos','frmMtoCliFacSearch','cxGrdDBTabPrin_DIRECCION1_CLIENTE_Caption','Dirección 1','',NULL,NULL,'2023-12-14 17:40:16','2023-12-14 17:40:16','Administrador','Administrador'),
 ('Todos','frmMtoCliFacSearch','cxGrdDBTabPrin_DIRECCION1_CLIENTE_Index','6','',NULL,NULL,'2023-12-14 17:40:16','2023-12-14 17:40:16','Administrador','Administrador'),
 ('Todos','frmMtoCliFacSearch','cxGrdDBTabPrin_DIRECCION1_CLIENTE_Visible','True','',NULL,NULL,'2023-12-14 17:40:16','2023-12-14 17:40:16','Administrador','Administrador'),
 ('Todos','frmMtoCliFacSearch','cxGrdDBTabPrin_DIRECCION1_CLIENTE_Width','312','',NULL,NULL,'2023-12-14 17:40:16','2023-12-14 17:40:16','Administrador','Administrador'),
 ('Todos','frmMtoCliFacSearch','cxGrdDBTabPrin_DIRECCION2_CLIENTE_Caption','Dirección 2','',NULL,NULL,'2023-12-14 17:40:16','2023-12-14 17:40:16','Administrador','Administrador'),
 ('Todos','frmMtoCliFacSearch','cxGrdDBTabPrin_DIRECCION2_CLIENTE_Index','7','',NULL,NULL,'2023-12-14 17:40:16','2023-12-14 17:40:16','Administrador','Administrador'),
 ('Todos','frmMtoCliFacSearch','cxGrdDBTabPrin_DIRECCION2_CLIENTE_Visible','True','',NULL,NULL,'2023-12-14 17:40:16','2023-12-14 17:40:16','Administrador','Administrador'),
 ('Todos','frmMtoCliFacSearch','cxGrdDBTabPrin_DIRECCION2_CLIENTE_Width','86','',NULL,NULL,'2023-12-14 17:40:16','2023-12-14 17:40:16','Administrador','Administrador'),
 ('Todos','frmMtoCliFacSearch','cxGrdDBTabPrin_EMAIL_CLIENTE_Caption','Email','',NULL,NULL,'2023-12-14 17:40:16','2023-12-14 17:40:16','Administrador','Administrador'),
 ('Todos','frmMtoCliFacSearch','cxGrdDBTabPrin_EMAIL_CLIENTE_Index','5','',NULL,NULL,'2023-12-14 17:40:16','2023-12-14 17:40:16','Administrador','Administrador'),
 ('Todos','frmMtoCliFacSearch','cxGrdDBTabPrin_EMAIL_CLIENTE_Visible','True','',NULL,NULL,'2023-12-14 17:40:16','2023-12-14 17:40:16','Administrador','Administrador'),
 ('Todos','frmMtoCliFacSearch','cxGrdDBTabPrin_EMAIL_CLIENTE_Width','249','',NULL,NULL,'2023-12-14 17:40:16','2023-12-14 17:40:16','Administrador','Administrador'),
 ('Todos','frmMtoCliFacSearch','cxGrdDBTabPrin_ESINTRACOMUNITARIO_CLIENTE_Caption','Intracomunitario','',NULL,NULL,'2023-12-14 17:40:16','2023-12-14 17:40:16','Administrador','Administrador'),
 ('Todos','frmMtoCliFacSearch','cxGrdDBTabPrin_ESINTRACOMUNITARIO_CLIENTE_Index','22','',NULL,NULL,'2023-12-14 17:40:16','2023-12-14 17:40:16','Administrador','Administrador'),
 ('Todos','frmMtoCliFacSearch','cxGrdDBTabPrin_ESINTRACOMUNITARIO_CLIENTE_Visible','True','',NULL,NULL,'2023-12-14 17:40:16','2023-12-14 17:40:16','Administrador','Administrador'),
 ('Todos','frmMtoCliFacSearch','cxGrdDBTabPrin_ESINTRACOMUNITARIO_CLIENTE_Width','256','',NULL,NULL,'2023-12-14 17:40:16','2023-12-14 17:40:16','Administrador','Administrador'),
 ('Todos','frmMtoCliFacSearch','cxGrdDBTabPrin_ESIVA_EXENTO_CLIENTE_Caption','IVA Exento','',NULL,NULL,'2023-12-14 17:40:16','2023-12-14 17:40:16','Administrador','Administrador'),
 ('Todos','frmMtoCliFacSearch','cxGrdDBTabPrin_ESIVA_EXENTO_CLIENTE_Index','20','',NULL,NULL,'2023-12-14 17:40:16','2023-12-14 17:40:16','Administrador','Administrador'),
 ('Todos','frmMtoCliFacSearch','cxGrdDBTabPrin_ESIVA_EXENTO_CLIENTE_Visible','True','',NULL,NULL,'2023-12-14 17:40:16','2023-12-14 17:40:16','Administrador','Administrador'),
 ('Todos','frmMtoCliFacSearch','cxGrdDBTabPrin_ESIVA_EXENTO_CLIENTE_Width','193','',NULL,NULL,'2023-12-14 17:40:16','2023-12-14 17:40:16','Administrador','Administrador'),
 ('Todos','frmMtoCliFacSearch','cxGrdDBTabPrin_ESIVA_RECARGO_CLIENTE_Caption','Tiene Recargo','',NULL,NULL,'2023-12-14 17:40:16','2023-12-14 17:40:16','Administrador','Administrador'),
 ('Todos','frmMtoCliFacSearch','cxGrdDBTabPrin_ESIVA_RECARGO_CLIENTE_Index','18','',NULL,NULL,'2023-12-14 17:40:16','2023-12-14 17:40:16','Administrador','Administrador'),
 ('Todos','frmMtoCliFacSearch','cxGrdDBTabPrin_ESIVA_RECARGO_CLIENTE_Visible','True','',NULL,NULL,'2023-12-14 17:40:16','2023-12-14 17:40:16','Administrador','Administrador'),
 ('Todos','frmMtoCliFacSearch','cxGrdDBTabPrin_ESIVA_RECARGO_CLIENTE_Width','206','',NULL,NULL,'2023-12-14 17:40:16','2023-12-14 17:40:16','Administrador','Administrador'),
 ('Todos','frmMtoCliFacSearch','cxGrdDBTabPrin_ESREGIMENESPECIALAGRICOLA_CLIENTE_Caption','Es Agricultor REAGP','',NULL,NULL,'2023-12-14 17:40:16','2023-12-14 17:40:16','Administrador','Administrador'),
 ('Todos','frmMtoCliFacSearch','cxGrdDBTabPrin_ESREGIMENESPECIALAGRICOLA_CLIENTE_Index','21','',NULL,NULL,'2023-12-14 17:40:16','2023-12-14 17:40:16','Administrador','Administrador'),
 ('Todos','frmMtoCliFacSearch','cxGrdDBTabPrin_ESREGIMENESPECIALAGRICOLA_CLIENTE_Visible','True','',NULL,NULL,'2023-12-14 17:40:16','2023-12-14 17:40:16','Administrador','Administrador'),
 ('Todos','frmMtoCliFacSearch','cxGrdDBTabPrin_ESREGIMENESPECIALAGRICOLA_CLIENTE_Width','315','',NULL,NULL,'2023-12-14 17:40:16','2023-12-14 17:40:16','Administrador','Administrador'),
 ('Todos','frmMtoCliFacSearch','cxGrdDBTabPrin_ESRETENCIONES_CLIENTE_Caption','Retiene IRPF','',NULL,NULL,'2023-12-14 17:40:16','2023-12-14 17:40:16','Administrador','Administrador'),
 ('Todos','frmMtoCliFacSearch','cxGrdDBTabPrin_ESRETENCIONES_CLIENTE_Index','19','',NULL,NULL,'2023-12-14 17:40:16','2023-12-14 17:40:16','Administrador','Administrador'),
 ('Todos','frmMtoCliFacSearch','cxGrdDBTabPrin_ESRETENCIONES_CLIENTE_Visible','True','',NULL,NULL,'2023-12-14 17:40:16','2023-12-14 17:40:16','Administrador','Administrador'),
 ('Todos','frmMtoCliFacSearch','cxGrdDBTabPrin_ESRETENCIONES_CLIENTE_Width','203','',NULL,NULL,'2023-12-14 17:40:16','2023-12-14 17:40:16','Administrador','Administrador'),
 ('Todos','frmMtoCliFacSearch','cxGrdDBTabPrin_IBAN_CLIENTE_Caption','Nro Cuenta IBAN','',NULL,NULL,'2023-12-14 17:40:16','2023-12-14 17:40:16','Administrador','Administrador'),
 ('Todos','frmMtoCliFacSearch','cxGrdDBTabPrin_IBAN_CLIENTE_Index','17','',NULL,NULL,'2023-12-14 17:40:16','2023-12-14 17:40:16','Administrador','Administrador'),
 ('Todos','frmMtoCliFacSearch','cxGrdDBTabPrin_IBAN_CLIENTE_Visible','True','',NULL,NULL,'2023-12-14 17:40:16','2023-12-14 17:40:16','Administrador','Administrador'),
 ('Todos','frmMtoCliFacSearch','cxGrdDBTabPrin_IBAN_CLIENTE_Width','143','',NULL,NULL,'2023-12-14 17:40:16','2023-12-14 17:40:16','Administrador','Administrador'),
 ('Todos','frmMtoCliFacSearch','cxGrdDBTabPrin_INSTANTEALTA_Index','28','',NULL,NULL,'2023-12-14 17:40:16','2023-12-14 17:40:16','Administrador','Administrador'),
 ('Todos','frmMtoCliFacSearch','cxGrdDBTabPrin_INSTANTEALTA_Visible','False','',NULL,NULL,'2023-12-14 17:40:16','2023-12-14 17:40:16','Administrador','Administrador'),
 ('Todos','frmMtoCliFacSearch','cxGrdDBTabPrin_INSTANTEMODIF_Index','27','',NULL,NULL,'2023-12-14 17:40:16','2023-12-14 17:40:16','Administrador','Administrador'),
 ('Todos','frmMtoCliFacSearch','cxGrdDBTabPrin_INSTANTEMODIF_Visible','False','',NULL,NULL,'2023-12-14 17:40:16','2023-12-14 17:40:16','Administrador','Administrador'),
 ('Todos','frmMtoCliFacSearch','cxGrdDBTabPrin_MOVIL_CLIENTE_Caption','Móvil','',NULL,NULL,'2023-12-14 17:40:16','2023-12-14 17:40:16','Administrador','Administrador'),
 ('Todos','frmMtoCliFacSearch','cxGrdDBTabPrin_MOVIL_CLIENTE_Index','4','',NULL,NULL,'2023-12-14 17:40:16','2023-12-14 17:40:16','Administrador','Administrador');
INSERT INTO `fza_usuarios_perfiles`(`USUARIO_GRUPO_PERFILES`, `KEY_PERFILES`, `SUBKEY_PERFILES`, `VALUE_PERFILES`, `VALUE_TEXT_PERFILES`, `TYPE_BLOB_PERFILES`, `VALUE_BLOB_PERFILES`, `INSTANTEMODIF`, `INSTANTEALTA`, `USUARIOALTA`, `USUARIOMODIF`) VALUES
 ('Todos','frmMtoCliFacSearch','cxGrdDBTabPrin_MOVIL_CLIENTE_Visible','True','',NULL,NULL,'2023-12-14 17:40:16','2023-12-14 17:40:16','Administrador','Administrador'),
 ('Todos','frmMtoCliFacSearch','cxGrdDBTabPrin_MOVIL_CLIENTE_Width','136','',NULL,NULL,'2023-12-14 17:40:16','2023-12-14 17:40:16','Administrador','Administrador'),
 ('Todos','frmMtoCliFacSearch','cxGrdDBTabPrin_NIF_CLIENTE_Caption','Nif','',NULL,NULL,'2023-12-14 17:40:16','2023-12-14 17:40:16','Administrador','Administrador'),
 ('Todos','frmMtoCliFacSearch','cxGrdDBTabPrin_NIF_CLIENTE_Index','3','',NULL,NULL,'2023-12-14 17:40:16','2023-12-14 17:40:16','Administrador','Administrador'),
 ('Todos','frmMtoCliFacSearch','cxGrdDBTabPrin_NIF_CLIENTE_Visible','True','',NULL,NULL,'2023-12-14 17:40:16','2023-12-14 17:40:16','Administrador','Administrador'),
 ('Todos','frmMtoCliFacSearch','cxGrdDBTabPrin_NIF_CLIENTE_Width','142','',NULL,NULL,'2023-12-14 17:40:16','2023-12-14 17:40:16','Administrador','Administrador'),
 ('Todos','frmMtoCliFacSearch','cxGrdDBTabPrin_OBSERVACIONES_CLIENTE_Caption','Observaciones','',NULL,NULL,'2023-12-14 17:40:16','2023-12-14 17:40:16','Administrador','Administrador'),
 ('Todos','frmMtoCliFacSearch','cxGrdDBTabPrin_OBSERVACIONES_CLIENTE_Index','12','',NULL,NULL,'2023-12-14 17:40:16','2023-12-14 17:40:16','Administrador','Administrador'),
 ('Todos','frmMtoCliFacSearch','cxGrdDBTabPrin_OBSERVACIONES_CLIENTE_Visible','True','',NULL,NULL,'2023-12-14 17:40:16','2023-12-14 17:40:16','Administrador','Administrador'),
 ('Todos','frmMtoCliFacSearch','cxGrdDBTabPrin_OBSERVACIONES_CLIENTE_Width','196','',NULL,NULL,'2023-12-14 17:40:16','2023-12-14 17:40:16','Administrador','Administrador'),
 ('Todos','frmMtoCliFacSearch','cxGrdDBTabPrin_PAIS_CLIENTE_Caption','País','',NULL,NULL,'2023-12-14 17:40:16','2023-12-14 17:40:16','Administrador','Administrador'),
 ('Todos','frmMtoCliFacSearch','cxGrdDBTabPrin_PAIS_CLIENTE_Index','11','',NULL,NULL,'2023-12-14 17:40:16','2023-12-14 17:40:16','Administrador','Administrador'),
 ('Todos','frmMtoCliFacSearch','cxGrdDBTabPrin_PAIS_CLIENTE_Visible','True','',NULL,NULL,'2023-12-14 17:40:16','2023-12-14 17:40:16','Administrador','Administrador'),
 ('Todos','frmMtoCliFacSearch','cxGrdDBTabPrin_PAIS_CLIENTE_Width','56','',NULL,NULL,'2023-12-14 17:40:16','2023-12-14 17:40:16','Administrador','Administrador'),
 ('Todos','frmMtoCliFacSearch','cxGrdDBTabPrin_POBLACION_CLIENTE_Caption','Población','',NULL,NULL,'2023-12-14 17:40:16','2023-12-14 17:40:16','Administrador','Administrador'),
 ('Todos','frmMtoCliFacSearch','cxGrdDBTabPrin_POBLACION_CLIENTE_Index','8','',NULL,NULL,'2023-12-14 17:40:16','2023-12-14 17:40:16','Administrador','Administrador'),
 ('Todos','frmMtoCliFacSearch','cxGrdDBTabPrin_POBLACION_CLIENTE_Visible','True','',NULL,NULL,'2023-12-14 17:40:16','2023-12-14 17:40:16','Administrador','Administrador'),
 ('Todos','frmMtoCliFacSearch','cxGrdDBTabPrin_POBLACION_CLIENTE_Width','227','',NULL,NULL,'2023-12-14 17:40:16','2023-12-14 17:40:16','Administrador','Administrador'),
 ('Todos','frmMtoCliFacSearch','cxGrdDBTabPrin_PROVINCIA_CLIENTE_Caption','Provincia','',NULL,NULL,'2023-12-14 17:40:16','2023-12-14 17:40:16','Administrador','Administrador'),
 ('Todos','frmMtoCliFacSearch','cxGrdDBTabPrin_PROVINCIA_CLIENTE_Index','9','',NULL,NULL,'2023-12-14 17:40:16','2023-12-14 17:40:16','Administrador','Administrador'),
 ('Todos','frmMtoCliFacSearch','cxGrdDBTabPrin_PROVINCIA_CLIENTE_Visible','True','',NULL,NULL,'2023-12-14 17:40:16','2023-12-14 17:40:16','Administrador','Administrador'),
 ('Todos','frmMtoCliFacSearch','cxGrdDBTabPrin_PROVINCIA_CLIENTE_Width','177','',NULL,NULL,'2023-12-14 17:40:16','2023-12-14 17:40:16','Administrador','Administrador'),
 ('Todos','frmMtoCliFacSearch','cxGrdDBTabPrin_RAZONSOCIAL_CLIENTE_Caption','Razón Social','',NULL,NULL,'2023-12-14 17:40:16','2023-12-14 17:40:16','Administrador','Administrador'),
 ('Todos','frmMtoCliFacSearch','cxGrdDBTabPrin_RAZONSOCIAL_CLIENTE_Index','2','',NULL,NULL,'2023-12-14 17:40:16','2023-12-14 17:40:16','Administrador','Administrador'),
 ('Todos','frmMtoCliFacSearch','cxGrdDBTabPrin_RAZONSOCIAL_CLIENTE_Visible','True','',NULL,NULL,'2023-12-14 17:40:16','2023-12-14 17:40:16','Administrador','Administrador'),
 ('Todos','frmMtoCliFacSearch','cxGrdDBTabPrin_RAZONSOCIAL_CLIENTE_Width','292','',NULL,NULL,'2023-12-14 17:40:16','2023-12-14 17:40:16','Administrador','Administrador'),
 ('Todos','frmMtoCliFacSearch','cxGrdDBTabPrin_REFERENCIA_CLIENTE_Caption','Referencia','',NULL,NULL,'2023-12-14 17:40:16','2023-12-14 17:40:16','Administrador','Administrador'),
 ('Todos','frmMtoCliFacSearch','cxGrdDBTabPrin_REFERENCIA_CLIENTE_Index','13','',NULL,NULL,'2023-12-14 17:40:16','2023-12-14 17:40:16','Administrador','Administrador'),
 ('Todos','frmMtoCliFacSearch','cxGrdDBTabPrin_REFERENCIA_CLIENTE_Visible','True','',NULL,NULL,'2023-12-14 17:40:16','2023-12-14 17:40:16','Administrador','Administrador'),
 ('Todos','frmMtoCliFacSearch','cxGrdDBTabPrin_REFERENCIA_CLIENTE_Width','87','',NULL,NULL,'2023-12-14 17:40:16','2023-12-14 17:40:16','Administrador','Administrador'),
 ('Todos','frmMtoCliFacSearch','cxGrdDBTabPrin_SERIE_CONTADOR_CLIENTE_Caption','Serie Particular de Facturación','',NULL,NULL,'2023-12-14 17:40:16','2023-12-14 17:40:16','Administrador','Administrador'),
 ('Todos','frmMtoCliFacSearch','cxGrdDBTabPrin_SERIE_CONTADOR_CLIENTE_Index','24','',NULL,NULL,'2023-12-14 17:40:16','2023-12-14 17:40:16','Administrador','Administrador'),
 ('Todos','frmMtoCliFacSearch','cxGrdDBTabPrin_SERIE_CONTADOR_CLIENTE_Visible','True','',NULL,NULL,'2023-12-14 17:40:16','2023-12-14 17:40:16','Administrador','Administrador'),
 ('Todos','frmMtoCliFacSearch','cxGrdDBTabPrin_SERIE_CONTADOR_CLIENTE_Width','227','',NULL,NULL,'2023-12-14 17:40:16','2023-12-14 17:40:16','Administrador','Administrador'),
 ('Todos','frmMtoCliFacSearch','cxGrdDBTabPrin_TARIFA_ARTICULO_CLIENTE_Caption','Tarifa Artículos','',NULL,NULL,'2023-12-14 17:40:16','2023-12-14 17:40:16','Administrador','Administrador'),
 ('Todos','frmMtoCliFacSearch','cxGrdDBTabPrin_TARIFA_ARTICULO_CLIENTE_Index','25','',NULL,NULL,'2023-12-14 17:40:16','2023-12-14 17:40:16','Administrador','Administrador'),
 ('Todos','frmMtoCliFacSearch','cxGrdDBTabPrin_TARIFA_ARTICULO_CLIENTE_Visible','True','',NULL,NULL,'2023-12-14 17:40:16','2023-12-14 17:40:16','Administrador','Administrador'),
 ('Todos','frmMtoCliFacSearch','cxGrdDBTabPrin_TARIFA_ARTICULO_CLIENTE_Width','209','',NULL,NULL,'2023-12-14 17:40:16','2023-12-14 17:40:16','Administrador','Administrador'),
 ('Todos','frmMtoCliFacSearch','cxGrdDBTabPrin_TELEFONO_CLIENTE_Caption','Teléfono','',NULL,NULL,'2023-12-14 17:40:16','2023-12-14 17:40:16','Administrador','Administrador'),
 ('Todos','frmMtoCliFacSearch','cxGrdDBTabPrin_TELEFONO_CLIENTE_Index','16','',NULL,NULL,'2023-12-14 17:40:16','2023-12-14 17:40:16','Administrador','Administrador'),
 ('Todos','frmMtoCliFacSearch','cxGrdDBTabPrin_TELEFONO_CLIENTE_Visible','True','',NULL,NULL,'2023-12-14 17:40:16','2023-12-14 17:40:16','Administrador','Administrador'),
 ('Todos','frmMtoCliFacSearch','cxGrdDBTabPrin_TELEFONO_CLIENTE_Width','161','',NULL,NULL,'2023-12-14 17:40:16','2023-12-14 17:40:16','Administrador','Administrador'),
 ('Todos','frmMtoCliFacSearch','cxGrdDBTabPrin_TELEFONO_CONTACTO_CLIENTE_Caption','Teléfono Contacto','',NULL,NULL,'2023-12-14 17:40:16','2023-12-14 17:40:16','Administrador','Administrador'),
 ('Todos','frmMtoCliFacSearch','cxGrdDBTabPrin_TELEFONO_CONTACTO_CLIENTE_Index','15','',NULL,NULL,'2023-12-14 17:40:16','2023-12-14 17:40:16','Administrador','Administrador'),
 ('Todos','frmMtoCliFacSearch','cxGrdDBTabPrin_TELEFONO_CONTACTO_CLIENTE_Visible','True','',NULL,NULL,'2023-12-14 17:40:16','2023-12-14 17:40:16','Administrador','Administrador'),
 ('Todos','frmMtoCliFacSearch','cxGrdDBTabPrin_TELEFONO_CONTACTO_CLIENTE_Width','151','',NULL,NULL,'2023-12-14 17:40:16','2023-12-14 17:40:16','Administrador','Administrador'),
 ('Todos','frmMtoCliFacSearch','cxGrdDBTabPrin_TEXTO_LEGAL_FACTURA_CLIENTE_Caption','Texto en Factura','',NULL,NULL,'2023-12-14 17:40:16','2023-12-14 17:40:16','Administrador','Administrador'),
 ('Todos','frmMtoCliFacSearch','cxGrdDBTabPrin_TEXTO_LEGAL_FACTURA_CLIENTE_Index','26','',NULL,NULL,'2023-12-14 17:40:16','2023-12-14 17:40:16','Administrador','Administrador'),
 ('Todos','frmMtoCliFacSearch','cxGrdDBTabPrin_TEXTO_LEGAL_FACTURA_CLIENTE_Visible','True','',NULL,NULL,'2023-12-14 17:40:16','2023-12-14 17:40:16','Administrador','Administrador'),
 ('Todos','frmMtoCliFacSearch','cxGrdDBTabPrin_TEXTO_LEGAL_FACTURA_CLIENTE_Width','605','',NULL,NULL,'2023-12-14 17:40:16','2023-12-14 17:40:16','Administrador','Administrador'),
 ('Todos','frmMtoCliFacSearch','cxGrdDBTabPrin_USUARIOALTA_Index','29','',NULL,NULL,'2023-12-14 17:40:16','2023-12-14 17:40:16','Administrador','Administrador'),
 ('Todos','frmMtoCliFacSearch','cxGrdDBTabPrin_USUARIOALTA_Visible','False','',NULL,NULL,'2023-12-14 17:40:16','2023-12-14 17:40:16','Administrador','Administrador'),
 ('Todos','frmMtoCliFacSearch','cxGrdDBTabPrin_USUARIOMODIF_Index','30','',NULL,NULL,'2023-12-14 17:40:16','2023-12-14 17:40:16','Administrador','Administrador'),
 ('Todos','frmMtoCliFacSearch','cxGrdDBTabPrin_USUARIOMODIF_Visible','False','',NULL,NULL,'2023-12-14 17:40:16','2023-12-14 17:40:16','Administrador','Administrador'),
 ('Todos','frmMtoCliFacSearch','lblEditMode_Caption','Navegando','',NULL,NULL,'2023-01-24 19:26:16','2023-01-24 19:26:16','Administrador','Administrador'),
 ('Todos','frmMtoCliFacSearch','lblTablaOrigen_Caption','vi_cli_busquedas','',NULL,NULL,'2023-01-24 19:26:16','2023-01-24 19:26:16','Administrador','Administrador'),
 ('Todos','frmMtoCliFacSearch','lblTextoaBuscar_Caption','Texto a buscar','',NULL,NULL,'2023-01-24 19:26:16','2023-01-24 19:26:16','Administrador','Administrador'),
 ('Todos','frmMtoCliFacSearch','lblTextoaBuscarPerfil_Caption','Texto a buscar','',NULL,NULL,'2023-01-24 19:26:16','2023-01-24 19:26:16','Administrador','Administrador'),
 ('Todos','frmMtoCliFacSearch','oApplyWidth','True','',NULL,NULL,'2023-12-14 17:40:51','2023-01-24 21:08:27','Administrador','Administrador'),
 ('Todos','frmMtoCliFacSearch','oBusqGlobal','Grid','',NULL,NULL,'2023-01-24 21:09:20','2023-01-24 21:08:27','Administrador','Administrador'),
 ('Todos','frmMtoCliFacSearch','oCreateItems','True','',NULL,NULL,'2023-12-14 17:40:55','2023-01-24 21:08:27','Administrador','Administrador'),
 ('Todos','frmMtoCliFacSearch','oGetSQLFromDB','False','',NULL,NULL,'2023-12-14 17:40:15','2023-12-14 17:40:15','Administrador','Administrador'),
 ('Todos','frmMtoCliFacSearch','oMostrarPerfil','False','',NULL,NULL,'2023-12-14 17:40:15','2023-12-14 17:40:15','Administrador','Administrador'),
 ('Todos','frmMtoCliFacSearch','oRenameComponents','False','',NULL,NULL,'2023-12-14 17:40:15','2023-12-14 17:40:15','Administrador','Administrador'),
 ('Todos','frmMtoCliFacSearch','rbBBDD_Caption','Buscar BBDD','',NULL,NULL,'2023-12-14 17:40:15','2023-12-14 17:40:15','Administrador','Administrador'),
 ('Todos','frmMtoCliFacSearch','rbGrid_Caption','Buscar Grid','',NULL,NULL,'2023-12-14 17:40:15','2023-12-14 17:40:15','Administrador','Administrador'),
 ('Todos','frmMtoCliFacSearch','tsFicha_Caption','&Ficha','',NULL,NULL,'2023-01-24 19:26:16','2023-01-24 19:26:16','Administrador','Administrador'),
 ('Todos','frmMtoCliFacSearch','tsLista_Caption','&Lista','',NULL,NULL,'2023-01-24 19:26:16','2023-01-24 19:26:16','Administrador','Administrador'),
 ('Todos','frmMtoCliFacSearch','tsPerfil_Caption','Perfil','',NULL,NULL,'2023-01-24 19:26:16','2023-01-24 19:26:16','Administrador','Administrador'),
 ('Todos','frmMtoCliFacSearch','tvPerfil__oApplyWidth','False','',NULL,NULL,'2023-12-14 17:40:16','2023-12-14 17:40:16','Administrador','Administrador'),
 ('Todos','frmMtoEmpFacSearch','btnAceptar_Caption','&Aceptar','',NULL,NULL,'2022-10-26 16:29:05','2022-10-26 16:29:05','Administrador','Administrador'),
 ('Todos','frmMtoEmpFacSearch','btnCancelar_Caption','&Cancelar','',NULL,NULL,'2022-10-26 16:29:05','2022-10-26 16:29:05','Administrador','Administrador'),
 ('Todos','frmMtoEmpFacSearch','btnCancelar1_Caption','&Cancelar','',NULL,NULL,'2022-10-26 16:29:05','2022-10-26 16:29:05','Administrador','Administrador'),
 ('Todos','frmMtoEmpFacSearch','btnCargarCaptions_Caption','&Cargar captions','',NULL,NULL,'2022-10-26 16:29:05','2022-10-26 16:29:05','Administrador','Administrador'),
 ('Todos','frmMtoEmpFacSearch','btnCargarColumnas_Caption','&Cargar columnas','',NULL,NULL,'2022-10-26 16:29:05','2022-10-26 16:29:05','Administrador','Administrador'),
 ('Todos','frmMtoEmpFacSearch','btnCargarVblesGlob_Caption','&Cargar Vbles Globales','',NULL,NULL,'2022-10-26 16:29:05','2022-10-26 16:29:05','Administrador','Administrador'),
 ('Todos','frmMtoEmpFacSearch','btnGrabar_Caption','&Grabar','',NULL,NULL,'2022-10-26 16:29:05','2022-10-26 16:29:05','Administrador','Administrador'),
 ('Todos','frmMtoEmpFacSearch','btnSalir_Caption','出来','',NULL,NULL,'2023-08-28 14:50:00','2022-10-26 16:29:05','Administrador','Administrador'),
 ('Todos','frmMtoEmpFacSearch','cxGrdDBTabPrin__oApplyWidth','True','',NULL,NULL,'2023-12-14 17:32:06','2023-12-14 17:32:06','Administrador','Administrador'),
 ('Todos','frmMtoEmpFacSearch','cxGrdDBTabPrin_CODIGO_EMPRESA_Caption','Código Empresa','',NULL,NULL,'2023-12-14 17:32:06','2023-12-14 17:32:06','Administrador','Administrador'),
 ('Todos','frmMtoEmpFacSearch','cxGrdDBTabPrin_CODIGO_EMPRESA_Index','0','',NULL,NULL,'2023-12-14 17:32:06','2023-12-14 17:32:06','Administrador','Administrador'),
 ('Todos','frmMtoEmpFacSearch','cxGrdDBTabPrin_CODIGO_EMPRESA_Visible','True','',NULL,NULL,'2023-12-14 17:32:06','2023-12-14 17:32:06','Administrador','Administrador'),
 ('Todos','frmMtoEmpFacSearch','cxGrdDBTabPrin_CODIGO_EMPRESA_Width','142','',NULL,NULL,'2023-12-14 17:32:06','2023-12-14 17:32:06','Administrador','Administrador'),
 ('Todos','frmMtoEmpFacSearch','cxGrdDBTabPrin_CPOSTAL_EMPRESA_Caption','Código Postal','',NULL,NULL,'2023-12-14 17:32:07','2023-12-14 17:32:07','Administrador','Administrador'),
 ('Todos','frmMtoEmpFacSearch','cxGrdDBTabPrin_CPOSTAL_EMPRESA_Index','7','',NULL,NULL,'2023-12-14 17:32:07','2023-12-14 17:32:07','Administrador','Administrador'),
 ('Todos','frmMtoEmpFacSearch','cxGrdDBTabPrin_CPOSTAL_EMPRESA_Visible','True','',NULL,NULL,'2023-12-14 17:32:07','2023-12-14 17:32:07','Administrador','Administrador'),
 ('Todos','frmMtoEmpFacSearch','cxGrdDBTabPrin_CPOSTAL_EMPRESA_Width','122','',NULL,NULL,'2023-12-14 17:32:07','2023-12-14 17:32:07','Administrador','Administrador'),
 ('Todos','frmMtoEmpFacSearch','cxGrdDBTabPrin_DIRECCION1_EMPRESA_Caption','Dirección Principal','',NULL,NULL,'2023-12-14 17:32:07','2023-12-14 17:32:07','Administrador','Administrador'),
 ('Todos','frmMtoEmpFacSearch','cxGrdDBTabPrin_DIRECCION1_EMPRESA_Index','5','',NULL,NULL,'2023-12-14 17:32:07','2023-12-14 17:32:07','Administrador','Administrador'),
 ('Todos','frmMtoEmpFacSearch','cxGrdDBTabPrin_DIRECCION1_EMPRESA_Visible','True','',NULL,NULL,'2023-12-14 17:32:07','2023-12-14 17:32:07','Administrador','Administrador'),
 ('Todos','frmMtoEmpFacSearch','cxGrdDBTabPrin_DIRECCION1_EMPRESA_Width','137','',NULL,NULL,'2023-12-14 17:32:07','2023-12-14 17:32:07','Administrador','Administrador'),
 ('Todos','frmMtoEmpFacSearch','cxGrdDBTabPrin_DIRECCION2_EMPRESA_Caption','Dirección Complementaria','',NULL,NULL,'2023-12-14 17:32:07','2023-12-14 17:32:07','Administrador','Administrador'),
 ('Todos','frmMtoEmpFacSearch','cxGrdDBTabPrin_DIRECCION2_EMPRESA_Index','6','',NULL,NULL,'2023-12-14 17:32:07','2023-12-14 17:32:07','Administrador','Administrador'),
 ('Todos','frmMtoEmpFacSearch','cxGrdDBTabPrin_DIRECCION2_EMPRESA_Visible','True','',NULL,NULL,'2023-12-14 17:32:07','2023-12-14 17:32:07','Administrador','Administrador');
INSERT INTO `fza_usuarios_perfiles`(`USUARIO_GRUPO_PERFILES`, `KEY_PERFILES`, `SUBKEY_PERFILES`, `VALUE_PERFILES`, `VALUE_TEXT_PERFILES`, `TYPE_BLOB_PERFILES`, `VALUE_BLOB_PERFILES`, `INSTANTEMODIF`, `INSTANTEALTA`, `USUARIOALTA`, `USUARIOMODIF`) VALUES
 ('Todos','frmMtoEmpFacSearch','cxGrdDBTabPrin_DIRECCION2_EMPRESA_Width','193','',NULL,NULL,'2023-12-14 17:32:07','2023-12-14 17:32:07','Administrador','Administrador'),
 ('Todos','frmMtoEmpFacSearch','cxGrdDBTabPrin_EMAIL_EMPRESA_Caption','Email','',NULL,NULL,'2023-12-14 17:32:06','2023-12-14 17:32:06','Administrador','Administrador'),
 ('Todos','frmMtoEmpFacSearch','cxGrdDBTabPrin_EMAIL_EMPRESA_Index','4','',NULL,NULL,'2023-12-14 17:32:06','2023-12-14 17:32:06','Administrador','Administrador'),
 ('Todos','frmMtoEmpFacSearch','cxGrdDBTabPrin_EMAIL_EMPRESA_Visible','True','',NULL,NULL,'2023-12-14 17:32:06','2023-12-14 17:32:06','Administrador','Administrador'),
 ('Todos','frmMtoEmpFacSearch','cxGrdDBTabPrin_EMAIL_EMPRESA_Width','204','',NULL,NULL,'2023-12-14 17:32:06','2023-12-14 17:32:06','Administrador','Administrador'),
 ('Todos','frmMtoEmpFacSearch','cxGrdDBTabPrin_ESREGIMENESPECIALAGRICOLA_EMPRESA_Caption','Es Agricultor REAGP','',NULL,NULL,'2023-12-14 17:32:07','2023-12-14 17:32:07','Administrador','Administrador'),
 ('Todos','frmMtoEmpFacSearch','cxGrdDBTabPrin_ESREGIMENESPECIALAGRICOLA_EMPRESA_Index','14','',NULL,NULL,'2023-12-14 17:32:07','2023-12-14 17:32:07','Administrador','Administrador'),
 ('Todos','frmMtoEmpFacSearch','cxGrdDBTabPrin_ESREGIMENESPECIALAGRICOLA_EMPRESA_Visible','True','',NULL,NULL,'2023-12-14 17:32:07','2023-12-14 17:32:07','Administrador','Administrador'),
 ('Todos','frmMtoEmpFacSearch','cxGrdDBTabPrin_ESREGIMENESPECIALAGRICOLA_EMPRESA_Width','321','',NULL,NULL,'2023-12-14 17:32:07','2023-12-14 17:32:07','Administrador','Administrador'),
 ('Todos','frmMtoEmpFacSearch','cxGrdDBTabPrin_ESRETENCIONES_EMPRESA_Caption','Aplica retenciones IRPF','',NULL,NULL,'2023-12-14 17:32:07','2023-12-14 17:32:07','Administrador','Administrador'),
 ('Todos','frmMtoEmpFacSearch','cxGrdDBTabPrin_ESRETENCIONES_EMPRESA_Index','13','',NULL,NULL,'2023-12-14 17:32:07','2023-12-14 17:32:07','Administrador','Administrador'),
 ('Todos','frmMtoEmpFacSearch','cxGrdDBTabPrin_ESRETENCIONES_EMPRESA_Visible','True','',NULL,NULL,'2023-12-14 17:32:07','2023-12-14 17:32:07','Administrador','Administrador'),
 ('Todos','frmMtoEmpFacSearch','cxGrdDBTabPrin_ESRETENCIONES_EMPRESA_Width','209','',NULL,NULL,'2023-12-14 17:32:07','2023-12-14 17:32:07','Administrador','Administrador'),
 ('Todos','frmMtoEmpFacSearch','cxGrdDBTabPrin_GRUPO_ZONA_IVA_EMPRESA_Caption','Grupo Iva','',NULL,NULL,'2023-12-14 17:32:07','2023-12-14 17:32:07','Administrador','Administrador'),
 ('Todos','frmMtoEmpFacSearch','cxGrdDBTabPrin_GRUPO_ZONA_IVA_EMPRESA_Index','12','',NULL,NULL,'2023-12-14 17:32:07','2023-12-14 17:32:07','Administrador','Administrador'),
 ('Todos','frmMtoEmpFacSearch','cxGrdDBTabPrin_GRUPO_ZONA_IVA_EMPRESA_Visible','True','',NULL,NULL,'2023-12-14 17:32:07','2023-12-14 17:32:07','Administrador','Administrador'),
 ('Todos','frmMtoEmpFacSearch','cxGrdDBTabPrin_GRUPO_ZONA_IVA_EMPRESA_Width','226','',NULL,NULL,'2023-12-14 17:32:07','2023-12-14 17:32:07','Administrador','Administrador'),
 ('Todos','frmMtoEmpFacSearch','cxGrdDBTabPrin_MOVIL_EMPRESA_Caption','Teléfono Móvil','',NULL,NULL,'2023-12-14 17:32:06','2023-12-14 17:32:06','Administrador','Administrador'),
 ('Todos','frmMtoEmpFacSearch','cxGrdDBTabPrin_MOVIL_EMPRESA_Index','3','',NULL,NULL,'2023-12-14 17:32:06','2023-12-14 17:32:06','Administrador','Administrador'),
 ('Todos','frmMtoEmpFacSearch','cxGrdDBTabPrin_MOVIL_EMPRESA_Visible','True','',NULL,NULL,'2023-12-14 17:32:06','2023-12-14 17:32:06','Administrador','Administrador'),
 ('Todos','frmMtoEmpFacSearch','cxGrdDBTabPrin_MOVIL_EMPRESA_Width','133','',NULL,NULL,'2023-12-14 17:32:06','2023-12-14 17:32:06','Administrador','Administrador'),
 ('Todos','frmMtoEmpFacSearch','cxGrdDBTabPrin_NIF_EMPRESA_Caption','Nif','',NULL,NULL,'2023-12-14 17:32:06','2023-12-14 17:32:06','Administrador','Administrador'),
 ('Todos','frmMtoEmpFacSearch','cxGrdDBTabPrin_NIF_EMPRESA_Index','2','',NULL,NULL,'2023-12-14 17:32:06','2023-12-14 17:32:06','Administrador','Administrador'),
 ('Todos','frmMtoEmpFacSearch','cxGrdDBTabPrin_NIF_EMPRESA_Visible','True','',NULL,NULL,'2023-12-14 17:32:06','2023-12-14 17:32:06','Administrador','Administrador'),
 ('Todos','frmMtoEmpFacSearch','cxGrdDBTabPrin_NIF_EMPRESA_Width','110','',NULL,NULL,'2023-12-14 17:32:06','2023-12-14 17:32:06','Administrador','Administrador'),
 ('Todos','frmMtoEmpFacSearch','cxGrdDBTabPrin_PAIS_EMPRESA_Caption','País','',NULL,NULL,'2023-12-14 17:32:07','2023-12-14 17:32:07','Administrador','Administrador'),
 ('Todos','frmMtoEmpFacSearch','cxGrdDBTabPrin_PAIS_EMPRESA_Index','10','',NULL,NULL,'2023-12-14 17:32:07','2023-12-14 17:32:07','Administrador','Administrador'),
 ('Todos','frmMtoEmpFacSearch','cxGrdDBTabPrin_PAIS_EMPRESA_Visible','True','',NULL,NULL,'2023-12-14 17:32:07','2023-12-14 17:32:07','Administrador','Administrador'),
 ('Todos','frmMtoEmpFacSearch','cxGrdDBTabPrin_PAIS_EMPRESA_Width','120','',NULL,NULL,'2023-12-14 17:32:07','2023-12-14 17:32:07','Administrador','Administrador'),
 ('Todos','frmMtoEmpFacSearch','cxGrdDBTabPrin_POBLACION_EMPRESA_Caption','Población','',NULL,NULL,'2023-12-14 17:32:07','2023-12-14 17:32:07','Administrador','Administrador'),
 ('Todos','frmMtoEmpFacSearch','cxGrdDBTabPrin_POBLACION_EMPRESA_Index','8','',NULL,NULL,'2023-12-14 17:32:07','2023-12-14 17:32:07','Administrador','Administrador'),
 ('Todos','frmMtoEmpFacSearch','cxGrdDBTabPrin_POBLACION_EMPRESA_Visible','True','',NULL,NULL,'2023-12-14 17:32:07','2023-12-14 17:32:07','Administrador','Administrador'),
 ('Todos','frmMtoEmpFacSearch','cxGrdDBTabPrin_POBLACION_EMPRESA_Width','189','',NULL,NULL,'2023-12-14 17:32:07','2023-12-14 17:32:07','Administrador','Administrador'),
 ('Todos','frmMtoEmpFacSearch','cxGrdDBTabPrin_PROVINCIA_EMPRESA_Caption','Provincia','',NULL,NULL,'2023-12-14 17:32:07','2023-12-14 17:32:07','Administrador','Administrador'),
 ('Todos','frmMtoEmpFacSearch','cxGrdDBTabPrin_PROVINCIA_EMPRESA_Index','9','',NULL,NULL,'2023-12-14 17:32:07','2023-12-14 17:32:07','Administrador','Administrador'),
 ('Todos','frmMtoEmpFacSearch','cxGrdDBTabPrin_PROVINCIA_EMPRESA_Visible','True','',NULL,NULL,'2023-12-14 17:32:07','2023-12-14 17:32:07','Administrador','Administrador'),
 ('Todos','frmMtoEmpFacSearch','cxGrdDBTabPrin_PROVINCIA_EMPRESA_Width','170','',NULL,NULL,'2023-12-14 17:32:07','2023-12-14 17:32:07','Administrador','Administrador'),
 ('Todos','frmMtoEmpFacSearch','cxGrdDBTabPrin_RAZONSOCIAL_EMPRESA_Caption','Razón Social','',NULL,NULL,'2023-12-14 17:32:06','2023-12-14 17:32:06','Administrador','Administrador'),
 ('Todos','frmMtoEmpFacSearch','cxGrdDBTabPrin_RAZONSOCIAL_EMPRESA_Index','1','',NULL,NULL,'2023-12-14 17:32:06','2023-12-14 17:32:06','Administrador','Administrador'),
 ('Todos','frmMtoEmpFacSearch','cxGrdDBTabPrin_RAZONSOCIAL_EMPRESA_Visible','True','',NULL,NULL,'2023-12-14 17:32:06','2023-12-14 17:32:06','Administrador','Administrador'),
 ('Todos','frmMtoEmpFacSearch','cxGrdDBTabPrin_RAZONSOCIAL_EMPRESA_Width','248','',NULL,NULL,'2023-12-14 17:32:06','2023-12-14 17:32:06','Administrador','Administrador'),
 ('Todos','frmMtoEmpFacSearch','cxGrdDBTabPrin_SERIE_CONTADOR_EMPRESA_Caption','Serie Documentos','',NULL,NULL,'2023-12-14 17:32:07','2023-12-14 17:32:07','Administrador','Administrador'),
 ('Todos','frmMtoEmpFacSearch','cxGrdDBTabPrin_SERIE_CONTADOR_EMPRESA_Index','11','',NULL,NULL,'2023-12-14 17:32:07','2023-12-14 17:32:07','Administrador','Administrador'),
 ('Todos','frmMtoEmpFacSearch','cxGrdDBTabPrin_SERIE_CONTADOR_EMPRESA_Visible','True','',NULL,NULL,'2023-12-14 17:32:07','2023-12-14 17:32:07','Administrador','Administrador'),
 ('Todos','frmMtoEmpFacSearch','cxGrdDBTabPrin_SERIE_CONTADOR_EMPRESA_Width','144','',NULL,NULL,'2023-12-14 17:32:07','2023-12-14 17:32:07','Administrador','Administrador'),
 ('Todos','frmMtoEmpFacSearch','cxGrdDBTabPrin_TEXTO_LEGAL_FACTURA_EMPRESA_Caption','Texto legal facturas','',NULL,NULL,'2023-12-14 17:32:07','2023-12-14 17:32:07','Administrador','Administrador'),
 ('Todos','frmMtoEmpFacSearch','cxGrdDBTabPrin_TEXTO_LEGAL_FACTURA_EMPRESA_Index','15','',NULL,NULL,'2023-12-14 17:32:07','2023-12-14 17:32:07','Administrador','Administrador'),
 ('Todos','frmMtoEmpFacSearch','cxGrdDBTabPrin_TEXTO_LEGAL_FACTURA_EMPRESA_Visible','True','',NULL,NULL,'2023-12-14 17:32:07','2023-12-14 17:32:07','Administrador','Administrador'),
 ('Todos','frmMtoEmpFacSearch','cxGrdDBTabPrin_TEXTO_LEGAL_FACTURA_EMPRESA_Width','572','',NULL,NULL,'2023-12-14 17:32:07','2023-12-14 17:32:07','Administrador','Administrador'),
 ('Todos','frmMtoEmpFacSearch','lblEditMode_Caption','Navegando','',NULL,NULL,'2022-10-26 16:29:05','2022-10-26 16:29:05','Administrador','Administrador'),
 ('Todos','frmMtoEmpFacSearch','lblTablaOrigen_Caption','VI_EMP_BUSQUEDAS','',NULL,NULL,'2023-01-27 09:39:13','2022-10-26 16:29:05','Administrador','Administrador'),
 ('Todos','frmMtoEmpFacSearch','lblTextoaBuscar_Caption','Texto a buscar','',NULL,NULL,'2022-10-26 16:29:05','2022-10-26 16:29:05','Administrador','Administrador'),
 ('Todos','frmMtoEmpFacSearch','lblTextoaBuscarPerfil_Caption','Texto a buscar','',NULL,NULL,'2022-10-26 16:29:05','2022-10-26 16:29:05','Administrador','Administrador'),
 ('Todos','frmMtoEmpFacSearch','oApplyWidth','True','',NULL,NULL,'2023-12-14 17:36:43','2022-10-26 16:29:04','Administrador','Administrador'),
 ('Todos','frmMtoEmpFacSearch','oBusqGlobal','Grid','',NULL,NULL,'2023-12-14 17:32:06','2022-10-26 16:29:04','Administrador','Administrador'),
 ('Todos','frmMtoEmpFacSearch','oCreateItems','False','',NULL,NULL,'2023-12-14 17:32:06','2022-10-26 16:29:04','Administrador','Administrador'),
 ('Todos','frmMtoEmpFacSearch','oGetSQLFromDB','False','',NULL,NULL,'2023-12-14 17:32:06','2023-12-14 17:32:06','Administrador','Administrador'),
 ('Todos','frmMtoEmpFacSearch','oMostrarPerfil','False','',NULL,NULL,'2023-12-14 17:32:06','2023-12-14 17:32:06','Administrador','Administrador'),
 ('Todos','frmMtoEmpFacSearch','oRenameComponents','False','',NULL,NULL,'2023-12-14 17:32:06','2023-12-14 17:32:06','Administrador','Administrador'),
 ('Todos','frmMtoEmpFacSearch','rbBBDD_Caption','Buscar BBDD','',NULL,NULL,'2023-12-14 17:32:06','2023-12-14 17:32:06','Administrador','Administrador'),
 ('Todos','frmMtoEmpFacSearch','rbGrid_Caption','Buscar Grid','',NULL,NULL,'2023-12-14 17:32:06','2023-12-14 17:32:06','Administrador','Administrador'),
 ('Todos','frmMtoEmpFacSearch','tsFicha_Caption','&Ficha','',NULL,NULL,'2022-10-26 16:29:05','2022-10-26 16:29:05','Administrador','Administrador'),
 ('Todos','frmMtoEmpFacSearch','tsLista_Caption','&Lista','',NULL,NULL,'2022-10-26 16:29:05','2022-10-26 16:29:05','Administrador','Administrador'),
 ('Todos','frmMtoEmpFacSearch','tsPerfil_Caption','Perfil','',NULL,NULL,'2022-10-26 16:29:05','2022-10-26 16:29:05','Administrador','Administrador'),
 ('Todos','frmMtoEmpFacSearch','tvPerfil__oApplyWidth','False','',NULL,NULL,'2023-12-14 17:32:07','2023-12-14 17:32:07','Administrador','Administrador'),
 ('Todos','frmPrintRecFac','frxrprt1_Buena','Buena',NULL,NULL,'<?xml version=\"1.0\" encoding=\"utf-8\" standalone=\"no\"?>\r\n<TfrxReport Version=\"6.9.3\" DotMatrixReport=\"False\" IniFile=\"\\Software\\Fast Reports\" PreviewOptions.Buttons=\"4095\" PreviewOptions.Zoom=\"1\" PrintOptions.Printer=\"Por defecto\" PrintOptions.PrintOnSheet=\"0\" ReportOptions.Author=\"factuzam\" ReportOptions.CreateDate=\"42481,6346757407\" ReportOptions.Description.Text=\"\" ReportOptions.LastChange=\"45037,556420706\" ScriptLanguage=\"PascalScript\" ScriptText.Text=\"begin&#13;&#10;&#13;&#10;end.\">\r\n  <Datasets>\r\n    <item DataSet=\"dmFacturas.fxdsRecibos\" DataSetName=\"Recibos\"/>\r\n  </Datasets>\r\n  <TfrxDataPage Name=\"Data\" HGuides.Text=\"\" VGuides.Text=\"\" Height=\"1000\" Left=\"0\" Top=\"0\" Width=\"1000\"/>\r\n  <TfrxReportPage Name=\"Page1\" HGuides.Text=\"\" VGuides.Text=\"\" PaperWidth=\"210\" PaperHeight=\"297\" PaperSize=\"9\" LeftMargin=\"5\" RightMargin=\"5\" TopMargin=\"20\" BottomMargin=\"20\" ColumnWidth=\"0\" ColumnPositions.Text=\"\" Frame.Typ=\"0\" MirrorMode=\"0\">\r\n    <TfrxMasterData Name=\"MasterData1\" FillType=\"ftBrush\" FillGap.Top=\"0\" FillGap.Left=\"0\" FillGap.Bottom=\"0\" FillGap.Right=\"0\" Frame.Typ=\"0\" Height=\"343,93723\" Left=\"0\" Top=\"18,89765\" Width=\"755,906\" ColumnWidth=\"0\" ColumnGap=\"0\" DataSet=\"dmFacturas.fxdsRecibos\" DataSetName=\"Recibos\" RowCount=\"0\">\r\n      <TfrxMemoView Name=\"Memo10\" AllowVectorExport=\"True\" Left=\"20,23624\" Top=\"59,25201\" Width=\"343,93723\" Height=\"49,13389\" DataSet=\"dmFacturas.fxdsPrintFac\" DataSetName=\"Facturas\" Font.Charset=\"1\" Font.Color=\"0\" Font.Height=\"-12\" Font.Name=\"Arial\" Font.Style=\"0\" Frame.Typ=\"15\" ParentFont=\"False\" Text=\"\"/>\r\n      <TfrxMemoView Name=\"Memo1\" AllowVectorExport=\"True\" Left=\"20,23624\" Top=\"9,89765\" Width=\"158,74026\" Height=\"49,13389\" Font.Charset=\"1\" Font.Color=\"0\" Font.Height=\"-12\" Font.Name=\"Arial\" Font.Style=\"0\" Frame.Typ=\"15\" ParentFont=\"False\" Text=\"\"/>\r\n      <TfrxMemoView Name=\"Memo2\" AllowVectorExport=\"True\" Left=\"35,35436\" Top=\"36,35436\" Width=\"124,72449\" Height=\"15,11812\" Font.Charset=\"1\" Font.Color=\"0\" Font.Height=\"-13\" Font.Name=\"Arial\" Font.Style=\"0\" Frame.Typ=\"0\" HAlign=\"haCenter\" ParentFont=\"False\" Text=\"[&#60;Recibos.&#34;SERIE_FACTURA_RECIBO&#34;&#62;]\\[&#60;Recibos.&#34;NRO_FACTURA_RECIBO&#34;&#62;]\\[IntToStr(&#60;Recibos.&#34;NRO_PLAZO_RECIBO&#34;&#62;)]\">\r\n        <Formats>\r\n          <item/>\r\n          <item/>\r\n          <item/>\r\n        </Formats>\r\n      </TfrxMemoView>\r\n      <TfrxMemoView Name=\"Memo3\" AllowVectorExport=\"True\" Left=\"27,7953\" Top=\"13,67718\" Width=\"113,3859\" Height=\"18,89765\" Font.Charset=\"1\" Font.Color=\"0\" Font.Height=\"-12\" Font.Name=\"Arial\" Font.Style=\"0\" Frame.Typ=\"0\" ParentFont=\"False\" Text=\"RECIBO NRO\"/>\r\n      <TfrxMemoView Name=\"Memo4\" AllowVectorExport=\"True\" Left=\"178,9765\" Top=\"9,89765\" Width=\"321,26005\" Height=\"49,13389\" Font.Charset=\"1\" Font.Color=\"0\" Font.Height=\"-12\" Font.Name=\"Arial\" Font.Style=\"0\" Frame.Typ=\"15\" ParentFont=\"False\" Text=\"\"/>\r\n      <TfrxMemoView Name=\"Memo5\" AllowVectorExport=\"True\" Left=\"220,55133\" Top=\"36,35436\" Width=\"226,7718\" Height=\"15,11812\" Font.Charset=\"1\" Font.Color=\"0\" Font.Height=\"-13\" Font.Name=\"Arial\" Font.Style=\"0\" Frame.Typ=\"0\" ParentFont=\"False\" Text=\"[Recibos.&#34;LOCALIDAD_EXPEDICION_RECIBO&#34;]\"/>\r\n      <TfrxMemoView Name=\"Memo6\" AllowVectorExport=\"True\" Left=\"190,31509\" Top=\"13,67718\" Width=\"173,85838\" Height=\"18,89765\" Font.Charset=\"1\" Font.Color=\"0\" Font.Height=\"-12\" Font.Name=\"Arial\" Font.Style=\"0\" Frame.Typ=\"0\" ParentFont=\"False\" Text=\"LOCALIDAD DE EXPEDICIÓN\"/>\r\n      <TfrxMemoView Name=\"Memo7\" AllowVectorExport=\"True\" Left=\"500,23655\" Top=\"9,89765\" Width=\"222,99227\" Height=\"49,13389\" DataSet=\"dmFacturas.fxdsPrintFac\" DataSetName=\"Facturas\" Font.Charset=\"1\" Font.Color=\"0\" Font.Height=\"-12\" Font.Name=\"Arial\" Font.Style=\"0\" Frame.Typ=\"15\" ParentFont=\"False\" Text=\"\"/>\r\n      <TfrxMemoView Name=\"Memo8\" AllowVectorExport=\"True\" Left=\"522,91373\" Top=\"13,67718\" Width=\"173,85838\" Height=\"18,89765\" Font.Charset=\"1\" Font.Color=\"0\" Font.Height=\"-12\" Font.Name=\"Arial\" Font.Style=\"0\" Frame.Typ=\"0\" ParentFont=\"False\" Text=\"IMPORTE RECIBO\"/>\r\n      <TfrxMemoView Name=\"Memo12\" AllowVectorExport=\"True\" Left=\"27,7953\" Top=\"66,5906\" Width=\"181,41744\" Height=\"18,89765\" Font.Charset=\"1\" Font.Color=\"0\" Font.Height=\"-12\" Font.Name=\"Arial\" Font.Style=\"0\" Frame.Typ=\"0\" ParentFont=\"False\" Text=\"FECHA DE EXPEDICIÓN\"/>\r\n      <TfrxMemoView Name=\"Memo11\" AllowVectorExport=\"True\" Left=\"364,17347\" Top=\"59,03154\" Width=\"359,05535\" Height=\"49,13389\" DataSet=\"dmFacturas.fxdsPrintFac\" DataSetName=\"Facturas\" Font.Charset=\"1\" Font.Color=\"0\" Font.Height=\"-12\" Font.Name=\"Arial\" Font.Style=\"0\" Frame.Typ=\"15\" ParentFont=\"False\" Text=\"\"/>\r\n      <TfrxMemoView Name=\"Memo13\" AllowVectorExport=\"True\" Left=\"379,29159\" Top=\"66,37013\" Width=\"181,41744\" Height=\"18,89765\" Font.Charset=\"1\" Font.Color=\"0\" Font.Height=\"-12\" Font.Name=\"Arial\" Font.Style=\"0\" Frame.Typ=\"0\" ParentFont=\"False\" Text=\"FECHA DE VENCIMIENTO\"/>\r\n      <TfrxMemoView Name=\"Memo14\" AllowVectorExport=\"True\" Left=\"35,35436\" Top=\"113,3859\" Width=\"79,37013\" Height=\"18,89765\" Font.Charset=\"1\" Font.Color=\"0\" Font.Height=\"-13\" Font.Name=\"Arial\" Font.Style=\"0\" Frame.Typ=\"0\" HAlign=\"haRight\" ParentFont=\"False\" Text=\"SON EU:\"/>\r\n      <TfrxMemoView Name=\"Memo15\" AllowVectorExport=\"True\" Left=\"20,23624\" Top=\"158,21274\" Width=\"702,99258\" Height=\"30,23624\" DataSet=\"dmFacturas.fxdsPrintFac\" DataSetName=\"Facturas\" Font.Charset=\"1\" Font.Color=\"0\" Font.Height=\"-12\" Font.Name=\"Arial\" Font.Style=\"0\" Frame.Typ=\"15\" ParentFont=\"False\" Text=\"\"/>\r\n      <TfrxMemoView Name=\"Memo16\" AllowVectorExport=\"True\" Left=\"27,7953\" Top=\"162,7718\" Width=\"181,41744\" Height=\"18,89765\" Font.Charset=\"1\" Font.Color=\"0\" Font.Height=\"-12\" Font.Name=\"Arial\" Font.Style=\"0\" Frame.Typ=\"0\" ParentFont=\"False\" Text=\"PAGADERO EN   &#60;IBAN&#62;  :\"/>\r\n      <TfrxMemoView Name=\"Memo18\" AllowVectorExport=\"True\" Left=\"20,23624\" Top=\"195,02381\" Width=\"468,66172\" Height=\"124,72449\" DataSet=\"dmFacturas.fxdsPrintFac\" DataSetName=\"Facturas\" Font.Charset=\"1\" Font.Color=\"0\" Font.Height=\"-12\" Font.Name=\"Arial\" Font.Style=\"0\" Frame.Typ=\"15\" ParentFont=\"False\" Text=\"\"/>\r\n      <TfrxMemoView Name=\"Memo19\" AllowVectorExport=\"True\" Left=\"27,7953\" Top=\"202,3624\" Width=\"241,88992\" Height=\"18,89765\" Font.Charset=\"1\" Font.Color=\"0\" Font.Height=\"-12\" Font.Name=\"Arial\" Font.Style=\"0\" Frame.Typ=\"0\" ParentFont=\"False\" Text=\"DOMICILIO Y NOMBRE DEL LIBRADO:\"/>\r\n      <TfrxMemoView Name=\"FacturasRAZONSOCIAL_CLIENTE\" IndexTag=\"1\" AllowVectorExport=\"True\" Left=\"27,7953\" Top=\"225,26005\" Width=\"400,63018\" Height=\"18,89765\" DataSet=\"dmFacturas.fxdsPrintFac\" DataSetName=\"Facturas\" Font.Charset=\"1\" Font.Color=\"0\" Font.Height=\"-13\" Font.Name=\"Arial\" Font.Style=\"1\" Frame.Typ=\"0\" ParentFont=\"False\" Text=\"[Recibos.&#34;RAZONSOCIAL_CLIENTE_RECIBO&#34;]\"/>\r\n      <TfrxMemoView Name=\"FacturasDIRECCION1_CLIENTE\" IndexTag=\"1\" AllowVectorExport=\"True\" Left=\"27,7953\" Top=\"247,93723\" Width=\"400,63018\" Height=\"18,89765\" DataSet=\"dmFacturas.fxdsPrintFac\" DataSetName=\"Facturas\" Frame.Typ=\"0\" Text=\"[Recibos.&#34;DIRECCION1_CLIENTE_RECIBO&#34;]\"/>\r\n      <TfrxMemoView Name=\"FacturasCPOSTAL_CLIENTE\" IndexTag=\"1\" AllowVectorExport=\"True\" Left=\"27,7953\" Top=\"266,83488\" Width=\"120,94496\" Height=\"18,89765\" DataSet=\"dmFacturas.fxdsPrintFac\" DataSetName=\"Facturas\" Frame.Typ=\"0\" Text=\"[Recibos.&#34;CPOSTAL_CLIENTE_RECIBO&#34;]\"/>\r\n      <TfrxMemoView Name=\"FacturasPOBLACION_CLIENTE\" IndexTag=\"1\" AllowVectorExport=\"True\" Left=\"156,29932\" Top=\"266,83488\" Width=\"272,12616\" Height=\"18,89765\" DataSet=\"dmFacturas.fxdsPrintFac\" DataSetName=\"Facturas\" Frame.Typ=\"0\" Text=\"[Recibos.&#34;POBLACION_CLIENTE_RECIBO&#34;]\"/>\r\n      <TfrxMemoView Name=\"FacturasPROVINCIA_CLIENTE\" IndexTag=\"1\" AllowVectorExport=\"True\" Left=\"27,7953\" Top=\"289,51206\" Width=\"328,81911\" Height=\"18,89765\" DataSet=\"dmFacturas.fxdsPrintFac\" DataSetName=\"Facturas\" Font.Charset=\"1\" Font.Color=\"0\" Font.Height=\"-13\" Font.Name=\"Arial\" Font.Style=\"0\" Frame.Typ=\"0\" ParentFont=\"False\" Text=\"[Recibos.&#34;PROVINCIA_CLIENTE_RECIBO&#34;]\"/>\r\n      <TfrxMemoView Name=\"FacturasCODIGO_CLIENTE\" IndexTag=\"1\" AllowVectorExport=\"True\" Left=\"405,7483\" Top=\"198,80334\" Width=\"79,37013\" Height=\"18,89765\" DataSet=\"dmFacturas.fxdsPrintFac\" DataSetName=\"Facturas\" Font.Charset=\"1\" Font.Color=\"0\" Font.Height=\"-13\" Font.Name=\"Arial\" Font.Style=\"0\" Frame.Typ=\"0\" HAlign=\"haRight\" ParentFont=\"False\" Text=\"[Recibos.&#34;CODIGO_CLIENTE_RECIBO&#34;]\"/>\r\n      <TfrxMemoView Name=\"Memo20\" AllowVectorExport=\"True\" Left=\"506,45702\" Top=\"198,43321\" Width=\"188,9765\" Height=\"18,89765\" Font.Charset=\"1\" Font.Color=\"0\" Font.Height=\"-11\" Font.Name=\"Arial\" Font.Style=\"0\" Frame.Typ=\"0\" ParentFont=\"False\" Text=\"CONFORME, EL LIBRADO\"/>\r\n      <TfrxMemoView Name=\"FacturasIMPORTE_LETRA1\" IndexTag=\"1\" AllowVectorExport=\"True\" Left=\"120,94496\" Top=\"113,3859\" Width=\"514,01608\" Height=\"37,7953\" DataSet=\"dmFacturas.fxdsPrintFac\" DataSetName=\"Facturas\" Frame.Typ=\"0\" Text=\"[Recibos.&#34;IMPORTE_LETRA_RECIBO&#34;]\"/>\r\n      <TfrxMemoView Name=\"FacturasIBAN\" IndexTag=\"1\" AllowVectorExport=\"True\" Left=\"222,99227\" Top=\"162,7718\" Width=\"272,12616\" Height=\"18,89765\" DataSet=\"dmFacturas.fxdsPrintFac\" DataSetName=\"Facturas\" Frame.Typ=\"0\" Text=\"[Recibos.&#34;IBAN_CLIENTE_RECIBO&#34;]\"/>\r\n      <TfrxMemoView Name=\"FacturasFECHA_EXPEDICION\" IndexTag=\"1\" AllowVectorExport=\"True\" Left=\"222,99227\" Top=\"81,5906\" Width=\"109,60637\" Height=\"18,89765\" DataSet=\"dmFacturas.fxdsPrintFac\" DataSetName=\"Facturas\" DisplayFormat.FormatStr=\"dd/mm/yyyy\" DisplayFormat.Kind=\"fkDateTime\" Frame.Typ=\"0\" Text=\"[Recibos.&#34;FECHA_EXPEDICION_RECIBO&#34;]\"/>\r\n      <TfrxMemoView Name=\"FacturasFECHA_VENCIMIENTO\" IndexTag=\"1\" AllowVectorExport=\"True\" Left=\"574,48856\" Top=\"81,5906\" Width=\"102,04731\" Height=\"18,89765\" DataSet=\"dmFacturas.fxdsPrintFac\" DataSetName=\"Facturas\" DisplayFormat.FormatStr=\"dd/mm/yyyy\" DisplayFormat.Kind=\"fkDateTime\" Frame.Typ=\"0\" Text=\"[Recibos.&#34;FECHA_VENCIMIENTO_RECIBO&#34;]\"/>\r\n      <TfrxMemoView Name=\"FacturasEUROS_RECIBO\" IndexTag=\"1\" AllowVectorExport=\"True\" Left=\"521,57514\" Top=\"32,45671\" Width=\"173,85838\" Height=\"18,89765\" DataSet=\"dmFacturas.fxdsPrintFac\" DataSetName=\"Facturas\" DisplayFormat.DecimalSeparator=\",\" DisplayFormat.FormatStr=\"%2.2m\" DisplayFormat.Kind=\"fkNumeric\" Font.Charset=\"1\" Font.Color=\"0\" Font.Height=\"-13\" Font.Name=\"Arial\" Font.Style=\"0\" Frame.Typ=\"0\" HAlign=\"haRight\" ParentFont=\"False\" Text=\"[Recibos.&#34;EUROS_RECIBO&#34;]\"/>\r\n      <TfrxLineView Name=\"Line1\" AllowVectorExport=\"True\" Left=\"0\" Top=\"334,81911\" Width=\"759,68553\" Height=\"0\" Color=\"0\" Frame.Style=\"fsDash\" Frame.Typ=\"4\"/>\r\n    </TfrxMasterData>\r\n  </TfrxReportPage>\r\n</TfrxReport>\r\n','2023-04-21 13:21:21','2023-04-21 13:21:21','Administrador','Administrador');
INSERT INTO `fza_usuarios_perfiles`(`USUARIO_GRUPO_PERFILES`, `KEY_PERFILES`, `SUBKEY_PERFILES`, `VALUE_PERFILES`, `VALUE_TEXT_PERFILES`, `TYPE_BLOB_PERFILES`, `VALUE_BLOB_PERFILES`, `INSTANTEMODIF`, `INSTANTEALTA`, `USUARIOALTA`, `USUARIOMODIF`) VALUES
 ('Todos','inLibtb','oSimbolosProhibidos',',\"\'+-€%*',NULL,NULL,NULL,'2023-04-26 11:50:56','2023-04-26 11:50:48','Administrador','Administrador');

DROP TABLE IF EXISTS `fza_variaciones`;
CREATE TABLE `fza_variaciones` (
  `CODIGO_VARIACION` varchar(20) NOT NULL,
  `NOMBRE_VARIACION` varchar(100) DEFAULT NULL,
  `ACTIVO_VARIACION` varchar(1) DEFAULT 'S',
  `ORDEN_VARIACION` int(11) DEFAULT NULL,
  `INSTANTEMODIF` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `INSTANTEALTA` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `USUARIOALTA` varchar(100) NOT NULL,
  `USUARIOMODIF` varchar(100) NOT NULL,
  PRIMARY KEY (`CODIGO_VARIACION`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci ROW_FORMAT=DYNAMIC;

INSERT INTO `fza_variaciones`(`CODIGO_VARIACION`, `NOMBRE_VARIACION`, `ACTIVO_VARIACION`, `ORDEN_VARIACION`, `INSTANTEMODIF`, `INSTANTEALTA`, `USUARIOALTA`, `USUARIOMODIF`) VALUES
 ('000','SIN VARIACIONES','S',0,'2023-10-01 19:44:16','2023-10-01 19:44:09','Administrador','Administrador'),
 ('001','TALLAS Y COLORES','S',1,'2023-09-11 20:46:59','2023-09-11 20:46:51','Administrador','Administrador');

DROP TABLE IF EXISTS `fza_variaciones_columnas`;
CREATE TABLE `fza_variaciones_columnas` (
  `CODIGO_VAR_COL` varchar(20) NOT NULL,
  `CODIGO_VARIACION_VAR_COL` varchar(20) DEFAULT NULL,
  `CODIGO_COLUMNA_VAR_COL` varchar(20) NOT NULL,
  `NOMBRE_COLUMNA_VAR_COL` varchar(100) DEFAULT NULL,
  `ACTIVO_COLUMNA_VAR_COL` varchar(1) DEFAULT 'S',
  `ORDEN_COLUMNA_VAR_COL` int(11) DEFAULT NULL,
  `ESDEFINITORIO_VAR_COL` varchar(1) DEFAULT NULL,
  `INSTANTEMODIF` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `INSTANTEALTA` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `USUARIOALTA` varchar(100) NOT NULL,
  `USUARIOMODIF` varchar(100) NOT NULL,
  PRIMARY KEY (`CODIGO_VAR_COL`,`CODIGO_COLUMNA_VAR_COL`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci ROW_FORMAT=DYNAMIC;

INSERT INTO `fza_variaciones_columnas`(`CODIGO_VAR_COL`, `CODIGO_VARIACION_VAR_COL`, `CODIGO_COLUMNA_VAR_COL`, `NOMBRE_COLUMNA_VAR_COL`, `ACTIVO_COLUMNA_VAR_COL`, `ORDEN_COLUMNA_VAR_COL`, `ESDEFINITORIO_VAR_COL`, `INSTANTEMODIF`, `INSTANTEALTA`, `USUARIOALTA`, `USUARIOMODIF`) VALUES
 ('001','0000000000000000001','COLOR','COLOR','S',2,'S','2023-10-02 11:28:11','2023-09-12 14:05:16','Administrador','Administrador'),
 ('001','0000000000000000002','COLORPROV','COLOR PROVEEDOR','S',3,'N','2023-10-02 11:28:17','2023-09-12 14:05:21','Administrador','Administrador'),
 ('001','0000000000000000003','TALLA','TALLA','S',1,'S','2023-10-02 11:28:22','2023-09-12 14:05:37','Administrador','Administrador');

DROP TABLE IF EXISTS `fza_winforms`;
CREATE TABLE `fza_winforms` (
  `CALL_WINF` varchar(255) NOT NULL,
  `CAPTION_WINF` varchar(255) DEFAULT NULL,
  `MENUITEM_WINF` varchar(255) DEFAULT NULL,
  `UNITF_WINF` varchar(255) DEFAULT NULL,
  `SHORTCUT_WINF` varchar(20) DEFAULT NULL,
  `DATAMODULE_WINF` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`CALL_WINF`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci ROW_FORMAT=DYNAMIC;

INSERT INTO `fza_winforms`(`CALL_WINF`, `CAPTION_WINF`, `MENUITEM_WINF`, `UNITF_WINF`, `SHORTCUT_WINF`, `DATAMODULE_WINF`) VALUES
 ('Articulos','Artículos','mnuArticulos','inMtoArticulos.TfrmMtoArticulos','A','UniDataArticulos.TdmArticulos'),
 ('Clientes','Clientes','mnuClientes','inMtoClientes.TfrmMtoClientes','K','UniDataClientes.TdmClientes'),
 ('Contadores','Contadores','mnuContadores','inMtoContadores.TfrmMtoContadores','R','UniDataContadores.TdmContadores'),
 ('Empresas','Empresas','mnuEmpresas','inMtoEmpresas.TfrmMtoEmpresas','E','UniDataEmpresas.TdmEmpresas'),
 ('Facturas','Facturas','mnuFacturas','inMtoFacturas.TfrmMtoFacturas','F','UniDataFacturas.TdmFacturas'),
 ('Familias','Familias','mnuFamilias','inMtoFamilias.TfrmMtoFamilias','N','UniDataFamilias.TdmFamilias'),
 ('FormasdePago','Formas de Pago','mnuFormasdePago','inMtoFormasdePago.TfrmMtoFormasdePago','Q','UniDataFormasdePago.TdmFormasdePago'),
 ('GeneradorProcesos','Generador de Procesos','mnuGeneradorProcesos','inMtoGeneradorProcesos.TfrmMtoGeneradorProcesos','G','UniDataGeneradorProcesos.TdmGeneradorProcesos'),
 ('Grupos','Grupos de Usuarios','mnuGrupos','inMtoGrupos.TfrmMtoGrupos','J','UniDataGrupos.TdmGrupos'),
 ('Ivas','Impuestos IVA','mnuIvas','inMtoIvas.TfrmMtoIvas','I','UniDataIvas.TdmIvas'),
 ('IvasGrupos','Grupos de Impuestos IVA','mnuGruposdeIVA','inMtoIvasGrupos.TfrmMtoIvasGrupos','O','UniDataIvasGrupos.TdmIvasGrupos'),
 ('Proveedores','Proveedores','mnuProveedores','inMtoProveedores.TfrmMtoProveedores','P','UniDataProveedores.TdmProveedores'),
 ('Tarifas','Tarifas','mnuTarifas','inMtoTarifas.TfrmMtoTarifas','T','UniDataTarifas.TdmTarifas'),
 ('Usuarios','Usuarios','mnuUsuarios','inMtoUsuarios.TfrmMtoUsuarios','H','UniDataUsuarios.TdmUsuarios'),
 ('UsuariosPerfiles','Perfiles de Usuarios','mnuPerfiles','inMtoUsuariosPerfiles.TfrmMtoUsuariosPerfiles','M','UniDataUsuariosPerfiles.TdmUsuariosPerfiles');

DROP VIEW IF EXISTS `vi_art_busquedas`;
CREATE ALGORITHM=UNDEFINED  SQL SECURITY DEFINER VIEW `vi_art_busquedas` AS select `fza_articulos`.`CODIGO_ARTICULO` AS `CODIGO_ARTICULO`,`fza_articulos`.`ACTIVO_ARTICULO` AS `ACTIVO_ARTICULO`,`fza_articulos`.`DESCRIPCION_ARTICULO` AS `DESCRIPCION_ARTICULO`,`fza_articulos`.`CODIGO_FAMILIA_ARTICULO` AS `CODIGO_FAMILIA_ARTICULO`,`fza_articulos_familias`.`DESCRIPCION_FAMILIA` AS `DESCRIPCION_FAMILIA`,`fza_articulos_proveedores`.`CODIGO_PROVEEDOR_ARTICULO_PROVEEDOR` AS `CODIGO_PROVEEDOR_PRINCIPAL`,`fza_proveedores`.`RAZONSOCIAL_PROVEEDOR` AS `RAZON_SOCIAL_PROVEEDOR_PRINCIPAL`,`fza_articulos_tarifas`.`CODIGO_TARIFA` AS `CODIGO_TARIFA`,`fza_tarifas`.`NOMBRE_TARIFA` AS `NOMBRE_TARIFA`,`fza_articulos_tarifas`.`PRECIOSALIDA_TARIFA` AS `PRECIOSALIDA_TARIFA`,`fza_articulos_tarifas`.`PRECIO_DTO_TARIFA` AS `PRECIO_DTO_TARIFA`,`fza_articulos_tarifas`.`PORCEN_DTO_TARIFA` AS `PORCEN_DTO_TARIFA`,`fza_articulos_tarifas`.`PRECIOFINAL_TARIFA` AS `PRECIOFINAL_TARIFA`,`fza_articulos_tarifas`.`FECHA_DESDE_TARIFA` AS `FECHA_DESDE_TARIFA`,`fza_articulos_tarifas`.`FECHA_HASTA_TARIFA` AS `FECHA_HASTA_TARIFA`,`fza_tarifas`.`ESIMP_INCL_TARIFA` AS `ESIMP_INCL_TARIFA`,`fza_ivas_tipos`.`NOMBRE_TIPO_IVA` AS `NOMBRE_TIPO_IVA`,`fza_articulos`.`TIPOIVA_ARTICULO` AS `TIPOIVA_ARTICULO`,`fza_articulos`.`TIPO_CANTIDAD_ARTICULO` AS `TIPO_CANTIDAD_ARTICULO`,`fza_articulos`.`USUARIOMODIF` AS `USUARIOMODIF`,`fza_articulos`.`INSTANTEALTA` AS `INSTANTEALTA`,`fza_articulos`.`INSTANTEMODIF` AS `INSTANTEMODIF`,`fza_articulos`.`USUARIOALTA` AS `USUARIOALTA`,`fza_articulos`.`ESACTIVO_FIJO_ARTICULO` AS `ESACTIVO_FIJO_ARTICULO` from ((((((`fza_articulos` left join `fza_articulos_familias` on(`fza_articulos`.`CODIGO_FAMILIA_ARTICULO` = `fza_articulos_familias`.`CODIGO_FAMILIA`)) left join `fza_articulos_tarifas` on(`fza_articulos`.`CODIGO_ARTICULO` = `fza_articulos_tarifas`.`CODIGO_ARTICULO_TARIFA`)) left join `fza_tarifas` on(`fza_articulos_tarifas`.`CODIGO_TARIFA` = `fza_tarifas`.`CODIGO_TARIFA` and `fza_tarifas`.`ESDEFAULT_TARIFA` = 'S')) left join `fza_ivas_tipos` on(`fza_articulos`.`TIPOIVA_ARTICULO` = `fza_ivas_tipos`.`CODIGO_ABREVIATURA_TIPO_IVA`)) left join `fza_articulos_proveedores` on(`fza_articulos`.`CODIGO_ARTICULO` = `fza_articulos_proveedores`.`CODIGO_ARTICULO_ARTICULO_PROVEEDOR` and `fza_articulos_proveedores`.`ESPROVEEDORPRINCIPAL_ARTICULO_PROVEEDOR` = 'S')) left join `fza_proveedores` on(`fza_proveedores`.`CODIGO_PROVEEDOR` = `fza_articulos_proveedores`.`CODIGO_PROVEEDOR_ARTICULO_PROVEEDOR`)) where `fza_articulos`.`ACTIVO_ARTICULO` = 'S' order by `fza_articulos`.`ORDEN_ARTICULO`;

DROP VIEW IF EXISTS `vi_articulos`;
CREATE ALGORITHM=UNDEFINED  SQL SECURITY DEFINER VIEW `vi_articulos` AS select `fza_articulos`.`CODIGO_ARTICULO` AS `CODIGO_ARTICULO`,`fza_articulos`.`ACTIVO_ARTICULO` AS `ACTIVO_ARTICULO`,`fza_articulos`.`ORDEN_ARTICULO` AS `ORDEN_ARTICULO`,`fza_articulos`.`DESCRIPCION_ARTICULO` AS `DESCRIPCION_ARTICULO`,`fza_articulos`.`CODIGO_FAMILIA_ARTICULO` AS `CODIGO_FAMILIA_ARTICULO`,`fza_articulos`.`CODIGO_VARIACION_ARTICULO` AS `CODIGO_VARIACION_ARTICULO`,`fza_articulos_familias`.`DESCRIPCION_FAMILIA` AS `DESCRIPCION_FAMILIA`,`fza_articulos_familias`.`NOMBRE_FAMILIA` AS `NOMBRE_FAMILIA`,`fza_articulos`.`TIPOIVA_ARTICULO` AS `TIPOIVA_ARTICULO`,`fza_ivas_tipos`.`NOMBRE_TIPO_IVA` AS `NOMBRE_TIPO_IVA`,`fza_articulos`.`ESACTIVO_FIJO_ARTICULO` AS `ESACTIVO_FIJO_ARTICULO`,`fza_articulos`.`TIPO_CANTIDAD_ARTICULO` AS `TIPO_CANTIDAD_ARTICULO`,`fza_proveedores`.`RAZONSOCIAL_PROVEEDOR` AS `RAZONSOCIAL_PROVEEDOR`,`fza_articulos`.`INSTANTEMODIF` AS `INSTANTEMODIF`,`fza_articulos`.`INSTANTEALTA` AS `INSTANTEALTA`,`fza_articulos`.`USUARIOALTA` AS `USUARIOALTA`,`fza_articulos`.`USUARIOMODIF` AS `USUARIOMODIF` from ((((`fza_articulos` left join `fza_articulos_familias` on(`fza_articulos`.`CODIGO_FAMILIA_ARTICULO` = `fza_articulos_familias`.`CODIGO_FAMILIA`)) left join `fza_articulos_proveedores` on(`fza_articulos`.`CODIGO_ARTICULO` = `fza_articulos_proveedores`.`CODIGO_ARTICULO_ARTICULO_PROVEEDOR` and `fza_articulos_proveedores`.`ESPROVEEDORPRINCIPAL_ARTICULO_PROVEEDOR` = 'S')) left join `fza_proveedores` on(`fza_articulos_proveedores`.`CODIGO_PROVEEDOR_ARTICULO_PROVEEDOR` = `fza_proveedores`.`CODIGO_PROVEEDOR`)) left join `fza_ivas_tipos` on(`fza_articulos`.`TIPOIVA_ARTICULO` = `fza_ivas_tipos`.`CODIGO_ABREVIATURA_TIPO_IVA`)) order by `fza_articulos`.`ORDEN_ARTICULO`;

DROP VIEW IF EXISTS `vi_articulos_familias`;
CREATE ALGORITHM=UNDEFINED  SQL SECURITY DEFINER VIEW `vi_articulos_familias` AS select `fza_articulos_familias`.`CODIGO_FAMILIA` AS `CODIGO_FAMILIA`,`fza_articulos_familias`.`ACTIVO_FAMILIA` AS `ACTIVO_FAMILIA`,`fza_articulos_familias`.`ORDEN_FAMILIA` AS `ORDEN_FAMILIA`,`fza_articulos_familias`.`ESDEFAULT_FAMILIA` AS `ESDEFAULT_FAMILIA`,`fza_articulos_familias`.`CODIGO_SUBFAMILIA` AS `CODIGO_SUBFAMILIA`,`fza_articulos_familias2`.`NOMBRE_FAMILIA` AS `NOMBRE_SUBFAMILIA`,`fza_articulos_familias`.`NOMBRE_FAMILIA` AS `NOMBRE_FAMILIA`,`fza_articulos_familias`.`DESCRIPCION_FAMILIA` AS `DESCRIPCION_FAMILIA`,`fza_articulos_familias`.`INSTANTEMODIF` AS `INSTANTEMODIF`,`fza_articulos_familias`.`INSTANTEALTA` AS `INSTANTEALTA`,`fza_articulos_familias`.`USUARIOALTA` AS `USUARIOALTA`,`fza_articulos_familias`.`USUARIOMODIF` AS `USUARIOMODIF` from (`fza_articulos_familias` left join `fza_articulos_familias` `fza_articulos_familias2` on(`fza_articulos_familias`.`CODIGO_SUBFAMILIA` = `fza_articulos_familias2`.`CODIGO_FAMILIA`));

DROP VIEW IF EXISTS `vi_articulos_familias_list`;
CREATE ALGORITHM=UNDEFINED  SQL SECURITY DEFINER VIEW `vi_articulos_familias_list` AS select `fza_articulos_familias`.`CODIGO_FAMILIA` AS `CODIGO_FAMILIA`,`fza_articulos_familias`.`ACTIVO_FAMILIA` AS `ACTIVO_FAMILIA`,`fza_articulos_familias`.`ORDEN_FAMILIA` AS `ORDEN_FAMILIA`,`fza_articulos_familias`.`ESDEFAULT_FAMILIA` AS `ESDEFAULT_FAMILIA`,`fza_articulos_familias`.`CODIGO_SUBFAMILIA` AS `CODIGO_SUBFAMILIA`,`fza_articulos_familias`.`NOMBRE_FAMILIA` AS `NOMBRE_FAMILIA`,`fza_articulos_familias`.`DESCRIPCION_FAMILIA` AS `DESCRIPCION_FAMILIA`,`fza_articulos_familias`.`INSTANTEMODIF` AS `INSTANTEMODIF`,`fza_articulos_familias`.`INSTANTEALTA` AS `INSTANTEALTA`,`fza_articulos_familias`.`USUARIOALTA` AS `USUARIOALTA`,`fza_articulos_familias`.`USUARIOMODIF` AS `USUARIOMODIF` from `fza_articulos_familias` where `fza_articulos_familias`.`ACTIVO_FAMILIA` = 'S' order by `fza_articulos_familias`.`ORDEN_FAMILIA`;

DROP VIEW IF EXISTS `vi_articulos_list`;
CREATE ALGORITHM=UNDEFINED  SQL SECURITY DEFINER VIEW `vi_articulos_list` AS select `fza_articulos`.`CODIGO_ARTICULO` AS `CODIGO_ARTICULO`,`fza_articulos`.`ACTIVO_ARTICULO` AS `ACTIVO_ARTICULO`,`fza_articulos`.`ORDEN_ARTICULO` AS `ORDEN_ARTICULO`,`fza_articulos`.`DESCRIPCION_ARTICULO` AS `DESCRIPCION_ARTICULO`,`fza_articulos`.`CODIGO_FAMILIA_ARTICULO` AS `CODIGO_FAMILIA_ARTICULO`,`fza_articulos_familias`.`DESCRIPCION_FAMILIA` AS `DESCRIPCION_FAMILIA`,`fza_articulos`.`TIPOIVA_ARTICULO` AS `TIPOIVA_ARTICULO`,`fza_articulos`.`ESACTIVO_FIJO_ARTICULO` AS `ESACTIVO_FIJO_ARTICULO`,`fza_articulos`.`TIPO_CANTIDAD_ARTICULO` AS `TIPO_CANTIDAD_ARTICULO`,`fza_articulos_proveedores`.`CODIGO_PROVEEDOR_ARTICULO_PROVEEDOR` AS `CODIGO_PROVEEDOR`,`fza_proveedores`.`RAZONSOCIAL_PROVEEDOR` AS `RAZONSOCIAL_PROVEEDOR`,`fza_articulos`.`INSTANTEMODIF` AS `INSTANTEMODIF`,`fza_articulos`.`INSTANTEALTA` AS `INSTANTEALTA`,`fza_articulos`.`USUARIOALTA` AS `USUARIOALTA`,`fza_articulos`.`USUARIOMODIF` AS `USUARIOMODIF` from (((`fza_articulos` left join `fza_articulos_familias` on(`fza_articulos`.`CODIGO_FAMILIA_ARTICULO` = `fza_articulos_familias`.`CODIGO_FAMILIA`)) left join `fza_articulos_proveedores` on(`fza_articulos_proveedores`.`CODIGO_ARTICULO_ARTICULO_PROVEEDOR` = `fza_articulos`.`CODIGO_ARTICULO` and `fza_articulos_proveedores`.`ESPROVEEDORPRINCIPAL_ARTICULO_PROVEEDOR` = 'S')) left join `fza_proveedores` on(`fza_proveedores`.`CODIGO_PROVEEDOR` = `fza_articulos_proveedores`.`CODIGO_PROVEEDOR_ARTICULO_PROVEEDOR`)) where `fza_articulos`.`ACTIVO_ARTICULO` = 'S' order by `fza_articulos`.`ORDEN_ARTICULO`;

DROP VIEW IF EXISTS `vi_articulos_proveedores`;
CREATE ALGORITHM=UNDEFINED  SQL SECURITY DEFINER VIEW `vi_articulos_proveedores` AS select `fza_articulos_proveedores`.`CODIGO_PROVEEDOR_ARTICULO_PROVEEDOR` AS `CODIGO_PROVEEDOR`,`fza_proveedores`.`RAZONSOCIAL_PROVEEDOR` AS `RAZONSOCIAL_PROVEEDOR`,`fza_articulos_proveedores`.`CODIGO_ARTICULO_ARTICULO_PROVEEDOR` AS `CODIGO_ARTICULO`,`fza_articulos_proveedores`.`PRECIO_ULT_COMPRA_ARTICULO_PROVEEDOR` AS `PRECIO_ULT_COMPRA`,`fza_articulos_proveedores`.`FECHA_VALIDEZ_ARTICULO_PROVEEDOR` AS `FECHA_VALIDEZ`,`fza_articulos_proveedores`.`ESPROVEEDORPRINCIPAL_ARTICULO_PROVEEDOR` AS `ESPROVEEDORPRINCIPAL`,`fza_articulos_proveedores`.`INSTANTEMODIF` AS `INSTANTEMODIF`,`fza_articulos_proveedores`.`INSTANTEALTA` AS `INSTANTEALTA`,`fza_articulos_proveedores`.`USUARIOALTA` AS `USUARIOALTA`,`fza_articulos_proveedores`.`USUARIOMODIF` AS `USUARIOMODIF` from (`fza_articulos_proveedores` left join `fza_proveedores` on(`fza_articulos_proveedores`.`CODIGO_PROVEEDOR_ARTICULO_PROVEEDOR` = `fza_proveedores`.`CODIGO_PROVEEDOR`));

DROP VIEW IF EXISTS `vi_articulos_tarifas`;
CREATE ALGORITHM=UNDEFINED  SQL SECURITY DEFINER VIEW `vi_articulos_tarifas` AS select `fza_articulos_tarifas`.`CODIGO_UNICO_TARIFA` AS `CODIGO_UNICO_TARIFA`,`fza_articulos_tarifas`.`CODIGO_ARTICULO_TARIFA` AS `CODIGO_ARTICULO_TARIFA`,`fza_tarifas`.`ESIMP_INCL_TARIFA` AS `ESIMP_INCL_TARIFA`,`fza_tarifas`.`ESDEFAULT_TARIFA` AS `ESDEFAULT_TARIFA`,`fza_articulos`.`DESCRIPCION_ARTICULO` AS `DESCRIPCION_ARTICULO`,`fza_articulos`.`TIPO_CANTIDAD_ARTICULO` AS `TIPO_CANTIDAD_ARTICULO`,`fza_ivas_tipos`.`NOMBRE_TIPO_IVA` AS `TIPO_IVA_ARTICULO`,`fza_articulos_tarifas`.`ACTIVO_TARIFA` AS `ACTIVO_TARIFA`,`fza_articulos_tarifas`.`CODIGO_TARIFA` AS `CODIGO_TARIFA`,`fza_tarifas`.`NOMBRE_TARIFA` AS `NOMBRE_TARIFA`,`fza_articulos_tarifas`.`FECHA_DESDE_TARIFA` AS `FECHA_DESDE_TARIFA`,`fza_articulos_tarifas`.`FECHA_HASTA_TARIFA` AS `FECHA_HASTA_TARIFA`,`fza_articulos_tarifas`.`PRECIOFINAL_TARIFA` AS `PRECIOFINAL_TARIFA`,`fza_articulos_tarifas`.`PRECIOSALIDA_TARIFA` AS `PRECIOSALIDA_TARIFA`,`fza_articulos_tarifas`.`PORCEN_DTO_TARIFA` AS `PORCEN_DTO_TARIFA`,`fza_articulos_tarifas`.`PRECIO_DTO_TARIFA` AS `PRECIO_DTO_TARIFA`,`fza_articulos_proveedores`.`CODIGO_PROVEEDOR_ARTICULO_PROVEEDOR` AS `CODIGO_PROVEEDOR`,`fza_proveedores`.`RAZONSOCIAL_PROVEEDOR` AS `RAZONSOCIAL_PROVEEDOR`,`fza_articulos_proveedores`.`PRECIO_ULT_COMPRA_ARTICULO_PROVEEDOR` AS `PRECIO_ULT_COMPRA`,`fza_articulos_proveedores`.`FECHA_VALIDEZ_ARTICULO_PROVEEDOR` AS `FECHA_VALIDEZ`,`fza_articulos`.`CODIGO_FAMILIA_ARTICULO` AS `CODIGO_FAMILIA_ARTICULO`,`fza_articulos_familias`.`DESCRIPCION_FAMILIA` AS `DESCRIPCION_FAMILIA`,`fza_articulos_tarifas`.`INSTANTEALTA` AS `INSTANTEALTA`,`fza_articulos_tarifas`.`INSTANTEMODIF` AS `INSTANTEMODIF`,`fza_articulos_tarifas`.`USUARIOALTA` AS `USUARIOALTA`,`fza_articulos_tarifas`.`USUARIOMODIF` AS `USUARIOMODIF` from ((((((`fza_articulos_tarifas` left join `fza_articulos_proveedores` on(`fza_articulos_tarifas`.`CODIGO_ARTICULO_TARIFA` = `fza_articulos_proveedores`.`CODIGO_ARTICULO_ARTICULO_PROVEEDOR` and `fza_articulos_proveedores`.`ESPROVEEDORPRINCIPAL_ARTICULO_PROVEEDOR` = 'S')) left join `fza_tarifas` on(`fza_articulos_tarifas`.`CODIGO_TARIFA` = `fza_tarifas`.`CODIGO_TARIFA`)) left join `fza_articulos` on(`fza_articulos_tarifas`.`CODIGO_ARTICULO_TARIFA` = `fza_articulos`.`CODIGO_ARTICULO`)) left join `fza_articulos_familias` on(`fza_articulos`.`CODIGO_FAMILIA_ARTICULO` = `fza_articulos_familias`.`CODIGO_FAMILIA`)) left join `fza_proveedores` on(`fza_articulos_proveedores`.`CODIGO_PROVEEDOR_ARTICULO_PROVEEDOR` = `fza_proveedores`.`CODIGO_PROVEEDOR`)) left join `fza_ivas_tipos` on(`fza_articulos`.`TIPOIVA_ARTICULO` = `fza_ivas_tipos`.`CODIGO_ABREVIATURA_TIPO_IVA`)) order by `fza_tarifas`.`ORDEN_TARIFA`,`fza_articulos`.`ORDEN_ARTICULO`;

DROP VIEW IF EXISTS `vi_cli_busquedas`;
CREATE ALGORITHM=UNDEFINED  SQL SECURITY DEFINER VIEW `vi_cli_busquedas` AS select `fza_clientes`.`CODIGO_CLIENTE` AS `CODIGO_CLIENTE`,`fza_clientes`.`ACTIVO_CLIENTE` AS `ACTIVO_CLIENTE`,`fza_clientes`.`RAZONSOCIAL_CLIENTE` AS `RAZONSOCIAL_CLIENTE`,`fza_clientes`.`NIF_CLIENTE` AS `NIF_CLIENTE`,`fza_clientes`.`MOVIL_CLIENTE` AS `MOVIL_CLIENTE`,`fza_clientes`.`EMAIL_CLIENTE` AS `EMAIL_CLIENTE`,`fza_clientes`.`DIRECCION1_CLIENTE` AS `DIRECCION1_CLIENTE`,`fza_clientes`.`DIRECCION2_CLIENTE` AS `DIRECCION2_CLIENTE`,`fza_clientes`.`POBLACION_CLIENTE` AS `POBLACION_CLIENTE`,`fza_clientes`.`PROVINCIA_CLIENTE` AS `PROVINCIA_CLIENTE`,`fza_clientes`.`CPOSTAL_CLIENTE` AS `CPOSTAL_CLIENTE`,`fza_clientes`.`PAIS_CLIENTE` AS `PAIS_CLIENTE`,`fza_clientes`.`OBSERVACIONES_CLIENTE` AS `OBSERVACIONES_CLIENTE`,`fza_clientes`.`REFERENCIA_CLIENTE` AS `REFERENCIA_CLIENTE`,`fza_clientes`.`CONTACTO_CLIENTE` AS `CONTACTO_CLIENTE`,`fza_clientes`.`TELEFONO_CONTACTO_CLIENTE` AS `TELEFONO_CONTACTO_CLIENTE`,`fza_clientes`.`TELEFONO_CLIENTE` AS `TELEFONO_CLIENTE`,`fza_clientes`.`IBAN_CLIENTE` AS `IBAN_CLIENTE`,`fza_clientes`.`ESIVA_RECARGO_CLIENTE` AS `ESIVA_RECARGO_CLIENTE`,`fza_clientes`.`ESRETENCIONES_CLIENTE` AS `ESRETENCIONES_CLIENTE`,`fza_clientes`.`ESIVA_EXENTO_CLIENTE` AS `ESIVA_EXENTO_CLIENTE`,`fza_clientes`.`ESREGIMENESPECIALAGRICOLA_CLIENTE` AS `ESREGIMENESPECIALAGRICOLA_CLIENTE`,`fza_clientes`.`ESINTRACOMUNITARIO_CLIENTE` AS `ESINTRACOMUNITARIO_CLIENTE`,`fza_clientes`.`CODIGO_FORMA_PAGO_CLIENTE` AS `CODIGO_FORMA_PAGO_CLIENTE`,`fza_clientes`.`SERIE_CONTADOR_CLIENTE` AS `SERIE_CONTADOR_CLIENTE`,`fza_clientes`.`TARIFA_ARTICULO_CLIENTE` AS `TARIFA_ARTICULO_CLIENTE`,`fza_clientes`.`TEXTO_LEGAL_FACTURA_CLIENTE` AS `TEXTO_LEGAL_FACTURA_CLIENTE`,`fza_clientes`.`INSTANTEMODIF` AS `INSTANTEMODIF`,`fza_clientes`.`INSTANTEALTA` AS `INSTANTEALTA`,`fza_clientes`.`USUARIOALTA` AS `USUARIOALTA`,`fza_clientes`.`USUARIOMODIF` AS `USUARIOMODIF` from `fza_clientes` where `fza_clientes`.`ACTIVO_CLIENTE` = 'S' order by `fza_clientes`.`CODIGO_CLIENTE` desc;

DROP VIEW IF EXISTS `vi_clientes`;
CREATE ALGORITHM=UNDEFINED  SQL SECURITY DEFINER VIEW `vi_clientes` AS select `fza_clientes`.`CODIGO_CLIENTE` AS `CODIGO_CLIENTE`,`fza_clientes`.`ORDEN_CLIENTE` AS `ORDEN_CLIENTE`,`fza_clientes`.`ACTIVO_CLIENTE` AS `ACTIVO_CLIENTE`,`fza_clientes`.`RAZONSOCIAL_CLIENTE` AS `RAZONSOCIAL_CLIENTE`,`fza_clientes`.`NIF_CLIENTE` AS `NIF_CLIENTE`,`fza_clientes`.`MOVIL_CLIENTE` AS `MOVIL_CLIENTE`,`fza_clientes`.`EMAIL_CLIENTE` AS `EMAIL_CLIENTE`,`fza_clientes`.`DIRECCION1_CLIENTE` AS `DIRECCION1_CLIENTE`,`fza_clientes`.`DIRECCION2_CLIENTE` AS `DIRECCION2_CLIENTE`,`fza_clientes`.`POBLACION_CLIENTE` AS `POBLACION_CLIENTE`,`fza_clientes`.`PROVINCIA_CLIENTE` AS `PROVINCIA_CLIENTE`,`fza_clientes`.`CPOSTAL_CLIENTE` AS `CPOSTAL_CLIENTE`,`fza_clientes`.`PAIS_CLIENTE` AS `PAIS_CLIENTE`,`fza_clientes`.`OBSERVACIONES_CLIENTE` AS `OBSERVACIONES_CLIENTE`,`fza_clientes`.`REFERENCIA_CLIENTE` AS `REFERENCIA_CLIENTE`,`fza_clientes`.`CONTACTO_CLIENTE` AS `CONTACTO_CLIENTE`,`fza_clientes`.`TELEFONO_CONTACTO_CLIENTE` AS `TELEFONO_CONTACTO_CLIENTE`,`fza_clientes`.`TELEFONO_CLIENTE` AS `TELEFONO_CLIENTE`,`fza_clientes`.`IBAN_CLIENTE` AS `IBAN_CLIENTE`,`fza_clientes`.`ESIVA_RECARGO_CLIENTE` AS `ESIVA_RECARGO_CLIENTE`,`fza_clientes`.`ESRETENCIONES_CLIENTE` AS `ESRETENCIONES_CLIENTE`,`fza_clientes`.`ESIVA_EXENTO_CLIENTE` AS `ESIVA_EXENTO_CLIENTE`,`fza_clientes`.`ESINTRACOMUNITARIO_CLIENTE` AS `ESINTRACOMUNITARIO_CLIENTE`,`fza_clientes`.`ESREGIMENESPECIALAGRICOLA_CLIENTE` AS `ESREGIMENESPECIALAGRICOLA_CLIENTE`,`fza_clientes`.`CODIGO_FORMA_PAGO_CLIENTE` AS `CODIGO_FORMA_PAGO_CLIENTE`,`fza_clientes`.`TARIFA_ARTICULO_CLIENTE` AS `TARIFA_ARTICULO_CLIENTE`,`fza_clientes`.`SERIE_CONTADOR_CLIENTE` AS `SERIE_CONTADOR_CLIENTE`,`fza_clientes`.`TEXTO_LEGAL_FACTURA_CLIENTE` AS `TEXTO_LEGAL_FACTURA_CLIENTE`,`fza_clientes`.`INSTANTEMODIF` AS `INSTANTEMODIF`,`fza_clientes`.`INSTANTEALTA` AS `INSTANTEALTA`,`fza_clientes`.`USUARIOALTA` AS `USUARIOALTA`,`fza_clientes`.`USUARIOMODIF` AS `USUARIOMODIF` from `fza_clientes`;

DROP VIEW IF EXISTS `vi_contadores`;
CREATE ALGORITHM=UNDEFINED  SQL SECURITY DEFINER VIEW `vi_contadores` AS select `fza_contadores`.`TIPODOC_CONTADOR` AS `TIPODOC_CONTADOR`,`fza_contadores`.`SERIE_CONTADOR` AS `SERIE_CONTADOR`,`fza_contadores`.`CONTADOR_CONTADOR` AS `CONTADOR_CONTADOR`,`fza_contadores`.`EMPRESA_CONTADOR` AS `EMPRESA_CONTADOR`,`fza_tipos_documentos`.`DESCRIPCION_TIPODOCUMENTO` AS `DESCRIPCION_TIPODOCUMENTO`,`fza_contadores`.`DEFAULT_CONTADOR` AS `DEFAULT_CONTADOR`,`fza_contadores`.`NUMDIGIT_CONTADOR` AS `NUMDIGIT_CONTADOR`,`fza_contadores`.`ACTIVO_CONTADOR` AS `ACTIVO_CONTADOR`,`fza_contadores`.`INSTANTEMODIF` AS `INSTANTEMODIF`,`fza_contadores`.`INSTANTEALTA` AS `INSTANTEALTA`,`fza_contadores`.`USUARIOALTA` AS `USUARIOALTA`,`fza_contadores`.`USUARIOMODIF` AS `USUARIOMODIF` from (`fza_contadores` left join `fza_tipos_documentos` on(`fza_contadores`.`TIPODOC_CONTADOR` = `fza_tipos_documentos`.`CODIGO_TIPODOCUMENTO`));

DROP VIEW IF EXISTS `vi_emp_busquedas`;
CREATE ALGORITHM=UNDEFINED  SQL SECURITY DEFINER VIEW `vi_emp_busquedas` AS select `fza_empresas`.`CODIGO_EMPRESA` AS `CODIGO_EMPRESA`,`fza_empresas`.`RAZONSOCIAL_EMPRESA` AS `RAZONSOCIAL_EMPRESA`,`fza_empresas`.`NIF_EMPRESA` AS `NIF_EMPRESA`,`fza_empresas`.`MOVIL_EMPRESA` AS `MOVIL_EMPRESA`,`fza_empresas`.`EMAIL_EMPRESA` AS `EMAIL_EMPRESA`,`fza_empresas`.`DIRECCION1_EMPRESA` AS `DIRECCION1_EMPRESA`,`fza_empresas`.`DIRECCION2_EMPRESA` AS `DIRECCION2_EMPRESA`,`fza_empresas`.`CPOSTAL_EMPRESA` AS `CPOSTAL_EMPRESA`,`fza_empresas`.`POBLACION_EMPRESA` AS `POBLACION_EMPRESA`,`fza_empresas`.`PROVINCIA_EMPRESA` AS `PROVINCIA_EMPRESA`,`fza_empresas`.`PAIS_EMPRESA` AS `PAIS_EMPRESA`,`fza_empresas`.`SERIE_CONTADOR_EMPRESA` AS `SERIE_CONTADOR_EMPRESA`,`fza_empresas`.`GRUPO_ZONA_IVA_EMPRESA` AS `GRUPO_ZONA_IVA_EMPRESA`,`fza_empresas`.`ESRETENCIONES_EMPRESA` AS `ESRETENCIONES_EMPRESA`,`fza_empresas`.`ESREGIMENESPECIALAGRICOLA_EMPRESA` AS `ESREGIMENESPECIALAGRICOLA_EMPRESA`,`fza_empresas`.`TEXTO_LEGAL_FACTURA_EMPRESA` AS `TEXTO_LEGAL_FACTURA_EMPRESA` from `fza_empresas` where `fza_empresas`.`ACTIVO_EMPRESA` = 'S' order by `fza_empresas`.`ORDEN_EMPRESA`;

DROP VIEW IF EXISTS `vi_empresas`;
CREATE ALGORITHM=UNDEFINED  SQL SECURITY DEFINER VIEW `vi_empresas` AS select `fza_empresas`.`CODIGO_EMPRESA` AS `CODIGO_EMPRESA`,`fza_empresas`.`ORDEN_EMPRESA` AS `ORDEN_EMPRESA`,`fza_empresas`.`ACTIVO_EMPRESA` AS `ACTIVO_EMPRESA`,`fza_empresas`.`RAZONSOCIAL_EMPRESA` AS `RAZONSOCIAL_EMPRESA`,`fza_empresas`.`NIF_EMPRESA` AS `NIF_EMPRESA`,`fza_empresas`.`MOVIL_EMPRESA` AS `MOVIL_EMPRESA`,`fza_empresas`.`EMAIL_EMPRESA` AS `EMAIL_EMPRESA`,`fza_empresas`.`DIRECCION1_EMPRESA` AS `DIRECCION1_EMPRESA`,`fza_empresas`.`DIRECCION2_EMPRESA` AS `DIRECCION2_EMPRESA`,`fza_empresas`.`CPOSTAL_EMPRESA` AS `CPOSTAL_EMPRESA`,`fza_empresas`.`POBLACION_EMPRESA` AS `POBLACION_EMPRESA`,`fza_empresas`.`PROVINCIA_EMPRESA` AS `PROVINCIA_EMPRESA`,`fza_empresas`.`PAIS_EMPRESA` AS `PAIS_EMPRESA`,`fza_empresas`.`IBAN_EMPRESA` AS `IBAN_EMPRESA`,`fza_empresas`.`GRUPO_ZONA_IVA_EMPRESA` AS `GRUPO_ZONA_IVA_EMPRESA`,`fza_ivas_grupos`.`DESCRIPCION_ZONA_IVA` AS `DESCRIPCION_ZONA_IVA`,`fza_empresas`.`ESRETENCIONES_EMPRESA` AS `ESRETENCIONES_EMPRESA`,`fza_empresas`.`ESREGIMENESPECIALAGRICOLA_EMPRESA` AS `ESREGIMENESPECIALAGRICOLA_EMPRESA`,`fza_empresas`.`SERIE_CONTADOR_EMPRESA` AS `SERIE_CONTADOR_EMPRESA`,`fza_empresas`.`TEXTO_LEGAL_FACTURA_EMPRESA` AS `TEXTO_LEGAL_FACTURA_EMPRESA`,`fza_empresas`.`INSTANTEMODIF` AS `INSTANTEMODIF`,`fza_empresas`.`INSTANTEALTA` AS `INSTANTEALTA`,`fza_empresas`.`USUARIOALTA` AS `USUARIOALTA`,`fza_empresas`.`USUARIOMODIF` AS `USUARIOMODIF` from (`fza_empresas` left join `fza_ivas_grupos` on(`fza_empresas`.`GRUPO_ZONA_IVA_EMPRESA` = `fza_ivas_grupos`.`GRUPO_ZONA_IVA`));

DROP VIEW IF EXISTS `vi_empresas_retenciones`;
CREATE ALGORITHM=UNDEFINED  SQL SECURITY DEFINER VIEW `vi_empresas_retenciones` AS select `fza_empresas_retenciones`.`CODIGO_RETENCION` AS `CODIGO_RETENCION`,`fza_empresas_retenciones`.`CODIGO_EMPRESA_RETENCION` AS `CODIGO_EMPRESA_RETENCION`,`fza_empresas_retenciones`.`PORCENRETENCION_RETENCION` AS `PORCENRETENCION_RETENCION`,`fza_empresas_retenciones`.`FECHA_DESDE_RETENCION` AS `FECHA_DESDE_RETENCION`,`fza_empresas_retenciones`.`FECHA_HASTA_RETENCION` AS `FECHA_HASTA_RETENCION`,`fza_empresas_retenciones`.`INSTANTEMODIF` AS `INSTANTEMODIF`,`fza_empresas_retenciones`.`INSTANTEALTA` AS `INSTANTEALTA`,`fza_empresas_retenciones`.`USUARIOALTA` AS `USUARIOALTA`,`fza_empresas_retenciones`.`USUARIOMODIF` AS `USUARIOMODIF` from `fza_empresas_retenciones`;

DROP VIEW IF EXISTS `vi_empresas_series`;
CREATE ALGORITHM=UNDEFINED  SQL SECURITY DEFINER VIEW `vi_empresas_series` AS select `fza_empresas_series`.`CODIGO_SERIE` AS `CODIGO_SERIE`,`fza_empresas_series`.`CODIGO_EMPRESA_SERIE` AS `CODIGO_EMPRESA_SERIE`,`fza_empresas_series`.`SERIE_SERIE` AS `SERIE_SERIE`,`fza_empresas_series`.`FECHA_DESDE_SERIE` AS `FECHA_DESDE_SERIE`,`fza_empresas_series`.`FECHA_HASTA_SERIE` AS `FECHA_HASTA_SERIE`,`fza_empresas_series`.`INSTANTEMODIF` AS `INSTANTEMODIF`,`fza_empresas_series`.`INSTANTEALTA` AS `INSTANTEALTA`,`fza_empresas_series`.`USUARIOALTA` AS `USUARIOALTA`,`fza_empresas_series`.`USUARIOMODIF` AS `USUARIOMODIF` from `fza_empresas_series`;

DROP VIEW IF EXISTS `vi_fac_busquedas`;
CREATE ALGORITHM=UNDEFINED  SQL SECURITY DEFINER VIEW `vi_fac_busquedas` AS select `fza_facturas`.`FECHA_FACTURA` AS `FECHA_FACTURA`,`fza_facturas`.`NRO_FACTURA` AS `NRO_FACTURA`,`fza_facturas`.`SERIE_FACTURA` AS `SERIE_FACTURA`,`fza_facturas`.`TOTAL_LIQUIDO_FACTURA` AS `TOTAL_LIQUIDO_FACTURA`,`fza_facturas`.`PORCEN_RETENCION_FACTURA` AS `PORCEN_RETENCION_FACTURA`,`fza_facturas`.`TOTAL_RETENCION_FACTURA` AS `TOTAL_RETENCION_FACTURA`,`fza_facturas`.`TOTAL_IMPUESTOS_FACTURA` AS `TOTAL_IMPUESTOS_FACTURA`,`fza_facturas`.`TOTAL_BASES_FACTURA` AS `TOTAL_BASES_FACTURA`,`fza_facturas`.`FORMA_PAGO_FACTURA` AS `FORMA_PAGO_FACTURA`,`fza_formapago`.`DESCRIPCION_FORMAPAGO` AS `DESCRIPCION_FORMAPAGO`,`fza_facturas`.`CODIGO_EMPRESA_FACTURA` AS `CODIGO_EMPRESA_FACTURA`,`fza_facturas`.`RAZONSOCIAL_EMPRESA_FACTURA` AS `RAZONSOCIAL_EMPRESA_FACTURA`,`fza_facturas`.`NIF_EMPRESA_FACTURA` AS `NIF_EMPRESA_FACTURA`,`fza_facturas`.`MOVIL_EMPRESA_FACTURA` AS `MOVIL_EMPRESA_FACTURA`,`fza_facturas`.`EMAIL_EMPRESA_FACTURA` AS `EMAIL_EMPRESA_FACTURA`,`fza_facturas`.`DIRECCION1_EMPRESA_FACTURA` AS `DIRECCION1_EMPRESA_FACTURA`,`fza_facturas`.`DIRECCION2_EMPRESA_FACTURA` AS `DIRECCION2_EMPRESA_FACTURA`,`fza_facturas`.`POBLACION_EMPRESA_FACTURA` AS `POBLACION_EMPRESA_FACTURA`,`fza_facturas`.`PROVINCIA_EMPRESA_FACTURA` AS `PROVINCIA_EMPRESA_FACTURA`,`fza_facturas`.`PAIS_EMPRESA_FACTURA` AS `PAIS_EMPRESA_FACTURA`,`fza_facturas`.`CPOSTAL_EMPRESA_FACTURA` AS `CPOSTAL_EMPRESA_FACTURA`,`fza_facturas`.`ESRETENCIONES_EMPRESA_FACTURA` AS `ESRETENCIONES_EMPRESA_FACTURA`,`fza_facturas`.`GRUPO_ZONA_IVA_EMPRESA_FACTURA` AS `GRUPO_ZONA_IVA_EMPRESA_FACTURA`,`fza_facturas`.`ESREGIMENESPECIALAGRICOLA_EMPRESA_FACTURA` AS `ESREGIMENESPECIALAGRICOLA_EMPRESA_FACTURA`,`fza_facturas`.`CODIGO_CLIENTE_FACTURA` AS `CODIGO_CLIENTE_FACTURA`,`fza_facturas`.`RAZONSOCIAL_CLIENTE_FACTURA` AS `RAZONSOCIAL_CLIENTE_FACTURA`,`fza_facturas`.`NIF_CLIENTE_FACTURA` AS `NIF_CLIENTE_FACTURA`,`fza_facturas`.`MOVIL_CLIENTE_FACTURA` AS `MOVIL_CLIENTE_FACTURA`,`fza_facturas`.`EMAIL_CLIENTE_FACTURA` AS `EMAIL_CLIENTE_FACTURA`,`fza_facturas`.`DIRECCION1_CLIENTE_FACTURA` AS `DIRECCION1_CLIENTE_FACTURA`,`fza_facturas`.`DIRECCION2_CLIENTE_FACTURA` AS `DIRECCION2_CLIENTE_FACTURA`,`fza_facturas`.`POBLACION_CLIENTE_FACTURA` AS `POBLACION_CLIENTE_FACTURA`,`fza_facturas`.`PROVINCIA_CLIENTE_FACTURA` AS `PROVINCIA_CLIENTE_FACTURA`,`fza_facturas`.`CPOSTAL_CLIENTE_FACTURA` AS `CPOSTAL_CLIENTE_FACTURA`,`fza_facturas`.`PAIS_CLIENTE_FACTURA` AS `PAIS_CLIENTE_FACTURA`,`fza_facturas`.`ESIVA_RECARGO_CLIENTE_FACTURA` AS `ESIVA_RECARGO_CLIENTE_FACTURA`,`fza_facturas`.`ESIVA_EXENTO_CLIENTE_FACTURA` AS `ESIVA_EXENTO_CLIENTE_FACTURA`,`fza_facturas`.`ESREGIMENESPECIALAGRICOLA_CLIENTE_FACTURA` AS `ESREGIMENESPECIALAGRICOLA_CLIENTE_FACTURA`,`fza_facturas`.`ESRETENCIONES_CLIENTE_FACTURA` AS `ESRETENCIONES_CLIENTE_FACTURA`,`fza_facturas`.`TARIFA_ARTICULO_CLIENTE_FACTURA` AS `TARIFA_ARTICULO_CLIENTE_FACTURA`,`fza_facturas`.`ESIMP_INCL_TARIFA_CLIENTE_FACTURA` AS `ESIMP_INCL_TARIFA_CLIENTE_FACTURA`,`fza_facturas`.`ESINTRACOMUNITARIO_CLIENTE_FACTURA` AS `ESINTRACOMUNITARIO_CLIENTE_FACTURA`,`fza_facturas`.`ESIRPF_IMP_INCL_ZONA_IVA_FACTURA` AS `ESIRPF_IMP_INCL_ZONA_IVA_FACTURA`,`fza_facturas`.`ESAPLICA_RE_ZONA_IVA_FACTURA` AS `ESAPLICA_RE_ZONA_IVA_FACTURA`,`fza_facturas`.`ESIVAAGRICOLA_ZONA_IVA_FACTURA` AS `ESIVAAGRICOLA_ZONA_IVA_FACTURA`,`fza_facturas`.`PALABRA_REPORTS_ZONA_IVA_FACTURA` AS `PALABRA_REPORTS_ZONA_IVA_FACTURA`,`fza_facturas`.`CODIGO_IVA_FACTURA` AS `CODIGO_IVA_FACTURA`,`fza_facturas`.`ESVENTA_ACTIVO_FIJO_FACTURA` AS `ESVENTA_ACTIVO_FIJO_FACTURA`,`fza_facturas`.`PORCEN_IVAN_FACTURA` AS `PORCEN_IVAN_FACTURA`,`fza_facturas`.`TOTAL_IVAN_FACTURA` AS `TOTAL_IVAN_FACTURA`,`fza_facturas`.`PORCEN_REN_FACTURA` AS `PORCEN_REN_FACTURA`,`fza_facturas`.`TOTAL_REN_FACTURA` AS `TOTAL_REN_FACTURA`,`fza_facturas`.`TOTAL_BASEI_IVAN_FACTURA` AS `TOTAL_BASEI_IVAN_FACTURA`,`fza_facturas`.`PORCEN_IVAR_FACTURA` AS `PORCEN_IVAR_FACTURA`,`fza_facturas`.`TOTAL_IVAR_FACTURA` AS `TOTAL_IVAR_FACTURA`,`fza_facturas`.`PORCEN_RER_FACTURA` AS `PORCEN_RER_FACTURA`,`fza_facturas`.`TOTAL_RER_FACTURA` AS `TOTAL_RER_FACTURA`,`fza_facturas`.`TOTAL_BASEI_IVAR_FACTURA` AS `TOTAL_BASEI_IVAR_FACTURA`,`fza_facturas`.`PORCEN_IVAS_FACTURA` AS `PORCEN_IVAS_FACTURA`,`fza_facturas`.`TOTAL_IVAS_FACTURA` AS `TOTAL_IVAS_FACTURA`,`fza_facturas`.`PORCEN_RES_FACTURA` AS `PORCEN_RES_FACTURA`,`fza_facturas`.`TOTAL_RES_FACTURA` AS `TOTAL_RES_FACTURA`,`fza_facturas`.`TOTAL_BASEI_IVAS_FACTURA` AS `TOTAL_BASEI_IVAS_FACTURA`,`fza_facturas`.`PORCEN_IVAE_FACTURA` AS `PORCEN_IVAE_FACTURA`,`fza_facturas`.`TOTAL_IVAE_FACTURA` AS `TOTAL_IVAE_FACTURA`,`fza_facturas`.`PORCEN_REE_FACTURA` AS `PORCEN_REE_FACTURA`,`fza_facturas`.`TOTAL_REE_FACTURA` AS `TOTAL_REE_FACTURA`,`fza_facturas`.`TOTAL_BASEI_IVAE_FACTURA` AS `TOTAL_BASEI_IVAE_FACTURA` from (`fza_facturas` left join `fza_formapago` on(`fza_facturas`.`FORMA_PAGO_FACTURA` = `fza_formapago`.`CODIGO_FORMAPAGO`));

DROP VIEW IF EXISTS `vi_fac_lin_busquedas`;
CREATE ALGORITHM=UNDEFINED  SQL SECURITY DEFINER VIEW `vi_fac_lin_busquedas` AS select `fza_facturas_lineas`.`NRO_FACTURA_LINEA` AS `NRO_FACTURA_LINEA`,`fza_facturas_lineas`.`SERIE_FACTURA_LINEA` AS `SERIE_FACTURA_LINEA`,`fza_facturas_lineas`.`LINEA_FACTURA_LINEA` AS `LINEA_FACTURA_LINEA`,`fza_facturas_lineas`.`CODIGO_ARTICULO_FACTURA_LINEA` AS `CODIGO_ARTICULO_FACTURA_LINEA`,`fza_facturas_lineas`.`CODIGO_FAMILIA_FACTURA_LINEA` AS `CODIGO_FAMILIA_FACTURA_LINEA`,`fza_facturas_lineas`.`NOMBRE_FAMILIA_FACTURA_LINEA` AS `NOMBRE_FAMILIA_FACTURA_LINEA`,`fza_facturas_lineas`.`FECHA_ENTREGA_FACTURA_LINEA` AS `FECHA_ENTREGA_FACTURA_LINEA`,`fza_facturas_lineas`.`TIPO_CANTIDAD_ARTICULO_FACTURA_LINEA` AS `TIPO_CANTIDAD_ARTICULO_FACTURA_LINEA`,`fza_facturas_lineas`.`ESIMP_INCL_TARIFA_FACTURA_LINEA` AS `ESIMP_INCL_TARIFA_FACTURA_LINEA`,`fza_facturas_lineas`.`TIPOIVA_ARTICULO_FACTURA_LINEA` AS `TIPOIVA_ARTICULO_FACTURA_LINEA`,`fza_ivas_tipos`.`NOMBRE_TIPO_IVA` AS `NOMBRE_TIPO_IVA`,`fza_facturas_lineas`.`DESCRIPCION_ARTICULO_FACTURA_LINEA` AS `DESCRIPCION_ARTICULO_FACTURA_LINEA`,`fza_facturas_lineas`.`CODIGO_TARIFA_FACTURA_LINEA` AS `CODIGO_TARIFA_FACTURA_LINEA`,`fza_facturas_lineas`.`CANTIDAD_FACTURA_LINEA` AS `CANTIDAD_FACTURA_LINEA`,`fza_facturas_lineas`.`PRECIOVENTA_SIVA_ARTICULO_FACTURA_LINEA` AS `PRECIOVENTA_SIVA_ARTICULO_FACTURA_LINEA`,`fza_facturas_lineas`.`PORCEN_IVA_FACTURA_LINEA` AS `PORCEN_IVA_FACTURA_LINEA`,`fza_facturas_lineas`.`PRECIOVENTA_CIVA_ARTICULO_FACTURA_LINEA` AS `PRECIOVENTA_CIVA_ARTICULO_FACTURA_LINEA`,`fza_facturas_lineas`.`TOTAL_FACTURA_LINEA` AS `TOTAL_FACTURA_LINEA`,`fza_facturas`.`CODIGO_CLIENTE_FACTURA` AS `CODIGO_CLIENTE_FACTURA_LINEA`,`fza_facturas`.`CODIGO_EMPRESA_FACTURA` AS `CODIGO_EMPRESA_FACTURA_LINEA` from ((`fza_facturas_lineas` left join `fza_facturas` on(`fza_facturas_lineas`.`NRO_FACTURA_LINEA` = `fza_facturas`.`NRO_FACTURA` and `fza_facturas_lineas`.`SERIE_FACTURA_LINEA` = `fza_facturas`.`SERIE_FACTURA`)) left join `fza_ivas_tipos` on(`fza_facturas_lineas`.`TIPOIVA_ARTICULO_FACTURA_LINEA` = `fza_ivas_tipos`.`CODIGO_ABREVIATURA_TIPO_IVA`));

DROP VIEW IF EXISTS `vi_facturas`;
CREATE ALGORITHM=UNDEFINED  SQL SECURITY DEFINER VIEW `vi_facturas` AS select `fza_facturas`.`FECHA_FACTURA` AS `FECHA_FACTURA`,`fza_facturas`.`NRO_FACTURA` AS `NRO_FACTURA`,`fza_facturas`.`SERIE_FACTURA` AS `SERIE_FACTURA`,`fza_facturas`.`TOTAL_LIQUIDO_FACTURA` AS `TOTAL_LIQUIDO_FACTURA`,`fza_facturas`.`PORCEN_RETENCION_FACTURA` AS `PORCEN_RETENCION_FACTURA`,`fza_facturas`.`TOTAL_RETENCION_FACTURA` AS `TOTAL_RETENCION_FACTURA`,`fza_facturas`.`TOTAL_IMPUESTOS_FACTURA` AS `TOTAL_IMPUESTOS_FACTURA`,`fza_facturas`.`TOTAL_BASES_FACTURA` AS `TOTAL_BASES_FACTURA`,`fza_facturas`.`FORMA_PAGO_FACTURA` AS `FORMA_PAGO_FACTURA`,`fza_facturas`.`CODIGO_EMPRESA_FACTURA` AS `CODIGO_EMPRESA_FACTURA`,`fza_facturas`.`RAZONSOCIAL_EMPRESA_FACTURA` AS `RAZONSOCIAL_EMPRESA_FACTURA`,`fza_facturas`.`NIF_EMPRESA_FACTURA` AS `NIF_EMPRESA_FACTURA`,`fza_facturas`.`MOVIL_EMPRESA_FACTURA` AS `MOVIL_EMPRESA_FACTURA`,`fza_facturas`.`EMAIL_EMPRESA_FACTURA` AS `EMAIL_EMPRESA_FACTURA`,`fza_facturas`.`DIRECCION1_EMPRESA_FACTURA` AS `DIRECCION1_EMPRESA_FACTURA`,`fza_facturas`.`DIRECCION2_EMPRESA_FACTURA` AS `DIRECCION2_EMPRESA_FACTURA`,`fza_facturas`.`POBLACION_EMPRESA_FACTURA` AS `POBLACION_EMPRESA_FACTURA`,`fza_facturas`.`PROVINCIA_EMPRESA_FACTURA` AS `PROVINCIA_EMPRESA_FACTURA`,`fza_facturas`.`PAIS_EMPRESA_FACTURA` AS `PAIS_EMPRESA_FACTURA`,`fza_facturas`.`CPOSTAL_EMPRESA_FACTURA` AS `CPOSTAL_EMPRESA_FACTURA`,`fza_facturas`.`ESRETENCIONES_EMPRESA_FACTURA` AS `ESRETENCIONES_EMPRESA_FACTURA`,`fza_facturas`.`GRUPO_ZONA_IVA_EMPRESA_FACTURA` AS `GRUPO_ZONA_IVA_EMPRESA_FACTURA`,`fza_facturas`.`ESREGIMENESPECIALAGRICOLA_EMPRESA_FACTURA` AS `ESREGIMENESPECIALAGRICOLA_EMPRESA_FACTURA`,`fza_facturas`.`CODIGO_CLIENTE_FACTURA` AS `CODIGO_CLIENTE_FACTURA`,`fza_facturas`.`RAZONSOCIAL_CLIENTE_FACTURA` AS `RAZONSOCIAL_CLIENTE_FACTURA`,`fza_facturas`.`NIF_CLIENTE_FACTURA` AS `NIF_CLIENTE_FACTURA`,`fza_facturas`.`MOVIL_CLIENTE_FACTURA` AS `MOVIL_CLIENTE_FACTURA`,`fza_facturas`.`EMAIL_CLIENTE_FACTURA` AS `EMAIL_CLIENTE_FACTURA`,`fza_facturas`.`DIRECCION1_CLIENTE_FACTURA` AS `DIRECCION1_CLIENTE_FACTURA`,`fza_facturas`.`DIRECCION2_CLIENTE_FACTURA` AS `DIRECCION2_CLIENTE_FACTURA`,`fza_facturas`.`POBLACION_CLIENTE_FACTURA` AS `POBLACION_CLIENTE_FACTURA`,`fza_facturas`.`PROVINCIA_CLIENTE_FACTURA` AS `PROVINCIA_CLIENTE_FACTURA`,`fza_facturas`.`CPOSTAL_CLIENTE_FACTURA` AS `CPOSTAL_CLIENTE_FACTURA`,`fza_facturas`.`PAIS_CLIENTE_FACTURA` AS `PAIS_CLIENTE_FACTURA`,`fza_facturas`.`ESIVA_RECARGO_CLIENTE_FACTURA` AS `ESIVA_RECARGO_CLIENTE_FACTURA`,`fza_facturas`.`ESIVA_EXENTO_CLIENTE_FACTURA` AS `ESIVA_EXENTO_CLIENTE_FACTURA`,`fza_facturas`.`ESREGIMENESPECIALAGRICOLA_CLIENTE_FACTURA` AS `ESREGIMENESPECIALAGRICOLA_CLIENTE_FACTURA`,`fza_facturas`.`ESRETENCIONES_CLIENTE_FACTURA` AS `ESRETENCIONES_CLIENTE_FACTURA`,`fza_facturas`.`TARIFA_ARTICULO_CLIENTE_FACTURA` AS `TARIFA_ARTICULO_CLIENTE_FACTURA`,`fza_facturas`.`ESIMP_INCL_TARIFA_CLIENTE_FACTURA` AS `ESIMP_INCL_TARIFA_CLIENTE_FACTURA`,`fza_facturas`.`ESINTRACOMUNITARIO_CLIENTE_FACTURA` AS `ESINTRACOMUNITARIO_CLIENTE_FACTURA`,`fza_facturas`.`ESIRPF_IMP_INCL_ZONA_IVA_FACTURA` AS `ESIRPF_IMP_INCL_ZONA_IVA_FACTURA`,`fza_facturas`.`ESAPLICA_RE_ZONA_IVA_FACTURA` AS `ESAPLICA_RE_ZONA_IVA_FACTURA`,`fza_facturas`.`ESIVAAGRICOLA_ZONA_IVA_FACTURA` AS `ESIVAAGRICOLA_ZONA_IVA_FACTURA`,`fza_facturas`.`PALABRA_REPORTS_ZONA_IVA_FACTURA` AS `PALABRA_REPORTS_ZONA_IVA_FACTURA`,`fza_facturas`.`CODIGO_IVA_FACTURA` AS `CODIGO_IVA_FACTURA`,`fza_facturas`.`ESVENTA_ACTIVO_FIJO_FACTURA` AS `ESVENTA_ACTIVO_FIJO_FACTURA`,`fza_facturas`.`PORCEN_IVAN_FACTURA` AS `PORCEN_IVAN_FACTURA`,`fza_facturas`.`TOTAL_IVAN_FACTURA` AS `TOTAL_IVAN_FACTURA`,`fza_facturas`.`PORCEN_REN_FACTURA` AS `PORCEN_REN_FACTURA`,`fza_facturas`.`TOTAL_REN_FACTURA` AS `TOTAL_REN_FACTURA`,`fza_facturas`.`TOTAL_BASEI_IVAN_FACTURA` AS `TOTAL_BASEI_IVAN_FACTURA`,`fza_facturas`.`PORCEN_IVAR_FACTURA` AS `PORCEN_IVAR_FACTURA`,`fza_facturas`.`TOTAL_IVAR_FACTURA` AS `TOTAL_IVAR_FACTURA`,`fza_facturas`.`PORCEN_RER_FACTURA` AS `PORCEN_RER_FACTURA`,`fza_facturas`.`TOTAL_RER_FACTURA` AS `TOTAL_RER_FACTURA`,`fza_facturas`.`TOTAL_BASEI_IVAR_FACTURA` AS `TOTAL_BASEI_IVAR_FACTURA`,`fza_facturas`.`PORCEN_IVAS_FACTURA` AS `PORCEN_IVAS_FACTURA`,`fza_facturas`.`TOTAL_IVAS_FACTURA` AS `TOTAL_IVAS_FACTURA`,`fza_facturas`.`PORCEN_RES_FACTURA` AS `PORCEN_RES_FACTURA`,`fza_facturas`.`TOTAL_RES_FACTURA` AS `TOTAL_RES_FACTURA`,`fza_facturas`.`TOTAL_BASEI_IVAS_FACTURA` AS `TOTAL_BASEI_IVAS_FACTURA`,`fza_facturas`.`PORCEN_IVAE_FACTURA` AS `PORCEN_IVAE_FACTURA`,`fza_facturas`.`TOTAL_IVAE_FACTURA` AS `TOTAL_IVAE_FACTURA`,`fza_facturas`.`PORCEN_REE_FACTURA` AS `PORCEN_REE_FACTURA`,`fza_facturas`.`TOTAL_REE_FACTURA` AS `TOTAL_REE_FACTURA`,`fza_facturas`.`TOTAL_BASEI_IVAE_FACTURA` AS `TOTAL_BASEI_IVAE_FACTURA`,`fza_facturas`.`NRO_FACTURA_ABONO_FACTURA` AS `NRO_FACTURA_ABONO_FACTURA`,`fza_facturas`.`SERIE_FACTURA_ABONO_FACTURA` AS `SERIE_FACTURA_ABONO_FACTURA`,`fza_facturas`.`TEXTO_LEGAL_FACTURA_CLIENTE_FACTURA` AS `TEXTO_LEGAL_FACTURA_CLIENTE_FACTURA`,`fza_facturas`.`TEXTO_LEGAL_FACTURA_EMPRESA_FACTURA` AS `TEXTO_LEGAL_FACTURA_EMPRESA_FACTURA`,`fza_facturas`.`DOCUMENTO_FACTURA` AS `DOCUMENTO_FACTURA`,`fza_facturas`.`COMENTARIOS_FACTURA` AS `COMENTARIOS_FACTURA`,`fza_facturas`.`CONTADOR_LINEAS_FACTURA` AS `CONTADOR_LINEAS_FACTURA`,`fza_facturas`.`ESCREARARTICULOS_FACTURA` AS `ESCREARARTICULOS_FACTURA`,`fza_facturas`.`ESDESCRIPCIONES_AMP_FACTURA` AS `ESDESCRIPCIONES_AMP_FACTURA`,`fza_facturas`.`ESFECHADEENTREGA_FACTURA` AS `ESFECHADEENTREGA_FACTURA`,`fza_facturas`.`INSTANTEMODIF` AS `INSTANTEMODIF`,`fza_facturas`.`INSTANTEALTA` AS `INSTANTEALTA`,`fza_facturas`.`USUARIOALTA` AS `USUARIOALTA`,`fza_facturas`.`USUARIOMODIF` AS `USUARIOMODIF`,`fza_formapago`.`DESCRIPCION_FORMAPAGO` AS `DESCRIPCION_FORMAPAGO` from (`fza_facturas` left join `fza_formapago` on(`fza_facturas`.`FORMA_PAGO_FACTURA` = `fza_formapago`.`CODIGO_FORMAPAGO`)) order by `fza_facturas`.`FECHA_FACTURA` desc;

DROP VIEW IF EXISTS `vi_facturas_lineas`;
CREATE ALGORITHM=UNDEFINED  SQL SECURITY DEFINER VIEW `vi_facturas_lineas` AS select `fza_facturas_lineas`.`NRO_FACTURA_LINEA` AS `NRO_FACTURA_LINEA`,`fza_facturas_lineas`.`SERIE_FACTURA_LINEA` AS `SERIE_FACTURA_LINEA`,`fza_facturas_lineas`.`LINEA_FACTURA_LINEA` AS `LINEA_FACTURA_LINEA`,`fza_facturas_lineas`.`CODIGO_ARTICULO_FACTURA_LINEA` AS `CODIGO_ARTICULO_FACTURA_LINEA`,`fza_facturas_lineas`.`CODIGO_FAMILIA_FACTURA_LINEA` AS `CODIGO_FAMILIA_FACTURA_LINEA`,`fza_facturas_lineas`.`NOMBRE_FAMILIA_FACTURA_LINEA` AS `NOMBRE_FAMILIA_FACTURA_LINEA`,`fza_facturas_lineas`.`FECHA_ENTREGA_FACTURA_LINEA` AS `FECHA_ENTREGA_FACTURA_LINEA`,`fza_facturas_lineas`.`TIPO_CANTIDAD_ARTICULO_FACTURA_LINEA` AS `TIPO_CANTIDAD_ARTICULO_FACTURA_LINEA`,`fza_facturas_lineas`.`ESIMP_INCL_TARIFA_FACTURA_LINEA` AS `ESIMP_INCL_TARIFA_FACTURA_LINEA`,`fza_facturas_lineas`.`TIPOIVA_ARTICULO_FACTURA_LINEA` AS `TIPOIVA_ARTICULO_FACTURA_LINEA`,`fza_facturas_lineas`.`DESCRIPCION_ARTICULO_FACTURA_LINEA` AS `DESCRIPCION_ARTICULO_FACTURA_LINEA`,`fza_facturas_lineas`.`CODIGO_TARIFA_FACTURA_LINEA` AS `CODIGO_TARIFA_FACTURA_LINEA`,`fza_facturas_lineas`.`CANTIDAD_FACTURA_LINEA` AS `CANTIDAD_FACTURA_LINEA`,`fza_facturas_lineas`.`PRECIOSALIDA_FACTURA_LINEA` AS `PRECIOSALIDA_FACTURA_LINEA`,`fza_facturas_lineas`.`PORCEN_DTO_FACTURA_LINEA` AS `PORCEN_DTO_FACTURA_LINEA`,`fza_facturas_lineas`.`PRECIO_DTO_FACTURA_LINEA` AS `PRECIO_DTO_FACTURA_LINEA`,`fza_facturas_lineas`.`PRECIOVENTA_SIVA_ARTICULO_FACTURA_LINEA` AS `PRECIOVENTA_SIVA_ARTICULO_FACTURA_LINEA`,`fza_facturas_lineas`.`PORCEN_IVA_FACTURA_LINEA` AS `PORCEN_IVA_FACTURA_LINEA`,`fza_facturas_lineas`.`PRECIOVENTA_CIVA_ARTICULO_FACTURA_LINEA` AS `PRECIOVENTA_CIVA_ARTICULO_FACTURA_LINEA`,`fza_facturas_lineas`.`TOTAL_FACTURA_LINEA` AS `TOTAL_FACTURA_LINEA`,`fza_facturas_lineas`.`INSTANTEMODIF` AS `INSTANTEMODIF`,`fza_facturas_lineas`.`INSTANTEALTA` AS `INSTANTEALTA`,`fza_facturas_lineas`.`USUARIOALTA` AS `USUARIOALTA`,`fza_facturas_lineas`.`USUARIOMODIF` AS `USUARIOMODIF` from `fza_facturas_lineas`;

DROP VIEW IF EXISTS `vi_facturas_lineas_print`;
CREATE ALGORITHM=UNDEFINED  SQL SECURITY DEFINER VIEW `vi_facturas_lineas_print` AS select `fza_facturas_lineas`.`NRO_FACTURA_LINEA` AS `NRO_FACTURA_LINEA`,`fza_facturas_lineas`.`SERIE_FACTURA_LINEA` AS `SERIE_FACTURA_LINEA`,`fza_facturas_lineas`.`LINEA_FACTURA_LINEA` AS `LINEA_FACTURA_LINEA`,`fza_facturas_lineas`.`CODIGO_ARTICULO_FACTURA_LINEA` AS `CODIGO_ARTICULO_FACTURA_LINEA`,`fza_facturas_lineas`.`CODIGO_FAMILIA_FACTURA_LINEA` AS `CODIGO_FAMILIA_FACTURA_LINEA`,`fza_facturas_lineas`.`NOMBRE_FAMILIA_FACTURA_LINEA` AS `NOMBRE_FAMILIA_FACTURA_LINEA`,`fza_facturas_lineas`.`FECHA_ENTREGA_FACTURA_LINEA` AS `FECHA_ENTREGA_FACTURA_LINEA`,`fza_facturas_lineas`.`TIPO_CANTIDAD_ARTICULO_FACTURA_LINEA` AS `TIPO_CANTIDAD_ARTICULO_FACTURA_LINEA`,`fza_facturas_lineas`.`ESIMP_INCL_TARIFA_FACTURA_LINEA` AS `ESIMP_INCL_TARIFA_FACTURA_LINEA`,`fza_facturas_lineas`.`TIPOIVA_ARTICULO_FACTURA_LINEA` AS `TIPOIVA_ARTICULO_FACTURA_LINEA`,`fza_facturas_lineas`.`DESCRIPCION_ARTICULO_FACTURA_LINEA` AS `DESCRIPCION_ARTICULO_FACTURA_LINEA`,`fza_facturas_lineas`.`CODIGO_TARIFA_FACTURA_LINEA` AS `CODIGO_TARIFA_FACTURA_LINEA`,`fza_facturas_lineas`.`CANTIDAD_FACTURA_LINEA` AS `CANTIDAD_FACTURA_LINEA`,`fza_facturas_lineas`.`PRECIOSALIDA_FACTURA_LINEA` AS `PRECIOSALIDA_FACTURA_LINEA`,`fza_facturas_lineas`.`PORCEN_DTO_FACTURA_LINEA` AS `PORCEN_DTO_FACTURA_LINEA`,`fza_facturas_lineas`.`PRECIO_DTO_FACTURA_LINEA` AS `PRECIO_DTO_FACTURA_LINEA`,`fza_facturas_lineas`.`PRECIOVENTA_SIVA_ARTICULO_FACTURA_LINEA` AS `PRECIOVENTA_SIVA_ARTICULO_FACTURA_LINEA`,`fza_facturas_lineas`.`PORCEN_IVA_FACTURA_LINEA` AS `PORCEN_IVA_FACTURA_LINEA`,`fza_facturas_lineas`.`PRECIOVENTA_CIVA_ARTICULO_FACTURA_LINEA` AS `PRECIOVENTA_CIVA_ARTICULO_FACTURA_LINEA`,`fza_facturas_lineas`.`TOTAL_FACTURA_LINEA` AS `TOTAL_FACTURA_LINEA`,`fza_facturas_lineas`.`INSTANTEMODIF` AS `INSTANTEMODIF`,`fza_facturas_lineas`.`INSTANTEALTA` AS `INSTANTEALTA`,`fza_facturas_lineas`.`USUARIOALTA` AS `USUARIOALTA`,`fza_facturas_lineas`.`USUARIOMODIF` AS `USUARIOMODIF` from `fza_facturas_lineas`;

DROP VIEW IF EXISTS `vi_facturas_print`;
CREATE ALGORITHM=UNDEFINED  SQL SECURITY DEFINER VIEW `vi_facturas_print` AS select `fza_facturas`.`FECHA_FACTURA` AS `FECHA_FACTURA`,`fza_facturas`.`NRO_FACTURA` AS `NRO_FACTURA`,`fza_facturas`.`SERIE_FACTURA` AS `SERIE_FACTURA`,`fza_facturas`.`TOTAL_LIQUIDO_FACTURA` AS `TOTAL_LIQUIDO_FACTURA`,`fza_facturas`.`PORCEN_RETENCION_FACTURA` AS `PORCEN_RETENCION_FACTURA`,`fza_facturas`.`TOTAL_RETENCION_FACTURA` AS `TOTAL_RETENCION_FACTURA`,`fza_facturas`.`TOTAL_IMPUESTOS_FACTURA` AS `TOTAL_IMPUESTOS_FACTURA`,`fza_facturas`.`TOTAL_BASES_FACTURA` AS `TOTAL_BASES_FACTURA`,`fza_facturas`.`FORMA_PAGO_FACTURA` AS `FORMA_PAGO_FACTURA`,`fza_facturas`.`CODIGO_EMPRESA_FACTURA` AS `CODIGO_EMPRESA_FACTURA`,`fza_facturas`.`RAZONSOCIAL_EMPRESA_FACTURA` AS `RAZONSOCIAL_EMPRESA_FACTURA`,`fza_facturas`.`NIF_EMPRESA_FACTURA` AS `NIF_EMPRESA_FACTURA`,`fza_facturas`.`MOVIL_EMPRESA_FACTURA` AS `MOVIL_EMPRESA_FACTURA`,`fza_facturas`.`EMAIL_EMPRESA_FACTURA` AS `EMAIL_EMPRESA_FACTURA`,`fza_facturas`.`DIRECCION1_EMPRESA_FACTURA` AS `DIRECCION1_EMPRESA_FACTURA`,`fza_facturas`.`DIRECCION2_EMPRESA_FACTURA` AS `DIRECCION2_EMPRESA_FACTURA`,`fza_facturas`.`POBLACION_EMPRESA_FACTURA` AS `POBLACION_EMPRESA_FACTURA`,`fza_facturas`.`PROVINCIA_EMPRESA_FACTURA` AS `PROVINCIA_EMPRESA_FACTURA`,`fza_facturas`.`PAIS_EMPRESA_FACTURA` AS `PAIS_EMPRESA_FACTURA`,`fza_facturas`.`CPOSTAL_EMPRESA_FACTURA` AS `CPOSTAL_EMPRESA_FACTURA`,`fza_facturas`.`ESRETENCIONES_EMPRESA_FACTURA` AS `ESRETENCIONES_EMPRESA_FACTURA`,`fza_facturas`.`GRUPO_ZONA_IVA_EMPRESA_FACTURA` AS `GRUPO_ZONA_IVA_EMPRESA_FACTURA`,`fza_facturas`.`ESREGIMENESPECIALAGRICOLA_EMPRESA_FACTURA` AS `ESREGIMENESPECIALAGRICOLA_EMPRESA_FACTURA`,`fza_facturas`.`CODIGO_CLIENTE_FACTURA` AS `CODIGO_CLIENTE_FACTURA`,`fza_facturas`.`RAZONSOCIAL_CLIENTE_FACTURA` AS `RAZONSOCIAL_CLIENTE_FACTURA`,`fza_facturas`.`NIF_CLIENTE_FACTURA` AS `NIF_CLIENTE_FACTURA`,`fza_facturas`.`MOVIL_CLIENTE_FACTURA` AS `MOVIL_CLIENTE_FACTURA`,`fza_facturas`.`EMAIL_CLIENTE_FACTURA` AS `EMAIL_CLIENTE_FACTURA`,`fza_facturas`.`DIRECCION1_CLIENTE_FACTURA` AS `DIRECCION1_CLIENTE_FACTURA`,`fza_facturas`.`DIRECCION2_CLIENTE_FACTURA` AS `DIRECCION2_CLIENTE_FACTURA`,`fza_facturas`.`POBLACION_CLIENTE_FACTURA` AS `POBLACION_CLIENTE_FACTURA`,`fza_facturas`.`PROVINCIA_CLIENTE_FACTURA` AS `PROVINCIA_CLIENTE_FACTURA`,`fza_facturas`.`CPOSTAL_CLIENTE_FACTURA` AS `CPOSTAL_CLIENTE_FACTURA`,`fza_facturas`.`PAIS_CLIENTE_FACTURA` AS `PAIS_CLIENTE_FACTURA`,`fza_facturas`.`ESIVA_RECARGO_CLIENTE_FACTURA` AS `ESIVA_RECARGO_CLIENTE_FACTURA`,`fza_facturas`.`ESIVA_EXENTO_CLIENTE_FACTURA` AS `ESIVA_EXENTO_CLIENTE_FACTURA`,`fza_facturas`.`ESREGIMENESPECIALAGRICOLA_CLIENTE_FACTURA` AS `ESREGIMENESPECIALAGRICOLA_CLIENTE_FACTURA`,`fza_facturas`.`ESRETENCIONES_CLIENTE_FACTURA` AS `ESRETENCIONES_CLIENTE_FACTURA`,`fza_facturas`.`TARIFA_ARTICULO_CLIENTE_FACTURA` AS `TARIFA_ARTICULO_CLIENTE_FACTURA`,`fza_facturas`.`ESIMP_INCL_TARIFA_CLIENTE_FACTURA` AS `ESIMP_INCL_TARIFA_CLIENTE_FACTURA`,`fza_facturas`.`ESINTRACOMUNITARIO_CLIENTE_FACTURA` AS `ESINTRACOMUNITARIO_CLIENTE_FACTURA`,`fza_facturas`.`ESIRPF_IMP_INCL_ZONA_IVA_FACTURA` AS `ESIRPF_IMP_INCL_ZONA_IVA_FACTURA`,`fza_facturas`.`ESAPLICA_RE_ZONA_IVA_FACTURA` AS `ESAPLICA_RE_ZONA_IVA_FACTURA`,`fza_facturas`.`ESIVAAGRICOLA_ZONA_IVA_FACTURA` AS `ESIVAAGRICOLA_ZONA_IVA_FACTURA`,`fza_facturas`.`PALABRA_REPORTS_ZONA_IVA_FACTURA` AS `PALABRA_REPORTS_ZONA_IVA_FACTURA`,`fza_facturas`.`CODIGO_IVA_FACTURA` AS `CODIGO_IVA_FACTURA`,`fza_facturas`.`ESVENTA_ACTIVO_FIJO_FACTURA` AS `ESVENTA_ACTIVO_FIJO_FACTURA`,`fza_facturas`.`PORCEN_IVAN_FACTURA` AS `PORCEN_IVAN_FACTURA`,`fza_facturas`.`TOTAL_IVAN_FACTURA` AS `TOTAL_IVAN_FACTURA`,`fza_facturas`.`PORCEN_REN_FACTURA` AS `PORCEN_REN_FACTURA`,`fza_facturas`.`TOTAL_REN_FACTURA` AS `TOTAL_REN_FACTURA`,`fza_facturas`.`TOTAL_BASEI_IVAN_FACTURA` AS `TOTAL_BASEI_IVAN_FACTURA`,`fza_facturas`.`PORCEN_IVAR_FACTURA` AS `PORCEN_IVAR_FACTURA`,`fza_facturas`.`TOTAL_IVAR_FACTURA` AS `TOTAL_IVAR_FACTURA`,`fza_facturas`.`PORCEN_RER_FACTURA` AS `PORCEN_RER_FACTURA`,`fza_facturas`.`TOTAL_RER_FACTURA` AS `TOTAL_RER_FACTURA`,`fza_facturas`.`TOTAL_BASEI_IVAR_FACTURA` AS `TOTAL_BASEI_IVAR_FACTURA`,`fza_facturas`.`PORCEN_IVAS_FACTURA` AS `PORCEN_IVAS_FACTURA`,`fza_facturas`.`TOTAL_IVAS_FACTURA` AS `TOTAL_IVAS_FACTURA`,`fza_facturas`.`PORCEN_RES_FACTURA` AS `PORCEN_RES_FACTURA`,`fza_facturas`.`TOTAL_RES_FACTURA` AS `TOTAL_RES_FACTURA`,`fza_facturas`.`TOTAL_BASEI_IVAS_FACTURA` AS `TOTAL_BASEI_IVAS_FACTURA`,`fza_facturas`.`PORCEN_IVAE_FACTURA` AS `PORCEN_IVAE_FACTURA`,`fza_facturas`.`TOTAL_IVAE_FACTURA` AS `TOTAL_IVAE_FACTURA`,`fza_facturas`.`PORCEN_REE_FACTURA` AS `PORCEN_REE_FACTURA`,`fza_facturas`.`TOTAL_REE_FACTURA` AS `TOTAL_REE_FACTURA`,`fza_facturas`.`TOTAL_BASEI_IVAE_FACTURA` AS `TOTAL_BASEI_IVAE_FACTURA`,`fza_facturas`.`NRO_FACTURA_ABONO_FACTURA` AS `NRO_FACTURA_ABONO_FACTURA`,`fza_facturas`.`SERIE_FACTURA_ABONO_FACTURA` AS `SERIE_FACTURA_ABONO_FACTURA`,`fza_facturas`.`TEXTO_LEGAL_FACTURA_CLIENTE_FACTURA` AS `TEXTO_LEGAL_FACTURA_CLIENTE_FACTURA`,`fza_facturas`.`TEXTO_LEGAL_FACTURA_EMPRESA_FACTURA` AS `TEXTO_LEGAL_FACTURA_EMPRESA_FACTURA`,`fza_facturas`.`DOCUMENTO_FACTURA` AS `DOCUMENTO_FACTURA`,`fza_facturas`.`COMENTARIOS_FACTURA` AS `COMENTARIOS_FACTURA`,`fza_facturas`.`CONTADOR_LINEAS_FACTURA` AS `CONTADOR_LINEAS_FACTURA`,`fza_facturas`.`ESCREARARTICULOS_FACTURA` AS `ESCREARARTICULOS_FACTURA`,`fza_facturas`.`ESDESCRIPCIONES_AMP_FACTURA` AS `ESDESCRIPCIONES_AMP_FACTURA`,`fza_facturas`.`ESFECHADEENTREGA_FACTURA` AS `ESFECHADEENTREGA_FACTURA`,`fza_facturas`.`INSTANTEMODIF` AS `INSTANTEMODIF`,`fza_facturas`.`INSTANTEALTA` AS `INSTANTEALTA`,`fza_facturas`.`USUARIOALTA` AS `USUARIOALTA`,`fza_facturas`.`USUARIOMODIF` AS `USUARIOMODIF`,`fza_formapago`.`DESCRIPCION_FORMAPAGO` AS `DESCRIPCION_FORMAPAGO`,`fza_formapago`.`ESCONTADO_FORMAPAGO` AS `ESCONTADO_FORMAPAGO`,(select group_concat(' ',date_format(`fza_recibos`.`FECHA_VENCIMIENTO_RECIBO`,'%d/%m/%Y'),'=> ',format(`fza_recibos`.`EUROS_RECIBO`,2),'€' separator ',') from `fza_recibos` where `fza_recibos`.`NRO_FACTURA_RECIBO` = `fza_facturas`.`NRO_FACTURA` and `fza_recibos`.`SERIE_FACTURA_RECIBO` = `fza_facturas`.`SERIE_FACTURA`) AS `VENCIMIENTOS_RECIBOS`,`fza_empresas`.`IBAN_EMPRESA` AS `IBAN_EMPRESA`,`fza_clientes`.`IBAN_CLIENTE` AS `IBAN_CLIENTE`,`fza_formapago`.`ESVERBANCOEMPRESA_FORMAPAGO` AS `ESVERBANCOEMPRESA_FORMAPAGO` from (((`fza_facturas` left join `fza_formapago` on(`fza_facturas`.`FORMA_PAGO_FACTURA` = `fza_formapago`.`CODIGO_FORMAPAGO`)) left join `fza_empresas` on(`fza_facturas`.`CODIGO_EMPRESA_FACTURA` = `fza_empresas`.`CODIGO_EMPRESA`)) left join `fza_clientes` on(`fza_facturas`.`CODIGO_CLIENTE_FACTURA` = `fza_clientes`.`CODIGO_CLIENTE`)) order by `fza_facturas`.`FECHA_FACTURA` desc;

DROP VIEW IF EXISTS `vi_formapago`;
CREATE ALGORITHM=UNDEFINED  SQL SECURITY DEFINER VIEW `vi_formapago` AS select `fza_formapago`.`CODIGO_FORMAPAGO` AS `CODIGO_FORMAPAGO`,`fza_formapago`.`ACTIVO_FORMAPAGO` AS `ACTIVO_FORMAPAGO`,`fza_formapago`.`ORDEN_FORMAPAGO` AS `ORDEN_FORMAPAGO`,`fza_formapago`.`DESCRIPCION_FORMAPAGO` AS `DESCRIPCION_FORMAPAGO`,`fza_formapago`.`N_PLAZOS_FORMAPAGO` AS `N_PLAZOS_FORMAPAGO`,`fza_formapago`.`N_DIAS_ENTRE_PLAZOS_FORMAPAGO` AS `N_DIAS_ENTRE_PLAZOS_FORMAPAGO`,`fza_formapago`.`PORCEN_ANTICIPO_FORMAPAGO` AS `PORCEN_ANTICIPO_FORMAPAGO`,`fza_formapago`.`ESVERBANCOEMPRESA_FORMAPAGO` AS `ESVERBANCOEMPRESA_FORMAPAGO`,`fza_formapago`.`ESDEFAULT_FORMAPAGO` AS `ESDEFAULT_FORMAPAGO`,`fza_formapago`.`INSTANTEMODIF` AS `INSTANTEMODIF`,`fza_formapago`.`INSTANTEALTA` AS `INSTANTEALTA`,`fza_formapago`.`USUARIOALTA` AS `USUARIOALTA`,`fza_formapago`.`USUARIOMODIF` AS `USUARIOMODIF` from `fza_formapago`;

DROP VIEW IF EXISTS `vi_ivas`;
CREATE ALGORITHM=UNDEFINED  SQL SECURITY DEFINER VIEW `vi_ivas` AS select `fza_ivas`.`CODIGO_IVA` AS `CODIGO_IVA`,`fza_ivas`.`GRUPO_ZONA_IVA` AS `GRUPO_ZONA_IVA`,`fza_ivas`.`DESCRIPCION_ZONA_IVA` AS `DESCRIPCION_ZONA_IVA`,`fza_ivas`.`PORCENEXENTO_IVA` AS `PORCENEXENTO_IVA`,`fza_ivas`.`PORCENEXENTO_RE_IVA` AS `PORCENEXENTO_RE_IVA`,`fza_ivas`.`PORCENNORMAL_IVA` AS `PORCENNORMAL_IVA`,`fza_ivas`.`PORCENNORMAL_RE_IVA` AS `PORCENNORMAL_RE_IVA`,`fza_ivas`.`PORCENREDUCIDO_IVA` AS `PORCENREDUCIDO_IVA`,`fza_ivas`.`PORCENREDUCIDO_RE_IVA` AS `PORCENREDUCIDO_RE_IVA`,`fza_ivas`.`PORCENSUPERREDUCIDO_IVA` AS `PORCENSUPERREDUCIDO_IVA`,`fza_ivas`.`PORCENSUPERREDUCIDO_RE_IVA` AS `PORCENSUPERREDUCIDO_RE_IVA`,`fza_ivas`.`FECHA_DESDE_IVA` AS `FECHA_DESDE_IVA`,`fza_ivas`.`FECHA_HASTA_IVA` AS `FECHA_HASTA_IVA`,`fza_ivas`.`INSTANTEMODIF` AS `INSTANTEMODIF`,`fza_ivas`.`INSTANTEALTA` AS `INSTANTEALTA`,`fza_ivas`.`USUARIOALTA` AS `USUARIOALTA`,`fza_ivas`.`USUARIOMODIF` AS `USUARIOMODIF`,`fza_ivas_grupos`.`ESAPLICA_RE_ZONA_IVA` AS `ESAPLICA_RE_ZONA_IVA`,`fza_ivas_grupos`.`ESIVAAGRICOLA_ZONA_IVA` AS `ESIVAAGRICOLA_ZONA_IVA`,`fza_ivas_grupos`.`ESDEFAULT_ZONA_IVA` AS `ESDEFAULT_ZONA_IVA`,`fza_ivas_grupos`.`ESIRPF_IMP_INCL_ZONA_IVA` AS `ESIRPF_IMP_INCL_ZONA_IVA`,`fza_ivas_grupos`.`PALABRA_REPORTS_ZONA_IVA` AS `PALABRA_REPORTS_ZONA_IVA` from (`fza_ivas` join `fza_ivas_grupos` on(`fza_ivas`.`GRUPO_ZONA_IVA` = `fza_ivas_grupos`.`GRUPO_ZONA_IVA`));

DROP VIEW IF EXISTS `vi_ivas_empresa`;
CREATE ALGORITHM=UNDEFINED  SQL SECURITY DEFINER VIEW `vi_ivas_empresa` AS select `i`.`CODIGO_IVA` AS `CODIGO_IVA`,`i`.`GRUPO_ZONA_IVA` AS `GRUPO_ZONA_IVA`,`i`.`DESCRIPCION_ZONA_IVA` AS `DESCRIPCION_ZONA_IVA`,`i`.`PORCENEXENTO_IVA` AS `PORCENEXENTO_IVA`,`i`.`PORCENEXENTO_RE_IVA` AS `PORCENEXENTO_RE_IVA`,`i`.`PORCENNORMAL_IVA` AS `PORCENNORMAL_IVA`,`i`.`PORCENNORMAL_RE_IVA` AS `PORCENNORMAL_RE_IVA`,`i`.`PORCENREDUCIDO_IVA` AS `PORCENREDUCIDO_IVA`,`i`.`PORCENREDUCIDO_RE_IVA` AS `PORCENREDUCIDO_RE_IVA`,`i`.`PORCENSUPERREDUCIDO_IVA` AS `PORCENSUPERREDUCIDO_IVA`,`i`.`PORCENSUPERREDUCIDO_RE_IVA` AS `PORCENSUPERREDUCIDO_RE_IVA`,`i`.`FECHA_DESDE_IVA` AS `FECHA_DESDE_IVA`,`i`.`FECHA_HASTA_IVA` AS `FECHA_HASTA_IVA`,`ig`.`ESAPLICA_RE_ZONA_IVA` AS `ESAPLICA_RE_ZONA_IVA`,`ig`.`ESIVAAGRICOLA_ZONA_IVA` AS `ESIVAAGRICOLA_ZONA_IVA`,`ig`.`ESDEFAULT_ZONA_IVA` AS `ESDEFAULT_ZONA_IVA`,`em`.`CODIGO_EMPRESA` AS `CODIGO_EMPRESA`,`ig`.`ESIRPF_IMP_INCL_ZONA_IVA` AS `ESIRPF_IMP_INCL_ZONA_IVA`,`ig`.`PALABRA_REPORTS_ZONA_IVA` AS `PALABRA_REPORTS_ZONA_IVA` from ((`fza_ivas` `i` join `fza_ivas_grupos` `ig` on(`i`.`GRUPO_ZONA_IVA` = `ig`.`GRUPO_ZONA_IVA`)) join `fza_empresas` `em` on(`em`.`GRUPO_ZONA_IVA_EMPRESA` = `ig`.`GRUPO_ZONA_IVA`));

DROP VIEW IF EXISTS `vi_ivas_grupos`;
CREATE ALGORITHM=UNDEFINED  SQL SECURITY DEFINER VIEW `vi_ivas_grupos` AS select `fza_ivas_grupos`.`GRUPO_ZONA_IVA` AS `GRUPO_ZONA_IVA`,`fza_ivas_grupos`.`DESCRIPCION_ZONA_IVA` AS `DESCRIPCION_ZONA_IVA`,`fza_ivas_grupos`.`ESIRPF_IMP_INCL_ZONA_IVA` AS `ESIRPF_IMP_INCL_ZONA_IVA`,`fza_ivas_grupos`.`ESIVAAGRICOLA_ZONA_IVA` AS `ESIVAAGRICOLA_ZONA_IVA`,`fza_ivas_grupos`.`ESAPLICA_RE_ZONA_IVA` AS `ESAPLICA_RE_ZONA_IVA`,`fza_ivas_grupos`.`ESDEFAULT_ZONA_IVA` AS `ESDEFAULT_ZONA_IVA`,`fza_ivas_grupos`.`PALABRA_REPORTS_ZONA_IVA` AS `PALABRA_REPORTS_ZONA_IVA`,`fza_ivas_grupos`.`INSTANTEMODIF` AS `INSTANTEMODIF`,`fza_ivas_grupos`.`INSTANTEALTA` AS `INSTANTEALTA`,`fza_ivas_grupos`.`USUARIOALTA` AS `USUARIOALTA`,`fza_ivas_grupos`.`USUARIOMODIF` AS `USUARIOMODIF` from `fza_ivas_grupos`;

DROP VIEW IF EXISTS `vi_ivas_zonas`;
CREATE ALGORITHM=UNDEFINED  SQL SECURITY DEFINER VIEW `vi_ivas_zonas` AS select `fza_ivas_zonas`.`CODIGO_ZONA_IVA` AS `CODIGO_ZONA_IVA`,`fza_ivas_zonas`.`DESCRIPCION_ZONA_IVA` AS `DESCRIPCION_ZONA_IVA`,`fza_ivas_zonas`.`ESDEFAULT_ZONA_IVA` AS `ESDEFAULT_ZONA_IVA` from `fza_ivas_zonas`;

DROP VIEW IF EXISTS `vi_proveedores`;
CREATE ALGORITHM=UNDEFINED  SQL SECURITY DEFINER VIEW `vi_proveedores` AS select `fza_proveedores`.`CODIGO_PROVEEDOR` AS `CODIGO_PROVEEDOR`,`fza_proveedores`.`ACTIVO_PROVEEDOR` AS `ACTIVO_PROVEEDOR`,`fza_proveedores`.`RAZONSOCIAL_PROVEEDOR` AS `RAZONSOCIAL_PROVEEDOR`,`fza_proveedores`.`NIF_PROVEEDOR` AS `NIF_PROVEEDOR`,`fza_proveedores`.`MOVIL_PROVEEDOR` AS `MOVIL_PROVEEDOR`,`fza_proveedores`.`EMAIL_PROVEEDOR` AS `EMAIL_PROVEEDOR`,`fza_proveedores`.`DIRECCION1_PROVEEDOR` AS `DIRECCION1_PROVEEDOR`,`fza_proveedores`.`DIRECCION2_PROVEEDOR` AS `DIRECCION2_PROVEEDOR`,`fza_proveedores`.`POBLACION_PROVEEDOR` AS `POBLACION_PROVEEDOR`,`fza_proveedores`.`PROVINCIA_PROVEEDOR` AS `PROVINCIA_PROVEEDOR`,`fza_proveedores`.`CPOSTAL_PROVEEDOR` AS `CPOSTAL_PROVEEDOR`,`fza_proveedores`.`PAIS_PROVEEDOR` AS `PAIS_PROVEEDOR`,`fza_proveedores`.`OBSERVACIONES_PROVEEDOR` AS `OBSERVACIONES_PROVEEDOR`,`fza_proveedores`.`REFERENCIA_PROVEEDOR` AS `REFERENCIA_PROVEEDOR`,`fza_proveedores`.`CONTACTO_PROVEEDOR` AS `CONTACTO_PROVEEDOR`,`fza_proveedores`.`TELEFONO_CONTACTO_PROVEEDOR` AS `TELEFONO_CONTACTO_PROVEEDOR`,`fza_proveedores`.`TELEFONO_PROVEEDOR` AS `TELEFONO_PROVEEDOR`,`fza_proveedores`.`IBAN_PROVEEDOR` AS `IBAN_PROVEEDOR`,`fza_proveedores`.`INSTANTEMODIF` AS `INSTANTEMODIF`,`fza_proveedores`.`INSTANTEALTA` AS `INSTANTEALTA`,`fza_proveedores`.`USUARIOALTA` AS `USUARIOALTA`,`fza_proveedores`.`USUARIOMODIF` AS `USUARIOMODIF` from `fza_proveedores`;

DROP VIEW IF EXISTS `vi_proveedores_articulos`;
CREATE ALGORITHM=UNDEFINED  SQL SECURITY DEFINER VIEW `vi_proveedores_articulos` AS select `fza_articulos_proveedores`.`CODIGO_PROVEEDOR_ARTICULO_PROVEEDOR` AS `CODIGO_PROVEEDOR`,`fza_articulos_proveedores`.`CODIGO_ARTICULO_ARTICULO_PROVEEDOR` AS `CODIGO_ARTICULO`,`vi_articulos`.`DESCRIPCION_ARTICULO` AS `DESCRIPCION_ARTICULO`,`vi_articulos`.`CODIGO_FAMILIA_ARTICULO` AS `CODIGO_FAMILIA`,`vi_articulos`.`DESCRIPCION_FAMILIA` AS `DESCRIPCION_FAMILIA`,`vi_articulos`.`TIPO_CANTIDAD_ARTICULO` AS `TIPO_CATNTIDAD_ARTICULO`,`vi_articulos`.`ESACTIVO_FIJO_ARTICULO` AS `ESACTIVO_FIJO_ARTICULO`,`fza_articulos_proveedores`.`PRECIO_ULT_COMPRA_ARTICULO_PROVEEDOR` AS `PRECIO_ULT_COMPRA`,`fza_articulos_proveedores`.`FECHA_VALIDEZ_ARTICULO_PROVEEDOR` AS `FECHA_VALIDEZ`,`fza_articulos_proveedores`.`ESPROVEEDORPRINCIPAL_ARTICULO_PROVEEDOR` AS `ESPROVEEDORPRINCIPAL`,`fza_articulos_proveedores`.`INSTANTEMODIF` AS `INSTANTEMODIF`,`fza_articulos_proveedores`.`INSTANTEALTA` AS `INSTANTEALTA`,`fza_articulos_proveedores`.`USUARIOALTA` AS `USUARIOALTA`,`fza_articulos_proveedores`.`USUARIOMODIF` AS `USUARIOMODIF` from (`fza_articulos_proveedores` left join `vi_articulos` on(`fza_articulos_proveedores`.`CODIGO_ARTICULO_ARTICULO_PROVEEDOR` = `vi_articulos`.`CODIGO_ARTICULO`));

DROP VIEW IF EXISTS `vi_recibos`;
CREATE ALGORITHM=UNDEFINED  SQL SECURITY DEFINER VIEW `vi_recibos` AS select `fza_recibos`.`NRO_FACTURA_RECIBO` AS `NRO_FACTURA_RECIBO`,`fza_recibos`.`SERIE_FACTURA_RECIBO` AS `SERIE_FACTURA_RECIBO`,`fza_recibos`.`NRO_PLAZO_RECIBO` AS `NRO_PLAZO_RECIBO`,`fza_recibos`.`FORMA_PAGO_ORIGEN_RECIBO` AS `FORMA_PAGO_ORIGEN_RECIBO`,`fza_recibos`.`FORMA_PAGO_DESCRIPCION_ORIGEN_RECIBO` AS `FORMA_PAGO_DESCRIPCION_ORIGEN_RECIBO`,`fza_recibos`.`EUROS_RECIBO` AS `EUROS_RECIBO`,`fza_recibos`.`STADO_RECIBO` AS `STADO_RECIBO`,`fza_recibos`.`FECHA_EXPEDICION_RECIBO` AS `FECHA_EXPEDICION_RECIBO`,`fza_recibos`.`FECHA_VENCIMIENTO_RECIBO` AS `FECHA_VENCIMIENTO_RECIBO`,`fza_recibos`.`IBAN_CLIENTE_RECIBO` AS `IBAN_CLIENTE_RECIBO`,`fza_recibos`.`FECHA_PAGO_RECIBO` AS `FECHA_PAGO_RECIBO`,`fza_recibos`.`LOCALIDAD_EXPEDICION_RECIBO` AS `LOCALIDAD_EXPEDICION_RECIBO`,`fza_recibos`.`CODIGO_CLIENTE_RECIBO` AS `CODIGO_CLIENTE_RECIBO`,`fza_recibos`.`RAZONSOCIAL_CLIENTE_RECIBO` AS `RAZONSOCIAL_CLIENTE_RECIBO`,`fza_recibos`.`DIRECCION1_CLIENTE_RECIBO` AS `DIRECCION1_CLIENTE_RECIBO`,`fza_recibos`.`POBLACION_CLIENTE_RECIBO` AS `POBLACION_CLIENTE_RECIBO`,`fza_recibos`.`PROVINCIA_CLIENTE_RECIBO` AS `PROVINCIA_CLIENTE_RECIBO`,`fza_recibos`.`CPOSTAL_CLIENTE_RECIBO` AS `CPOSTAL_CLIENTE_RECIBO`,`fza_recibos`.`IMPORTE_LETRA_RECIBO` AS `IMPORTE_LETRA_RECIBO`,`fza_recibos`.`INSTANTEMODIF` AS `INSTANTEMODIF`,`fza_recibos`.`INSTANTEALTA` AS `INSTANTEALTA`,`fza_recibos`.`USUARIOALTA` AS `USUARIOALTA`,`fza_recibos`.`USUARIOMODIF` AS `USUARIOMODIF` from `fza_recibos` order by `fza_recibos`.`SERIE_FACTURA_RECIBO`,`fza_recibos`.`NRO_FACTURA_RECIBO`,`fza_recibos`.`NRO_PLAZO_RECIBO`;

DROP VIEW IF EXISTS `vi_tarifas`;
CREATE ALGORITHM=UNDEFINED  SQL SECURITY DEFINER VIEW `vi_tarifas` AS select `fza_tarifas`.`CODIGO_TARIFA` AS `CODIGO_TARIFA`,`fza_tarifas`.`NOMBRE_TARIFA` AS `NOMBRE_TARIFA`,`fza_tarifas`.`ACTIVO_TARIFA` AS `ACTIVO_TARIFA`,`fza_tarifas`.`ORDEN_TARIFA` AS `ORDEN_TARIFA`,`fza_tarifas`.`ESIMP_INCL_TARIFA` AS `ESIMP_INCL_TARIFA`,`fza_tarifas`.`ESDEFAULT_TARIFA` AS `ESDEFAULT_TARIFA`,`fza_tarifas`.`INSTANTEMODIF` AS `INSTANTEMODIF`,`fza_tarifas`.`INSTANTEALTA` AS `INSTANTEALTA`,`fza_tarifas`.`USUARIOALTA` AS `USUARIOALTA`,`fza_tarifas`.`USUARIOMODIF` AS `USUARIOMODIF` from `fza_tarifas` where `fza_tarifas`.`ACTIVO_TARIFA` = 'S' order by `fza_tarifas`.`ORDEN_TARIFA`;

DROP VIEW IF EXISTS `vi_usuarios`;
CREATE ALGORITHM=UNDEFINED  SQL SECURITY DEFINER VIEW `vi_usuarios` AS select `fza_usuarios`.`USUARIO_USUARIO` AS `USUARIO_USUARIO`,`fza_usuarios`.`PASSWORD_USUARIO` AS `PASSWORD_USUARIO`,`fza_usuarios`.`GRUPO_USUARIO` AS `GRUPO_USUARIO`,`fza_usuarios`.`EMPRESADEF_USUARIO` AS `EMPRESADEF_USUARIO`,`vi_empresas`.`RAZONSOCIAL_EMPRESA` AS `RAZONSOCIAL_EMPRESA`,`fza_usuarios`.`ULTIMOLOGIN_USUARIO` AS `ULTIMOLOGIN_USUARIO`,`fza_usuarios_grupos`.`GRUPO_GRUPO` AS `GRUPO_GRUPO`,`fza_usuarios_grupos`.`ESGRUPOADMINISTRADOR_GRUPO` AS `ESGRUPOADMINISTRADOR_GRUPO` from ((`fza_usuarios` join `fza_usuarios_grupos` on(`fza_usuarios`.`GRUPO_USUARIO` = `fza_usuarios_grupos`.`GRUPO_GRUPO`)) left join `vi_empresas` on(`fza_usuarios`.`EMPRESADEF_USUARIO` = `vi_empresas`.`CODIGO_EMPRESA`));

DROP VIEW IF EXISTS `vi_usuarios_grupos`;
CREATE ALGORITHM=UNDEFINED  SQL SECURITY DEFINER VIEW `vi_usuarios_grupos` AS select `fza_usuarios_grupos`.`GRUPO_GRUPO` AS `GRUPO_GRUPO`,`fza_usuarios_grupos`.`ESGRUPOADMINISTRADOR_GRUPO` AS `ESGRUPOADMINISTRADOR_GRUPO`,`fza_usuarios_grupos`.`INSTANTEMODIF` AS `INSTANTEMODIF`,`fza_usuarios_grupos`.`INSTANTEALTA` AS `INSTANTEALTA`,`fza_usuarios_grupos`.`USUARIOALTA` AS `USUARIOALTA`,`fza_usuarios_grupos`.`USUARIOMODIF` AS `USUARIOMODIF` from `fza_usuarios_grupos`;

DROP VIEW IF EXISTS `vi_usuarios_perfiles`;
CREATE ALGORITHM=UNDEFINED  SQL SECURITY DEFINER VIEW `vi_usuarios_perfiles` AS select `fza_usuarios_perfiles`.`USUARIO_GRUPO_PERFILES` AS `USUARIO_GRUPO_PERFILES`,`fza_usuarios_perfiles`.`KEY_PERFILES` AS `KEY_PERFILES`,`fza_usuarios_perfiles`.`SUBKEY_PERFILES` AS `SUBKEY_PERFILES`,`fza_usuarios_perfiles`.`VALUE_PERFILES` AS `VALUE_PERFILES`,`fza_usuarios_perfiles`.`VALUE_TEXT_PERFILES` AS `VALUE_TEXT_PERFILES`,`fza_usuarios_perfiles`.`TYPE_BLOB_PERFILES` AS `TYPE_BLOB_PERFILES`,`fza_usuarios_perfiles`.`VALUE_BLOB_PERFILES` AS `VALUE_BLOB_PERFILES`,`fza_usuarios_perfiles`.`INSTANTEMODIF` AS `INSTANTEMODIF`,`fza_usuarios_perfiles`.`INSTANTEALTA` AS `INSTANTEALTA`,`fza_usuarios_perfiles`.`USUARIOALTA` AS `USUARIOALTA`,`fza_usuarios_perfiles`.`USUARIOMODIF` AS `USUARIOMODIF` from `fza_usuarios_perfiles`;

DROP VIEW IF EXISTS `vi_variaciones`;
CREATE ALGORITHM=UNDEFINED  SQL SECURITY DEFINER VIEW `vi_variaciones` AS select `fza_variaciones`.`CODIGO_VARIACION` AS `CODIGO_VARIACION`,`fza_variaciones`.`NOMBRE_VARIACION` AS `NOMBRE_VARIACION`,`fza_variaciones`.`ACTIVO_VARIACION` AS `ACTIVO_VARIACION`,`fza_variaciones`.`ORDEN_VARIACION` AS `ORDEN_VARIACION` from `fza_variaciones` where `fza_variaciones`.`ACTIVO_VARIACION` = 'S' order by `fza_variaciones`.`ORDEN_VARIACION`;

/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
