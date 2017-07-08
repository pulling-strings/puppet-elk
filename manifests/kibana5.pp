# Setting up kibana4
class elk::kibana5 {
  class { 'kibana':
    manage_repo => false,
    config      => {
      'server.port' => '8080',
      'server.host' => '0.0.0.0'
    }
  }

}
