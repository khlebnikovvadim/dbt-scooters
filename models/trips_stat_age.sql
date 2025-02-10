select age, avg(daily_trips) avg_daily_trips
from (select trp.started_at::date date, extract (year from age(trp.started_at,  usr.birth_date)) age, count(*) daily_trips
from scooters_raw.trips trp join scooters_raw.users usr on trp.user_id = usr.id
group by 1,2)
group by 1
order by 1