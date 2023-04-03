/* 
Show unique birth years from patients and order them by ascending. */


select distinct YEAR(birth_date) 
from patients
order by year(birth_date) asc
