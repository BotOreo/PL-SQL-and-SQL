SET SERVEROUTPUT ON;
SET VERIFY OFF;
ACCEPT val PROMPT 'Enter the E-Book ID: ';

DECLARE
   ebookid VARCHAR2(10) := '&val';
   expireddate DATE;

BEGIN
   expireddate := getexpdate_sf(ebookid);
   DBMS_OUTPUT.PUT_LINE('EXPIRED DATE FOR THE ISSUE IS: ' || expireddate);
END;
/