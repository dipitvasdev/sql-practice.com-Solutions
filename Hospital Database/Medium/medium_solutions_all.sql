/*++++Q1.SQL++++*/ 

/* 
Show unique birth years from patients and order them by ascending. */


select distinct YEAR(birth_date) 
from patients
order by year(birth_date) asc




/*++++Q2.SQL++++*/ 

/* Show unique first names from the patients table which only occurs once in the list.

For example, if two or more people are named 'John' in the first_name column then don't include their name in the output list. If only 1 person is named 'Leo' then include them in the output. */



select distinct first_name
from patients
group by first_name
having count(first_name) == 1




/*++++Q3.SQL++++*/ 

/* Show patient_id and first_name from patients where their first_name start and ends with 's' and is at least 6 characters long. */


select patient_id, first_name
from patients
where first_name like 's%____%s'




/*++++Q4.SQL++++*/ 

/* Show patient_id, first_name, last_name from patients whos diagnosis is 'Dementia'.

Primary diagnosis is stored in the admissions table. */


select 
	patients.patient_id, 
    patients.first_name, 
    patients.last_name
    
from patients

inner join 
	admissions
ON 
	patients.patient_id = admissions.patient_id
    
WHERE 
	admissions.diagnosis == 'Dementia'




/*++++Q5.SQL++++*/ 

/* Display every patient's first_name.
Order the list by the length of each name and then by alphbetically*/

select
	first_name
from patients
order by LENGTH(first_name), first_name asc




/*++++Q6.SQL++++*/ 

/* Show the total amount of male patients and the total amount of female patients in the patients table.
Display the two results in the same row. */

SELECT 
    SUM(CASE WHEN gender = 'M' THEN 1 ELSE 0 END) AS male_patients, 
    SUM(CASE WHEN gender = 'F' THEN 1 ELSE 0 END) AS female_patients
FROM 
    patients;




/*++++Q7.SQL++++*/ 

/* Show first and last name, allergies from patients which have allergies to either 'Penicillin' or 'Morphine'. Show results ordered ascending by allergies then by first_name then by last_name. */

select 
	first_name, last_name, allergies
from 
	patients
where
	 allergies == 'Penicillin' or allergies == 'Morphine'
order by
	allergies asc,
    first_name,
    last_name




/*++++Q8.SQL++++*/ 

/* Show patient_id, diagnosis from admissions. Find patients admitted multiple times for the same diagnosis. */ 

SELECT 
    patient_id, 
    diagnosis
FROM 
    admissions
WHERE 
    diagnosis IN (
        SELECT 
            diagnosis 
        FROM 
            admissions 
        GROUP BY 
            diagnosis, patient_id 
        HAVING 
            COUNT(*) > 1
    )
GROUP BY 
    patient_id, diagnosis 
HAVING 
    COUNT(*) > 1;




/*++++Q9.SQL++++*/ 

/* Show the city and the total number of patients in the city.
Order from most to least patients and then by city name ascending. */


select 
	city, 
    count(*)
from
	patients

group by
	city
order by
	count(*) desc, 
    city




/*++++Q10.SQL++++*/ 

/* Show first name, last name and role of every person that is either patient or doctor.
The roles are either "Patient" or "Doctor" */

select
	first_name,
    last_name, 
    'Patient'
from
	patients

union all

select 
	first_name,
    last_name,
    'Doctor'
    
from
	doctors




/*++++Q11.SQL++++*/ 

/* Show all allergies ordered by popularity. Remove NULL values from query. */

select
	allergies,
    COUNT(*)
from
	patients
where
	allergies is not null
group BY
	allergies 
order by
	count(*) desc




/*++++Q12.SQL++++*/ 

/* Show all patient's first_name, last_name, and birth_date who were born in the 1970s decade. Sort the list starting from the earliest birth_date. */


select
	first_name,
    last_name,
    birth_date
 from
 	patients
 
 where
 	YEAR(birth_date) between 1970 and 1979
 
 order by
 	birth_date




/*++++Q13.SQL++++*/ 

/* We want to display each patient's full name in a single column. Their last_name in all upper letters must appear first, then first_name in all lower case letters. Separate the last_name and first_name with a comma. Order the list by the first_name in decending order
EX: SMITH,jane */

select
	concat(upper(last_name) , ',',lower(first_name)) as full_name
from
	patients
order by
	first_name desc




/*++++Q14.SQL++++*/ 

/* Show the province_id(s), sum of height; where the total sum of its patient's height is greater than or equal to 7,000. */

select
	province_id, 
    sum(height) 
from
	patients
group by
	province_id
having
	sum(height) >= 7000




/*++++Q15.SQL++++*/ 

/* Show the difference between the largest weight and smallest weight for patients with the last name 'Maroni' */

select
	max(weight) - min(weight) as difference
from
	patients
where
	last_name == 'Maroni'




/*++++Q16.SQL++++*/ 

/* Show all of the days of the month (1-31) and how many admission_dates occurred on that day. Sort by the day with most admissions to least admissions. */

select
	day(admission_date) as day_number, 
    count(*) 

from
	admissions

group by

	day(admission_date)

order by
	count(*) desc




/*++++Q17.SQL++++*/ 

/* Show all columns for patient_id 542's most recent admission_date. */

SELECT *
FROM admissions
WHERE patient_id = 542
AND admission_date = (
  SELECT MAX(admission_date)
  FROM admissions
  WHERE patient_id = 542
)




/*++++Q18.SQL++++*/ 

/* Show patient_id, attending_doctor_id, and diagnosis for admissions that match one of the two criteria:
1. patient_id is an odd number and attending_doctor_id is either 1, 5, or 19.
2. attending_doctor_id contains a 2 and the length of patient_id is 3 characters. */


select
	patient_id,
    attending_doctor_id,
    diagnosis
from
	admissions

where
	(
      patient_id % 2 != 0 
      and 
      attending_doctor_id in (1,5,19)
    )
    or 
    (
      attending_doctor_id like '%2%' 
      and
      len(patient_id) == 3
    )




/*++++Q19.SQL++++*/ 

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




/*++++Q20.SQL++++*/ 

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




/*++++Q21.SQL++++*/ 

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




/*++++Q22.SQL++++*/ 

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




/*++++Q23.SQL++++*/ 

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




/*++++Q24.SQL++++*/ 

/* Display patient's full name,
height in the units feet rounded to 1 decimal,
weight in the unit pounds rounded to 0 decimals,
birth_date,
gender non abbreviated.

Convert CM to feet by dividing by 30.48.
Convert KG to pounds by multiplying by 2.205. */


select
	concat(first_name, ' ' , last_name) as full_name, 
    round(height / 30.48, 1) as height, 
    round(weight*2.205, 0) as weight,
    birth_date,
    CASE when gender = 'M' then 'Male' else 'Female' end
    
from
	patients




