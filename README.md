# Description

Installs and configures rsyslog. Provides LWRP for creating rules.

# Requirements

## Platform:

* Ubuntu

# Attributes

* `node['rsyslog']['modules']['default_modules']` -  Defaults to `"%w(imuxsock imklog)"`.
* `node['rsyslog']['modules']['extra_modules']` -  Defaults to `"[ ... ]"`.
* `node['rsyslog']['preservefqdn']` -  Defaults to `"off"`.
* `node['rsyslog']['global']['ActionFileDefaultTemplate']` -  Defaults to `"RSYSLOG_TraditionalFileFormat"`.
* `node['rsyslog']['global']['RepeatedMsgReduction']` -  Defaults to `"on"`.
* `node['rsyslog']['global']['FileOwner']` -  Defaults to `"syslog"`.
* `node['rsyslog']['global']['FileGroup']` -  Defaults to `"adm"`.
* `node['rsyslog']['global']['FileCreateMode']` -  Defaults to `"0640"`.
* `node['rsyslog']['global']['DirCreateMode']` -  Defaults to `"0755"`.
* `node['rsyslog']['global']['Umask']` -  Defaults to `"0022"`.
* `node['rsyslog']['global']['PrivDropToUser']` -  Defaults to `"syslog"`.
* `node['rsyslog']['global']['PrivDropToGroup']` -  Defaults to `"syslog"`.
* `node['rsyslog']['global']['WorkDirectory']` -  Defaults to `"/var/spool/rsyslog"`.
* `node['rsyslog']['rules']['postfix']['selector']` -  Defaults to `"mail.*"`.
* `node['rsyslog']['rules']['postfix']['action']` -  Defaults to `"/var/spool/rsyslog"`.

# Recipes

* rsyslog::default - Installs and configures rsyslog

# LWRP

## `rule`
Create loging rules for rsyslog
### Parameters
<table>
<tr>
<th>Parameter</th>
<th>Description</th>
<th>Example</th>
<th>Required?</th>
<th>Default</th>
</tr>
<tr>
<td>selector</td>
<td>Facilities and priorities from log selectors separated by period(.)</td>
<td><tt>""auth,authpriv.*""</tt></td>
<td>Y</td>
<td>nil</td>
</tr>
<tr>
<td>log_action</td>
<td>Where to sent filtered records</td>
<td>"/var/log/mydaemon.log"</td>
<td>Y</td>
<td>nil</td>
</tr>
<tr>
<td>priority</td>
<td>Priority loading for generated conf file</td>
<td>15</td>
<td>Y</td>
<td>20</td>
</tr>
</table>

### `rule_input`
Create rules for getting arbitrary log files into rsyslg
### Parameters
<table>
<tr>
<th>Parameter</th>
<th>Description</th>
<th>Example</th>
<th>Required?</th>
<th>Default</th>
</tr>
<tr>
<td>prioriy</td>
<td>Priority loading for generated conf file</td>
<td><tt>15</tt></td>
<td>Y</td>
<td>20</td>
</tr>
<tr>
<td>filename</td>
<td>Logfile source from which we polling records</td>
<td><tt>"/home/myapp/current/log/production.log"</tt></td>
<td>Y</td>
<td>nil</td>
</tr>
<tr>
<td>severity</td>
<td>Severity level</td>
<td><tt>"Error"</tt></td>
<td>N</td>
<td>Info</td>
</tr>
<tr>
<td>facility</td>
<td>Group logs by facility</td>
<td><tt>"security"</tt></td>
<td>N</td>
<td>daemon</td>
</tr>
<tr>
<td>persist_interval</td>
<td>Interval for polling in ms</td>
<td><tt>"30000"</tt></td>
<td>N</td>
<td>1000</td>
</tr>
</table>


# Usage

Include ```recipe[rsyslog]``` in node runlist

For example, if you want to log all message from mail facility

```
rsyslog_rule "random-mail-service" do
priority 15
selector "mail.*"
log_action "-/var/log/mail.log"
end
```

Or if you want to send all messages to remote server

```
rsyslog_rule "udp-remote" do
selector "*.*"
log_action "@logs.example.com:514"
end
```

Using input file in rsyslog
Before using input file rule in rsyslog you need to specify imfile module in extra_modules attribute

```
rsyslog_rule_input "unicorn-rails" do
priority 15
filename "/home/rocketbank/rocketbank/current/log/production.log"
severity "error"
end
```


# License and Maintainer

Maintainer:: LLC Express 42 (<info@express42.com>)

License:: MIT
