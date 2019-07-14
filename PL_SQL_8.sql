set serveroutput on
set verify off
create or replace procedure printdoc
(p_docid number) is

	v_name doctor.doc_name%TYPE;


begin
	select doc_name
	into v_name
	from doctor
	where doc_id = p_docid;
	
	dbms_output.put_line('The doc name is :'||v_name);

end;
/