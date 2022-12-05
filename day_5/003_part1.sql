DECLARE
    TYPE t_stacks IS TABLE OF VARCHAR2(100)
    INDEX BY PLS_INTEGER; 
    tbl_stacks  t_stacks;
    v_data      VARCHAR2(100);
    n_split     INTEGER;
    n_ptr       INTEGER;
    n_sep1      INTEGER;
    n_sep2      INTEGER;
    n_crates    INTEGER;
    n_from      INTEGER;
    n_to        INTEGER;
    
    CURSOR c_moves ( n_start IN INTEGER ) IS
    SELECT *
    FROM   aoc_5
    WHERE  rowval >= n_start
    ORDER BY rowval;
BEGIN
    -- Separate stacks from moves
    SELECT rowval
    INTO   n_split
    FROM   aoc_5
    WHERE  rowdata IS NULL;
    
    FOR l_i IN REVERSE 1..n_split - 2
    LOOP
        SELECT rowdata
        INTO   v_data
        FROM   aoc_5
        WHERE  rowval = l_i;
    
        n_ptr := 1;
        
        LOOP
            n_sep1 := INSTR( v_data, '[', n_ptr );
            n_sep2 := INSTR( v_data, ']', n_ptr ); 
            n_ptr  := n_sep2 + 1;
            
            IF n_sep1 = 0 THEN
                EXIT;
            END IF;
            
            IF NOT tbl_stacks.EXISTS(( n_sep1 + 3 ) / 4 ) THEN
                tbl_stacks(( n_sep1 + 3 ) / 4 ) := '';
            END IF;
            
            
            tbl_stacks(( n_sep1 + 3 ) / 4 ) := tbl_stacks(( n_sep1 + 3 ) / 4 ) ||
                SUBSTR( v_data, n_sep1 + 1, n_sep2 - n_sep1 - 1 );
        END LOOP;
    END LOOP;
    
    FOR l_i IN 1..tbl_stacks.COUNT
    LOOP
        DBMS_OUTPUT.PUT_LINE( tbl_stacks( l_i ));
    END LOOP;
    
    FOR r_move IN c_moves( n_split + 1 )
    LOOP
        DBMS_OUTPUT.PUT_LINE( r_move.rowdata );
        n_crates := SUBSTR( r_move.rowdata, INSTR( r_move.rowdata, CHR(32), 1, 1 ) + 1, 
                        INSTR( r_move.rowdata, CHR(32), 1, 2 ) - INSTR( r_move.rowdata, CHR(32), 1, 1 ) - 1 );
        n_from := SUBSTR( r_move.rowdata, INSTR( r_move.rowdata, CHR(32), 1, 3 ) + 1, 
                        INSTR( r_move.rowdata, CHR(32), 1, 4 ) - INSTR( r_move.rowdata, CHR(32), 1, 3 ) - 1 );
        n_to := SUBSTR( r_move.rowdata, INSTR( r_move.rowdata, CHR(32), 1, 5 ) + 1 );
    
        v_data := SUBSTR( tbl_stacks( n_from ), -n_crates );
        tbl_stacks( n_from ) := SUBSTR( tbl_stacks( n_from ), 1, LENGTH( tbl_stacks( n_from )) - n_crates );
        FOR l_i IN 1..LENGTH( v_data )
        LOOP
            tbl_stacks( n_to ) := tbl_stacks( n_to ) || SUBSTR( v_data, -l_i, 1 );
        END LOOP;
    
        FOR l_i IN 1..tbl_stacks.COUNT
        LOOP
            DBMS_OUTPUT.PUT_LINE( tbl_stacks( l_i ));
        END LOOP;
    END LOOP;  
    
    v_data := NULL;
    FOR l_i IN 1..tbl_stacks.COUNT
    LOOP
        v_data := v_data || SUBSTR( tbl_stacks( l_i ), -1 );
    END LOOP;

    DBMS_OUTPUT.PUT_LINE( v_data );
      
END;
/

    
