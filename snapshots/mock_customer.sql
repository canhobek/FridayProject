{% snapshot mock_customer %}

{% set new_schema= target.schema + '_snapshot' %}

    {{
        config(
            target_database=target.database,
            target_schema=new_schema,
            unique_key='C_CUSTKEY',
            
            strategy='check',
            check_cols='all'
        )
    }}

    select * from {{ source('public', 'customer') }}
 {% endsnapshot %}