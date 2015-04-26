# Setting Elasticsearch Kibana 4 and logstash
class elk {
  include elk::logstash
  class {'kibana4': }

  class{'jdk':
    version => '8'
  } -> Package['logstash']

  class { 'elasticsearch':
    manage_repo  => true,
    repo_version => '1.4',
  }

  elasticsearch::instance { 'kibana4':
    config                     => {
      'http.cors.enabled'      => true,
      'http.cors.allow-origin' => '"*"'
    }
  }

}
