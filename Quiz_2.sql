set serveroutput on
set verify off
ACCEPT doc_id PROMPT 'Enter Doctor ID : '

DECLARE
docid doctor.doc_id%TYPE;
docname doctor.doc_name%TYPE;
salary doctor.salpermon%TYPE;
ann_Bonus number(10);
w_area doctor.area%TYPE;

 

BEGIN

docid:=&doc_id;

SELECT doc_name, salpermon, area INTO docname, salary, w_area
FROM doctor
WHERE doc_id=docid;

ann_Bonus:=AnnualBonus(w_area);

dbms_output.put_line('Doc Name : '||docname);
dbms_output.put_line('Salary per month : '||salary);
dbms_output.put_line('Area : '||w_area);
dbms_output.put_line('Annual Bonus : '||ann_Bonus);

END;
/