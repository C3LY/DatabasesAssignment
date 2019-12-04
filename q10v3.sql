SELECT theatreNo,
       day(date(startDateTime))       AS day,
       monthname(date(startDateTime)) AS month,
       year(date(startDateTime))      AS year,
       count(theatreNo)               AS numOfOps,
        startDateTime
FROM Hospital_Operation
GROUP BY date(startDateTime), theatreNo
ORDER BY theatreNo ASC, startDateTime ASC