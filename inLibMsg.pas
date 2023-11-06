{*******************************************************}
{                                                       }
{       FactuZam                                        }
{                                                       }
{       Copyright (C) 2023 Alejandro Laorden Hidalgo    }
{                                                       }
{*******************************************************}

unit inLibMsg;

interface
  type
    TMessage = class

    end;

    var

      SClassRttiNotFnd:string = 'Clase %s no encontrada en rtti. ' +
                                  'Hay un error al crear el formulario';
      SLocateNotFnd:string = 'El dato o datos %s no se han encontrado en %s';
      SResWinFNotFnd:string = '%s no encontrada en las tabla del sistema' +
                                ' fza_winforms';
      SCliToTbl:string = 'Cliente: %s pasado correctamente a la tabla de ' +
                         'clientes';
      SEmpToTbl:string = 'Empresa: %s pasada correctamente a la tabla de '+
                         'empresas';

  implementation


end.
