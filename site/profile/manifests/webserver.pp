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
		mode => 0644,
	}		
}
