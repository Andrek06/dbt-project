{{ config(materialized='table') }}

select
    f.*,
    u.nome, u.cognome, u.data_registrazione,
    p.piano_nome, p.prezzo, p.durata,
    m.metodo_nome,
    c.codice as coupon_codice, c.sconto
from {{ ref('fct_pagamenti') }} f
left join {{ ref('dim_utenti') }} u on f.id_utente = u.id_utente
left join {{ ref('dim_piani') }} p on f.id_piano = p.id_piano
left join {{ ref('dim_metodi') }} m on f.id_metodo = m.id_metodo
left join {{ ref('dim_coupon') }} c on f.id_coupon = c.id_coupon