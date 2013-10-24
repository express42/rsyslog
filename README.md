Rsyslog Cookbook
======================

TODO
-----

1. Docs
2. More complex templates for rsyslog
3. Separate remote section
4. Server?

Warning
-------

Default existing rules file ```/etc/rsyslog.d/50-default.conf``` will be removed.

This cookbook version (0.0.2) tested only on Ubuntu 12.04.

Requirements
------------
Resources/Providers
-------------------
#### `rule`
Create loging rules for rsyslog
##### Parameters
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

#### `rule_input`
Create rules for getting arbitrary log files into rsyslg
##### Parameters
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

Usage
-----

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

License and Author
==================

Author:: Express 42 (<info@express42.com>)

Copyright (C) 2012-2013 LLC Express 42

Permission is hereby granted, free of charge, to any person obtaining a copy of
this software and associated documentation files (the "Software"), to deal in
the Software without restriction, including without limitation the rights to
use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies
of the Software, and to permit persons to whom the Software is furnished to do
so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.
THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
