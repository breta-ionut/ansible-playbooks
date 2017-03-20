php:
    version: 7.1
    extensions: [php7.1-cli, php7.1-mysql, php7.1-xml, php7.1-gd, php7.1-intl, php-curl, php-memcached, php-xdebug, php7.1-mcrypt]
    pecl_extensions: []

apps:
    symfony3:
        name: symfony3
        doc_root_path: /var/www/symfony3/web
        parent_path: /var/www
        root_dir: symfony3
        owner: vagrant
        group: vagrant
        server_name: symfony3
        mysql_database: symfony3
        mysql_user: symfony3
        mysql_password: 12345
        symfony_version: 3.2
