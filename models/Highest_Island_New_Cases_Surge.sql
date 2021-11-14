
{{ config(materialized='view') }}

with source_data as (select Location,date, year(to_date(date, 'MM/DD/YYYY')) as year,month(to_date(date, 'MM/DD/YYYY')) as month,WEEK(to_date(date, 'MM/DD/YYYY')) as week,quarter(to_date(date, 'MM/DD/YYYY')) as quarter,
Total_Cases,Total_Deaths,Total_Recovered,Total_Active_Cases,New_Cases,New_Deaths,New_Recovered,New_Active_Cases,New_Cases_per_Million,Total_Cases_per_Million,New_Deaths_per_Million,Total_Deaths_per_Million,Case_Fatality_Rate,Case_Recovered_Rate,Growth_Factor_of_New_Cases,Growth_Factor_of_New_Deaths from "FIVETRAN_INTERVIEW_DB"."GOOGLE_SHEETS"."COVID_19_INDONESIA_KAPIL_SRIVATSAN_1" WHERE ISLAND IN ('Jawa','Papua''Kalimantan''Nusa Tenggara','Sumatera','Sulawesi','Maluku') )


select location,year,quarter,month,week,max(new_cases) as New_Cases from source_data group by location,year,quarter,month,week order by new_cases desc limit 1;
