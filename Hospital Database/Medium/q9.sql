/* Show the city and the total number of patients in the city.
Order from most to least patients and then by city name ascending. */


select 
	city, 
    count(*)
from
	patients

group by
	city
order by
	count(*) desc, 
    city
