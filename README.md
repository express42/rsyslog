# Description

Installs and configures rsyslog v6 and v7+. Provides LWRP for creating rules.

# Requirements
Rsyslog native package or latest rsyslog stable package from official repository.

## Platform:
* Ubuntu 14.04

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

* rsyslog::default - Installs and configures rsyslog.

# Resources
* [rsyslog_rule](#rsyslog_rule)
* [rsyslog_rule_input](#rsyslog_rule_input)
* [rsyslog_template](#rsyslog_template)

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

### `template`
Create template to specify the log format 
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
<td>type</td>
<td>Type of template, list or string is available.</td>
<td><tt>"list"</tt></td>
<td>Y</td>
<td>string</td>
</tr>
<tr>
<td>statement</td>
<td>statement defined to created template</td>
<td><tt>"/var/log/system-%HOSTNAME%.log"</tt></td>
<td>Y</td>
<td>nil</td>
</tr>
</table>



# Usage

Include `recipe[rsyslog]` in node runlist

## Using rsyslog_rule
If you want to log all message from mail facility:

```
rsyslog_rule 'random-mail-service' do
  priority 15
  selector 'mail.*'
  log_action '-/var/log/mail.log'
end
```

Or if you want to send all messages to remote server:

```
rsyslog_rule 'udp-remote' do
  selector '*.*'
  log_action '@logs.example.com:514'
end
```

## Using rsyslog_rule_input
Before using input rule you need to specify `imfile` module in `extra_modules` attribute.

```
rsyslog_rule_input "unicorn-rails" do
  priority 15
  filename "/home/rocketbank/rocketbank/current/log/production.log"
  severity "error"
end
```

## Using template
Create template for GELF ouput using in rules (need lots of escaping currently)

```
rsyslog_template 'gelf' do
  type 'list'
  statement 'constant(value="{\"version\":\"1.1\",")
  constant(value="\"host\":\"")
  property(name="hostname")
  constant(value="\",\"short_message\":\"")
  property(name="msg" format="json")
  constant(value="\",\"timestamp\":\"")
  property(name="timegenerated" dateformat="unixtimestamp")
  constant(value="\",\"level\":\"")
  property(name="syslogseverity")
  constant(value="\"}")'
end
```

## Using action
Create actions for sending output data to graylog server using GELF protocol

```
rsyslog_action 'gelf_output' do
  type 'omfwd'
  rule 'target="graylog.example.org" port="12201" protocol="udp" template="gelf"'
end
```

Sends data go kafka first, insted logging server

```
rsyslog_action 'kafka_output' do
  type 'omkafka'
  rule 'broker=['kafka01.exampler.org:9092', 'kafka02.exampler.org:9092'] topic="logger" confParam=["compression.codec=snappy"]'
end

```

See fixture cookbook in `tests/fixtures/cookbooks`.


# License and Maintainer

Maintainer:: LLC Express 42 (<cookbooks@express42.com>)

License:: MIT
