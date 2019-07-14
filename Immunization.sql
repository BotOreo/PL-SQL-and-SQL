set serveroutput on
ACCEPT pt_id PROMPT 'Enter the patient ID : '

DECLARE
	pat_id patient.pt_id%TYPE;
	pat_dob patient.ptdob%TYPE;
	status number;
	shots varchar2(100);

	
BEGIN

pat_id:=&pt_id;

SELECT ptdob INTO pat_dob
FROM patient
WHERE pt_id=pat_id;

status:=x_Immu(pat_dob);

	IF status=1 THEN shots:='REQUIRED';
	ELSIF status=0 THEN shots:='NOT REQUIRED';
	END IF;

dbms_output.put_line('His/Her DOB : '||pat_dob);
dbms_output.put_line('The status of X-immunization : '||shots);


END;
/