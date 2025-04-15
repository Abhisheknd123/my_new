{{
    config(
        materialized='table'
    )
}}

select 
ORDER_ID,
upper(CUSTOMER_NAME),
CATEGORY,
SUB_CATEGORY,
CITY,
coalesce(try_to_date(ORDER_DATE,'dd-mm-yyyy'),
try_to_date(ORDER_DATE,'mm/dd/yyyy')) as ORDER_DATE,
REGION,
SALES,
DISCOUNT,
PROFIT,
STATE
from

{{ source('raw', 'dmart_raw') }}
