SET SERVEROUTPUT ON;
SET VERIFY OFF;
ACCEPT val PROMPT 'Enter the E-Book ID: ';

DECLARE
   bookid VARCHAR2(10) := '&val';
   validation NUMBER;
   vtitle ebook.title%TYPE;

BEGIN
   validation := chkavailable_sf(bookid);

   SELECT title
   INTO vtitle
   FROM ebook
   WHERE ebookid = bookid;

   IF validation = 1 THEN
      DBMS_OUTPUT.PUT_LINE('Requested book: ' || vtitle || ' (' || bookid ||') | Status: AVAILABLE');
   ELSE
      DBMS_OUTPUT.PUT_LINE('Requested book: ' || vtitle || ' (' || bookid ||') | Status: UNAVAILABLE');
   END IF;
END;
/