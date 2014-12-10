name             'rsyslog'
maintainer       'LLC Express 42'
maintainer_email 'cookbooks@express42.com'
license          'MIT'
description      'Installs and configures rsyslog. Provides LWRP for creating rules.'
version          '0.0.5'

recipe           'rsyslog::default', 'Installs and configures rsyslog.'

supports         'ubuntu'
