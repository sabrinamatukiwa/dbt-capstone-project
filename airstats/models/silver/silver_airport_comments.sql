{{ config(materialized='incremental') }}

WITH comments AS (

    SELECT *
    FROM {{ ref('src_airport_comments') }}

)
, filtered AS (

    SELECT *
    FROM comments
    WHERE comment_body IS NOT NULL
      AND comment_body <> ''

)
, cleaned AS (

    SELECT
        comment_id,
        airport_ident,
        comment_timestamp,
        COALESCE(member_nickname, '__UNKNOWN__') AS member_nickname,
        comment_subject,
        comment_body,
        CURRENT_TIMESTAMP() AS loaded_at
    FROM filtered

{% if is_incremental() %}

    WHERE comment_id > (SELECT MAX(comment_id) FROM {{ this }})

{% endif %}

)

SELECT *
FROM cleaned