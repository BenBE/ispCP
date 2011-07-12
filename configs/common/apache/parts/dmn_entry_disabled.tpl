<VirtualHost {DMN_IP}:80>

    <IfModule suexec_module>
           SuexecUserGroup {SUEXEC_USER} {SUEXEC_GROUP}
    </IfModule>

    ServerAdmin     webmaster@{DMN_NAME}
    DocumentRoot    {DOMAIN_DISABELED_DIR}

    ServerName      {DMN_NAME}
    ServerAlias     www.{DMN_NAME} {DMN_NAME} {SUEXEC_USER}.{BASE_SERVER_VHOST}

    RedirectMatch permanent ^/ispcp[\/]?$	{BASE_SERVER_VHOST_PREFIX}{BASE_SERVER_VHOST}/

    <Directory {DOMAIN_DISABELED_DIR}>
        Options -Indexes Includes FollowSymLinks MultiViews
        AllowOverride All
        Order allow,deny
        Allow from all
    </Directory>

</VirtualHost>
