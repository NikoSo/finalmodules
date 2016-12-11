class apache {
	
	# Asennetaan Apache2
	package {"apache2":
	ensure => "installed",
	# allowcdrom => "true",
}
	
	#Luodaan index.html kansio ja sinne sisältöä
file {"/var/www/html/index.html":
	content => "Tämä on Nikon harjoitus 2.\n",
}

        #Luodaan käyttäjälle niko public_html -kansio
file {"/home/niko/public_html":
        ensure => "directory",
}

        #Luodaan käyttäjälle index_html -tiedosto ja sinne sisältöä.
file {"/home/niko/public_html/index.html":
        content => "Tämä on käyttäjän Niko testisivu",
}

	# Otetaan käyttäjien kotihakemisto käyttöön(Vastaa sudo a2enmod 
	# userdir -komentoa

file { '/etc/apache2/mods-enabled/userdir.conf':
	ensure => 'link',
	target => '../mods-available/userdir.conf',
	notify => Service["apache2"],
}

file { '/etc/apache2/mods-enabled/userdir.load':
	ensure => 'link',
	target => '../mods-available/userdir.load',
notify => Service["apache2"],
}

service {"apache2":
	ensure => "true",
	enable => "true",
	# provider => "systemd",
}

}
