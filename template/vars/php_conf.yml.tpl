php_conf_dict:
    "5.6":
        repository: ppa:ondrej/php5-5.6
        php_package: php5
        php_fpm_package: php5-fpm
        php_fpm_service: php5-fpm
        php_fpm_listen_owner: nginx
        php_fpm_listen_group: nginx
        extensions: [php5-cli, php5-mysql, php5-gd, php5-intl, php5-curl, php5-memcached, php5-xdebug, php5-mcrypt]
        pecl_extensions: []
        tools: [php-pear, php5-dev, libcurl3-openssl-dev]
        conf_path: /etc/php5
        fastcgi_path: unix:/var/run/php5-fpm.sock

    "7.0":
        repository: ppa:ondrej/php
        php_package: php7.0
        php_fpm_package: php7.0-fpm
        php_fpm_service: php7.0-fpm
        php_fpm_listen_owner: nginx
        php_fpm_listen_group: nginx
        extensions: [php7.0-cli, php7.0-mysql, php7.0-xml, php7.0-gd, php7.0-intl, php-curl, php-memcached, php-xdebug, php7.0-mcrypt]
        pecl_extensions: []
        tools: [php-pear, php7.0-dev, libcurl3-openssl-dev]
        conf_path: /etc/php/7.0
        fastcgi_path: unix:/var/run/php/php7.0-fpm.sock

    "7.1":
        repository: ppa:ondrej/php
        php_package: php7.1
        php_fpm_package: php7.1-fpm
        php_fpm_service: php7.1-fpm
        php_fpm_listen_owner: nginx
        php_fpm_listen_group: nginx
        extensions: [php7.1-cli, php7.1-mysql, php7.1-xml, php7.1-gd, php7.1-intl, php-curl, php-memcached, php-xdebug, php7.1-mcrypt]
        pecl_extensions: []
        tools: [php-pear, php7.1-dev, libcurl3-openssl-dev]
        conf_path: /etc/php/7.1
        fastcgi_path: unix:/var/run/php/php7.1-fpm.sock
