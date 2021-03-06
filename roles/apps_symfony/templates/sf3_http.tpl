server {
    server_name {{ app.value.server_name }};

    listen 80;

    root {{ app.value.path }}/web;
    
    error_log /var/log/nginx/{{ app.value.name }}_error.log;
    access_log /var/log/nginx/{{ app.value.name }}_access.log;

    location / {
        try_files $uri /app_dev.php$is_args$args;
    }
    
    # DEV
    # This rule should only be placed on your development environment
    # In production, don't include this and don't deploy app_dev.php or config.php
    location ~ ^/(app_dev|config)\.php(/|$) {
        fastcgi_pass {{ php_conf.fastcgi_path }};
        fastcgi_split_path_info ^(.+\.php)(/.*)$;

        include fastcgi_params;
    {% if app.value.custom_fastcgi_params|default(false) %}
        include {{ app.key }}_params;
    {% endif %}
        fastcgi_param SCRIPT_FILENAME $realpath_root$fastcgi_script_name;
        fastcgi_param DOCUMENT_ROOT $realpath_root;

        internal;
    }

    # PROD
    location ~ ^/app\.php(/|$) {
        fastcgi_pass {{ php_conf.fastcgi_path }};
        fastcgi_split_path_info ^(.+\.php)(/.*)$;

        include fastcgi_params;
    {% if app.value.custom_fastcgi_params|default(false) %}
        include {{ app.key }}_params;
    {% endif %}
        fastcgi_param SCRIPT_FILENAME $realpath_root$fastcgi_script_name;
        fastcgi_param DOCUMENT_ROOT $realpath_root;
    }
}
