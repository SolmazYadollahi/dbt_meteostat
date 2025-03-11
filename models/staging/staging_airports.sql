WITH airports_regions_join AS (
    SELECT * 
    FROM {{source('flights_data', 'airports')}}
    LEFT JOIN {{source('staging_flights', 'regions')}}
    USING (country)
)
SELECT * FROM airports_regions_join