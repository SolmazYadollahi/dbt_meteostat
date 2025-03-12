
WITH mart_faa_stats AS (
    SELECT 
        prep_airports.city AS city,
        prep_airports.country AS country,
        prep_airports.name AS airport_name,
        COUNT(DISTINCT dep_time) AS uniq_dep_con,
        COUNT(DISTINCT arr_time) AS uniq_arr_con,
        COUNT(sched_dep_time) + COUNT(sched_arr_time) AS sched_dep_arr,
        SUM(sched_dep_time) AS total_sched_dep_time,
        SUM(sched_arr_time) AS total_sched_arr_time,
        SUM(cancelled) AS total_cancelled,
        SUM(diverted) AS total_diverted,
        COUNT(actual_elapsed_time) AS actual_elapsed_count
    FROM prep_flights
    left JOIN prep_airports ON prep_flights.origin = prep_airports.faa   
    GROUP BY prep_airports.city, prep_airports.country, prep_airports.name
)
SELECT * FROM mart_faa_stats;

