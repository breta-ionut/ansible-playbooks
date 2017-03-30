server {
    server_name {{ item.value.server_name }};

    listen 80;

    root {{ item.value.public_path }};
    
    error_log /var/log/nginx/{{ item.value.name }}_error.log;
    access_log /var/log/nginx/{{ item.value.name }}_access.log;

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
