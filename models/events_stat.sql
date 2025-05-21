with tbl as (
    select
        sum(case type when ' start_search' then 1 else 0 end) all_starts,
        sum(
            case type when ' cancel_search' then 1 else 0 end
        )::float all_cancels
    from {{ ref("events_full") }}
)

select all_cancels / all_starts * 100 events_stat
from tbl
