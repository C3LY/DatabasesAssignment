select t2.*
from (
select theatreNo, max(totalops) as totalops from (
select theatreNo, date(startDateTime), count(*) as totalops
  from Hospital_Operation t
  group by theatreNo, date(startDateTime)
) s1 group by theatreNo) w join
(select theatreNo, date(startDateTime), count(*) as totalops
  from Hospital_Operation t
  group by theatreNo, date(startDateTime)
) t2 on t2.theatreNo = w.theatreNo and t2.totalops = w.totalops;