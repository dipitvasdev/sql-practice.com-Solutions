/* Show first_name, last_name, and the total number of admissions attended for each doctor.

Every admission has been attended by a doctor. */

select
	doctors.first_name,
    doctors.last_name,
    count(*) 
from
	admissions
inner join 
	doctors
on
	doctors.doctor_id = admissions.attending_doctor_id

group by
	doctors.first_name,
    doctors.last_name
