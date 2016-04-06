server {
    server_name {{ front.server_name }};
    listen 80;

    root {{ front.doc_root }};
    
    error_log /var/log/nginx/front_error.log;
    access_log /var/log/nginx/front_access.log;

    location / {
        try_files $uri /index.html$is_args$args;
    }
}
