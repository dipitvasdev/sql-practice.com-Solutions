/* display the number of duplicate patients based on their first_name and last_name. */


select
	first_name,
    last_name,
    count(*) 
from
	patients

group by
	first_name,
    last_name
 having
 	 count(*) > 1
