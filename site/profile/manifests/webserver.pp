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


::apache::vhost { 'devops-webserver.automagine.net non-ssl':
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
