-- list all operations that overlap times
-- theatre no = theatre
-- start time - Time1 no date
-- start time of second op -  time2
-- if(tbl2.startDateTime <= (addtime(TIME(tbl1.startDateTime), duration))  AND addtime(TIME(tbl2.startDateTime), duration) >= table1.startDateTime)
-- ((TIME(HO2.startDateTime)) <= (ADDTIME(TIME(HO1.startDateTime),HO1.duration)))


SELECT HO1.theatreNo, time(HO1.startDateTime) as Time1,  time(HO2.startDateTime) as Time2
FROM Hospital_Operation AS HO1
    inner JOIN Hospital_Operation as HO2 on
        (HO1.theatreNo = HO2.theatreNo)
        AND HO1.startDateTime < HO2.startDateTime
 WHERE (DATE(HO1.startDateTime) = DATE(HO2.startDateTime))
   AND ((TIME(HO2.startDateTime)) < (addtime(TIME(HO1.startDateTime), HO1.duration)))
   AND ((addtime(TIME(HO2.startDateTime), HO2.duration)) >= (TIME(HO1.startDateTime)))
