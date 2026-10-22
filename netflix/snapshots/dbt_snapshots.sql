{% snapshot dbt_snapshots %}

{{ 
    config(
        target_schema = 'snapshots',
        unique_key = ['user_id', 'movie_id', 'tag'],
        strategy = 'timestamp',
        updated_at = 'tag_timestamp'
    )
}}

select 
    md5(cast(user_id || '|' || movie_id || '|' || tag as varchar)) as surrogate_id,
    user_id,
    movie_id,
    tag,
    tag_timestamp
from {{ ref('stg_tag') }}
limit 100

{% endsnapshot %}