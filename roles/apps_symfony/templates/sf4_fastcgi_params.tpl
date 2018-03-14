{% for key, value in _apps_symfony_env_vars.iteritems() %}
fastcgi_param {{ key }} "{{ value }}";
{% endfor %}
