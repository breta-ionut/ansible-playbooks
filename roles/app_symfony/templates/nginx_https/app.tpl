server {
    server_name {{ item.value.server_name }};
    
    listen 443 ssl http2 default_server;
    listen [::]:443 ssl http2 default_server;

    root {{ item.value.doc_root_path }};
    
    error_log /var/log/nginx/{{ item.value.name }}_error.log;
    access_log /var/log/nginx/{{ item.value.name }}_access.log;

    ssl_certificate /etc/nginx/ssl/{{ item.value.name }}.crt;
    ssl_certificate_key /etc/nginx/ssl/{{ item.value.name }}.key;
    ssl_dhparam /etc/nginx/ssl/dhparam.pem;

    add_header Strict-Transport-Security "max-age=15768000; includeSubDomains" always;

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
        fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
    }

    # PROD
    location ~ ^/app\.php(/|$) {
        fastcgi_pass {{ php_conf.fastcgi_path }};
        fastcgi_split_path_info ^(.+\.php)(/.*)$;
        include fastcgi_params;
        fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;

        #Prevents URIs that include the front controller. This will 404:
        #http://domain.tld/app.php/some-path
        #Remove the internal directive to allow URIs like this
        internal;
    }
}

server {
   server_name {{ item.value.server_name }};

   listen 80;
   listen [::]:80;

   return 301 https://$server_name$request_uri;
}
