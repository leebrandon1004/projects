--Question 1a
drop table LAB9_EMPLOYEE;

CREATE TABLE LAB9_EMPLOYEE AS SELECT * FROM EMPLOYEE;
/

--Question 1b
create or replace trigger TBDS_LAB9_EMPLOYEE
    before delete on LAB9_EMPLOYEE
begin
    dbms_output.put_line('aTrigger fired before deleting anything from LAB9_EMPLOYEE');
end;
/

--Question 1c
create or replace trigger TBDR_LAB9_EMPLOYEE
    before delete on LAB9_EMPLOYEE
    for each row
begin
    dbms_output.put_line('bTrigger fired before deleting a row from LAB9_EMPLOYEE');
end;
/

--Question 1d
create or replace trigger TADS_LAB9_EMPLOYEE
    after delete on LAB9_EMPLOYEE
begin
    dbms_output.put_line('cTrigger fired after deleting anything from LAB9_EMPLOYEE');
end;
/

--Question 1e
create or replace trigger TADR_LAB9_EMPLOYEE
    after delete on LAB9_EMPLOYEE
    for each row
begin
    dbms_output.put_line('dTrigger after deleting a row from LAB9_EMPLOYEE');
end;
/

--Question 1f
delete from LAB9_EMPLOYEE 
where employeeid = '101135';
/

--Question 1g
rollback;
/

--Question 1h
delete from LAB9_EMPLOYEE 
where jobtitle = 'Sales'
/

--Question 1i
rollback;
/

--Question 1j
Truncate table LAB9_EMPLOYEE;


--Results
/*
Question 1a

Question 1b
Trigger is fired before deleting data from the table LAB9_EMPLOYEE and the trigger is defined on the table LAB9_EMPLOYEE.

Question 1c
The trigger fires once for each row of the table that is affected by the triggering statement and the trigger is defined on the table LAB9_EMPLOYEE.

Question 1d
Oracle will fire this trigger before the DELETE operation is executed and the trigger is defined on the table LAB9_EMPLOYEE.

Question 1e
Oracle will fire this trigger before the DELETE operation is executed and the trigger fires once for each row of the table that is affected by the triggering statement.
Trigger is defined on the table LAB9_EMPLOYEE.

Question 1f
1 row deleted.

Trigger fired before deleting anything from LAB9_EMPLOYEE
Trigger fired before deleting a row from LAB9_EMPLOYEE
Trigger after deleting a row from LAB9_EMPLOYEE
Trigger fired after deleting anything from LAB9_EMPLOYEE

Triggers: TBDS_LAB9_EMPLOYEE, TBDR_LAB9_EMPLOYEE, TADS_LAB9_EMPLOYEE, and TADR_LAB9_EMPLOYEE was fired in order. 

Question 1g
Data is restored and trigger does not perform a commit.

Question 1h
3 rows deleted.

Trigger fired before deleting anything from LAB9_EMPLOYEE
Trigger fired before deleting a row from LAB9_EMPLOYEE
Trigger after deleting a row from LAB9_EMPLOYE
Trigger fired before deleting a row from LAB9EMPLOYEE
Trigger after deleting a row from LAB9_EMPLOEE
Trigger fired before deleting a row from LA9_EMPLOYEE
Trigger after deleting a row from LAB9_EMPOYEE
Trigger fired after deleting anything fro LAB9_EMPLOYEE

Triggers: TBDS_LAB9_EMPLOYEE, TBDR_LAB9_EMPLOYEE, TADR_LAB9_EMPLOYEE, TBDR_LAB9_EMPLOYEE, TADR_LAB9_EMPLOYEE, TBDR_LAB9_EMPLOYEE,
TADR_LAB9_EMPLOYEE, TADS_LAB9_EMPLOYEE was fired in order.

Question 1i
Yes, data was restoted. It is what I expected. 

Question 1j
No trigger was fired.
*/
