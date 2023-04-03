/* Show the percent of patients that have 'M' as their gender. Round the answer to the nearest hundreth number and in percent form. */


select
	concat(
      ROUND(
        SUM(CASE WHEN gender = 'M' then 1 else 0 end) * 100.00 / count(*)
        ,2)
    ,'%')
	
FROM
	patients
