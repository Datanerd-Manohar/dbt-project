with user_ids as 
(
    select distinct user_id from {{ ref('stg_ratings')}}
    union 
    select distinct user_id from {{ ref('stg_tag')}}
)

select distinct user_id from user_ids