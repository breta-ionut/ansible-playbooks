server {
    server_name {{ app.value.server_name }};

    listen 80;

    root {{ app.value.public_path }};
    
    error_log /var/log/nginx/{{ app.value.name }}_error.log;
    access_log /var/log/nginx/{{ app.value.name }}_access.log;

    location / {
        try_files $uri /{{ app.value.index }}.php$is_args$args;
    }

    location ~ ^/{{ app.value.index }}\.php(/|$) {
        fastcgi_pass {{ php_conf.fastcgi_path }};
        fastcgi_split_path_info ^(.+\.php)(/.*)$;

        include fastcgi_params;
    {% if app.value.custom_fastcgi_params|default(false) %}
        include /etc/nginx/{{ app.key }}_params;
    {% endif %}
        fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
    }
}
