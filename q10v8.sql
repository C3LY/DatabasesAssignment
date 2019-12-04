SELECT p.theatreNo,
       day(date(p.startDateTime))       AS day,
       monthname(date(p.startDateTime)) AS month,
       year(date(p.startDateTime))      AS year,
    --   es.maxNos              AS numOfOps
FROM Hospital_Operation as p
INNER JOIN
    (
             SELECT *, max(ops)
            FROM Hospital_Operation
            CROSS JOIN (
                SELECT IF(count(*)max(ops)
                FROM (
                         SELECT *, count(*) AS ops
                         FROM Hospital_Operation
                         GROUP BY theatreNo, date(startDateTime)
                     ) AS alias2
            ) as alias3
            GROUP BY theatreNo, date(startDateTime)

      --  GROUP BY DATE(startDateTime), theatreNo
    ) as es
    on p.theatreNo = es.theatreNo and es.ops = es.maxNos
-- ORDER BY theatreNo ASC, startDateTime ASC

