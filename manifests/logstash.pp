# Setting up logstash for streaming data into Kibana
class elk::logstash {
  class { '::logstash':
    manage_repo      => false,
    service_provider => 'systemd'
  }
}
