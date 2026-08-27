{% snapshot loan_snapshot %}

{{
    config(
        target_schema='PRACTICE',
        unique_key='LOAN_ID',
        strategy='timestamp',
        updated_at='UPDATED_DTTM'
    )
}}

SELECT
    *
    
FROM {{ source('PRACTICE', 'LOAN') }}

{% endsnapshot %}