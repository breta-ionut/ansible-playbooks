server {
    server_name {{ app.value.server_name }};

    listen 80;

    error_log /var/log/nginx/{{ app.value.name }}_error.log;
    access_log /var/log/nginx/{{ app.value.name }}_access.log;

    location / {
        proxy_pass http://127.0.0.1:{{ app.value.port }};

        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;

        proxy_http_version 1.1;
        proxy_set_header Upgrade $http_upgrade;
        proxy_set_header Connection 'upgrade';

        proxy_cache_bypass $http_upgrade;
        proxy_redirect off;
    }
}
