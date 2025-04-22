#get list of all tags in the recipes

#first, have set variable that stores all tags
#iterate through total_tags column and for each one, split by comma and add to the set the values not in the set already
CREATE temporary TABLE tag_list (tags VARCHAR(30));

INSERT INTO tag_list (tags)
VALUES (recipetags.total_tags)
WHERE recipetags.total_tags