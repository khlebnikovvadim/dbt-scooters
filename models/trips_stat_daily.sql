select
    date,
    count(*) as trips,
    max(price_rub) as max_price_rub,
    avg(distance_m) / 1000 as avg_distance_km,
    avg(
        case
            when duration_s <> 0 then price_rub / duration_s * 60 else price_rub
        end
    ) as avg_price_rub_per_min
from
    {{ ref("trips_prep") }}
group by
    1
order by
    1
