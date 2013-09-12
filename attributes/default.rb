# Cookbook Name:: rsyslog
# Attributes:: default

# Modules 
default['rsyslog']['modules']['default_modules'] = ["imuxsock", "imklog"]
default['rsyslog']['modules']['extra_modules'] = []

# Global
default['rsyslog']['global']['ActionFileDefaultTemplate'] = "RSYSLOG_TraditionalFileFormat"
default['rsyslog']['global']['RepeatedMsgReduction'] = "on"
default['rsyslog']['global']['FileOwner'] = "syslog"
default['rsyslog']['global']['FileGroup'] = "adm"
default['rsyslog']['global']['FileCreateMode'] = "0640"
default['rsyslog']['global']['DirCreateMode'] = "0755"
default['rsyslog']['global']['Umask'] = "0022"
default['rsyslog']['global']['PrivDropToUser'] = "syslog"
default['rsyslog']['global']['PrivDropToGroup'] = "syslog"
default['rsyslog']['global']['WorkDirectory'] = "/var/spool/rsyslog"

# Default Rules
default['rsyslog']['rules']['postfix']['selector'] = "mail.*"
default['rsyslog']['rules']['postfix']['action'] = "/var/spool/rsyslog"

