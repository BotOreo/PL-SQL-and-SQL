set serveroutput on
set verify off
accept vnum prompt 'Enter the number here, doofus : ' 

DECLARE 
v_num doctor.salpermon%type;
v_sal doctor.salpermon%type;
v_name doctor.doc_name%type;

BEGIN
SELECT DOC_NAME,SALPERMON
INTO v_name, v_sal
from doctor
where doc_id =&vdocid;

v_num :=v_sal * &vnum;

dbms_output.put_line('The doctor name is : '||v_name);
dbms_output.put_line('The salary now is : '||to_char(v_num,'fm$99,999,999,999.00'));

EXCEPTION
	when no_data_found then
	dbms_output.put_line('There is no such doctor !');

END;
/



