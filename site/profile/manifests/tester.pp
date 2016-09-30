class profile::tester {
	package { "httpd":
		ensure => installed,
	}
	package { "mod_ssl":
		ensure => installed,
	}
	package { "apr-util":
		ensure => installed,
	}
}
