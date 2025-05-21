with tbl as (
    select
        sum(
            case type when ' cancel_search' then 1 else 0 end
        )::float as all_cancels,
        sum(case type when ' start_search' then 1 else 0 end) as all_starts
    from {{ ref("events_full") }}
)

select all_cancels / all_starts * 100 as events_stat
from tbl
