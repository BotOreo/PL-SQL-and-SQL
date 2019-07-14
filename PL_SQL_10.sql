set serveroutput on
set verify off
ACCEPT m_charge PROMPT 'Enter the minimum charge per appointment : RM ';
DECLARE 
	docid doctor.doc_id%TYPE;
	charge doctor.chgperappt%TYPE;
	m_charge doctor.chgperappt%TYPE;
	docname doctor.doc_name%TYPE;
	value number(6,2);	
BEGIN
	SELECT doc_id, doc_name, chgperappt 
	INTO docid, docname, charge
	FROM doctor
	WHERE chgperappt < &m_charge;
		
	
	IF SQL%FOUND THEN
		dbms_output.put_line('Dr. '||docname||' ('||docid||') is charging RM '||charge); 
	value:=charge+(charge*0.3);
	dbms_output.put_line('Please increase the charge per appointment by 30% --> RM '||value);
	dbms_output.put_line('All charge per appointment met the minimum criteria.');
	ELSE
	dbms_output.put_line('All charge per appointment met the minimum criteria.');
	END IF;
	

EXCEPTION
	WHEN NO_DATA_FOUND THEN
		dbms_output.put_line('All charge per appointment met the minimum criteria.');
	WHEN TOO_MANY_ROWS THEN
		dbms_output.put_line('Exceeded number of rows. Fetch too many rows.');
END;
	/