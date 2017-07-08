# Setting up kibana4
class elk::kibana5 {

  package{'curl':
    ensure  => present
  }

  class {'::kibana4':}

  file { '/etc/systemd/system/kibana4.service':
    ensure => file,
    mode   => '0644',
    source => 'puppet:///modules/elk/kibana4.service',
    owner  => root,
    group  => root,
  } ->
  
  exec { 'systemd-daemon-reload':
    command     => '/bin/systemctl daemon-reload',
    refreshonly => true,
  } -> Service['kibana4']

}
