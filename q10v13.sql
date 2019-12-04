SELECT HO2.theatreNo,
       day(HO2.date1)       AS dom,
       monthname(HO2.date1) AS month,
       year(HO2.date1)      AS year,
       HO2.totalops         AS numOps
FROM (
         SELECT theatreNo,
                max(totalops) AS maxops -- highest num of ops for each theatreno
         FROM (
                  SELECT theatreNo,
                         date(startDateTime),
                         count(*) AS totalops -- counts total ops for each day
                  FROM Hospital_Operation AS HO1
                  GROUP BY theatreNo, date(startDateTime)
              ) AS totalforDaysT
         GROUP BY theatreNo) AS maxOpT
    JOIN
     (SELECT theatreNo,
             date(startDateTime) AS date1,
             count(*)            AS totalops -- counts total ops for each day
      FROM Hospital_Operation AS HO1
      GROUP BY theatreNo, date(startDateTime)
     ) AS HO2
     ON HO2.theatreNo = maxOpT.theatreNo AND HO2.totalops = maxOpT.maxops
ORDER BY theatreNo ASC, date1 ASC;