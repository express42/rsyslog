include_recipe 'apt'
include_recipe 'rsyslog'

rsyslog_rule_input 'apt' do
  filename '/var/log/apt/history.log'
end
