WITH runways AS (

    SELECT *
    FROM {{ ref('src_runways') }}

)
, cleaned AS (

    SELECT
        runway_id,
        airport_ident,
        runway_length_ft,
        runway_width_ft,
        COALESCE(NULLIF(runway_surface, ''), '__UNKNOWN__') AS runway_surface,
        runway_lighted,
        runway_closed
    FROM runways

)

SELECT *
FROM cleaned