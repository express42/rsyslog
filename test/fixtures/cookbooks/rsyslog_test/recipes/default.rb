include_recipe 'apt'
include_recipe 'rsyslog'

# rule_input lwrp
rsyslog_rule_input 'apt' do
  filename '/var/log/apt/history.log'
end

# template lwrp
rsyslog_template "gelf" do
  type "list"
  statement "\tconstant(value=\\\"{\\\"version\\\":\\\"1.1\\\",\\\")\n\tconstant(value=\"\\\"host\\\":\\\"\")\n\tproperty(name=\"hostname\")\n\tconstant(value=\"\\\",\\\"short_message\\\":\"\\\")\n\tproperty(name=\"msg\" format=\"json\")\n\tconstant(value=\"\\\",\\\"timestamp\":\\\"\\\")\n\tproperty(name=\"timegenerated\" dateformat=\"unixtimestamp\")\n\tconstant(value=\"\\\",\\\"level\\\":\\\"\")\n\tproperty(name=\"syslogseverity\")\n\tconstant(value=\"\\\"}\")\n\t"
end
