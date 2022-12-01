
DECLARE
    c_clob      CLOB;
    n_ptr       INTEGER := 1;
    n_blank     INTEGER;
    v_elf       VARCHAR2(1000);
    n_elf       INTEGER := 1;
    n_idx       INTEGER;
    v_crlf      VARCHAR2(10) := CHR(13) || CHR(10);
    v_crlf2     VARCHAR2(10) := CHR(13) || CHR(10) || CHR(13) || CHR(10);
BEGIN
    SELECT inputval 
    INTO   c_clob
    FROM   aoc2022
    WHERE  dag = 1;

    -- Check for line separator type
    IF DBMS_LOB.INSTR( c_clob, v_crlf2, n_ptr ) = 0 THEN
        v_crlf  := CHR(10);
        v_crlf2 := CHR(10) || CHR(10);        
    END IF;

    LOOP
        -- Find blank line separating two elves
        n_blank := DBMS_LOB.INSTR( c_clob, v_crlf2, n_ptr );
        IF n_blank = 0 THEN
            IF n_ptr < DBMS_LOB.GETLENGTH( c_clob ) THEN
                -- Process last chunk if we didn't finish with a separator
                v_elf := DBMS_LOB.SUBSTR( C_clob, DBMS_LOB.GETLENGTH( c_clob ) - N_ptr + 1, N_ptr );
            ELSE
                EXIT;
            END IF; 
        ELSE
            -- Process next chunk
            v_elf := DBMS_LOB.SUBSTR( C_clob, N_blank - N_ptr, N_ptr );
        END IF;

        -- Move pointer and start new elf indexing
        n_ptr := n_blank + LENGTH( v_crlf2 );
        n_idx := 1;

        -- Parse elf input into separate values
        FOR r_val IN ( SELECT COLUMN_VALUE AS cal
                       FROM TABLE( explode_string( v_elf, v_crlf )))
        LOOP
            -- Shouldn't ever be null, but just in case
            IF r_val.cal IS NOT NULL THEN
                INSERT INTO aoc_1
                VALUES ( n_elf, n_idx, TO_NUMBER( r_val.cal ));
                n_idx := n_idx + 1;
            END IF;
        END LOOP;
        n_elf := n_elf + 1;
        
        IF n_blank = 0 THEN
            EXIT;
        END IF;
    END LOOP;
END;
/
