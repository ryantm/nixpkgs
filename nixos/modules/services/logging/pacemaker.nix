{ config, lib, pkgs, ... }:

with lib;

let
  cfg = config.services.pacemaker;

  pacemakerConfigFile = pkgs.writeText "pacemaker" ''
  '';

  stateDir = "/var/lib/pacemaker";

in
{
  options = {

    services.pacemaker = {

      enable = mkEnableOption "pacemaker";

    };
  };

  config = mkIf cfg.enable {

    systemd.tmpfiles.rules = [
      "d '${stateDir}' - nobody nogroup - -"
      "d '/var/log/pacemaker' - nobody nogroup - -"
    ];

    systemd.services.pacemaker = {
      description = "Pacemaker HA service";
      after = [ "network.target" ];
      wantedBy = [ "multi-user.target" ];
      serviceConfig = {
        ExecStart="${pkgs.pacemaker}/bin/pacemakerd";
        WorkingDirectory = stateDir;
      };
    };

    meta.maintainers = with maintainers; [ ryantm ];
  };

}
