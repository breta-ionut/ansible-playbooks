server {
    server_name {{ app.value.server_name }};

    listen 80;

    root {{ app.value.public_path }};

    error_log /var/log/nginx/{{ app.value.name }}_error.log;
    access_log /var/log/nginx/{{ app.value.name }}_access.log;

    location / {
        try_files $uri /index.html$is_args$args;
    }
}
