-- each op theatre, which days had the most operaitons
-- five columns = theatre number
-- day of month - dom

-- name of month - firsat character cap - month
-- 4 digit year with heading year
-- nubmer of ops on that dayin the theatre numOps

select HO1.theatreNo, day(date(HO1.startDateTime)) as day, monthname(date(HO1.startDateTime))  as month, year(date(HO1.startDateTime)) as year,  count(HO1.theatreNo) as numOfOps
from Hospital_Operation as HO1
left outer JOIN Hospital_Operation as HO2 on
        (HO1.theatreNo = HO2.theatreNo)
        AND HO1.startDateTime < HO2.startDateTime
where (HO2.theatreNo is NULL) AND HO2.startDateTime is null
GROUP BY date(HO1.startDateTime), HO1.theatreNo
ORDER BY HO1.theatreNo ASC, HO1.startDateTime asc