SELECT *, count(*) as ops
FROM Hospital_Operation
GROUP BY date(startDateTime), theatreNo
