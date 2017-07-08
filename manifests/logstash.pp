# Setting up logstash for streaming data into Kibana
# Cluster is the internal elasticsearch output cluster name
class elk::logstash {
  class { 'logstash':
    manage_repo      => false,
    service_provider => 'systemd'
  }

  logstash::configfile { 'inputs':
    source=> 'puppet:///modules/logconf/syslog.conf',
  }

}
