

{{ config(materialized='view') }}

with source_data as (select Location,date, year(to_date(date, 'MM/DD/YYYY')) as year,month(to_date(date, 'MM/DD/YYYY')) as month,WEEK(to_date(date, 'MM/DD/YYYY')) as week,quarter(to_date(date, 'MM/DD/YYYY')) as quarter,
Total_Cases,Total_Deaths,Total_Recovered,Total_Active_Cases,New_Cases,New_Deaths,New_Recovered,New_Active_Cases,New_Cases_per_Million,Total_Cases_per_Million,New_Deaths_per_Million,Total_Deaths_per_Million,Case_Fatality_Rate,Case_Recovered_Rate,Growth_Factor_of_New_Cases,Growth_Factor_of_New_Deaths from "FIVETRAN_INTERVIEW_DB"."GOOGLE_SHEETS"."COVID_19_INDONESIA_KAPIL_SRIVATSAN_1" WHERE ISLAND IN ('Jawa','Papua''Kalimantan''Nusa Tenggara','Sumatera','Sulawesi','Maluku') )


select location,year,quarter,month,week,sum(Total_Cases) as Total_Cases ,sum(Total_Deaths) as Total_Deaths,sum(Total_Recovered) as Total_Recovered,sum(Total_Active_Cases) as Total_Active_Cases,
sum(New_Cases) as New_Cases,sum(New_Deaths) as New_Deaths,sum(New_Recovered) as New_Recovered,sum(New_Active_Cases) as New_Active_Cases from source_data group by location,year,quarter,month,week order by location,total_deaths desc ,year,quarter,month,week
