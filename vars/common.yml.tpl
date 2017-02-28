server:
    packages: [nano, vim, curl, git]
    timezone: Europe/Bucharest
    locale: en_US.UTF-8

mysql:
    root_password: ''

samba:
    user: vagrant
    password: Samba@12345
    share_root: /var/www/
    share_user: vagrant
    share_group: vagrant
