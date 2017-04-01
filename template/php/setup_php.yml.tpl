---
- name: Set up the server with an empty PHP application
  hosts: localhost

  become: yes
  become_user: root
  become_method: sudo

  vars_files:
    - vars/php.yml

  roles:
    - server
    - mysql
    - php
    - nginx
    - nginx_https
    - samba
    - composer
    - symfony
    - app_php
