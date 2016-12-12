class apachewithphp{
        package {"apache2":
                ensure => "installed", allowcdrom => "true",
        }

	file {"/home/niko/public_html":
		ensure => "directory",
	}
	file{"/home/niko/public_html/index.php":
		content => template("apachewithphp/index.php.erb"),
	
	}

        file { "/etc/apache2/mods-enabled/userdir.load":
                ensure => "link",
                target => "../mods-available/userdir.load",
                notify => Service["apache2"],
        }
	
        file { "/etc/apache2/mods-enabled/userdir.conf":
                ensure => "link",
                target => "../mods-available/userdir.conf",
                notify => Service["apache2"],
        }

        package {"libapache2-mod-php":
                ensure => "installed",
		require => Package["apache2"],
	}

        file {"/etc/apache2/mods-available/php7.conf":
                content => template("apachewithphp/php7.conf.erb"),
                require => Package["apache2"],
                notify => Service["apache2"],
        }

        service {"apache2":
                ensure => "true",
                enable => "true",
		provider => "systemd",
		require => Package["apache2"],
	}
}
