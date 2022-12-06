CREATE OR REPLACE FUNCTION strsortunique( p_string IN VARCHAR2 )
RETURN VARCHAR2 IS
    v_result    VARCHAR2(4000);
BEGIN
    v_result := strsort( p_string );
    v_result := REGEXP_REPLACE( v_result, '(.)\1+', '\1');
    RETURN v_result;
EXCEPTION
    WHEN OTHERS THEN 
        RETURN v_result;
END;
/
