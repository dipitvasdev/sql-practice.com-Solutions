/*++++Q1.SQL++++*/ 

/* Show all of the patients grouped into weight groups.
Show the total amount of patients in each weight group.
Order the list by the weight group decending.

For example, if they weight 100 to 109 they are placed in the 100 weight group, 110-119 = 110 weight group, etc. */


select
	count(*),
    (weight / 10) * 10 as weight_group 
from
	patients
group by
	weight_group 

order by
	weight_group desc




/*++++Q2.SQL++++*/ 

/* Show patient_id, weight, height, isObese from the patients table.

Display isObese as a boolean 0 or 1.

Obese is defined as weight(kg)/(height(m)2) >= 30.

weight is in units kg.

height is in units cm. */

SELECT 
  patient_id,
  weight,
  height,
  CASE 
    WHEN weight / ((height/100.0) * (height/100.0)) >= 30 THEN 1
    ELSE 0
  END AS isObese
FROM 
  patients;




/*++++Q3.SQL++++*/ 

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




/*++++Q4.SQL++++*/ 

/* All patients who have gone through admissions, can see their medical documents on our site. Those patients are given a temporary password after their first admission. Show the patient_id and temp_password.

The password must be the following, in order:
1. patient_id
2. the numerical length of patient's last_name
3. year of patient's birth_date */

select
	DISTINCT admissions.patient_id,
    concat(patients.patient_id, len(last_name), year(birth_date)) as temp_password
from
	patients
join
	admissions on patients.patient_id = admissions.patient_id




/*++++Q5.SQL++++*/ 

/* Each admission costs $50 for patients without insurance, and $10 for patients with insurance. All patients with an even patient_id have insurance.

Give each patient a 'Yes' if they have insurance, and a 'No' if they don't have insurance. Add up the admission_total cost for each has_insurance group. */

select
	case when patient_id % 2 == 0 then 'Yes' ELSE 'No' END as has_insurance, 
    sum(case when patient_id % 2 == 0 then 10 else 50 end) as cost_after_insurance
from
	admissions
group by
	has_insurance




/*++++Q6.SQL++++*/ 

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




/*++++Q7.SQL++++*/ 

/* We are looking for a specific patient. Pull all columns for the patient who matches the following criteria:
- First_name contains an 'r' after the first two letters.
- Identifies their gender as 'F'
- Born in February, May, or December
- Their weight would be between 60kg and 80kg
- Their patient_id is an odd number
- They are from the city 'Kingston' */

select
	*
from
	patients
where
	first_name like '__r%'
    and
    gender = 'F' 
    and
    month(birth_date) in (2,5,12) 
    and
    weight between 60 and 80
    and
    patient_id %2 !=0 
    and 
    city = 'Kingston'




/*++++Q8.SQL++++*/ 

/* Show the percent of patients that have 'M' as their gender. Round the answer to the nearest hundreth number and in percent form. */


select
	concat(
      ROUND(
        SUM(CASE WHEN gender = 'M' then 1 else 0 end) * 100.00 / count(*)
        ,2)
    ,'%')
	
FROM
	patients




/*++++Q9.SQL++++*/ 

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




/*++++Q10.SQL++++*/ 

/* Sort the province names in ascending order in such a way that the province 'Ontario' is always on top. */

select
	province_name
from
	province_names
order by
	case when province_name == 'Ontario' then 0 else 1 end, 
    province_name asc




