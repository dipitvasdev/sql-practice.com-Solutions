/* Show the total amount of male patients and the total amount of female patients in the patients table.
Display the two results in the same row. */

SELECT 
    SUM(CASE WHEN gender = 'M' THEN 1 ELSE 0 END) AS male_patients, 
    SUM(CASE WHEN gender = 'F' THEN 1 ELSE 0 END) AS female_patients
FROM 
    patients;
