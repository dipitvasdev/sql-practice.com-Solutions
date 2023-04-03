/* For each day display the total amount of admissions on that day. Display the amount changed from the previous date. */

select
	admission_date,  
    COUNT(*) as total_admissions,
    count(*) - lag(count(*)) over (order by admission_date) 
    
from
	admissions
group by
	admission_date
order by
	admission_date
