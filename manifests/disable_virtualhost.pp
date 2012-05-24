define apache2::disable_virtualhost($conffile) {

    include apache2

    exec { "apache2-disable-virtualhost-$conffile":
        command => "a2dissite $conffile",
        onlyif => "test -f /etc/apache2/sites-enabled/$conffile",
        notify => Service["apache2"]
    }
}
