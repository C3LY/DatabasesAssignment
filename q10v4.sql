SELECT theatreNo,
       day(date(startDateTime))       AS day,
       monthname(date(startDateTime)) AS month,
       year(date(startDateTime))      AS year,
       count(theatreNo)               AS numOfOps,
       maxOps
FROM (
         SELECT *, Max(numofOps) AS maxOps
         FROM (
                  SELECT *, COUNT(theatreNo) AS numOfOps
                  FROM Hospital_Operation
                  GROUP BY DATE(startDateTime), theatreNo
              ) AS alias1
     ) AS alias2
-- GROUP BY date(startDateTime), theatreNo
ORDER BY theatreNo ASC, startDateTime ASC