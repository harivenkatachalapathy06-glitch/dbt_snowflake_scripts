{{ config(
    materialized='incremental',
    unique_key='TRANSACTION_ID'
) }}

SELECT
    *
FROM {{ source('PRACTICE', 'LOAN_TRANSACTION') }}

{% if is_incremental() %}

WHERE LAST_UPDATED_TIMESTAMP >
      (SELECT MAX(LAST_UPDATED_TIMESTAMP)
       FROM {{ this }})

{% endif %}


