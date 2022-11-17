-- Seleziono il l'ultimo valore ricevuto in uno specifico canale
select 
    max(id), canpacket_channel 
from candata 
where 
    canpacket_channel = 2032 
group by canpacket_channel 
limit 1;

-- delete dei dati del can
delete from candata;

-- Analisi delle performance della query
explain analyze 
    select 
        max(id), canpacket_channel 
    from candata 
    where 
        canpacket_channel = 2032 
    group by canpacket_channel 
    limit 1;

-- Analisi generica
explain analyze 
    select * from candata;

-- Invia notifica
select pg_notify('can_notification', 'ABCD134459543453');


