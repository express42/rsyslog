Rsyslog Cookbook
======================

TODO
-----

1. Docs
2. Templates
3. Separate remote section
4. Server?

Warning
-------

All existing rules in ```/etc/rsyslog.d``` will be removed.

Requirements
------------

This cookbook version (0.1.1) tested only on Ubuntu 12.04.

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
