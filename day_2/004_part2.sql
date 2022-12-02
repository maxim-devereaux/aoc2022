-- X=lose, Y=draw, Z=win, so ASCII(result)-88 * 3 for round result score, 
-- Own move: convert elf move to 0, 1, 2. Increment if winning, decrement if losing, 
-- add 3 to prevent going under 0 (so really convert elf move to 3, 4 or 5 at step 1), 
-- mod 3 to get own move, add 1 for score
SELECT SUM( MOD( ASCII( elf_played ) - 62 + 
            ( CASE WHEN played = 'X' THEN -1 
                   WHEN played = 'Z' THEN 1 ELSE 0 END ), 3 ) + 1 +
       ( ASCII( played ) - 88 ) * 3 ) AS score
FROM   aoc_2
/

-- SHORTER VERSION
-- ASCII( played ) - 89 gives offset to own move. -62 - 89 = -151, and 
-- since we are modding with 3, we just need to subtract 1 rather than 151
SELECT SUM( MOD( ASCII( elf_played ) + ASCII( played ) - 1, 3 ) + 1 +
       ( ASCII( played ) - 88 ) * 3 ) AS score
FROM   aoc_2
/
