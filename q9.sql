-- list all operations that overlap times
-- theatre no = theatre
-- start time - Time1 no date
-- start time of second op -  time2


select tbl2theatreNo, startDateTime, duration, count(date(startDateTime)) as count
from Hospital_Operation as tble1
join Hospital_Operation as tble2 ON tble1.theatreNo = tble2.theatreNo

GROUP BY (date(startDateTime))