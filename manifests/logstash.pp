# Setting up logstash for streaming data into Kibana
# Cluster is the internal elasticsearch output cluster name
class elk::logstash(
  $cluster = false,
  $version = '1.4'
) {

  class { '::logstash':
    init_defaults_file => 'puppet:///modules/elk/logstash',
    manage_repo        => true,
    repo_version       => $version
  }

  logstash::configfile { 'elastic_output':
    content => template('elk/elastic_output.erb'),
    order   => 10
  }

  logstash::configfile { 'gelf_input':
    source => 'puppet:///modules/elk/gelf_input',
    order  => 10
  }

  logstash::configfile { 'tcp_input':
    source => 'puppet:///modules/elk/tcp_input',
    order  => 10
  }

  file_line { 'logstash LS_USER':
    ensure => absent,
    path   => '/etc/default/logstash',
    line   => 'LS_USER=logstash'
  } ->

  file_line { 'root LS_USER':
    path => '/etc/default/logstash',
    line => 'LS_USER=root'
  } ~> Service['logstash']

}
