{% docs __overview__ %}

# AirStats

AirStats is a dbt project that transforms raw airport, runway, and airport comment data into cleaned and structured datasets for analysis.

## Silver Layer

The Silver layer contains three main models:

### silver_airports

This is the main airport reference table. Each airport is identified by `airport_ident` and contains information such as airport type, name, geographic coordinates, continent, country, and region.

### silver_runways

This table contains runway information, including runway dimensions, surface type, lighting status, and closed status.

Each runway is connected to an airport through `airport_ident`.

### silver_airport_comments

This table contains comments associated with airports. Empty comments are removed, missing member nicknames are replaced with `__UNKNOWN__`, and records are loaded incrementally.

Each comment is connected to an airport through `airport_ident`.

## Model Relationships

The Silver models are connected through `airport_ident`:

silver_runways → silver_airports

silver_airport_comments → silver_airports

This makes `silver_airports` the central reference table for airport-related information in the AirStats project.

{% enddocs %}