DECLARE
    c_clob      CLOB;
    n_ptr       INTEGER := 4;
    n_len       INTEGER;
    v_4         VARCHAR2(4);
BEGIN
    SELECT inputval 
    INTO   c_clob
    FROM   aoc2022
    WHERE  dag = 6;

    n_len := DBMS_LOB.GETLENGTH( c_clob );

    LOOP
        -- Get 4 chars
        v_4 := DBMS_LOB.SUBSTR( c_clob, 4, n_ptr-3 );
    
        IF SUBSTR( v_4, 1, 1 ) != SUBSTR( v_4, 2, 1 ) AND
           SUBSTR( v_4, 1, 1 ) != SUBSTR( v_4, 3, 1 ) AND
           SUBSTR( v_4, 1, 1 ) != SUBSTR( v_4, 4, 1 ) AND
           SUBSTR( v_4, 2, 1 ) != SUBSTR( v_4, 3, 1 ) AND
           SUBSTR( v_4, 2, 1 ) != SUBSTR( v_4, 4, 1 ) AND
           SUBSTR( v_4, 3, 1 ) != SUBSTR( v_4, 4, 1 ) THEN
           
            DBMS_OUTPUT.PUT_LINE( 'Matching at: ' || n_ptr || ', ' || v_4 );
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
    n_ptr       INTEGER := 4;
    n_len       INTEGER;
    v_4         VARCHAR2(4);
BEGIN
    SELECT inputval 
    INTO   c_clob
    FROM   aoc2022
    WHERE  dag = 6;

    n_len := DBMS_LOB.GETLENGTH( c_clob );

    LOOP
        -- Get 4 chars
        v_4 := DBMS_LOB.SUBSTR( c_clob, 4, n_ptr-3 );
    
        IF strsort( v_4 ) = strsortunique( v_4 ) THEN           
            DBMS_OUTPUT.PUT_LINE( 'Matching at: ' || n_ptr || ', ' || v_4 );
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
