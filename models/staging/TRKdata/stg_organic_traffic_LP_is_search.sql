with 

source as (
    select * 
    from {{ source('TRKdata', 'TRK_238_Organic_Traffic_LP_is_search')}} 
    limit 100
),

staged as (
   select * 
   from source 
)

select *
from staged