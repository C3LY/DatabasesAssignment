-- list all operations that overlap times
-- theatre no = theatre
-- start time - Time1 no date
-- start time of second op -  time2
-- if(tbl2.startDateTime <= (addtime(TIME(tbl1.startDateTime), duration))  AND addtime(TIME(tbl2.startDateTime), duration) >= table1.startDateTime)
-- ((TIME(HO2.startDateTime)) <= (ADDTIME(TIME(HO1.startDateTime),HO1.duration)))


SELECT HO1.theatreNo, HO1.startDateTime as starttime1, (addtime(TIME(HO1.startDateTime), HO1.duration)) as endtime1, HO2.startDateTime as starttime2, (addtime(TIME(HO2.startDateTime), HO2.duration)) as endtime2, if((Time('2016-12-02 09:00:00') < TIME('2016-12-02 11:00:00')), 5,6) as ifstate
FROM Hospital_Operation AS HO1
    INNER Join Hospital_Operation as HO2 on
        (HO1.theatreNo = HO2.theatreNo) AND
        (DATE(HO1.startDateTime) = DATE(HO2.startDateTime)) AND
        ((TIME(HO2.startDateTime)) < (addtime(TIME(HO1.startDateTime), HO1.duration))) AND
        ((addtime(TIME(HO2.startDateTime), HO2.duration)) >= (TIME(HO1.startDateTime)))
        -- (addtime(TIME(HO2.startDateTime), HO2.duration) >= HO1.startDateTime))
 GROUP BY HO1.theatreNo, HO1.startDateTime
HAVING endtime1 <> endtime2;