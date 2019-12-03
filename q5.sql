SELECT NINumber, fname, lname, ROUND(weight/ POWER((height/100),2),3) AS BMI
FROM Hospital_Patient
WHERE ((DATEDIFF(CURRENT_DATE, dateOfBirth)/365)<30)