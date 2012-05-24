define apache2::redirection($virtualhost_name, $server_admin_mail, $is_https = false, $ssl_cert = "", $ssl_cert_key = "", 
                            $origin = '/', $destination) {

    if !defined(Apache2::Module["rewrite"])
    {
        apache2::module { "rewrite":
            modname => "rewrite"
        }
    }

    apache2::virtualhost { "$virtualhost_name":
        virtualhost_name => "$virtualhost_name",
        server_admin_mail => "$server_admin_mail",
        virtualhost_specifics => template("apache2/redirection.erb")
    }
}
