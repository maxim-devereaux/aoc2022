
-- String exploder
WITH multi AS ( SELECT ROWNUM AS rn
                FROM dual 
                CONNECT BY ROWNUM <= ( SELECT MAX( LENGTH( backpack )) AS len
                                       FROM aoc_3 ))
-- Sum of all priorities                                       
SELECT SUM( prio ) AS answer 
       -- Priority for unique letters across three elves
FROM ( SELECT DISTINCT a.elfgroup
                      ,a.item
                      ,CASE WHEN ASCII( a.item ) > 96 
                            THEN ASCII( a.item ) - 96 
                            ELSE ASCII( a.item ) - 38 END AS prio
            -- Explode elf 1 backpack
       FROM ( SELECT elfnum
                    ,elfgroup 
                    ,SUBSTR( items, rn, 1 ) as item
                    -- Elf 1 in group of 3
              FROM ( SELECT elfnum
                           ,CEIL( elfnum / 3 ) AS elfgroup
                           ,backpack AS items 
                     FROM aoc_3 
                     WHERE MOD( elfnum, 3 ) = 1 ) comp1, multi ) a
            -- Explode elf 2 backpack
           ,( SELECT elfnum
                    ,elfgroup 
                    ,SUBSTR( items, rn, 1 ) as item
                    -- Elf 2 in group of 3
              FROM ( SELECT elfnum
                           ,CEIL( elfnum / 3 ) AS elfgroup
                           ,backpack AS items 
                     FROM aoc_3 
                     WHERE MOD( elfnum, 3 ) = 2 ) comp1, multi ) b
            -- Explode elf 3 backpack
           ,( SELECT elfnum
                    ,elfgroup 
                    ,SUBSTR( items, rn, 1 ) as item
                    -- Elf 3 in group of 3
              FROM ( SELECT elfnum
                           ,CEIL( elfnum / 3 ) AS elfgroup
                           ,backpack AS items 
                     FROM aoc_3 
                     WHERE MOD( elfnum, 3 ) = 0 ) comp1, multi ) c
-- Match elves by group and matching item
WHERE  a.elfgroup = b.elfgroup
AND    a.item     = b.item
AND    a.elfgroup = c.elfgroup
AND    a.item     = c.item )
/
