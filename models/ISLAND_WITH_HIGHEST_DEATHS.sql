
/*
    Welcome to your first dbt model!
    Did you know that you can also configure models directly within SQL files?
    This will override configurations stated in dbt_project.yml
    Try changing "table" to "view" below
*/

{{ config(materialized='table') }}

with source_data as (
SELECT 
DATE,
TOTAL_RECOVERED,
TOTAL_CASES_PER_MILLION,
TOTAL_RURAL_VILLAGES,
TOTAL_ACTIVE_CASES,
POPULATION,
TOTAL_CITIES,
TOTAL_DISTRICTS,
TOTAL_DEATHS,
ISLAND,
PROVINCE,
TOTAL_CASES,
TOTAL_URBAN_VILLAGES,
TOTAL_DEATHS_PER_MILLION
FROM COVID_DATA WHERE ISLAND IN ('Jawa','Papua''Kalimantan''Nusa Tenggara','Sumatera','Sulawesi','Maluku') 
GROUP BY TOTAL_RECOVERED,
TOTAL_CASES_PER_MILLION,
TOTAL_RURAL_VILLAGES,
TOTAL_ACTIVE_CASES,
POPULATION,
TOTAL_CITIES,
TOTAL_DISTRICTS,
TOTAL_DEATHS,
ISLAND,
PROVINCE,
TOTAL_CASES,
TOTAL_URBAN_VILLAGES,
TOTAL_DEATHS_PER_MILLION,DATE order by DATE DESC,TOTAL_DEATHS DESC;

)

select TOTAL_DEATHS,ISLAND
from source_data group BY TOTAL_DEATHS,ISLAND ORDER BY TOTAL_DEATHS

/*
    Uncomment the line below to remove records with null `id` values
*/

-- where id is not null
