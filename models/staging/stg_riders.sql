select 
    id as id_rider,
    nome, 
    telefono 
from {{ source('raw_rides', 'riders') }}