with ordini as (
    select * from {{ ref('stg_ordini') }}
),
transazioni as ( select * from {{ ref('stg_transazioni') }} ),
abbonamenti as ( select * from {{ ref('stg_abbonamenti') }} ),
rinnovi as ( select * from {{ ref('stg_rinnovi') }} )

select
    o.id_ordine,
    o.id_utente,
    o.id_piano,
    o.id_coupon,
    o.id_metodo,
    o.data_ordine,
    t.importo,
    t.data_transazione,
    a.iniziato_il as abbonamento_inizio,
    a.finito_il as abbonamento_fine,
    r.is_rinnovo_attivo
from ordini o
left join transazioni t on o.id_ordine = t.id_ordine
left join abbonamenti a on o.id_ordine = a.id_ordine
left join rinnovi r on o.id_ordine = r.id_ordine