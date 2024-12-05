/* NOT USED UPSTREAM. 
    The requested report does not call for user information, so this model is not used anywhere upstream.
	This model is created for completeness of the investigative aspects of the task.
NOT USED UPSTREAM. */

-- Name is a reserved keyword. Renaming.
-- Convert date strings to timestamps and rename
-- Add calculated month fields that will be used downstream
WITH base_users AS (
    SELECT
        id,
        name AS user_name,
        email AS user_email,
        modified::TIMESTAMP AS modified_time
    FROM {{ source('postgres_public','users') }}
)
SELECT
    id,
    user_name,
    user_email,
    modified_time,
    {{ add_month_fields('modified_time') }}
FROM base_users