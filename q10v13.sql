select t2.theatreNo,
       day(t2.date1)       AS day,
       monthname(t2.date1) AS month,
       year(t2.date1)      AS year,
       t2.totalops as numOps
from (
select theatreNo, max(totalops) as totalops from (
select theatreNo, date(startDateTime), count(*) as totalops
  from Hospital_Operation t
  group by theatreNo, date(startDateTime)
) s1 group by theatreNo) w join
(select theatreNo, date(startDateTime) as date1, count(*) as totalops
  from Hospital_Operation t
  group by theatreNo, date(startDateTime)
) t2 on t2.theatreNo = w.theatreNo and t2.totalops = w.totalops
ORDER BY theatreNo asc, date1 asc;