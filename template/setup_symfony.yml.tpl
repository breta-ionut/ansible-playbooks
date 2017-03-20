---
- name: Set up the server with an empty Symfony project
  hosts: localhost

  become: yes
  become_user: root
  become_method: sudo

  vars_files:
    - vars/symfony.yml

  roles:
    - server
    - mysql
    - php
    - nginx
    - nginx_https
    - samba
    - composer
    - symfony
    - app_symfony
