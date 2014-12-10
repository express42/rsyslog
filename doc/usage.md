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

See fixture cookbook in `tests/fixtures/cookbooks`.
