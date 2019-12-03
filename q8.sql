-- doctors not mentored
-- mdentoring someone else
-- ni no
--  uppercase initial of first name(1 letter) init
-- last name
-- MENTEE.lname as mentee

SELECT MENTOR.NINumber, left(upper(MENTOR.fname),1) as init, MENTOR.lname as mentor
FROM Hospital_Doctor AS MENTOR
INNER JOIN Hospital_Doctor MENTEE on MENTOR.NINumber = MENTEE.mentored_by
WHERE MENTOR.mentored_by is null;