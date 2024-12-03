{{
  config(
    materialized='table'
  )
}}

With t_data AS (
SELECT DISTINCT 
`ship-city` AS ship_city,
`ship-state` AS ship_state,
`ship-postal-code` AS ship_postal_code,
`ship-country` AS ship_country,
FROM
    {{ source('bronze', 'amazon_sale_report') }}
)

SELECT {{ dbt_utils.generate_surrogate_key([
				'ship_postal_code'
			]) }} as sales_shipment_id, *
FROM t_data
WHERE ship_country IS NOT NULL