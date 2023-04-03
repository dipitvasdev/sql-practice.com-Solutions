/* Show all allergies ordered by popularity. Remove NULL values from query. */

select
	allergies,
    COUNT(*)
from
	patients
where
	allergies is not null
group BY
	allergies 
order by
	count(*) desc
