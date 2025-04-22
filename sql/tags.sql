UPDATE dishes_dataset.recipetags
SET max_time = CONVERT(SUBSTRING(total_tags, INSTR(total_tags, "-minutes-or-less")-2, 2), UNSIGNED)
WHERE INSTR(total_tags, '-minutes-or-less') != 0;

UPDATE dishes_dataset.recipetags
SET max_time = 60 * CONVERT(SUBSTRING(total_tags, INSTR(total_tags, "-hours-or-less")-1, 1), UNSIGNED)
WHERE INSTR(total_tags, '-hours-or-less') != 0;

UPDATE dishes_dataset.recipetags
SET max_time = 0
WHERE max_time IS NULL;
-- SELECT SUBSTRING(total_tags, INSTR(total_tags, "-minutes-or-less")-2, 2) FROM recipetags
-- WHERE INSTR(total_tags, '-minutes-or-less') != 0;recipetags