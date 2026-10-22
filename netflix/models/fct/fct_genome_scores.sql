select movie_id, tag_id, round(relevance, 4) as relevance 
from {{ ref('stg_genome_scores') }}
where relevance > 0