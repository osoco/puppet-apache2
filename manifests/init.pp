class apache2 ($version = "latest", $apache2_user = 'www-data') {

    package { "apache2":
        ensure => $version,
        notify => Exec['grant-home-access-to-apache2-user']
    }

    exec { 'grant-home-access-to-apache2-user':
       command => "chown $apache2_user:$apache2_user ~$apache2_user",
       require => Package['apache2'],
       refreshonly => true
    }

    service { "apache2":
        ensure => running,
        hasstatus => true,
        hasrestart => true,
        enable => true,
        require => Package["apache2"]
    }

}
