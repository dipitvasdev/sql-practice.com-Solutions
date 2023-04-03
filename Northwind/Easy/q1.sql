/*Show the category_name and description from the categories table sorted by category_name. */

select
	category_name,
    description
FROM
	categories
order by 
	category_name
