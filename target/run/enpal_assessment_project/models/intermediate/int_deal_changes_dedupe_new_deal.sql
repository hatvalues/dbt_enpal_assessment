
  create view "postgres"."public_pipedrive_analytics"."int_deal_changes_dedupe_new_deal__dbt_tmp"
    
    
  as (
    -- Separate new deals model from the deal_changes model
-- There are a handful of dupe deals in the deal_changes model (assumption - deals should not have more than one added date)
-- Materialize as a view so it can be tested for deduplication
SELECT
	deal_id, 
	MAX(change_time) AS created_time
FROM "postgres"."public_pipedrive_analytics"."stg_pipedrive__deal_changes"
WHERE changed_field_key = 'add_time'
GROUP BY
	deal_id
  );