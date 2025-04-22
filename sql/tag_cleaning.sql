SELECT * FROM dishes_dataset.recipetags;
#ALTER TABLE dishes_dataset.recipetags RENAME COLUMN tags to total_tags; 
ALTER TABLE dishes_dataset.recipetags DROP COLUMN holiday; 
ALTER TABLE dishes_dataset.recipetags ADD COLUMN holiday boolean; 
-- UPDATE TABLE dishes_dataset.recipetags
--      set holday=TRUE
--      where type=3 and item='A'