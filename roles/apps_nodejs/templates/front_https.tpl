server {
    server_name {{ app.value.server_name }};

    listen 443 ssl http2;
    listen [::]:443 ssl http2;

    root {{ app.value.public_path }};

    error_log /var/log/nginx/{{ app.value.name }}_error.log;
    access_log /var/log/nginx/{{ app.value.name }}_access.log;

    ssl_certificate /etc/nginx/ssl/{{ app.value.name }}.crt;
    ssl_certificate_key /etc/nginx/ssl/{{ app.value.name }}.key;
    ssl_dhparam /etc/nginx/ssl/dhparam.pem;

    add_header Strict-Transport-Security "max-age=15768000; includeSubDomains" always;

    location / {
        try_files $uri /index.html$is_args$args;
    }
}

server {
    server_name {{ app.value.server_name }};

    listen 80;
    listen [::]:80;

    return 301 https://$server_name$request_uri;
}
