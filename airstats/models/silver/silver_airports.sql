WITH airports AS (

    SELECT *
    FROM {{ ref('src_airports') }}

)

SELECT *
FROM airports