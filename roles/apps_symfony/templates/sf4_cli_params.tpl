export APP_ENV=dev
export APP_DEBUG=1
export DATABASE_URL="mysql://{{ app.value.mysql_user }}:{{ app.value.mysql_password }}@127.0.0.1:3306/{{ app.value.mysql_database }}"
