select movie_id, 
    initcap(trim(title)) as movie_title,
    split(genres, '|') as genre_array,
    genres
from {{ ref('stg_movies') }}