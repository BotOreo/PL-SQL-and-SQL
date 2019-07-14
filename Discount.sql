set serveroutput on
ACCEPT pt_id PROMPT 'Enter the patient ID : '

DECLARE
	d_name doctor.doc_name%TYPE;
	d_id doctor.doc_id%TYPE;
	charge doctor.chgperappt%TYPE;
	pat_id patient.pt_id%TYPE;
	p_city billing.city%TYPE;
	disc number(4,3);
	amount number(4,2);


	
BEGIN

pat_id:=&pt_id;

SELECT doc_id INTO d_id
FROM patient
WHERE pt_id = pat_id;

SELECT doc_name, chgperappt INTO d_name, charge
FROM doctor
WHERE d_id = doc_id;

SELECT city INTO p_city
FROM billing
WHERE pt_id = pat_id;

disc:=paymentPat(p_city);
amount:= (charge-(charge*disc));

dbms_output.put_line('He/She is the patient of Dr. '||d_name);
dbms_output.put_line('Charge per appointment for Dr. '||d_name||' is RM '||charge);
dbms_output.put_line('Please pay only : RM '||amount);


END;
/
