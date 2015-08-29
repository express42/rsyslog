#
# Cookbook Name:: rsyslog
# Provider:: template
#
# Author:: LLC Express 42 (info@express42.com)
#
# Copyright (C) LLC 2015 Express 42
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

action :create do
  action_name = new_resource.name
  action_type = new_resource.type
  action_rule = new_resource.rule
  action_priority = new_resource.priority

  template "/etc/rsyslog.d/#{action_priority}-#{action_name}.conf" do
    source 'action.conf.erb'
    owner 'root'
    group 'root'
    mode '0644'
    variables(
      name: action_name,
      type: action_type,
      rule: action_rule
    )
    cookbook 'rsyslog'
    notifies :restart, 'service[rsyslog]', :delayed
  end

  new_resource.updated_by_last_action(true)
end
