#
# Cookbook Name:: rsyslog
# Provider:: rule_input
#
# Author:: LLC Express 42 (info@express42.com)
#
# Copyright (C) LLC 2012 Express 42
#
# Permission is hereby granted, free of charge, to any person obtaining a copy of
# this software and associated documentation files (the "Software"), to deal in
# the Software without restriction, including without limitation the rights to
# use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies
# of the Software, and to permit persons to whom the Software is furnished to do
# so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.
#

action :rule_input do

  rule_name = new_resource.name
  priority = new_resource.priority
  filename = new_resource.filename
  state_file = rule_name
  tag = new_resource.name
  severity = new_resource.severity
  facility = new_resource.facility
  persist_interval = new_resource.persist_interval

  template "/etc/rsyslog.d/#{priority}-#{rule_name}.conf" do
    source "rule-input.conf.erb"
    owner "root"
    group "root"
    mode 0644
    variables(
      :filename => filename,
      :state_file => state_file,
      :severity => severity,
      :facility => facility,
      :persist_interval => persist_interval,
      :tag => tag
    )
    cookbook "rsyslog"
    notifies :restart, "service[rsyslog]", :delayed
  end
end
