/* Show patient_id, first_name, last_name, and attending doctor's specialty.
Show only the patients who has a diagnosis as 'Epilepsy' and the doctor's first name is 'Lisa'

Check patients, admissions, and doctors tables for required information. */

select
	p.patient_id,
    p.first_name,
    p.last_name,
    d.specialty
from
	patients p
join 
	admissions a
on 
	p.patient_id = a.patient_id
join
	doctors d 
on
	a.attending_doctor_id = d.doctor_id

where
	a.diagnosis = 'Epilepsy'
    and
    d.first_name = 'Lisa'
