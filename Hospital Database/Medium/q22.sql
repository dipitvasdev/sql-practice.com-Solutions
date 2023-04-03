/* For every admission, display the patient's full name, their admission diagnosis, and their doctor's full name who diagnosed their problem. */

select
	concat(p.first_name, ' ' ,p.last_name) as patient_full_name,
    a.diagnosis,
    concat(d.first_name, ' ', d.last_name) as doctor_full_name

from
	patients p
inner join
	admissions a
on 
	p.patient_id == a.patient_id

INNER join 
	doctors d 

ON 
	a.attending_doctor_id == d.doctor_id
