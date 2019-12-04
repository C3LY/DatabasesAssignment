SELECT theatreNo,
       day(date(startDateTime))       AS day,
       monthname(date(startDateTime)) AS month,
       year(date(startDateTime))      AS year,
       count(theatreNo)               AS numOfOps
FROM Hospital_Operation orig
    join (SELECT *, count(theatreNo) AS numOfOps
    FROM Hospital_Operation
    GROUP BY date(startDateTime), theatreNo) as alias3
inner join(
    select theatreNo, startDateTime, max(Ops) maxops
    from (
         SELECT *, count(theatreNo) AS Ops
FROM Hospital_Operation
GROUP BY date(startDateTime), theatreNo
             ) as alias4
   -- group by theatreNo, date(startDateTime)
    ) as alias2
on orig.theatreNo = alias2.theatreNo and date(orig.startDateTime) = date(alias2.startDateTime)
GROUP BY date(startDateTime), theatreNo