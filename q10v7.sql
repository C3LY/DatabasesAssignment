SELECT theatreNo,
       day(date(startDateTime))       AS day,
       monthname(date(startDateTime)) AS month,
       year(date(startDateTime))      AS year,
       (nums)              AS numOfOps
FROM (
        SELECT *, COUNT(theatreNo) AS nums
        FROM Hospital_Operation
        GROUP BY DATE(startDateTime), theatreNo
    ) as alias1
GROUP BY theatreNo
ORDER BY theatreNo ASC, startDateTime ASC