class mysql{
        package {"mysql-server":
		ensure => "installed",
        }
	package {"mysql-client":
		ensure => "installed",
	}
	file{"/tmp/mysql.txt":
                content => template("mysql/mysql_ohje.erb"),
	}
}
