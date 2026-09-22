{{ config(materialized='ephemeral') }}

WITH source AS (

    SELECT * 
    FROM {{source('airstats', 'comments') }}
)

, renamed AS (

    SELECT
        id AS comment_id,
        airport_ident,
        date AS comment_timestamp,
        member_nickname,
        subject AS comment_subject,
        body AS comment_body
    FROM source

)

SELECT *
FROM renamed