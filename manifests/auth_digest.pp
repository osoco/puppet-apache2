class apache2::auth_digest {

    $module_suffix = "apache2_auth_digest"

    apache2::module { "authz_host-$module_suffix":
        modname => "authz_host",
    }

    apache2::module { "authn_file-$module_suffix":
        modname => "authn_file",
    }

    apache2::module { "auth_digest-$module_suffix":
        modname => "auth_digest",
    }
}
