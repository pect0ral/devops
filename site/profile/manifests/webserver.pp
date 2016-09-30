class profile::webserver {
	$index_content = "<html>
  	<head>
		<title>Hello World</title> </head>
	<body>
		<h1>Hello World!</h1>
  	</body>		
</html>"

	file {  '/var/www/html/index.html':
		content => $index_content,
		mode => '0644',
	}		


class { '::apache':
  default_vhost => false,
}
class {'::firewall': }
class {'::firewallchain': }

::firewall { '100 allow http and https access':
    dport   => [80, 443],
    proto  => tcp,
    action => accept,
  }
::firewall { '200 allow ssh access':
    dport   => 22,
    proto  => tcp,
    action => accept,
  }
::firewallchain { 'INPUT:filter:IPv4':
  ensure => present,
  policy => drop,
  before => undef,
}


::apache::vhost { 'devops-webserver.automagene.net non-ssl':
  servername      => 'devops-webserver.automagine.net',
  port            => '80',
  docroot         => '/var/www/html',
  redirect_status => 'permanent',
  redirect_dest   => 'https://devops-webserver.automagine.net/',
}

::apache::vhost { 'devops-webserver.automagine.net ssl':
  servername => 'devops-webserver.automagine.net',
  port       => '443',
  docroot    => '/var/www/html',
  ssl        => true,
}
}
