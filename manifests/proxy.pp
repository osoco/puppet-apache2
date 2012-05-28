define apache2::proxy($virtualhost_name, $server_admin_mail, $is_https = false, $ssl_cert = "", $ssl_cert_key = "", 
                      $backend_url, $proxy_location = "/", $proxy_type = "http", $bypass_locations = []) {

    $mod_name = "proxy_$proxy_type"
    if !defined(Apache2::Module["$mod_name"]) {
        apache2::module { "apache2-module-$mod_name":
            modname => "$mod_name"
        }
    }

    apache2::virtualhost { "$virtualhost_name":
        virtualhost_name => "$virtualhost_name",
        server_admin_mail => "$server_admin_mail",
        virtualhost_specifics => template("apache2/proxy.erb")
    }
}
