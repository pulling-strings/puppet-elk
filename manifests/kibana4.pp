# Setting up kibana4
class kibana4 {

  include kibana4

  file { '/etc/systemd/system/kibana4.service':
    ensure=> file,
    mode  => '0644',
    source=> 'puppet:///elk/module/kibana4.service',
    owner => root,
    group => root,
  } ->
  
  exec { "systemd-daemon-reload":
    command     => "/bin/systemctl daemon-reload",
    refreshonly => true,
  } -> Service['kibana4']

}
