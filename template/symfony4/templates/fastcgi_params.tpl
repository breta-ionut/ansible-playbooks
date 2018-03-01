fastcgi_param APP_ENV {{ app.value.custom_data.env|default('dev') }};
fastcgi_param APP_DEBUG {{ app.value.custom_data.debug|default(1) }};
fastcgi_param DATABASE_URL "{{ app.value.custom_data.database_url }}";
