/* For each doctor, display their id, full name, and the first and last admission date they attended. */


select
	doctors.doctor_id,
    concat(doctors.first_name, ' ', doctors.last_name) as full_name,
    min(admissions.admission_date),
    max(admissions.admission_date)
from
	doctors
inner join
	admissions
on 
	doctors.doctor_id = admissions.attending_doctor_id

group by
	doctors.doctor_id
