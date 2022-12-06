DECLARE
    c_clob      CLOB;
    n_ptr       INTEGER := 14;
    n_len       INTEGER;
    v_14         VARCHAR2(14);
BEGIN
    SELECT inputval 
    INTO   c_clob
    FROM   aoc2022
    WHERE  dag = 6;

    n_len := DBMS_LOB.GETLENGTH( c_clob );

    LOOP
        -- Get 14 chars
        v_14 := DBMS_LOB.SUBSTR( c_clob, 14, n_ptr-13 );
    
        -- All different (really ugly)
        IF SUBSTR( v_14, 1, 1 ) != SUBSTR( v_14, 2, 1 ) AND
           SUBSTR( v_14, 1, 1 ) != SUBSTR( v_14, 3, 1 ) AND
           SUBSTR( v_14, 1, 1 ) != SUBSTR( v_14, 4, 1 ) AND
           SUBSTR( v_14, 1, 1 ) != SUBSTR( v_14, 5, 1 ) AND
           SUBSTR( v_14, 1, 1 ) != SUBSTR( v_14, 6, 1 ) AND
           SUBSTR( v_14, 1, 1 ) != SUBSTR( v_14, 7, 1 ) AND
           SUBSTR( v_14, 1, 1 ) != SUBSTR( v_14, 8, 1 ) AND
           SUBSTR( v_14, 1, 1 ) != SUBSTR( v_14, 9, 1 ) AND
           SUBSTR( v_14, 1, 1 ) != SUBSTR( v_14, 10, 1 ) AND
           SUBSTR( v_14, 1, 1 ) != SUBSTR( v_14, 11, 1 ) AND
           SUBSTR( v_14, 1, 1 ) != SUBSTR( v_14, 12, 1 ) AND
           SUBSTR( v_14, 1, 1 ) != SUBSTR( v_14, 13, 1 ) AND
           SUBSTR( v_14, 1, 1 ) != SUBSTR( v_14, 14, 1 ) AND
           SUBSTR( v_14, 2, 1 ) != SUBSTR( v_14, 3, 1 ) AND
           SUBSTR( v_14, 2, 1 ) != SUBSTR( v_14, 4, 1 ) AND
           SUBSTR( v_14, 2, 1 ) != SUBSTR( v_14, 5, 1 ) AND
           SUBSTR( v_14, 2, 1 ) != SUBSTR( v_14, 6, 1 ) AND
           SUBSTR( v_14, 2, 1 ) != SUBSTR( v_14, 7, 1 ) AND
           SUBSTR( v_14, 2, 1 ) != SUBSTR( v_14, 8, 1 ) AND
           SUBSTR( v_14, 2, 1 ) != SUBSTR( v_14, 9, 1 ) AND
           SUBSTR( v_14, 2, 1 ) != SUBSTR( v_14, 10, 1 ) AND
           SUBSTR( v_14, 2, 1 ) != SUBSTR( v_14, 11, 1 ) AND
           SUBSTR( v_14, 2, 1 ) != SUBSTR( v_14, 12, 1 ) AND
           SUBSTR( v_14, 2, 1 ) != SUBSTR( v_14, 13, 1 ) AND
           SUBSTR( v_14, 2, 1 ) != SUBSTR( v_14, 14, 1 ) AND
           SUBSTR( v_14, 3, 1 ) != SUBSTR( v_14, 4, 1 ) AND
           SUBSTR( v_14, 3, 1 ) != SUBSTR( v_14, 5, 1 ) AND
           SUBSTR( v_14, 3, 1 ) != SUBSTR( v_14, 6, 1 ) AND
           SUBSTR( v_14, 3, 1 ) != SUBSTR( v_14, 7, 1 ) AND
           SUBSTR( v_14, 3, 1 ) != SUBSTR( v_14, 8, 1 ) AND
           SUBSTR( v_14, 3, 1 ) != SUBSTR( v_14, 9, 1 ) AND
           SUBSTR( v_14, 3, 1 ) != SUBSTR( v_14, 10, 1 ) AND
           SUBSTR( v_14, 3, 1 ) != SUBSTR( v_14, 11, 1 ) AND
           SUBSTR( v_14, 3, 1 ) != SUBSTR( v_14, 12, 1 ) AND
           SUBSTR( v_14, 3, 1 ) != SUBSTR( v_14, 13, 1 ) AND
           SUBSTR( v_14, 3, 1 ) != SUBSTR( v_14, 14, 1 ) AND
           SUBSTR( v_14, 4, 1 ) != SUBSTR( v_14, 5, 1 ) AND
           SUBSTR( v_14, 4, 1 ) != SUBSTR( v_14, 6, 1 ) AND
           SUBSTR( v_14, 4, 1 ) != SUBSTR( v_14, 7, 1 ) AND
           SUBSTR( v_14, 4, 1 ) != SUBSTR( v_14, 8, 1 ) AND
           SUBSTR( v_14, 4, 1 ) != SUBSTR( v_14, 9, 1 ) AND
           SUBSTR( v_14, 4, 1 ) != SUBSTR( v_14, 10, 1 ) AND
           SUBSTR( v_14, 4, 1 ) != SUBSTR( v_14, 11, 1 ) AND
           SUBSTR( v_14, 4, 1 ) != SUBSTR( v_14, 12, 1 ) AND
           SUBSTR( v_14, 4, 1 ) != SUBSTR( v_14, 13, 1 ) AND
           SUBSTR( v_14, 4, 1 ) != SUBSTR( v_14, 14, 1 ) AND
           SUBSTR( v_14, 5, 1 ) != SUBSTR( v_14, 6, 1 ) AND
           SUBSTR( v_14, 5, 1 ) != SUBSTR( v_14, 7, 1 ) AND
           SUBSTR( v_14, 5, 1 ) != SUBSTR( v_14, 8, 1 ) AND
           SUBSTR( v_14, 5, 1 ) != SUBSTR( v_14, 9, 1 ) AND
           SUBSTR( v_14, 5, 1 ) != SUBSTR( v_14, 10, 1 ) AND
           SUBSTR( v_14, 5, 1 ) != SUBSTR( v_14, 11, 1 ) AND
           SUBSTR( v_14, 5, 1 ) != SUBSTR( v_14, 12, 1 ) AND
           SUBSTR( v_14, 5, 1 ) != SUBSTR( v_14, 13, 1 ) AND
           SUBSTR( v_14, 5, 1 ) != SUBSTR( v_14, 14, 1 ) AND
           SUBSTR( v_14, 6, 1 ) != SUBSTR( v_14, 7, 1 ) AND
           SUBSTR( v_14, 6, 1 ) != SUBSTR( v_14, 8, 1 ) AND
           SUBSTR( v_14, 6, 1 ) != SUBSTR( v_14, 9, 1 ) AND
           SUBSTR( v_14, 6, 1 ) != SUBSTR( v_14, 10, 1 ) AND
           SUBSTR( v_14, 6, 1 ) != SUBSTR( v_14, 11, 1 ) AND
           SUBSTR( v_14, 6, 1 ) != SUBSTR( v_14, 12, 1 ) AND
           SUBSTR( v_14, 6, 1 ) != SUBSTR( v_14, 13, 1 ) AND
           SUBSTR( v_14, 6, 1 ) != SUBSTR( v_14, 14, 1 ) AND
           SUBSTR( v_14, 7, 1 ) != SUBSTR( v_14, 8, 1 ) AND
           SUBSTR( v_14, 7, 1 ) != SUBSTR( v_14, 9, 1 ) AND
           SUBSTR( v_14, 7, 1 ) != SUBSTR( v_14, 10, 1 ) AND
           SUBSTR( v_14, 7, 1 ) != SUBSTR( v_14, 11, 1 ) AND
           SUBSTR( v_14, 7, 1 ) != SUBSTR( v_14, 12, 1 ) AND
           SUBSTR( v_14, 7, 1 ) != SUBSTR( v_14, 13, 1 ) AND
           SUBSTR( v_14, 7, 1 ) != SUBSTR( v_14, 14, 1 ) AND
           SUBSTR( v_14, 8, 1 ) != SUBSTR( v_14, 9, 1 ) AND
           SUBSTR( v_14, 8, 1 ) != SUBSTR( v_14, 10, 1 ) AND
           SUBSTR( v_14, 8, 1 ) != SUBSTR( v_14, 11, 1 ) AND
           SUBSTR( v_14, 8, 1 ) != SUBSTR( v_14, 12, 1 ) AND
           SUBSTR( v_14, 8, 1 ) != SUBSTR( v_14, 13, 1 ) AND
           SUBSTR( v_14, 8, 1 ) != SUBSTR( v_14, 14, 1 ) AND
           SUBSTR( v_14, 9, 1 ) != SUBSTR( v_14, 10, 1 ) AND
           SUBSTR( v_14, 9, 1 ) != SUBSTR( v_14, 11, 1 ) AND
           SUBSTR( v_14, 9, 1 ) != SUBSTR( v_14, 12, 1 ) AND
           SUBSTR( v_14, 9, 1 ) != SUBSTR( v_14, 13, 1 ) AND
           SUBSTR( v_14, 9, 1 ) != SUBSTR( v_14, 14, 1 ) AND
           SUBSTR( v_14, 10, 1 ) != SUBSTR( v_14, 11, 1 ) AND
           SUBSTR( v_14, 10, 1 ) != SUBSTR( v_14, 12, 1 ) AND
           SUBSTR( v_14, 10, 1 ) != SUBSTR( v_14, 13, 1 ) AND
           SUBSTR( v_14, 10, 1 ) != SUBSTR( v_14, 14, 1 ) AND
           SUBSTR( v_14, 11, 1 ) != SUBSTR( v_14, 12, 1 ) AND
           SUBSTR( v_14, 11, 1 ) != SUBSTR( v_14, 13, 1 ) AND
           SUBSTR( v_14, 11, 1 ) != SUBSTR( v_14, 14, 1 ) AND
           SUBSTR( v_14, 12, 1 ) != SUBSTR( v_14, 13, 1 ) AND
           SUBSTR( v_14, 12, 1 ) != SUBSTR( v_14, 14, 1 ) AND
           SUBSTR( v_14, 13, 1 ) != SUBSTR( v_14, 14, 1 ) THEN
           
            DBMS_OUTPUT.PUT_LINE( 'Matching at: ' || n_ptr || ', ' || v_14 );
            EXIT;
        END IF;
        
        n_ptr := n_ptr + 1;
       
        IF n_ptr > DBMS_LOB.GETLENGTH( c_clob ) THEN
            DBMS_OUTPUT.PUT_LINE( 'No match' );
            EXIT;
        END IF;
    END LOOP;
END;
/

-- Improved version using new helper functions
DECLARE
    c_clob      CLOB;
    n_ptr       INTEGER := 14;
    n_len       INTEGER;
    v_14        VARCHAR2(14);
BEGIN
    SELECT inputval 
    INTO   c_clob
    FROM   aoc2022
    WHERE  dag = 6;

    n_len := DBMS_LOB.GETLENGTH( c_clob );

    LOOP
        -- Get 4 chars
        v_14 := DBMS_LOB.SUBSTR( c_clob, 14, n_ptr-13 );
    
        IF strsort( v_14 ) = strsortunique( v_14 ) THEN           
            DBMS_OUTPUT.PUT_LINE( 'Matching at: ' || n_ptr || ', ' || v_14 );
            EXIT;
        END IF;
        
        n_ptr := n_ptr + 1;
       
        IF n_ptr > DBMS_LOB.GETLENGTH( c_clob ) THEN
            DBMS_OUTPUT.PUT_LINE( 'No match' );
            EXIT;
        END IF;
    END LOOP;
END;
/
