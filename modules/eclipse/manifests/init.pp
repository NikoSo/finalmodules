class eclipse{
        package {"eclipse":
                ensure => "installed",
        }
	package {"default-jre":
                ensure => "installed",
        }
	file{"/usr/lib/eclipse/eclipse.ini":
                content => template("eclipse/eclipse.ini.erb"),

        }
}
