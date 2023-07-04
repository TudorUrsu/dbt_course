with 

source as (
    select * 
    from {{source('TRKdata', 'Sales_report_for_DFP_SAMSUNG')}}
),

staged as (
    select * 
    from source
)

select * 
from staged
