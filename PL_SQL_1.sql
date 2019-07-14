set serveroutput on
set verify off
accept vnum prompt 'Enter the number here ->' 

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
dbms_output.put_line('The number is '||v_num);
END;
/

