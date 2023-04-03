/* Display the total amount of patients for each province. Order by descending. */

select
	province_name,
	count(patients.patient_id) as patient_count 
from
 	patients
inner join
	province_names
on 
	patients.province_id = province_names.province_id

group by
	province_names.province_name

order by
	count(patients.patient_id) desc
