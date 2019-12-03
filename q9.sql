-- list all operations that overlap times
-- theatre no = theatre
-- start time - Time1 no date
-- start time of second op -  time2
-- if(tbl2.startDateTime <= (addtime(TIME(tbl1.startDateTime), duration))  AND addtime(TIME(tbl2.startDateTime), duration) >= table1.startDateTime)


select HO1.theatreNo, HO1.startDateTime, HO1.duration
from Hospital_Operation as HO1
    Inner Join Hospital_Operation as HO2 on
        (HO1.theatreNo = HO2.theatreNo) AND
        (DATE(HO1.startDateTime) = DATE(HO2.startDateTime)) AND
        (TIME(HO2.startDateTime) <= (addtime(TIME(HO1.startDateTime), HO1.duration)) AND (addtime(TIME(HO2.startDateTime), HO2.duration) >= HO1.startDateTime))
-- GROUP BY (date(startDateTime))