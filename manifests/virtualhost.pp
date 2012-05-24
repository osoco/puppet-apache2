define apache2::virtualhost($virtualhost_name, $server_admin_mail, $document_root = "", $virtualhost_specifics = "",
                            $is_https = false, $ssl_cert = "", $ssl_cert_key = "", $rewrite_conds = []) {

    include apache2

    notify { "Apache2: Creating virtualhost $virtualhost_name with the conf: DocumentRoot '$document_root', IsHttps '$is_https', rewrite_conds '$rewrite_conds'": }

    apache2::custom_virtualhost { "$virtualhost_name":
        conffile => "$virtualhost_name",
        content => template("apache2/virtual_host.erb")
    }
}
