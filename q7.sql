-- group by should  startdatetime be here?

SELECT NINumber, lname, count(NINumber) as operations
FROM Hospital_Doctor
LEFT OUTER JOIN Hospital_CarriesOut ON Hospital_Doctor.NINumber = Hospital_CarriesOut.doctor
GROUP BY NINumber, startDateTime
HAVING year(Hospital_CarriesOut.startDateTime)= year(curdate())
ORDER BY operations DESC;