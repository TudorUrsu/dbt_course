{#
    Let's develop a macro that: 
    1. queries the information schema of a database 
    2. finds objects that are > 1 week old (no longer maintained) 
    3. generates automated drop statements 
    4. has the ability to execute those drop statements 
#}

{% macro clean_stale_models(database = target.database, schema = target.schema, days = 7) %}

    {% set get_rop_commands_query %}
        SELECT 
            CASE 
                WHEN table_type = 'VIEW' 
                    THEN table_type
                ELSE 
                    'TABLE' 
            END AS drop_type, 
            'DROP' || drop_type || ' {{database | upper}}.' || table_schema || '.' || table_name || ';'
        FROM {{ database }}.information_schema.tables 
        WHERE table_schema = UPPER('{{ schema }}')
            AND last_altered <= current_date - {{ days }}
    {% endset %}

    {{ log ('\nGenerating cleanup queries...\n', info = True) }}
    {% set drop_queries = run_query(get_drop_commands_query).columns[1].values() %}

    {% for item in sequence %}

    {% endfor %}

{% endmacro %}