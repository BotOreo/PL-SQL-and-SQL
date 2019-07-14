------------Question 1-----------------------
set serveroutput on
set verify off
ACCEPT name_i PROMPT 'Enter your name: ';
ACCEPT matric_i PROMPT 'Enter your matric number: ';

DECLARE
	name varchar2(30);
	name_i varchar2(30);
	matric number;
	matric_i number;

BEGIN
name:='&name_i';
matric:=&matric_i;

dbms_output.put_line('My name is : '||name);
dbms_output.put_line('Matric no : '||matric);


END;
/
----------Question 2------------------------
set serveroutput on
set verify off
declare

v_num NUMBER :=&v_num;
v_result NUMBER;

begin
v_result:=POWER(v_num,2);

dbms_output.put_line('The value of v_result is: '||v_result);

end;
/

----------Question 3------------------------
set serveroutput on
set verify off
declare

v_day VARCHAR(20);

begin
v_day:=to_char(sysdate,'DAY');

dbms_output.put_line('Today is : '||v_day);

end;
/


