select ec.*, et." type" type 
from {{ ref("events_clean") }} ec left join {{ ref("event_types") }} et on ec.type_id = et.type_id