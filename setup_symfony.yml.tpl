---
- name: Set up the server
  hosts: all
  become: yes
  vars_files:
    - vars/php_conf.yml
    - vars/common.yml
    - vars/symfony.yml
  roles:
    - php_conf
    - server
    - mysql
    - php
    - nginx
    - nginx_https
    - samba
    - composer
    - symfony
    - app_symfony
