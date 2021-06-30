/* In phpmyadmin, go to the routine tab and add new routine > function
   Name the routine function as "strip_html_tags", choose "function" as type, add one parameter named "string" of type "text" and the result type as "text" 
   Leave "deterministic" unchecked, security type "definer", SQL data access type "no sql"
   Add code from BEGIN TO END to the definition field.
*/

--CREATE FUNCTION strip_html_tags(string TEXT) RETURNS TEXT 
--NOT DETERMINISTIC NO SQL 
--SQL SECURITY DEFINER 
BEGIN 
  DECLARE start,end INT DEFAULT 1; 
  LOOP 
    SET start = LOCATE("<", string, start);
    IF (!start) THEN RETURN string; END IF;
    SET end = LOCATE(">", string, start);
    IF (!end) THEN SET end = start; END IF;
    SET string = INSERT(string, start, end - start + 1, "");
  END LOOP;
END;

/*
Then call the function in the sql statement
strip_html_tags(pl.description_short) AS 'description'
*/
