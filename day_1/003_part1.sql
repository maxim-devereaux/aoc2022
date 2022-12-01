
SELECT cal
FROM ( SELECT elfnum, SUM( calories ) AS cal
       FROM aoc_1
       GROUP BY elfnum
       ORDER BY 2 DESC 
       FETCH FIRST 1 ROWS ONLY )
/
