with sales_report_Samsung as (
    select * 
    from {{ ref('Sales_report_for_DFP_SAMSUNG')}}
)

select 
    HIT_TIMESTAMP,
    ga_user_id, 
    product_revenue 
from sales_report_Samsung
group by 1
having total_amount < 0