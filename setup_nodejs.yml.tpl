---
- name: Set up the server
  hosts: all
  become: yes
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
