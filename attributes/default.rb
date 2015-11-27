override['redis']['source']['version'] = '2.8.21'
override['redis']['source']['url']     = 'http://download.redis.io/releases'

node.override['redis']['user']             = 'redis'
node.override['redis']['group']            = 'redis'
node.override['redis']['src_dir']          = '/usr/src/redis'
node.override['redis']['dst_dir']          = '/opt/redis'
node.override['redis']['source']['sha']    = '2741bf67093e38ec23494f0882794160f01e9f34a379a2ddf828b64260015d3b'
node.override['redis']['symlink_binaries'] = false

default['nginx']['gzip']              = 'on'
default['nginx']['gzip_static']       = 'on'
default['nginx']['gzip_http_version'] = '1.0'
default['nginx']['gzip_comp_level']   = '2'
default['nginx']['gzip_proxied']      = 'any'
default['nginx']['gzip_vary']         = 'off'
default['nginx']['gzip_buffers']      = nil
