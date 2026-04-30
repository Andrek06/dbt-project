with base_corse as (
    select * from {{ ref('stg_corse') }}
),

richieste as ( select id_corsa, creato_il as richiesta_at from {{ source('raw_rides', 'corse_richieste') }} ),
accettate as ( select id_corsa, creato_il as accettata_at from {{ source('raw_rides', 'corse_accettate') }} ),
iniziate as ( select id_corsa, creato_il as iniziata_at from {{ source('raw_rides', 'corse_iniziate') }} ),
completate as ( select id_corsa, creato_il as completata_at from {{ source('raw_rides', 'corse_completate') }} ),
cancellate as ( select id_corsa, creato_il as cancellata_at, motivo from {{ source('raw_rides', 'corse_cancellate') }} )

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