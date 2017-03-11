---
- name: Set up the server with an empty Node.JS project
  hosts: local

  become: yes
  become_user: root
  become_method: sudo

  vars_files:
    - vars/common.yml
    - vars/nodejs.yml

  roles:
    - server
    - mysql
    - node
    - nginx
    - nginx_https
    - samba
    - app_nodejs
