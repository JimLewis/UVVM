library ieee;
  use ieee.std_logic_1164.all;
  use ieee.numeric_std.all;
  use ieee.math_real.all;
  use ieee.numeric_std.all;
  use std.textio.all;

library uvvm_util;
-- context uvvm_util.uvvm_util_context;
-- Looking for minimial set of packages referenced
use uvvm_util.types_pkg.all;
use uvvm_util.adaptations_pkg.all;
use uvvm_util.global_signals_and_shared_variables_pkg.all;
use uvvm_util.string_methods_pkg.all;


package asertion_methods_pkg is
  procedure log(
    msg_id          : t_msg_id;
    msg             : string;
    scope           : string            := C_TB_SCOPE_DEFAULT;
    msg_id_panel    : t_msg_id_panel    := shared_msg_id_panel;
    log_destination : t_log_destination := shared_default_log_destination;
    log_file_name   : string            := C_LOG_FILE_NAME;
    open_mode       : file_open_kind    := append_mode
  );

  procedure alert(
    constant alert_level : t_alert_level;
    constant msg         : string;
    constant scope       : string := C_TB_SCOPE_DEFAULT
  );


end package asertion_methods_pkg;
package body asertion_methods_pkg is

  -- OSVVM all logs in assertions_pkg are affirmations.  Remap to log_passed
  procedure log (
    msg_id          : t_msg_id;
    msg             : string;
    scope           : string            := C_TB_SCOPE_DEFAULT;
    msg_id_panel    : t_msg_id_panel    := shared_msg_id_panel;
    log_destination : t_log_destination := shared_default_log_destination;
    log_file_name   : string            := C_LOG_FILE_NAME;
    open_mode       : file_open_kind    := append_mode
  ) is
  begin
    uvvm_util.methods_pkg.log_passed(msg_id, msg, scope, msg_id_panel, log_destination, log_file_name, open_mode) ;
  end procedure log ;

  procedure alert (
    constant alert_level : t_alert_level;
    constant msg         : string;
    constant scope       : string := C_TB_SCOPE_DEFAULT
  ) is
  begin
    uvvm_util.methods_pkg.affirm_error(alert_level, msg, scope) ;
  end alert ;


end package body asertion_methods_pkg;

