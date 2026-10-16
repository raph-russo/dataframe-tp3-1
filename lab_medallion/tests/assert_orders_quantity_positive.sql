-- Le test échoue si cette requête retourne des lignes
select
    order_id,
    quantity
from {{ ref('stg_orders') }}
where quantity <= 0
