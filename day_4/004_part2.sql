SELECT COUNT(*)
FROM   aoc_4
-- Elf 1 contains elf 2
WHERE ( elf1_start <= elf2_start AND elf1_end >= elf2_end )
-- Elf 2 contains elf 1
OR    ( elf2_start <= elf1_start AND elf2_end >= elf1_end )
-- Overlap (elf 2 before elf 1)
OR    elf1_start BETWEEN elf2_start AND elf2_end
-- Overlap (elf 1 before elf 2)
OR    elf2_start BETWEEN elf1_start AND elf1_end
/
