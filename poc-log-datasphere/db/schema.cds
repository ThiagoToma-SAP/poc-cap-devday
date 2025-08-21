namespace poc_log_datasphere.db;

using {
    managed,
    cuid
} from '@sap/cds/common';

entity Logs: managed, cuid {
      level        : String(10);       // DEBUG, INFO, WARN, ERROR
      serviceName  : String(100);      // Nome do serviço ou app
      hostname     : String(100);      // Host onde ocorreu o log
      message      : LargeString;      // Mensagem principal
      tags         : Composition of many LogTag on tags.parent = $self; // Tags dinâmicas
      metadata     : LargeString;       // Info adicional (ex: stack trace, payloads)
}

entity LogTag: managed, cuid {
  key parent : Association to Logs;
  key name   : String(50);
  value      : String(255);
}