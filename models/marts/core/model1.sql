with sales_Samsung as (
    select * 
    from {{ref ('stg_sales_report_Samsung') }}
),

organic_traffic_LP_search as (
    select * 
    from {{ref ('stg_organic_traffic_LP_is_search') }}
),

lead_sources_emag_card as (
    select * 
    from {{ref ('stg_lead_sources_eMAG_Card')}}
),

final as (
    select 
        sales_Samsung.DATA, 
        sales_Samsung.SKU,
        sales_Samsung.product_revenue,
        organic_traffic_LP_search.Page,
        lead_sources_emag_card.Users_that_applied
    from sales_Samsung 

    left join organic_traffic_LP_search on sales_Samsung.DATA = organic_traffic_LP_search.Data 

    left join lead_sources_emag_card on sales_Samsung.DATA = lead_sources_emag_card.DATE
)

select * 
from final