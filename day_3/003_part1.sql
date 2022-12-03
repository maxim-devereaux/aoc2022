
-- String exploder
WITH multi AS ( SELECT ROWNUM AS rn
                FROM dual 
                CONNECT BY ROWNUM <= ( SELECT MAX( LENGTH( backpack ) / 2 ) AS len
                                       FROM aoc_3 ))
-- Sum of all priorities                                       
SELECT SUM( prio ) AS answer 
       -- Priority for unique letters in both backpacks
FROM ( SELECT a.elfnum
             ,a.item
             ,MAX( CASE WHEN ASCII( a.item ) > 96 
                        THEN ASCII( a.item ) - 96 
                        ELSE ASCII( a.item ) - 38 END ) AS prio
            -- Explode compartment 1
       FROM ( SELECT elfnum
                    ,len
                    ,rn AS idx
                    ,SUBSTR( items, rn, 1 ) AS item
                    -- Define compartment 1
              FROM ( SELECT elfnum
                           ,LENGTH( backpack ) / 2 AS len
                           ,SUBSTR( backpack, 1, LENGTH( backpack ) / 2 ) AS items 
                     FROM aoc_3 ) comp1
                   ,multi ) a
            -- Explode compartment 2
           ,( SELECT elfnum
                    ,len
                    ,rn AS idx
                    ,SUBSTR( items, rn, 1 ) AS item
                    -- Define compartment 2
              FROM ( SELECT elfnum
                           ,LENGTH( backpack ) / 2 AS len
                           ,SUBSTR( backpack, -( LENGTH( backpack ) / 2 )) AS items 
                     FROM aoc_3 ) comp2
                   ,multi ) b
WHERE  a.elfnum = b.elfnum 
AND    a.item   = b.item
GROUP BY a.elfnum, a.item )
/
