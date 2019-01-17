{% for key, value in app.value.persistent_environment.iteritems() %}
fastcgi_param {{ key }} "{{ value }}";
{% endfor %}
