{{ config(materialized='table') }}

with fct_corse as (
    select * from {{ ref('fct_corse') }}
),
dim_riders as (
    select * from {{ ref('dim_riders') }}
),
dim_clienti as (
    select * from {{ ref('dim_clienti') }}
),
dim_locali as (
    select * from {{ ref('dim_locali') }}
)

select
    f.*,
    r.nome as rider_nome,
    r.telefono as rider_telefono,
    c.nome as cliente_nome,
    c.email as cliente_email,
    c.indirizzo as cliente_indirizzo,
    l.nome as locale_nome,
    l.indirizzo as locale_indirizzo
from fct_corse f
left join dim_riders r on f.id_rider = r.id_rider
left join dim_clienti c on f.id_cliente = c.id_cliente
left join dim_locali l on f.id_locale = l.locale_id