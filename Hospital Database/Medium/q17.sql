/* Show all columns for patient_id 542's most recent admission_date. */

SELECT *
FROM admissions
WHERE patient_id = 542
AND admission_date = (
  SELECT MAX(admission_date)
  FROM admissions
  WHERE patient_id = 542
)
