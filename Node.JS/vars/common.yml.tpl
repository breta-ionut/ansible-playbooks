server:
    packages: [nano, vim, curl, git]
    timezone: Europe/Bucharest
    locale: en_US.UTF-8

mysql:
    root_password: ''

samba:
    password: Samba@12345
    share_root: /var/www/

api:
    mysql_database: js-api
    mysql_user: js-api
    mysql_password: 12345
    doc_root: /var/www/js.api
    server_name: js.api
    port: 1337
    index_file: index.js

front:
    doc_root: /var/www/js.front
    server_name: js.front
