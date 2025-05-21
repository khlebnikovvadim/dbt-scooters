select
    ec.*,
    et." type" as type
from {{ ref("events_clean") }} as ec
left join {{ ref("event_types") }} as et on ec.type_id = et.type_id
