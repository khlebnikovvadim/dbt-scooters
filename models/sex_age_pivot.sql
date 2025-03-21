select
  age,
  {{ dbt_utils.pivot(
      'sex',
      dbt_utils.get_column_values(ref('trips_users'), 'sex')
  ) }}
from {{ ref('trips_users') }}
group by
    1
order by
    1