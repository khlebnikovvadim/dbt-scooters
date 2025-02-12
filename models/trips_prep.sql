select id, 
       user_id, 
       scooter_hw_id,
       started_at, 
       finished_at, 
       start_lat, 
       start_lon,
       finish_lat,
       finish_lon,
       distance / 1000 distance_m,
       extract(epoch from (finished_at - started_at)) duration_s,
       price / 100 price_rub,
       started_at::date date,
       case when extract(epoch from (finished_at - started_at)) > 0 and price = 0 then true
            else false end is_free 
       from {{source("scooters_raw","trips",)}}