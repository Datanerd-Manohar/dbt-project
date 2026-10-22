{{ 
    config(materialized = 'incremental', 
    on_schema_change = 'fail')
}}

select user_id, movie_id, rating, rating_timestamp
from {{ ref('stg_ratings') }}
where rating is not null

{% if is_incremental() %}
  AND rating_timestamp > (SELECT MAX(rating_timestamp) FROM {{ this }})
{% endif %}