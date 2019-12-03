SELECT theatreNo, date(startDateTime), count(*)
FROM Hospital_Operation
GROUP BY theatreNo, date(startDateTime)
having count(*) =
       (SELECT max(c) FROM
           (SELECT Count(theatreNo) as c
               FROM Hospital_Operation AS  T
               GROUP BY theatreNo, startDateTime
               ) AS T
           )