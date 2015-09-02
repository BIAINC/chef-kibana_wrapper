name             'kibana_wrapper'
maintainer       'YOUR_COMPANY_NAME'
maintainer_email 'YOUR_EMAIL'
license          'All rights reserved'
description      'Installs/Configures kibana_wrapper'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'

depends 'kibana'
suggests 'nginx'
suggests 'java'
suggests 'elasticsearch'
