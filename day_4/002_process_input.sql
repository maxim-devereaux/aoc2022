DECLARE
    c_clob      CLOB;
    n_ptr       INTEGER := 1;
    n_sep       INTEGER;
    v_row       VARCHAR2(50);
    v_row2      VARCHAR2(50);
    n_row       INTEGER := 1;
    v_crlf      VARCHAR2(10) := CHR(13) || CHR(10);
    v_crlf2     VARCHAR2(10) := CHR(13) || CHR(10) || CHR(13) || CHR(10);
BEGIN
    SELECT inputval 
    INTO   c_clob
    FROM   aoc2022
    WHERE  dag = 4;

    -- Check for line separator type
    IF DBMS_LOB.INSTR( c_clob, v_crlf, n_ptr ) = 0 THEN
        v_crlf  := CHR(10);
        v_crlf2 := CHR(10) || CHR(10);        
    END IF;

    LOOP
        -- Get line
        n_sep := DBMS_LOB.INSTR( c_clob, v_crlf, n_ptr );
        IF n_sep = 0 THEN
            IF n_ptr < DBMS_LOB.GETLENGTH( c_clob ) THEN
                -- Process last line if we didn't finish with a separator
                v_row := DBMS_LOB.SUBSTR( C_clob, DBMS_LOB.GETLENGTH( c_clob ) - n_ptr + 1, n_ptr );
            ELSE
                EXIT;
            END IF; 
        ELSE
            -- Process next line
            v_row := DBMS_LOB.SUBSTR( C_clob, n_sep - n_ptr, n_ptr );
        END IF;

        -- Move pointer 
        n_ptr := n_sep + LENGTH( v_crlf );
        
        -- Split second elf
        v_row2 := SUBSTR( v_row, INSTR( v_row, ',' ) + 1 );

        -- Add pair
        INSERT INTO aoc_4
        VALUES ( n_row
                ,SUBSTR( v_row, 1, INSTR( v_row, '-' ) - 1 )
                ,SUBSTR( v_row, INSTR( v_row, '-' ) + 1, INSTR( v_row, ',' ) - INSTR( v_row, '-' ) - 1 )
                ,SUBSTR( v_row2, 1, INSTR( v_row2, '-' ) -1 )
                ,SUBSTR( v_row2, INSTR( v_row2, '-' ) + 1 ));

        n_row := n_row + 1;        
        IF n_sep = 0 THEN
            EXIT;
        END IF;
    END LOOP;
END;
/
