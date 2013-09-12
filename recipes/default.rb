#
# Cookbook Name:: rsyslog
# Recipe:: default
#
# Copyright 2012, LLC Express 42
#
# Permission is hereby granted, free of charge, to any person obtaining
# a copy of this software and associated documentation files (the
# "Software"), to deal in the Software without restriction, including
# without limitation the rights to use, copy, modify, merge, publish,
# distribute, sublicense, and/or sell copies of the Software, and to
# permit persons to whom the Software is furnished to do so, subject to
# the following conditions:
#
# The above copyright notice and this permission notice shall be
# included in all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
# EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
# MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
# NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
# LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
# OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
# WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
#

package "rsyslog"

service 'rsyslog' do
  supports :restart => true
  action [:enable, :start]
end

modules = (node['rsyslog']['modules']['default_modules'] + node['rsyslog']['modules']['extra_modules']).uniq

template "/etc/rsyslog.conf" do
  source "rsyslog.conf.erb"
  variables(
    :modules => modules,
    :global => node['rsyslog']['global']
  )
  notifies :restart, "service[rsyslog]"
end

execute "remove default logging rules" do
  command "rm -rf /etc/rsyslog.d/*"
end

rsyslog_rule "postfix" do
  selector "mail.*"
  log_action "/var/log/mail.log"
end

rsyslog_rule "remote" do
  selector "*.*"
  log_action "@10.0.2.2"
end
