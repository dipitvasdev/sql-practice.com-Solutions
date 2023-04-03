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
