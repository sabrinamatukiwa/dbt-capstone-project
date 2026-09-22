SELECT *
FROM {{ ref('silver_runways') }}
WHERE runway_surface IS NULL
   OR runway_surface = ''