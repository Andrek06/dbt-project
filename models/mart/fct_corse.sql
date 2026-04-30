with base_corse as (
    select * from {{ ref('stg_corse') }}
),

richieste as ( select * from {{ ref('stg_corse_richieste') }} ),
accettate as ( select * from {{ ref('stg_corse_accettate') }} ),
iniziate as ( select * from {{ ref('stg_corse_iniziate') }} ),
completate as ( select * from {{ ref('stg_corse_completate') }} ),
cancellate as ( select * from {{ ref('stg_corse_cancellate') }} )

select
    b.corsa_id,
    b.id_rider,
    b.id_cliente,
    b.id_locale,
    r.richiesta_at,
    a.accettata_at,
    i.iniziata_at,
    comp.completata_at,
    canc.cancellata_at,
    canc.motivo as motivo_cancellazione
from base_corse b
left join richieste r on b.corsa_id = r.id_corsa
left join accettate a on b.corsa_id = a.id_corsa
left join iniziate i on b.corsa_id = i.id_corsa
left join completate comp on b.corsa_id = comp.id_corsa
left join cancellate canc on b.corsa_id = canc.id_corsa