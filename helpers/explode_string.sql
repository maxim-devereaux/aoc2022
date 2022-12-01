
CREATE OR REPLACE FUNCTION explode_string( p_string IN VARCHAR2, p_find IN VARCHAR2 )
RETURN t_varchar2_array Pipelined AS

    CURSOR c_explode( cp_string IN Varchar2, cp_find IN Varchar2 ) IS
        SELECT UPPER( REGEXP_SUBSTR( cp_string, '[^' || cp_find || ']+', 1, LEVEL )) AS dataval
        FROM   dual
        CONNECT BY REGEXP_SUBSTR( cp_string,'[^' || cp_find || ']+', 1, LEVEL) IS NOT NULL;
BEGIN
    FOR r_explode IN c_explode( p_string, p_find )
    LOOP
        PIPE ROW ( r_explode.dataval );
    END LOOP;
    
    RETURN;
    
END explode_string;
/
