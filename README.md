puppet-apache2
==============

Puppet module to manage apache2, with hability to enable or disable virtualhosts and modules. Currently, it only works in Debian family. Examples:

    class my_apache_conf {

        apache2::module { "fastcgi":
            modname => "fastcgi",
        }

        apache2::disable_virtualhost { "000-default":
            conffile => "000-default",
        }

        apache2::proxy { "apache2-proxy-tomcat":
           virtualhost_name => 'mytomcatapp.com',
           server_admin_mail => 'admin@mytomcatapp.com',
           backend_url => '127.0.0.1:8080'
        }

        apache2::redirection { "apache2-jenkins-redirect":
            virtualhost_name => 'jenkins.myorg.com',
            server_admin_mail => 'admin@myorg.com',
            destination => 'http://continuos-integration.myorg.com/jenkins'
        }
    }

For more advanced usages, you can check out the projects https://github.com/osoco/puppet-apache2_svn and https://github.com/osoco/puppet-apache2_trac

