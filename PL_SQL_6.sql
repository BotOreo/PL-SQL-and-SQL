SET SERVEROUTPUT ON
SET VERIFY OFF

ACCEPT fname PROMPT 'Enter patient first name: '
ACCEPT lname PROMPT 'Enter patient last name: '
ACCEPT amt PROMPT 'Enter voucher value: '

DECLARE

v_pt_id patient.pt_id%TYPE;
v_amt billing.balance%TYPE;

BEGIN

-- Find the patient ID
SELECT pt_id
INTO v_pt_id
FROM patient
WHERE pt_fname = '&fname' AND pt_lname = '&lname';

-- Credit the patient's account
UPDATE billing
SET balance = NVL(balance,0)- &amt
WHERE pt_id = v_pt_id;
DBMS_OUTPUT.PUT_LINE(' Table Updated. ');

END;
/
SET VERIFY ON
SET SERVEROUTPUT OFF