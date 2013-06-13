define apache2::module($modname = "$name") {

    include apache2

    file { "$modname-$name":
        path => "/etc/apache2/mods-available/$modname.load",
        owner => "root",
        group => "root",
        mode => 0640,
    }

    exec { "apache2-module-$modname-$name":
        command => "a2enmod $modname",
        creates => "/etc/apache2/mods-enabled/$modname.load",
        require => File["/etc/apache2/mods-available/$modname.load"],
        notify => Service["apache2"]
    }
}
