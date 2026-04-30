select 
    id as id_cliente,
    nome, 
    telefono, 
    email, 
    indirizzo 
from {{ source('raw_rides', 'clienti') }}