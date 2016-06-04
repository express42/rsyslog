name             'rsyslog'
maintainer       'LLC Express 42'
maintainer_email 'cookbooks@express42.com'
license          'MIT'
description      'Installs and configures rsyslog. Provides LWRP for creating rules.'
version          '1.0.0'
issues_url       'https://github.com/express42-cookbooks/rsyslog/issues'
source_url       'https://github.com/express42-cookbooks/rsyslog'

recipe           'rsyslog::default', 'Installs and configures rsyslog.'
recipe           'rsyslog::apt_official_repo', 'Setup official ppa rsyslog repository with latest stable version'

supports         'ubuntu'
