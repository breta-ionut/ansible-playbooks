{% for key, value in app.value.persistent_environment %}
fastcgi_param {{ key }}="{{ value }}";
{% endif %}
