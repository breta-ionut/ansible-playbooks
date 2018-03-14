{% for key, value in _apps_symfony_env_vars %}
fastcgi_param {{ key }} "{{ value }}";
{% endif %}
