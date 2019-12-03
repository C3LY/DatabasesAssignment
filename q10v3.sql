select theatreNo, day(date(startDateTime)) as day, monthname(date(startDateTime))  as month, year(date(startDateTime)) as year,  count(theatreNo) as numOfOps
from Hospital_Operation
GROUP BY date(startDateTime), theatreNo
ORDER BY theatreNo ASC, startDateTime asc