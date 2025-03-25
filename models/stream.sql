select trim(type) event_type, user_id, timestamp::date event_date
from  {{ ref("events_full") }}