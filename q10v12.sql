SELECT HO.theatreNo, date(HO.startDateTime), MAX(ops) maxSal
FROM Hospital_Operation HO
JOIN(
 SELECT *, count(theatreNo) as ops
FROM Hospital_Operation
GROUP BY date(startDateTime), theatreNo
    ) as alias2
ON ops > 2
group by HO.theatreNo, date(HO.startDateTime)