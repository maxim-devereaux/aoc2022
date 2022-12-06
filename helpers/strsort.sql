CREATE OR REPLACE FUNCTION strsort( p_string IN VARCHAR2 )
RETURN VARCHAR2 IS
    v_result    VARCHAR2(4000);
BEGIN
    SELECT LISTAGG( charval, NULL ) WITHIN GROUP ( ORDER BY charval )
    INTO   v_result
    FROM ( SELECT SUBSTR( p_string, ROWNUM, 1 ) AS charval
           FROM   dual
           CONNECT BY ROWNUM <= LENGTH( p_string ));
    RETURN v_result;
EXCEPTION
    WHEN OTHERS THEN 
        RETURN v_result;
END;
/
