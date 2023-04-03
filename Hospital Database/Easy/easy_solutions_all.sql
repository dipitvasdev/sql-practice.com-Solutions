/*++++Q1.SQL++++*/ 

/*Show first name, last name, and gender of patients who's gender is 'M'*/

SELECT first_name, last_name, gender from patients where gender == 'M'




/*++++Q2.SQL++++*/ 

/* Show first name and last name of patients who does not have allergies. (null) */

SELECT first_name, last_name from patients where allergies is null




/*++++Q3.SQL++++*/ 

/* Show first name of patients that start with the letter 'C'*/

SELECT first_name from patients where first_name like 'C%'




/*++++Q4.SQL++++*/ 

/* Show first name and last name of patients that weight within the range of 100 to 120 (inclusive) */

SELECT first_name, last_name from patients where weight between 100 and 120




/*++++Q5.SQL++++*/ 

/* Update the patients table for the allergies column. If the patient's allergies is null then replace it with 'NKA' */

update patients SET allergies = 'NKA' where allergies is null




/*++++Q6.SQL++++*/ 

/* Show first name and last name concatinated into one column to show their full name. */ 

select concat(first_name, ' ', last_name) AS 'full_name' from patients




/*++++Q7.SQL++++*/ 

/* Show first name, last name, and the full province name of each patient.

Example: 'Ontario' instead of 'ON' */


select patients.first_name, patients.last_name, province_names.province_name 
FROM patients 
INNER join province_names 
ON patients.province_id = province_names.province_id




/*++++Q8.SQL++++*/ 

/* Show how many patients have a birth_date with 2010 as the birth year. */

select count(birth_date) AS 'total_patients' 
FROM patients 
where birth_date like '2010%'




/*++++Q9.SQL++++*/ 

/* Show the first_name, last_name, and height of the patient with the greatest height. */

select first_name, last_name, MAX(height) from patients




/*++++Q10.SQL++++*/ 

/* Show all columns for patients who have one of the following patient_ids:
1,45,534,879,1000 */ 


select * from patients where patient_id IN (1,45,534,879,1000) ;




/*++++Q11.SQL++++*/ 

/* Show the total number of admissions */ 


select count(*) from admissions




/*++++Q12.SQL++++*/ 

/* Show all the columns from admissions where the patient was admitted and discharged on the same day. */

select * from admissions where admission_date == discharge_date




/*++++Q13.SQL++++*/ 

/* Show the patient id and the total number of admissions for patient_id 579. */

select patient_id, count(*) from admissions where patient_id == 579




/*++++Q14.SQL++++*/ 

/* Based on the cities that our patients live in, show unique cities that are in province_id 'NS'? */


select distinct city from patients where province_id == 'NS'




/*++++Q15.SQL++++*/ 

/* Write a query to find the first_name, last name and birth date of patients who has height greater than 160 and weight greater than 70 */ 

select first_name, last_name, birth_date 
from patients
where height > 160 and weight > 70




/*++++Q16.SQL++++*/ 

/* Write a query to find list of patients first_name, last_name, and allergies from Hamilton where allergies are not null */

select first_name, last_name, allergies from patients where city == 'Hamilton' and allergies is not null




/*++++Q17.SQL++++*/ 

/* Based on cities where our patient lives in, write a query to display the list of unique city starting with a vowel (a, e, i, o, u). Show the result order in ascending by city. */


select distinct city
from patients
where city like 'a%' or city like 'e%' or city like 'i%' or city like 'o%'OR city like 'u%'
order by city asc




