set serveroutput on
ACCEPT pt_id PROMPT 'Enter the patient ID : '

DECLARE
	pat_id billing.pt_id%TYPE;
	d_balance billing.balance%TYPE;
	insurance billing.pt_ins%TYPE;
	amount number(10,2);

	
BEGIN

pat_id:=&pt_id;

SELECT balance, pt_ins INTO d_balance, insurance
FROM billing
WHERE pt_id=pat_id;


	IF d_balance > 100 THEN 
		IF insurance = 'BCBS' THEN
			amount:=d_balance-(d_balance*0.1);
			dbms_output.put_line('Balance after 10% discount  : RM '||amount);
		ELSIF insurance = 'SIH' THEN
			amount:=d_balance-(d_balance*0.2);
			dbms_output.put_line('Balance after 20% discount : RM '||amount);
		ELSE amount:=d_balance-(d_balance*0.05);
		dbms_output.put_line('Balance after 5% discount : RM '||amount);
		END IF;
	ELSIF d_balance < 100 THEN dbms_output.put_line('Balance : RM '||d_balance);
	END IF;


END;
/