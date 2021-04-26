--Question 1a
CREATE OR REPLACE PROCEDURE hello_world AS
    v_output VARCHAR2(35) := 'Hello World';
BEGIN
    dbms_output.put_line(v_output);
END hello_world;
/

--Question 1b
Execute hello_world;
/

--Question 1c

--Question 2

--Question 3a
CREATE OR REPLACE PROCEDURE HELLO_WORLD
(P_NAME IN VARCHAR2)
AS
    V_OUTPUT VARCHAR2(35);
BEGIN
    V_OUTPUT := 'Hello ' || P_NAME;
    DBMS_OUTPUT.PUT_LINE (V_OUTPUT);
END
HELLO_WORLD;
/

--Question 3b
Execute HELLO_WORLD('World');
/

--Question 3c
Execute HELLO_WORLD('Mark');
/

--Question 3d
Execute HELLO_WORLD('World procedure. I have so much fun coding in SQL and PLSQL');
/

--Question 3e
CREATE OR REPLACE PROCEDURE HELLO_WORLD
(P_NAME IN VARCHAR2)
AS
    V_OUTPUT VARCHAR2(100);
BEGIN
    V_OUTPUT := 'Hello ' || P_NAME;
    DBMS_OUTPUT.PUT_LINE (V_OUTPUT);
END
HELLO_WORLD;
/

--Question 3f
Execute HELLO_WORLD('World procedure. I have so much fun coding in SQL and PLSQL');
/

--Question 4a
CREATE OR REPLACE PROCEDURE HELLO_WORLD
(
    p_greeting IN varchar2,
    p_name IN varchar2
)
AS
    v_output VARCHAR2(75);
BEGIN
    v_output := p_greeting || ' ' || p_name;
    dbms_output.put_line (v_output);
END HELLO_WORLD;
/
--Question 4b
Execute HELLO_WORLD('Hello', 'World');
/

--Question 4c
Execute HELLO_WORLD('World');
/

--Question 4d
Execute HELLO_WORLD('Goodbye', 'Hal');
/

--Question 4e
Execute HELLO_WORLD('Hello', 'null');
/

--Question 5a
CREATE OR REPLACE FUNCTION NUMBER_OF_EMPLOYEES
    RETURN NUMBER
AS
    v_number_of_employees NUMBER := 0;
begin

    select count(*)
        into v_number_of_employees
    from employee;
    
    return v_number_of_employees;
end NUMBER_OF_EMPLOYEES;
/

--Question 5b
Declare 
    Employees Number;
Begin
    Employees := NUMBER_OF_EMPLOYEES();
    dbms_output.put_line('Total number of Employees: ' || Employees);
End;
/

--Question 6a
CREATE OR REPLACE FUNCTION NUMBER_OF_EMPLOYEES
(p_jobtitle IN varchar2)
    RETURN NUMBER
AS
    v_number_of_employees NUMBER := 0;
begin

    select count(*)
        into v_number_of_employees
    from employee
    where jobtitle = p_jobtitle;
    
    return v_number_of_employees;
end NUMBER_OF_EMPLOYEES;
/

--Question 6b
Declare 
    Employees NUMBER;
    Engineer VARCHAR2(100) := 'Engineer';
Begin
    Employees := NUMBER_OF_EMPLOYEES(Engineer);
    dbms_output.put_line('Total number of engineers at Eagle Electronics: ' || Employees);
End;
/

--Question 6c
CREATE OR REPLACE FUNCTION NUMBER_OF_EMPLOYEES
(p_jobtitle IN varchar2:=(35))
    RETURN NUMBER
AS
    v_number_of_employees NUMBER := 0;
begin

    select count(*)
        into v_number_of_employees
    from employee
    where upper(jobtitle) = TRIM(upper(p_jobtitle));
    
    return v_number_of_employees;
end NUMBER_OF_EMPLOYEES;
/

--Question 6d
Declare 
    Employees NUMBER;
    Engineer VARCHAR2(100) := 'engineer';
Begin
    Employees := NUMBER_OF_EMPLOYEES(Engineer);
    dbms_output.put_line('Total number of engineers at Eagle Electronics: ' || Employees);
End;
/

--Question 6e
Declare 
    Employees NUMBER;
    Engineer VARCHAR2(100) := 'dba';
Begin
    Employees := NUMBER_OF_EMPLOYEES(Engineer);
    dbms_output.put_line('Total number of dba at Eagle Electronics: ' || Employees);
End;
/

--Question 6f
Declare 
    Employees NUMBER;
    Engineer VARCHAR2(100) := 'DBA';
Begin
    Employees := NUMBER_OF_EMPLOYEES(Engineer);
    dbms_output.put_line('Total number of dba at Eagle Electronics: ' || Employees);
End;
/

--Question 6g
Declare 
    Employees NUMBER;
    Engineer VARCHAR2(100) := 'chief sales officer';
Begin
    Employees := NUMBER_OF_EMPLOYEES(Engineer);
    dbms_output.put_line('Total number of chief sales officer at Eagle Electronics: ' || Employees);
End;
/

--Question 6h
Declare 
    Employees NUMBER;
    Engineer VARCHAR2(100) := ' chief sales officer ';
Begin
    Employees := NUMBER_OF_EMPLOYEES(Engineer);
    dbms_output.put_line('Total number of chief sales officer at Eagle Electronics: ' || Employees);
End;
/

--Question 6i
Declare 
    Employees NUMBER;
    Engineer VARCHAR2(100) := 'CEO';
Begin
    Employees := NUMBER_OF_EMPLOYEES(Engineer);
    dbms_output.put_line('Total number of CEO at Eagle Electronics: ' || Employees);
End;
/

--Question 7a
create or replace procedure SIMPLE_LOOP_EXAMPLE
as
    lcounter NUMBER;
    v_current_date NUMBER;
begin
    v_current_date := to_number(to_char(sysdate, 'DD'));
    
    lcounter := 1;
    loop
        dbms_output.put_line (lcounter);
        if lcounter >= v_current_date THEN
            exit;
        else
            lcounter := lcounter + 1;
        end if;
    end loop;
    
end SIMPLE_LOOP_EXAMPLE;
/

--Question 7b
execute SIMPLE_LOOP_EXAMPLE();
/

--Question 7c

--Question 7d

--Question 7e
create or replace procedure SIMPLE_LOOP_EXAMPLE
as
    lcounter NUMBER;
    v_current_date NUMBER;
begin
    v_current_date := to_number(to_char(sysdate, 'DD'));
    
    lcounter := 1;
    loop
        dbms_output.put_line (lcounter);
        if lcounter >= v_current_date THEN
            exit when lcounter >= v_current_date;
        else
            lcounter := lcounter + 1;
        end if;
    end loop;
    
end SIMPLE_LOOP_EXAMPLE;
/

--Question 8a
create or replace procedure WHILE_LOOP_EXAMPLE
as
    lcounter NUMBER;
    v_current_date NUMBER;
begin
    v_current_date := to_number(to_char(sysdate, 'DD'));
    

    lcounter := 1;
    
    while lcounter >= v_current_date loop
        dbms_output.put_line (lcounter);
            exit;
            
        lcounter := lcounter + 1;
    end loop;
    
end WHILE_LOOP_EXAMPLE;
/

--Question 8b
execute WHILE_LOOP_EXAMPLE();
/

--Question 9a
create or replace procedure FOR_LOOP_EXAMPLE
as
    lcounter NUMBER;
    v_current_date NUMBER;
begin
    v_current_date := to_number(to_char(sysdate, 'DD'));
    
    lcounter := 1;
    for l_counter in 1..v_current_date loop
        dbms_output.put_line (lcounter);
        if lcounter >= v_current_date THEN
            exit;
        else
            lcounter := lcounter + 1;
        end if;
    end loop;
    
end FOR_LOOP_EXAMPLE;
/

--Question 9b
execute FOR_LOOP_EXAMPLE();
/

--Question 10a

--Question 10b
GRANT EXECUTE ON NUMBER_OF_EMPLOYEES TO CNIT372TA;
/

--Question 10c
GRANT EXECUTE ON HELLO_WORLD TO CNIT372TA;
GRANT EXECUTE ON SIMPLE_LOOP_EXAMPLE TO CNIT372TA;
GRANT EXECUTE ON WHILE_LOOP_EXAMPLE TO CNIT372TA;
GRANT EXECUTE ON FOR_LOOP_EXAMPLE TO CNIT372TA;
/

--Question 11a
REVOKE EXECUTE ON NUMBER_OF_EMPLOYEES FROM CNIT372TA;
/

--Question 11b
DROP PROCEDURE SIMPLE_LOOP_EXAMPLE;

create or replace procedure SIMPLE_LOOP_EXAMPLE
as
    lcounter NUMBER;
    v_current_date NUMBER;
begin
    v_current_date := to_number(to_char(sysdate, 'DD'));
    
    lcounter := 1;
    loop
        dbms_output.put_line (lcounter);
        if lcounter >= v_current_date THEN
            exit when lcounter >= v_current_date;
        else
            lcounter := lcounter + 1;
        end if;
    end loop;
    
end SIMPLE_LOOP_EXAMPLE;

SELECT * FROM USER_TAB_PRIVS;
/

--Question 11c

--Question 11d
create or replace procedure WHILE_LOOP_EXAMPLE
as
    lcounter NUMBER;
    v_current_date NUMBER;
begin
    v_current_date := to_number(to_char(sysdate, 'DD'));

    lcounter := 1;
    
    while lcounter >= v_current_date loop
        dbms_output.put_line (lcounter);
            exit;
            
        lcounter := lcounter + 1;
    end loop;
    
end WHILE_LOOP_EXAMPLE;

SELECT * FROM USER_TAB_PRIVS;
/

--Question 11e

--Question 12
DROP PROCEDURE HELLO_WORLD;
DROP PROCEDURE SIMPLE_LOOP_EXAMPLE;
DROP PROCEDURE WHILE_LOOP_EXAMPLE;
DROP PROCEDURE FOR_LOOP_EXAMPLE;
DROP FUNCTION NUMBER_OF_EMPLOYEES;
/

--Question 13a

--Question 13b
CREATE OR REPLACE PROCEDURE HELLO_WORLD
(
    p_greeting IN varchar2,
    p_name IN varchar2
)
AS
    v_output VARCHAR2(75);
BEGIN
    v_output := p_greeting || ' ' || p_name;
    dbms_output.put_line (v_output);
END HELLO_WORLD;

Execute HELLO_WORLD('Hello', 'Sunshine');
/

--Question 14a
CREATE OR REPLACE FUNCTION DAYS_AWAY
(p_days IN DATE)
    RETURN NUMBER
AS
    v_number_of_days NUMBER := 0;
    
BEGIN
    v_number_of_days := 0;
    
    v_number_of_days := (p_days-sysdate) + 1;
    
    return v_number_of_days;

END DAYS_AWAY;
/


--Question 14b
Declare 
    v_number_of_days NUMBER;
Begin
    v_number_of_days := Round(DAYS_AWAY(To_Date('2020-10-04', 'YYYY-MM-DD')),0);
    dbms_output.put_line('Total Days Away: ' || v_number_of_days);
End;
/

--Question 15a
CREATE OR REPLACE PROCEDURE DAY_OF_THE_WEEK
(p_day IN DATE)
AS
    day_of_week VARCHAR2(30);
    day_before VARCHAR2(30);
    day_after VARCHAR2(30);
    
BEGIN
    day_of_week := to_char(to_date(p_day), 'Day');
    day_before := to_char(to_date(p_day - 1), 'Day');
    day_after := to_char(to_date(p_day + 1), 'Day');
    
    dbms_output.put_line('The day of the week is : ' || day_of_week);
    dbms_output.put_line('One day after the day is : ' || day_before);
    dbms_output.put_line('One day before the day is : ' || day_after);
    
END;
/

--Question 15b
Execute DAY_OF_THE_WEEK('4-OCT-20');
/

CREATE OR REPLACE PROCEDURE NUMBER_OF_STUDENTS
    (userid in CNIT372TA.CNIT_FALL20_ATTENDANCE_SUMMARY IN VARCHAR2(10)
    status in CNIT372TA.CNIT_FALL20_ATTENDANCE_SUMMARY IN VARCHAR2 (10))
AS
    students NUMBER;
BEGIN
    select 

CREATE OR REPLACE PROCEDURE NUMBER_OF_STUDENTS IS
    cursor number is
    select count(status) 
    from CNIT372TA.CNIT_FALL20_ATTENDANCE_SUMMARY 
    where ATNDATE between '2020-09-01' AND '2020-09-31';
BEGIN
/* RESULTS: 
Question 1a
Procedure HELLO_WORLD compiled
Explanation: It is printed into the Script Output pane on SQL developer. 

Question 1b
Hello World

Question 1c
The difference is that anonymous blocks are hard to use PL/SQL to build a large complex application
but with named blocks of code, which are procedures, can perform an action and a value can be 
returned. An unnamed block must have an beginning and an end. 

Question 2
CREATE OR REPLACE PROCEDURE hello_world AS
    v_output VARCHAR2(35) := 'Hello World';
BEGIN
    dbms_output.put_line(v_output);
END hello_world;

Question 3a
Procedure HELLO_WORLD compiled

Question 3b
Hello World

Question 3c
Hello Mark

Question 3d
Error starting at line : 38 in command -
BEGIN HELLO_WORLD('World procedure. I have so much fun coding in SQL and PLSQL'); END;
Error report -
ORA-06502: PL/SQL: numeric or value error: character string buffer too small
ORA-06512: at "LEE3118.HELLO_WORLD", line 6
ORA-06512: at line 1
06502. 00000 -  "PL/SQL: numeric or value error%s"
*Cause:    An arithmetic, numeric, string, conversion, or constraint error
           occurred. For example, this error occurs if an attempt is made to
           assign the value NULL to a variable declared NOT NULL, or if an
           attempt is made to assign an integer larger than 99 to a variable
           declared NUMBER(2).
*Action:   Change the data, how it is manipulated, or how it is declared so
           that values do not violate constraints.

Question 3e
I changed the VARCHAR2 size from 35 to 100

Question 3f
Hello World procedure. I have so much fun coding in SQL and PLSQL

Question 4a

Question 4b
Hello World

Question 4c
Error starting at line : 75 in command -
BEGIN HELLO_WORLD('World'); END;
Error report -
ORA-06550: line 1, column 59:
PLS-00306: wrong number or types of arguments in call to 'HELLO_WORLD'
ORA-06550: line 1, column 59:
PL/SQL: Statement ignored
06550. 00000 -  "line %s, column %s:\n%s"
*Cause:    Usually a PL/SQL compilation error.
*Action:

This type of error is an compilation error because there were two IN parameters but
since we only executed one this does not meet the execution requirements. 

Question 4d
Goodbye Hal

Question 4e
Hello null

Question 5a

Question 5b
Total number of Employees: 40

Question 6a

Question 6b
Total number of engineers at Eagle Electronics: 5

Question 6c
The updated function includes the use of UPPER in jobtitle variable, TRIM() function also 
in the jobtitle variable, and changing the datatype from VARCHAR2 to VARCHAR2(35).

Question 6d
Total number of engineers at Eagle Electronics: 5

Question 6e
Total number of dba at Eagle Electronics: 1

Question 6f
Total number of dba at Eagle Electronics: 1

Question 6g
Total number of chief sales officer at Eagle Electronics: 1

Question 6h
Total number of chief sales officer at Eagle Electronics: 1

Question 6i
Total number of CEO at Eagle Electronics: 0

Question 7a

Question 7b
1

Question 7c
The SIMPLE_LOOP_EXAMPLE gets the current date by the format 'DD', two digits of the date only,
and it initializes lcounter to '1'. If lcounter which is '1', is larger or equal than the 
current date, the loop ends but if the lcounter is smaller than the current date the loop
increments lcounter by 1 until lcounter becomes smaller than the current date, where 30 is 
the last date of the month. Since today is the October 1. there it satisfies the first
requirement whieh lcounter is also 1 so, the program exits due to lcounter and the current date
is the same.

Question 7d
It uses a basic exit statement which completes the loop and control passes to the statement 
after the end loop.

Question 7e
1

Question 8a

Question 8b
1

Question 9a

Question 9b
1

Question 10a
To allow another use to execute your HELLO_WORLD procedure, there are object and user privileges
that should be allowed to other users in order to execute the HELLO_WORLD procedure. 

Source: https://docs.oracle.com/cd/A97630_01/server.920/a96521/privs.htm#:~:text=A%20user%20privilege%20is%20a,together%20privileges%20or%20other%20roles.

Question 10b
Grant succeeded.

Question 10c
Grant succeeded.

Question 11a
REVOKE EXECUTE ON NUMBER_OF_EMPLOYEES FROM CNIT372TA;

Question 11b
Yes, CNIT372TA user still retains execution permissions from the SIMPLE_LOOP_EXAMPLE procedure.

Question 11c
No, dropping a procedure does not remove permissions on it.

Question 11d
Yes the CNIT372TA user still retains execution permissions on the WHILE_LOOP_EXAMPLE

Question 11e
No, re-creating a procedure does not remove permissions on it. 

Question 12

Question 13a
The HELLO_WORLD procedure has an optional parameter so it can have zero parameters but
in this lab we had 1 and 2 parameters used in the HELLO_WORLD procedure.

Question 13b
Hello Sunshine

Question 14a


Question 14b

Question 15a

Question 15b

*/

