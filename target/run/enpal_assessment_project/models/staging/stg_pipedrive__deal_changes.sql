
  create view "postgres"."public_pipedrive_analytics"."stg_pipedrive__deal_changes__dbt_tmp"
    
    
  as (
    -- This model is generated from the `deal_changes` table in the `pipedrive` schema.
-- Renaming a id column to standardise
SELECT
    deal_id AS id,
    change_time,
    changed_field_key,
    new_value
FROM "postgres"."public"."deal_changes"
  );