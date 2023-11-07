{*******************************************************}
{                                                       }
{           Biblioteca de Tiempo de Ejecuci�n Delphi    }
{                                                       }
{ Derechos de autor (c) 1995-2019 Embarcadero Technologies, Inc. }
{              Todos los derechos reservados            }
{                                                       }
{*******************************************************}

unit System.SysConst;

{$IFDEF ANDROID}
{$define USE_LIBICU}
{$ENDIF ANDROID}

                                                                                  
{$IFDEF LINUX}
  {$DEFINE USE_LIBICU}
{$ENDIF LINUX}

interface
{$HPPEMIT LEGACYHPP}

resourcestring
  SUnknown = '<desconocido>';
  SInvalidInteger = '''%s'' no es un valor entero v�lido';
  SInvalidInteger2 = '''%s'' no es un valor entero v�lido para el tipo %s';
  SInvalidFloat = '''%s'' no es un valor de punto flotante v�lido';
  SInvalidFloat2 = '''%s'' no es un valor de punto flotante v�lido para el tipo %s';
  SInvalidCurrency = '''%s'' no es un valor de moneda v�lido';
  SInvalidDate = '''%s'' no es una fecha v�lida';
  SInvalidTime = '''%s'' no es una hora v�lida';
  SInvalidDateTime = '''%s'' no es una fecha y hora v�lidas';
  SInvalidDateTimeFloat = '''%g'' no es una fecha y hora v�lidas';
  SInvalidTimeStamp = '''%d.%d'' no es un sello de tiempo v�lido';
  SInvalidGUID = '''%s'' no es un valor de GUID v�lido';
  SInvalidBoolean = '''%s'' no es un valor booleano v�lido';
  STimeEncodeError = 'Argumento no v�lido para codificar tiempo';
  SDateEncodeError = 'Argumento no v�lido para codificar fecha';
  SOutOfMemory = 'Memoria agotada';
  SInOutError = 'Error de E/S %d';
  SFileNotFound = 'Archivo no encontrado';
  SInvalidFilename = 'Nombre de archivo no v�lido' deprecated 'Usar SInvalidUnknownFilename';
  SInvalidUnknownFilename = 'Nombre de archivo no v�lido';
  STooManyOpenFiles = 'Demasiados archivos abiertos';
  SAccessDenied = 'Acceso denegado al archivo';
  SEndOfFile = 'Lectura m�s all� del final del archivo';
  SDiskFull = 'Disco lleno';
  SInvalidInput = 'Entrada num�rica no v�lida';
  SDivByZero = 'Divisi�n por cero';
  SRangeError = 'Error de comprobaci�n de rango';
  SIntOverflow = 'Desbordamiento de entero';
  SInvalidOp = 'Operaci�n de punto flotante no v�lida';
  SZeroDivide = 'Divisi�n de punto flotante por cero';
  SOverflow = 'Sobreflujo de punto flotante';
  SUnderflow = 'Subflujo de punto flotante';
  SInvalidPointer = 'Operaci�n de puntero no v�lida';
  SInvalidCast = 'Conversi�n de tipo de clase no v�lida';
{$IFDEF MSWINDOWS}
  SAccessViolationArg3 = 'Violaci�n de acceso en direcci�n %p. %s de direcci�n %p';
{$ENDIF MSWINDOWS}
{$IF Defined(LINUX) or Defined(MACOS) or Defined(ANDROID)}
  SAccessViolationArg2 = 'Violaci�n de acceso en direcci�n %p, accediendo a direcci�n %p';
{$ENDIF LINUX or MACOS or ANDROID}
  SAccessViolationNoArg = 'Violaci�n de acceso';
  SStackOverflow = 'Desbordamiento de pila';
  SControlC = 'Se presion� Ctrl+C';
  SQuit = 'Se presion� la tecla de salida';
  SPrivilege = 'Instrucci�n privilegiada';
  SOperationAborted = 'Operaci�n abortada';
  SException = 'Excepci�n %s en el m�dulo %s en %p.' + sLineBreak + '%s%s' + sLineBreak;
  SExceptTitle = 'Error de la aplicaci�n';
{$IF Defined(LINUX) or Defined(MACOS) or Defined(ANDROID)}
  SSigactionFailed = 'Error en la llamada de sigaction';
  SOSExceptionHandlingFailed = 'Fall� la inicializaci�n del manejo de excepciones del sistema operativo';
{$ENDIF LINUX or MACOS or ANDROID}
  SInvalidFormat = 'Formato ''%s'' inv�lido o incompatible con el argumento';
  SArgumentMissing = 'Ning�n argumento para el formato ''%s''';
  SDispatchError = 'Llamadas a m�todos de variantes no soportadas';
  SReadAccess = 'Lectura';
  SWriteAccess = 'Escritura';
  SExecuteAccess = 'Ejecuci�n';
  SInvalidAccess = 'Acceso no v�lido';
  SResultTooLong = 'Resultado del formato mayor a 4096 caracteres';
  SFormatTooLong = 'Cadena de formato demasiado larga';
{$IFDEF MACOS}
  SCFStringFailed = 'Error al crear CFString';
{$ENDIF MACOS}
{$IF defined(USE_LIBICU)}
  SICUError = 'Error de ICU: %d, %s';
  SICUErrorOverflow = 'Error de sobreflujo de ICU: %d, %s, Longitud necesaria=%d';
{$ENDIF defined(USE_LIBICU)}

  SVarArrayCreate = 'Error al crear una variante o matriz segura';
  SVarArrayBounds = '�ndice de variante o matriz segura fuera de l�mites';
  SVarArrayLocked = 'Variante o matriz segura bloqueada';
  SVarArrayWithHResult = 'Error inesperado de variante o matriz segura: %s%.8x';

  SInvalidVarCast = 'Conversi�n de tipo de variante no v�lida';
  SInvalidVarOp = 'Operaci�n de variante no v�lida';
  SInvalidVarNullOp = 'Operaci�n nula de variante no v�lida';
  SInvalidVarOpWithHResultWithPrefix = 'Operaci�n de variante no v�lida (%s%.8x)'#10'%s';
  SVarTypeRangeCheck1 = 'Error de comprobaci�n de rango para variante de tipo (%s)';
  SVarTypeRangeCheck2 = 'Error de comprobaci�n de rango al convertir variante de tipo (%s) a tipo (%s)';
  SVarTypeOutOfRangeWithPrefix = 'El tipo de variante personalizada (%s%.4x) est� fuera de rango';
  SVarTypeAlreadyUsedWithPrefix = 'El tipo de variante personalizada (%s%.4x) ya ha sido usado por %s';
  SVarTypeNotUsableWithPrefix = 'El tipo de variante personalizada (%s%.4x) no es utilizable';
  SVarTypeTooManyCustom = 'Se han registrado demasiados tipos de variantes personalizadas';

  // los siguientes ya no se usan
  SVarNotArray = 'La variante no es una matriz' deprecated; // no utilizado, usar SVarInvalid en su lugar
  SVarTypeUnknown = 'Tipo de variante personalizada desconocido ($%.4x)' deprecated; // ya no se usa
  SVarTypeOutOfRange = 'Tipo de variante personalizada ($%.4x) est� fuera de rango' deprecated;
  SVarTypeAlreadyUsed = 'Tipo de variante personalizada ($%.4x) ya usado por %s' deprecated;
  SVarTypeNotUsable = 'Tipo de variante personalizada ($%.4x) no es utilizable' deprecated;
  SInvalidVarOpWithHResult = 'Operaci�n de variante no v�lida ($%.8x)' deprecated;

  SVarTypeCouldNotConvert = 'No se pudo convertir la variante de tipo (%s) a tipo (%s)';
  SVarTypeConvertOverflow = 'Sobreflujo al convertir variante de tipo (%s) a tipo (%s)';
  SVarOverflow = 'Sobreflujo de variante';
  SVarInvalid = 'Argumento no v�lido';
  SVarBadType = 'Tipo de variante no v�lido';
  SVarNotImplemented = 'Operaci�n no compatible';
  SVarOutOfMemory = 'Operaci�n de variante se qued� sin memoria';
  SVarUnexpected = 'Error inesperado de variante';

  SVarDataClearRecursing = 'Recursi�n al realizar VarDataClear';
  SVarDataCopyRecursing = 'Recursi�n al realizar VarDataCopy';
  SVarDataCopyNoIndRecursing = 'Recursi�n al realizar VarDataCopyNoInd';
  SVarDataInitRecursing = 'Recursi�n al realizar VarDataInit';
  SVarDataCastToRecursing = 'Recursi�n al realizar VarDataCastTo';
  SVarIsEmpty = 'La variante est� vac�a';
  sUnknownFromType = 'No se puede convertir desde el tipo especificado';
  sUnknownToType = 'No se puede convertir al tipo especificado';
  SExternalException = 'Excepci�n externa %x';
  SAssertionFailed = 'La aserci�n fall�';
  SIntfCastError = 'Interfaz no compatible';
  SSafecallException = 'Excepci�n en m�todo de safecall';
  SMonitorLockException = 'Bloqueo de objeto no pose�do';
  SNoMonitorSupportException = 'Funci�n de soporte de monitoreo no inicializada';
  SNotImplemented = 'Caracter�stica no implementada';
  SObjectDisposed = 'M�todo llamado en objeto descartado';
  SAssertError = '%s (%s, l�nea %d)';
  SAbstractError = 'Error abstracto';
  SModuleAccessViolation = 'Violaci�n de acceso en direcci�n %p en m�dulo ''%s''. %s de direcci�n %p';
  SCannotReadPackageInfo = 'No se puede acceder a la informaci�n del paquete para el paquete ''%s''';
  sErrorLoadingPackage = 'No se puede cargar el paquete %s.'+sLineBreak+'%s';
  SInvalidPackageFile = 'Archivo de paquete no v�lido ''%s''';
  SInvalidPackageHandle = 'Manejo de paquete no v�lido';
  SDuplicatePackageUnit = 'No se puede cargar el paquete ''%s''. Contiene la unidad ''%s'', ' +
    'que tambi�n est� contenida en el paquete ''%s''';
  SOSError = 'Error del sistema.  C�digo: %d.'+sLineBreak+'%s%s';
  SUnkOSError = 'Fall� una llamada a una funci�n del SO';
{$IFDEF MSWINDOWS}
  SWin32Error = 'Error Win32.  C�digo: %d.'#10'%s' deprecated 'Usar SOSError';
  SUnkWin32Error = 'Fall� una funci�n de la API de Win32' deprecated 'Usar SUnkOSError';
{$ENDIF}
  SNL = 'La aplicaci�n no est� licenciada para usar esta funci�n';

  SShortMonthNameJan = 'Ene';
  SShortMonthNameFeb = 'Feb';
  SShortMonthNameMar = 'Mar';
  SShortMonthNameApr = 'Abr';
  SShortMonthNameMay = 'May';
  SShortMonthNameJun = 'Jun';
  SShortMonthNameJul = 'Jul';
  SShortMonthNameAug = 'Ago';
  SShortMonthNameSep = 'Sep';
  SShortMonthNameOct = 'Oct';
  SShortMonthNameNov = 'Nov';
  SShortMonthNameDec = 'Dic';

  SLongMonthNameJan = 'Enero';
  SLongMonthNameFeb = 'Febrero';
  SLongMonthNameMar = 'Marzo';
  SLongMonthNameApr = 'Abril';
  SLongMonthNameMay = 'Mayo';
  SLongMonthNameJun = 'Junio';
  SLongMonthNameJul = 'Julio';
  SLongMonthNameAug = 'Agosto';
  SLongMonthNameSep = 'Septiembre';
  SLongMonthNameOct = 'Octubre';
  SLongMonthNameNov = 'Noviembre';
  SLongMonthNameDec = 'Diciembre';

  SShortDayNameSun = 'Dom';
  SShortDayNameMon = 'Lun';
  SShortDayNameTue = 'Mar';
  SShortDayNameWed = 'Mi�';
  SShortDayNameThu = 'Jue';
  SShortDayNameFri = 'Vie';
  SShortDayNameSat = 'S�b';

  SLongDayNameSun = 'Domingo';
  SLongDayNameMon = 'Lunes';
  SLongDayNameTue = 'Martes';
  SLongDayNameWed = 'Mi�rcoles';
  SLongDayNameThu = 'Jueves';
  SLongDayNameFri = 'Viernes';
  SLongDayNameSat = 'S�bado';

{$IFDEF POSIX}
  SEraEntries = '';
{$ENDIF}

  SCannotCreateDir = 'No se puede crear el directorio';
  SCodesetConversionError = 'Fallo en la conversi�n del conjunto de c�digos';

  // Usado por TEncoding
  SInvalidSourceArray = 'Matriz de origen no v�lida';
  SInvalidDestinationArray = 'Matriz de destino no v�lida';
  SCharIndexOutOfBounds = '�ndice de car�cter fuera de l�mites (%d)';
  SByteIndexOutOfBounds = '�ndice de inicio fuera de l�mites (%d)';
  SInvalidCharCount = 'Recuento no v�lido (%d)';
  SInvalidDestinationIndex = '�ndice de destino no v�lido (%d)';
  SInvalidCodePage = 'P�gina de c�digos no v�lida';
  SInvalidEncodingName = 'Nombre de codificaci�n no v�lido';
  SNoMappingForUnicodeCharacter = 'No existe asignaci�n para el car�cter Unicode en la p�gina de c�digos multi-byte objetivo';
  SInvalidStringBaseIndex = '�ndice de base de cadena no v�lido';
  SOperationCancelled = 'Operaci�n Cancelada';

implementation

end.