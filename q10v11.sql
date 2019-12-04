SELECT
  p.theatreNo,
  p.startDateTime,
  alias2.ops
FROM
  Hospital_Operation AS p
  INNER JOIN
  (
    SELECT
      theatreNo,
      MAX(ops) AS max_seats
    FROM
      (SELECT *, count(*) as ops
FROM Hospital_Operation
          GROUP BY date(startDateTime), theatreNo) as alias1
 --   GROUP BY theatreNo
  ) AS es
      join (SELECT *, count(*) as ops
FROM Hospital_Operation
          GROUP BY date(startDateTime), theatreNo) as alias2
  ON p.theatreNo = es.theatreNo
  AND alias2.ops = es.max_seats
;