SELECT HO1.theatreNo, time(HO1.startDateTime) as Time1,  time(HO2.startDateTime) as Time2
FROM Hospital_Operation AS HO1
    inner JOIN Hospital_Operation as HO2 on
        (HO1.theatreNo = HO2.theatreNo)
        AND HO1.startDateTime < HO2.startDateTime
 WHERE (DATE(HO1.startDateTime) = DATE(HO2.startDateTime))
   AND ((TIME(HO2.startDateTime)) < (addtime(TIME(HO1.startDateTime), HO1.duration)))
   AND ((addtime(TIME(HO2.startDateTime), HO2.duration)) >= (TIME(HO1.startDateTime)))
