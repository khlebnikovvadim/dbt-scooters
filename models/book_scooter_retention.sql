
{{ dbt_product_analytics.retention(
  event_stream=ref("stream"),
  first_action="start_search",
  second_action="book_scooter"
)}}