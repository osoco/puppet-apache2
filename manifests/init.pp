class apache2 ($version = "latest") {

    package { "apache2":
        ensure => $version
    }

    service { "apache2":
        ensure => running,
        hasstatus => true,
        hasrestart => true,
        enable => true,
        require => Package["apache2"]
    }

}
