select tag_id, initcap(trim(tag)) as tag_name
from {{ ref('stg_genome_tags')}}