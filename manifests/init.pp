# Setting up elk 5.x
class elk {
  include elk::logstash
  include elk::kibana5

  Apt::Source ['elasticsearch'] -> Package['kibana']
  Apt::Source ['elasticsearch'] -> Package['logstash']

  class{'jdk': }

  class { 'elasticsearch':
    repo_version     => '5.x',
    service_provider => 'systemd',
    manage_repo      => true,
    require          => Class['jdk']
  }

  elasticsearch::instance { 'kibana-01':
    ensure => present
  }

}
