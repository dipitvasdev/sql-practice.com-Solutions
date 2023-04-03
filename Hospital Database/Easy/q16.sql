/* Write a query to find list of patients first_name, last_name, and allergies from Hamilton where allergies are not null */

select first_name, last_name, allergies from patients where city == 'Hamilton' and allergies is not null
