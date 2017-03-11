---
- name: Set up the server with an empty Symfony project
  hosts: localhost

  become: yes
  become_user: root
  become_method: sudo

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
