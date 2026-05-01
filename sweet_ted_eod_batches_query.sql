-- End-of-Day inventory item source
-- This is the query used by the updated HTML to pull item names from batches.

SELECT DISTINCT ON (LOWER(TRIM(name)))
  id,
  name AS item_name,
  batch_code,
  date,
  created_at
FROM public.batches
WHERE name IS NOT NULL
  AND TRIM(name) <> ''
ORDER BY LOWER(TRIM(name)), created_at DESC;

-- Optional filtered version for a selected batch code:
-- SELECT id, name AS item_name, batch_code, date, created_at
-- FROM public.batches
-- WHERE name IS NOT NULL
--   AND TRIM(name) <> ''
--   AND batch_code = 'PUT_BATCH_CODE_HERE'
-- ORDER BY created_at DESC;
