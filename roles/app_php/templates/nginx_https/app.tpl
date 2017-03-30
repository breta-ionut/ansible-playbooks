server {
    server_name {{ item.value.server_name }};
    
    listen 443 ssl http2 default_server;
    listen [::]:443 ssl http2 default_server;

    root {{ item.value.public_path }};
    
    error_log /var/log/nginx/{{ item.value.name }}_error.log;
    access_log /var/log/nginx/{{ item.value.name }}_access.log;

    ssl_certificate /etc/nginx/ssl/{{ item.value.name }}.crt;
    ssl_certificate_key /etc/nginx/ssl/{{ item.value.name }}.key;
    ssl_dhparam /etc/nginx/ssl/dhparam.pem;

    add_header Strict-Transport-Security "max-age=15768000; includeSubDomains" always;

    location / {
        try_files $uri /{{ item.value.index }}.php$is_args$args;
    }

    location ~ ^/{{ item.value.index }}\.php(/|$) {
        fastcgi_pass {{ php_conf.fastcgi_path }};
        fastcgi_split_path_info ^(.+\.php)(/.*)$;
        include fastcgi_params;
        fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
    }
}

server {
   server_name {{ item.value.server_name }};

   listen 80;
   listen [::]:80;

   return 301 https://$server_name$request_uri;
}
