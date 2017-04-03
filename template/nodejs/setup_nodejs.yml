---
- name: Set up the server with an empty Node.JS project
  hosts: localhost

  become: yes
  become_user: root
  become_method: sudo

  vars_files:
    - vars/nodejs.yml

  roles:
    - server
    - mysql
    - node
    - nginx
    - nginx_https
    - samba
    - app_nodejs
