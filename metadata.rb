name             'rails-app'
maintainer       'Nick Prokesch'
maintainer_email 'nick@prokes.ch'
license          'All rights reserved'
description      'Installs/Configures a rails app'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.5.1'
depends          'supervisor'
depends          'redis'
depends          'apt'
depends          'puma'
