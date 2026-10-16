{{ config(severity='warn') }}

-- Le test échoue si le code postal n'est pas dans la plage de l'état
select
    u.user_id,
    u.state,
    u.zip_code,
    s.zip_min,
    s.zip_max
from {{ ref('stg_users') }} u
join {{ ref('states') }} s on u.state = s.code
where u.zip_code < s.zip_min
   or u.zip_code > s.zip_max
