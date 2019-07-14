set serveroutput on
set verify off
create or replace procedure DisplayDoc
(docid number, docname varchar2) is
	
	cnt number(10);
BEGIN

	SELECT count(pt_id)
	INTO cnt
	FROM patient
	WHERE doc_id = docid;
	
IF cnt > 0 THEN
	dbms_output.put_line('Dr. '||docname||' ('||docid||') have '||cnt||' patient(s).');
ELSE
	dbms_output.put_line('Dr. '||docname||' have '||cnt||' patient.');
END IF; 
END;
/

-------------------Anon-----------------------------
set serveroutput on
set verify off
ACCEPT doc_id PROMPT 'Enter the Doc ID: ';
DECLARE
	docname doctor.doc_name%TYPE;
	docid doctor.doc_id%TYPE;
BEGIN
	docid:=&doc_id;	

	SELECT doc_name
	INTO docname
	FROM doctor
	WHERE doc_id=docid;
	DisplayDoc(docid, docname);
EXCEPTION
	WHEN NO_DATA_FOUND THEN
		dbms_output.put_line('No doctor with this ID.');

END;
/