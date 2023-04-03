/* Show the provinces that has more patients identified as 'M' than 'F'. Must only show full province_name */

select
	province_names.province_name
from
	province_names
join 
	patients
on 
	patients.province_id == province_names.province_id
group by
	province_name
having
	sum(case when gender = 'M' then 1 else 0 end) 
    > 
    sum(case when gender = 'F' then 1 else 0 end)
