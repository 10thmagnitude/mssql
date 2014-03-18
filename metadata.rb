name             'mssql'
maintainer       '10th Magnitude'
maintainer_email 'jsmyth@10thMagnitude.com'
license          'All rights reserved'
description      'Installs/Configures mssql'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'

supports         "windows"
depends          "openssl"
depends          "windows", ">= 1.2.6"
depends "minitest-handler", "~> 1.1.2"

