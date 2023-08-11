with 

source as (
    select * 
    from {{ source('TRKdata', 'TRK_263_Lead_sources_analysis_eMAG_Card') }} 
    limit 100
),

staged as (
    select * 
    from source
)

select * 
from staged