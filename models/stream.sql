select
    user_id,
    timestamp::date as event_date,
    trim(type) as event_type
from {{ ref("events_full") }}
