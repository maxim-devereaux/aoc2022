-- Own score is 1 for X (ASCII 88), 2 for Y, 3 for Z. 3 points for draw A=X, B=Y, C=Z
SELECT SUM( ASCII( played ) - 87 +
       CASE WHEN ASCII( elf_played ) = ASCII( played ) - 23 THEN 3
            WHEN ( elf_played = 'A' AND played = 'Y' ) OR 
                 ( elf_played = 'B' AND played = 'Z' ) OR 
                 ( elf_played = 'C' AND played = 'X' ) THEN 6
            ELSE 0 END ) AS score
FROM   aoc_2
/

-- SHORTER VERSION
-- Own score is 1 for X (ASCII 88), 2 for Y, 3 for Z. 
-- 3 points for draw A=X, B=Y, C=Z
-- Diff ASCII vals, minus 23 (A-X), add 3 to prevent negative
-- Mod 3, and if 1, then we played 1 higher than them
SELECT SUM( ASCII( played ) - 87 +
       CASE WHEN ASCII( elf_played ) = ASCII( played ) - 23 THEN 3
            WHEN MOD( ASCII( played ) - ASCII( elf_played ) - 20, 3 ) = 1 THEN 6
            ELSE 0 END ) AS score
FROM   aoc_2
/

-- EVEN SHORTER VERSION
-- Map difference in played moves to 0 (we played "one less"), 1 (same move), 2 then multiply by 3 for score
SELECT SUM( ASCII( played ) - 87 + MOD( ASCII( played ) - ASCII( elf_played ) - 19, 3 ) * 3 ) AS score
FROM   aoc_2
/
