unit Vcl.Consts;

{$HPPEMIT LEGACYHPP}

interface

resourcestring
   
   
   
   
   
   
   
   
   
   SSelectADate = 'Seleccione una fecha';
   SOpenFileTitle = 'Abrir';
   SCantWriteResourceStreamError = 'No se puede escribir en un flujo de recursos de s�lo lectura';
   SDuplicateReference = 'WriteObject llamado dos veces para la misma instancia';
   SClassMismatch = 'El recurso %s es de clase incorrecta';
   SInvalidTabIndex = '�ndice de tabulaci�n fuera de l�mites';
   SInvalidTabPosition = 'La posici�n de la pesta�a es incompatible con el estilo de pesta�a actual';
   SInvalidTabStyle = 'Estilo de pesta�a incompatible con la posici�n de pesta�a actual';
   SInvalidBitmap = 'La imagen de mapa de bits no es v�lida';
   SInvalidIcon = 'La imagen del icono no es v�lida';
   SInvalidMetafile = 'El metaarchivo no es v�lido';
   SInvalidPixelFormat = 'Formato de p�xel no v�lido';
   SInvalidImage = 'Imagen no v�lida';
   SBitmapEmpty = 'El mapa de bits est� vac�o';
   SScanLine = '�ndice de l�nea de escaneo fuera de rango';
   SChangeIconSize = 'No se puede cambiar el tama�o de un icono';
   SChangeWicSize = 'No se puede cambiar el tama�o de una imagen de WIC';
   SOleGraphic = 'Operaci�n no v�lida en TOleGraphic';
   SUnknownExtension = 'Extensi�n de archivo de imagen desconocida (.%s)';
   SUnknownClipboardFormat = 'Formato de portapapeles no compatible';
   SUnknownStreamFormat = 'Formato de transmisi�n no compatible';
   SOutOfResources = 'Fuera de recursos del sistema';
   SNoCanvasHandle = 'El lienzo no permite dibujar';
   SInvalidTextFormatFlag = 'El indicador de formato de texto ''%s'' no es compatible';
   SInvalidImageSize = 'Tama�o de imagen no v�lido';
   STooManyImages = 'Demasiadas im�genes';
   SDimsDoNotMatch = 'Las dimensiones de la imagen no coinciden con las dimensiones de la lista de im�genes';
   SInvalidImageList = 'Lista de im�genes no v�lida';
   SReplaceImage = 'No se puede reemplazar la imagen';
   SInsertImage = 'No se puede insertar la imagen';
   SImageIndexError = '�ndice de lista de im�genes no v�lido';
   SImageReadFail = 'Error al leer los datos de ImageList de la secuencia';
   SImageWriteFail = 'Error al escribir los datos de ImageList en la transmisi�n';
   SWindowDCError = 'Error al crear el contexto del dispositivo de ventana';
   SClientNotSet = 'Cliente de TDrag no inicializado';
   SWindowClass = 'Error al crear la clase de ventana';
   SWindowCreate = 'Error al crear la ventana';
   SCannotFocus = 'No se puede enfocar una ventana deshabilitada o invisible';
   SParentRequired = 'El control ''%s'' no tiene ventana principal';
   SControlPath = '. Ruta:'#13#10'%s';
   SParentGivenNotAParent = 'El padre proporcionado no es padre de ''%s''';
   SMDIChildNotVisible = 'No se puede ocultar un formulario secundario MDI';
   SVisibleChanged = 'No se puede cambiar lo visible en OnShow u OnHide';
   SCannotShowModal = 'No se puede hacer modal una ventana visible';
   SScrollBarRange = 'Propiedad de la barra de desplazamiento fuera de rango';
   SPropertyOutOfRange = '%s propiedad fuera de rango';
   SMenuIndexError = '�ndice de men� fuera de rango';
   SMenuReinserted = 'Men� insertado dos veces';
   SMenuNotFound = 'El submen� no est� en el men�';
   SNoTimers = 'No hay suficientes temporizadores disponibles';
   SNotPrinting = 'La impresora no est� imprimiendo actualmente';
   SPrinting = 'Impresi�n en curso';
   SPrinterIndexError = '�ndice de impresora fuera de rango';
   SInvalidPrinter = 'La impresora seleccionada no es v�lida';
   SDeviceOnPort = '%s en %s';
   SGroupIndexTooLow = 'GroupIndex no puede ser menor que el GroupIndex de un elemento de men� anterior';
   STwoMDIForms = 'No se puede tener m�s de un formulario MDI por solicitud';
   SNoMDIForm = 'No se puede crear el formulario. Actualmente no hay formularios MDI activos';
   SImageCanvasNeedsBitmap = 'S�lo se puede modificar una imagen si contiene un mapa de bits';
   SControlParentSetToSelf = 'Un control no puede tenerse a s� mismo como padre';
   SOKButton = 'Aceptar';
   SCancelButton = 'Cancelar';
   SYesButton = '&S�';
   SNoButton = '&No';
   SHelpButton = '&Ayuda';
   SCloseButton = '&Cerrar';
   SIgnoreButton = '&Ignorar';
   SRetryButton = '&Reintentar';
   SAbortButton = 'Abortar';
   SAllButton = '&Todos';

   SCannotDragForm = 'No se puede arrastrar un formulario';
   SPutObjectError = 'Poner objeto en un elemento no definido';
   SCardDLLNotLoaded = 'No se pudo cargar CARDS.DLL';
   SDuplicateCardId = 'Se encontr� un ID de tarjeta duplicado';

   SDdeErr = 'Un error devuelto desde DDE ($0%x)';
   SDdeConvErr = 'Error DDE - conversaci�n no establecida ($0%x)';
   SDdeMemErr = 'Se produjo un error cuando DDE se qued� sin memoria ($0%x)';
   SDdeNoConnect = 'No se puede conectar la conversaci�n DDE';

   SFB = 'FB';
   SFG = 'FG';
   SBG = 'BG';
   SOldTShape = 'No se puede cargar la versi�n anterior de TShape';
   SVMetafiles = 'Metaarchivos';
   SVEnhMetafiles = 'Metarchivos mejorados';
   SVIcons = 'Iconos';
   SVBitmaps = 'Mapas de bits';
   SVTIFFImages = 'Im�genes TIFF';
{$IF DEFINED(CLR)}
   SVJPGImages = 'Im�genes JPEG';
   SVPNGImages = 'Im�genes PNG';
   SVGIFImages = 'Im�genes GIF';
{$ENDIF}
   SGridTooLarge = 'Cuadr�cula demasiado grande para su funcionamiento';
   STooManyDeleted = 'Demasiadas filas o columnas eliminadas';
   SIndexOutOfRange = '�ndice de cuadr�cula fuera de rango';
SFixedColTooBig = 'El n�mero de columnas fijas debe ser menor que el n�mero de columnas';
   SFixedRowTooBig = 'El n�mero de filas fijas debe ser menor que el n�mero de filas';
   SInvalidStringGridOp = 'No se pueden insertar ni eliminar filas de la cuadr�cula';
   SInvalidEnumValue = 'Valor de enumeraci�n no v�lido';
   SInvalidNumber = 'Valor num�rico no v�lido';
   SOutlineIndexError = '�ndice de esquema no encontrado';
   SOutlineExpandError = 'El padre debe estar expandido';
   SInvalidCurrentItem = 'Valor no v�lido para el elemento actual';
   SMaskErr = 'Valor de entrada no v�lido';
   SMaskEditErr = 'Valor de entrada no v�lido. Utilice la tecla de escape para abandonar los cambios';
   SOutlineError = '�ndice de esquema no v�lido';
   SOutlineBadLevel = 'Asignaci�n de nivel incorrecta';
   SOutlineSelection = 'Selecci�n no v�lida';
   SOutlineFileLoad = 'Error al cargar el archivo';
   SOutlineLongLine = 'L�nea demasiado larga';
   SOutlineMaxLevels = 'Se excedi� la profundidad m�xima del contorno';

   SMsgDlgWarning = 'Advertencia';
   SMsgDlgError = 'Error';
   SMsgDlgInformation = 'Informaci�n';
   SMsgDlgConfirm = 'Confirmar';
   SMsgDlgYes = '&S�';
   SMsgDlgNo = '&No';
   SMsgDlgOK = 'Aceptar';
   SMsgDlgCancel = 'Cancelar';
   SMsgDlgHelp = '&Ayuda';
   SMsgDlgHelpNone = 'No hay ayuda disponible';
   SMsgDlgHelpHelp = 'Ayuda';
   SMsgDlgAbort = '&Abortar';
   SMsgDlgRetry = '&Reintentar';
   SMsgDlgIgnore = '&Ignorar';
   SMsgDlgAll = '&Todos';
   SMsgDlgNoToAll = 'N&o a todos';
   SMsgDlgYesToAll = 'S� a &Todos';
   SMsgDlgClose = '&Cerrar';

   SmkcBkSp = 'BkSp';
   SmkcTab = 'Tab';
   SmkcEsc = 'Esc';
   SmkcEnter = 'Entrar';
   SmkcSpace = 'Espacio';
   SmkcPgUp = 'ReP�g';
   SmkcPgDn = 'AvP�g';
   SmkcEnd = 'Fin';
   SmkcHome = 'Inicio';
   SmkcLeft = 'Izquierda';
   SmkcUp = 'Arriba';
   SmkcRight = 'Derecho';
   SmkcDown = 'Abajo';
   SmkcIns = 'Ins';
   SmkcDel = 'Eliminar';
   SmkcShift = 'May�s+';
   SmkcCtrl = 'Ctrl+';
   SmkcAlt = 'Alt+';

   srUnknown = '(Desconocido)';
   srNone = '(Ninguno)';
   SOutOfRange = 'El valor debe estar entre %dy %d';

   SDateEncodeError = 'Argumento no v�lido para la codificaci�n de fecha';
   SDefaultFilter = 'Todos los archivos (*.*)|*.*';
   sAllFilter = 'Todos';
   SNoVolumeLabel = ': [ - sin etiqueta de volumen - ]';
   SInsertLineError = 'No se puede insertar una l�nea';

   SConfirmCreateDir = 'El directorio especificado no existe. �Crearlo?';
   SSelectDirCap = 'Seleccionar directorio';
   SDirNameCap = 'Directorio &Nombre:';
   SDrivesCap = 'D&rives:';
   SDirsCap = '&Directorios:';
   SFilesCap = '&Archivos: (*.*)';
   SNetworkCap = 'Ne&red...';

   SColorPrefix = 'Color' deprecated; //!! obsoleto - eliminar en 5.0
   SColorTags = 'ABCDEFGHIJKLMNOP' deprecated; //!! obsoleto - eliminar en 5.0

   SInvalidClipFmt = 'Formato de portapapeles no v�lido';
   SIconToClipboard = 'El portapapeles no admite iconos';
   SCannotOpenClipboard = 'No se puede abrir el portapapeles: %s';

   SDefault = 'Predeterminado';

   SInvalidMemoSize = 'El texto excede la capacidad de la nota';
   SCustomColors = 'Colores personalizados';
   SInvalidPrinterOp = 'Operaci�n no admitida en la impresora seleccionada';
   SNoDefaultPrinter = 'No hay ninguna impresora predeterminada seleccionada actualmente';

   SIniFileWriteError = 'No se puede escribir en %s';

   SBitsIndexError = '�ndice de bits fuera de rango';

   SUntitled = '(Sin t�tulo)';

   SInvalidRegType = 'Tipo de datos no v�lido para ''%s''';

   SUnknownConversion = 'Extensi�n de archivo de conversi�n RichEdit desconocida (.%s)';
   SDuplicateMenus = 'El men� ''%s'' ya est� siendo utilizado por otro formulario';

   SPictureLabel = 'Imagen:';
   SPictureDesc = ' (%dx%d)';
   SPreviewLabel = 'Vista previa';

   SCannotOpenAVI = 'No se puede abrir AVI';

   SNotOpenErr = 'No hay ning�n dispositivo MCI abierto';
   SMPOpenFilter = 'Todos los archivos (*.*)|*.*|Archivos Wave (*.wav)|*.wav|Archivos MIDI (*.mid)|*.mid|Video para Windows (*.avi)|*. avi';
   SMCINil = '';
   SMCIAVIVideo = 'AVIVideo';
   SMCICDAudio = 'CDAudio';
   SMCIDAT = 'DAT';
   SMCIDigitalVideo = 'V�deo Digital';
   SMCIMMMovie = 'MMPel�cula';
   SMCIOtro = 'Otro';
   SMCIOverlay = 'Superposici�n';
   SMCIScanner = 'Esc�ner';
   SMCISequencer = 'Secuenciador';
   SMCIVCR = 'videograbadora';
   SMCIVideodisc = 'Videodisco';
   SMCIWaveAudio = 'WaveAudio';
   SMCIUnknownError = 'C�digo de error desconocido';

   SBoldItalicFont = 'Negrita cursiva';
   SBoldFont = 'Negrita';
   SItalicFont = 'Cursiva';
   SRegularFont = 'Regular';

   SPropertiesVerb = 'Propiedades';

   SServiceFailed = 'El servicio fall� en %s: %s';
   SExecute = 'ejecutar';
   SStart = 'inicio';
   SStop = 'detener';
   SPause = 'pausa';
   SContinue = 'continuar';
   SInterrogate = 'interrogar';
   SShutdown = 'apagar';
   SCustomError = 'El servicio fall� en el mensaje personalizado(%d): %s';
   SServiceInstallOK = 'Servicio instalado correctamente';
   SServiceInstallFailed = 'El servicio "%s" no se pudo instalar con el error: "%s"';
   SServiceUninstallOK = 'Servicio desinstalado exitosamente';
   SServiceUninstallFailed = 'El servicio "%s" no se pudo desinstalar con el error: "%s"';

   SDockedCtlNeedsName = 'El control acoplado debe tener un nombre';
   SDockTreeRemoveError = 'Error al eliminar el control del �rbol del muelle';
   SDockZoneNotFound = ' - Zona de acoplamiento no encontrada';
   SDockZoneHasNoCtl = ' - La zona del muelle no tiene control';
   SDockZoneVersionConflict = 'Error al cargar la zona del muelle desde la transmisi�n. ' +
     'Esperando la versi�n %d, pero encontr� %d.';

   SAllCommands = 'Todos los comandos';

   SDuplicateItem = 'La lista no permite duplicados ($0%x)';

   STextNotFound = 'Texto no encontrado: "%s"';
   SBrowserExecError = 'No se ha especificado ning�n navegador predeterminado';

   SColorBoxCustomCaption = 'Personalizado...';

   SMultiSelectRequired = 'El modo de selecci�n m�ltiple debe estar activado para esta funci�n';

   SPromptArrayTooShort = 'La longitud de la matriz de valores debe ser >= longitud de la matriz de solicitud';
   SPromptArrayEmpty = 'La matriz de mensajes no debe estar vac�a';

   SUsername = '&Nombre de usuario';
   SPassword = '&Contrase�a';
   SDomain = '&Dominio';
   SLogin = 'Iniciar sesi�n';

   SKeyCaption = 'Clave';
   SValueCaption = 'Valor';
   SKeyConflict = 'Ya existe una clave con el nombre "%s"';
   SKeyNotFound = 'Clave "%s" no encontrada';
   SNoColumnMoving = 'goColMoving no es una opci�n admitida';
   SNoEqualsInKey = 'La clave no puede contener el signo igual ("=")';

   SSendError = 'Error al enviar correo';
   SAssignSubItemError = 'No se puede asignar un subelemento a una barra de acciones cuando uno de sus elementos principales ya est� asignado a una barra de acciones';
   SDeleteItemWithSubItems = 'El elemento %s tiene subelementos, �eliminarlo de todos modos?';
   SDeleteNotAllowed = 'No tienes permiso para eliminar este elemento';
   SMoveNotAllowed = 'No se permite mover el elemento %s';
   SMoreButtons = 'M�s botones';
   SErrorDownloadingURL = 'Error al descargar la URL: %s';
   SUrlMonDllMissing = 'No se puede cargar %s';
   SAllActions = '(Todas las acciones)';
   SNoCategory = '(Sin categor�a)';
   SExpand = 'Expandir';
   SErrorSettingPath = 'Error al configurar la ruta: "%s"';
   SLBPutError = 'Intentando colocar elementos en un cuadro de lista de estilo virtual';
   SErrorLoadingFile = 'Error al cargar el archivo de configuraci�n previamente guardado: %s'#13'�Desea eliminarlo?';
   SResetUsageData = '�Restablecer todos los datos de uso?';
   SFileRunDialogTitle = 'Ejecutar';
   SNoName = '(Sin nombre)';
   SErrorActionManagerNotAssigned = 'Primero se debe asignar el ActionManager';
   SAddRemoveButtons = '&Agregar o quitar botones';
   SResetActionToolBar = 'Restablecer barra de herramientas';
   SPersonalizar = '&Personalizar...';
   SSeparator = 'Separador';
   SCircularReferencesNotAllowed = 'No se permiten referencias circulares';
   SCannotHideActionBand = '%s no permite ocultarse';
   SErrorSettingCount = 'Error al configurar %s.Count';
   SListBoxMustBeVirtual = 'El estilo del cuadro de lista (%s) debe ser virtual para poder configurar el Conteo';
   SUnableToSaveSettings = 'No se pueden guardar las configuraciones';
   SRestoreDefaultSchedule = '�Desea restablecer el programa de prioridades predeterminado?';
   SNoGetItemEventHandler = 'No se ha asignado ning�n controlador de eventos OnGetItem';
   SInvalidColorMap = 'Mapa de colores no v�lido, esta ActionBand requiere ColorMaps del tipo TCustomActionBarColorMapEx';
   SDuplicateActionBarStyleName = 'Ya se ha registrado un estilo llamado %s';
   SMissingActionBarStyleName = 'No se ha registrado un estilo llamado %s';
   SStandardStyleActionBars = 'Estilo est�ndar';
   SXPStyleActionBars = 'Estilo XP';
   SActionBarStyleMissing = 'No hay unidad de estilo ActionBand presente en la cl�usula de usos.'#13 +
     'Su aplicaci�n debe incluir XPStyleActnCtrls, StdStyleActnCtrls o ' +
     'una unidad de estilo ActionBand de terceros en su cl�usula de usos';
   sParameterCannotBeNil = 'El par�metro %s en la llamada a %s no puede ser nulo';
   SInvalidColorString = 'Cadena de color no v�lida';
   SActionManagerNotAssigned = 'La propiedad %s ActionManager no ha sido asignada';

   SInvalidPath = '"%s" es una ruta no v�lida';
   SInvalidPathCaption = 'Ruta no v�lida';

   SANSIEncoding = 'ANSI';
   SASCIIEncoding = 'ASCII';
   SUnicodeEncoding = 'Unicode';
   SBigEndianEncoding = 'Unicode Big Endian';
   SUTF8Encoding  = 'UTF-8';
   SUTF7Encoding  = 'UTF-7';
   SEncodingLabel = 'Codificaci�n:';

   sCannotAddFixedSize = 'No se pueden agregar columnas o filas mientras el estilo de expansi�n sea de tama�o fijo';
   sInvalidSpan = '''%d'' no es un intervalo v�lido';
   sInvalidRowIndex = '�ndice de fila, %d, fuera de l�mites';
   sInvalidColumnIndex = '�ndice de columna, %d, fuera de l�mites';
   sInvalidControlItem = 'ControlItem.Control no puede configurarse como propietario de GridPanel';
   sCannotDeleteColumn = 'No se puede eliminar una columna que contiene controles';
   sCannotDeleteRow = 'No se puede eliminar una fila que contiene controles';
   sCellMember = 'Miembro';
   sCellSizeType = 'Tipo de tama�o';
   sCellValue = 'Valor';
   sCellAutoSize = 'Autom�tico';
   sCellPercentSize = 'Porcentaje';
   sCellAbsoluteSize = 'Absoluto';
   sCellColumn = 'Columna%d';
   sCellRow = 'Fila%d';

   STrayIconRemoveError = 'No se puede eliminar el icono de notificaci�n del shell';
   STrayIconCreateError = 'No se puede crear el icono de notificaci�n del shell';

   SPageControlNotSet = 'Primero se debe asignar PageControl';

   SWindowsVistaRequired = '%s requiere Windows Vista o posterior';
   SXPThemesRequired = '%s requiere que los temas est�n habilitados';

   STaskDlgButtonCaption = 'Bot�n%d';
   STaskDlgRadioButtonCaption = 'RadioButton%d';
   SInvalidTaskDlgButtonCaption = 'Caption no puede estar vac�o';

   SInvalidCategoryPanelParent = 'CategoryPanel debe tener un CategoryPanelGroup como padre';
   SInvalidCategoryPanelGroupChild = 'S�lo se pueden insertar CategoryPanels en un CategoryPanelGroup';
   
   SInvalidCanvasOperation = 'Operaci�n de lienzo no v�lida';
   SNoOwner = '%s no tiene propietario';
   SRequireSameOwner = 'El origen y el destino requieren el mismo propietario';
   SDirect2DInvalidOwner = '%s no puede pertenecer a un lienzo diferente';
   SDirect2DInvalidSolidBrush = 'No es un pincel de color s�lido';
   SDirect2DInvalidBrushStyle = 'Estilo de pincel no v�lido';

   SKeyboardLocaleInfo = 'Error al recuperar la informaci�n local';
   SKeyboardLangChange = 'Error al cambiar el idioma de entrada';

   SOlyWinControls = 'S�lo puede acoplar mediante pesta�as controles basados en TWinControl';

   SNoKeyword = 'No se ha especificado ning�n teclado';

   SStyleLoadError = 'No se puede cargar el estilo ''%s''';
   SStyleLoadErrors = 'No se pueden cargar estilos: %s';
   SStyleRegisterError = 'Estilo ''%s'' ya registrado';
   SStyleClassRegisterError = 'La clase de estilo ''%s'' ya est� registrada';
   SStyleNotFound = 'Estilo ''%s'' no encontrado';
   SStyleClassNotFound = 'Clase de estilo ''%s'' no encontrada';
   SStyleInvalidHandle = 'Identificador de estilo no v�lido';
   SStyleFormatError = 'Formato de estilo no v�lido';
   SStyleFileDescription = 'Archivo de estilo VCL';
   SStyleHookClassRegistered = 'La clase ''%s'' ya est� registrada para ''%s''';
   SStyleHookClassNotRegistered = 'La clase ''%s'' no est� registrada para ''%s''';
   SStyleInvalidParameter = '%s par�metro no puede ser nulo';
   SStyleHookClassNotFound = 'No se ha registrado una clase StyleHook para %s';
   SStyleFeatureNotSupported = 'Funci�n no admitida por este estilo';
   SStyleNotRegistered = 'El estilo ''%s'' no est� registrado';
   SStyleUnregisterError = 'No se puede cancelar el registro del estilo del sistema';
   SStyleNotRegisteredNoName = 'Estilo no registrado';


   // cadenas ColorToPrettyName
   SNameBlack = 'Negro';
   SNameMaroon = 'Granate';
   SNameGreen = 'Verde';
   SNameOlive = 'Oliva';
   SNameNavy = 'Marina';
   SNamePurple = 'P�rpura';
   SNameTeal = 'Verde azulado';
   SNameGray = 'Gris';
   SNameSilver = 'Plata';
   SNameRed = 'Rojo';
   SNameLime = 'Lime';
   SNameYellow = 'Amarillo';
   SNameBlue = 'Azul';
   SNameFuchsia = 'Fucsia';
   SNameAqua = 'Agua';
   SNameWhite = 'Blanco';
   SNameMoneyGreen = 'Verde D�lar';
   SNameSkyBlue = 'Azul cielo';
   SNameCream = 'Crema';
   SNameMedGray = 'Gris medio';
   SNameActiveBorder = 'Borde activo';
   SNameActiveCaption = 'T�tulo activo';
   SNameAppWorkSpace = 'Espacio de trabajo de la aplicaci�n';
   SNameBackground = 'Fondo';
   SNameBtnFace = 'Face del bot�n';
   SNameBtnHighlight = 'Bot�n resaltado';
   SNameBtnShadow = 'Sombra de bot�n';
   SNameBtnText = 'Texto del bot�n';
   SNameCaptionText = 'Texto del t�tulo';
   SNameDefault = 'Predeterminado';
   SNameGradientActiveCaption = 'Subt�tulo activo de degradado';
   SNameGradientInactiveCaption = 'Subt�tulo inactivo de gradiente';
   SNameGrayText = 'Texto gris';
   SNameHighlight = 'Resaltar fondo';
   SNameHighlightText = 'Texto resaltado';
   SNameHotLight = 'Luz Caliente';
   SNameInactiveBorder = 'Borde inactivo';
   SNameInactiveCaption = 'T�tulo inactivo';
   SNameInactiveCaptionText = 'Texto de t�tulo inactivo';
   SNameInfoBk = 'Antecedentes de informaci�n';
   SNameInfoText = 'Texto informativo';
   SNameMenu = 'Fondo del men�';
   SNameMenuBar = 'Barra de men�';
   SNameMenuHighlight = 'Men� resaltado';
   SNameMenuText = 'Texto del men�';
   SNameNone = 'Ninguno';
   SNameScrollBar = 'Barra de desplazamiento';
   SName3DDkShadow = 'Sombra oscura 3D';
   SName3DLight = 'Luz 3D';
   SNameWindow = 'Fondo de la ventana';
   SNameWindowFrame = 'Marco de ventana';
   SNameWindowText = 'Texto de la ventana';

   SInvalidBitmapPixelFormat = 'Formato de p�xeles de mapa de bits no v�lido, debe ser una imagen de 32 bits';
   SJumplistsItemErrorGetpsi = 'Consultando la interfaz IPropertyStore';
   SJumplistsItemErrorInitializepropvar = 'Inicializando una propiedad variante';
   SJumplistsItemErrorSetps = 'Establecer el valor de un almac�n de propiedades';
   SJumplistsItemErrorCommitps = 'Confirmando un almac�n de propiedades';
   SJumplistsItemErrorSettingarguments = 'Configurar los argumentos de un elemento de la jumplist';
   SJumplistsItemErrorSettingpath = 'Configurar la ruta de un elemento de la jumplist';
   SJumplistsItemErrorSettingicon = 'Configurar la ubicaci�n del icono de un elemento de la jumplist';
   SJumplistsItemErrorAddingtobjarr = 'Agregar un elemento a una matriz de objetos';
   SJumplistsItemErrorGettingobjarr = 'Consultando la interfaz IObjectArray';
   SJumplistsItemErrorNofriendlyname = 'La propiedad FriendlyName de un elemento no debe estar vac�a';
   SJumplistsItemException = 'Excepci�n JumpListItem: Error %d: %s';
   SJumplistException = 'Excepci�n de JumpList: Error %d: %s';
   SJumplistErrorBeginlist = 'Iniciando una sesi�n de creaci�n para una nueva jumplist';
   SJumplistErrorAppendrc = 'Agregando un elemento a la categor�a de archivos recientes de una nueva jumplist';
   SJumplistErrorAppendfc = 'Agregando un elemento a la categor�a de archivos frecuentes de una nueva jumplist';
   SJumplistErrorAddusertasks = 'A�adiendo sus tareas a una nueva jumplist';
   SJumplistErrorAddcategory = 'Agregar una categor�a personalizada (''%s'') y sus elementos secundarios a una nueva jumplist';
   SJumplistErrorCommitlist = 'Commitiendo una nueva jumplist';
   SJumplistExceptionInvalidOS = 'El sistema operativo actual no admite jumplist';
   SJumplistExceptionAppID = 'El proceso actual ya tiene un ID de aplicaci�n';
   
   { BeginInvoke }
   
   sBeginInvokeNoHandle = 'No se puede llamar a BeginInvoke en un control sin padre o identificador de ventana';

   SToggleSwitchCaptionOn = 'Activado';
   SToggleSwitchCaptionOff = 'Desactivado';
   SInvalidRelativePanelControlItem = 'ControlItem.Control no puede configurarse como propietario de RelativePanel';
   SInvalidRelativePanelSibling = 'El control no es un hermano dentro de RelativePanel';
   SInvalidRelativePanelSiblingSelf = 'El control no se puede posicionar con respecto a s� mismo';
   SRelativePanelCircularDependency = 'Error de Panel relativo: Se detect� dependencia circular. No se pudo completar el dise�o';
   
  implementation

  end.
