define apache2::custom_virtualhost($conffile, $source = "", $content = "") {

    include apache2

    if ($source != "") {
        file { "/etc/apache2/sites-available/$conffile":
            owner => "root",
            group => "root",
            mode => "0640",
	    notify => Service["apache2"],
            require => Package["apache2"],
            source => "$source",
        }
    }
    elsif ($content != "") {
        file { "/etc/apache2/sites-available/$conffile":
            owner => "root",
            group => "root",
            mode => "0640",
	    notify => Service["apache2"],
            require => Package["apache2"],
            content => "$content",
        }
    }

    exec { "apache2-custom-virtualhost-$conffile":
        command => "a2ensite $conffile",
        creates => "/etc/apache2/sites-enabled/$conffile",
        require => File["/etc/apache2/sites-available/$conffile"],
        notify => Service["apache2"]
    }
}
