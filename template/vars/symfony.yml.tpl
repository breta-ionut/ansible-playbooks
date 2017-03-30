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

symfony_apps:
  symfony3:
    name: symfony3
    doc_root_path: /var/www/symfony3/web
    parent_path: /var/www
    root_dir: symfony3
    owner: vagrant
    group: vagrant
    server_name: symfony3
    https: true
    mysql_database: symfony3
    mysql_user: symfony3
    mysql_password: 12345
    symfony_version: 3.2
