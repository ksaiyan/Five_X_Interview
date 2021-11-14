{{ config(materialized='view') }}

SELECT date, SUM(new_deaths) AS NEW_CASES 
FROM "FIVETRAN_INTERVIEW_DB"."GOOGLE_SHEETS"."COVID_19_INDONESIA_KAPIL_SRIVATSAN_1" 
WHERE ISLAND IN ('Jawa','Papua''Kalimantan''Nusa Tenggara','Sumatera','Sulawesi','Maluku') 
GROUP BY date
