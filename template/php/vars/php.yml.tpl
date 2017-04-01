php:
  version: "7.1"
  extensions:
    - php7.1-cli
    - php7.1-mysql
    - php7.1-xml
    - php7.1-mbstring
    - php7.1-intl
    - php7.1-gd
    - php7.1-zip
    - php-curl
    - php-xdebug
  pecl_extensions: []

php_apps:
  php:
    name: php
    public_path: /var/www/php
    path: /var/www/php
    index: index
    owner: vagrant
    group: vagrant
    server_name: php
    https: true
    mysql_database: php
    mysql_user: php
    mysql_password: 12345
