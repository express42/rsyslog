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
