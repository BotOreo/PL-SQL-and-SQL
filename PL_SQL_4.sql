set serveroutput on
set verify off
accept vpatid prompt 'Enter the patient ID: ' 

DECLARE 
v_name varchar2(100);
v_docid doctor.doc_id%type;
v_name2 doctor.doc_name%type;

BEGIN
SELECT patient.pt_fname||pt_lname, doctor.doc_id
INTO v_name,v_docid
from doctor cross join patient
where pt_id =&vpatid;

dbms_output.put_line('The patient name is : '||v_name);
dbms_output.put_line('The doctor name is : '||v_name2);

EXCEPTION
	when no_data_found then
	dbms_output.put_line('There is no such doctor !');

END;
/



