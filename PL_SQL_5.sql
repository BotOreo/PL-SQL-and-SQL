set serveroutput on
accept ptid prompt 'Enter the patient ID : '
set verify off

DECLARE
v_lname patient.pt_lname%type;
v_fname patient.pt_fname%type;
v_docname doctor.doc_name%type;
v_docid doctor.doc_id%type;
ptid patient.pt_id%type;

BEGIN

SELECT pt_lname, pt_fname, doc_id, doc_name, pt_id
INTO v_lname, v_fname, v_docid, v_docname, ptid
FROM patient natural join doctor
WHERE pt_id=&ptid;

dbms_output.put_line('Patient name : '||v_fname||' '||v_lname);
dbms_output.put_line('A patient of Dr. '||v_docname||' '||'('||v_docid||')');

END;
/

