export APP_ENV={{ app.value.custom_data.env|default('dev') }}
export APP_DEBUG={{ app.value.custom_data.debug|default(1) }}
export DATABASE_URL={{ app.value.custom_data.database_url }}
