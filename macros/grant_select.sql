{% macro grant_select(schema = target.schema, role = target.role) %}
    -- Here we are defining the actual SQL statement that we want to run. 
    -- To do so, we add a 'set' block. 
    -- This operates the same as a single line 'set' statement
    {% set query %}
        grant usage on schema {{ schema }} to role {{ role }};
        grant select on all tables in schema {{ schema }} to role {{ role }};
        grant select on all views in schema {{ schema }} to role {{ role }};
    {% endset %}

    -- If I specify 'info = True', I'm going to get the message out into the actual terminal output as wess as the detailed logs.
    -- If 'info = False', which is the default, it's only going to go into the rich logs.
    {{ log('Granting select on all tables and views in chema ' ~ schema ~ ' to role ' ~ role, info = True ) }}

    -- 'do' - it is a Jinja call that will execute some sort of code. It won't print anything, but it will do whatever sort of operation we define here
    {% do run_query(query) %}
    {{ log('Privileges granted', info = True)}}
{% endmacro %}