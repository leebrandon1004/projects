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

/

--Question 1d

/

--Question 2

/

--Question 3
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

--Question 3a
Execute HELLO_WORLD('World');
/

--Question 3b
Execute HELLO_WORLD('Mark');
/

--Question 3c
Execute HELLO_WORLD('World procedure. I have so much fun coding in SQL and PLSQL');
/

--Question 3d
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

--Question 3e
Execute HELLO_WORLD('World procedure. I have so much fun coding in SQL and PLSQL');
/


--Question 4
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

--Question 4a
Execute HELLO_WORLD('Hello', 'World');
/

--Question 4b
Execute HELLO_WORLD('World');
/

--Question 4c
Execute HELLO_WORLD('Goodbye', 'Hal');
/

--Question 4d
Execute HELLO_WORLD('Hello', 'null');
/

--Question 5
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

--Question 5a
Declare 
    Employees Number;
Begin
    Employees := NUMBER_OF_EMPLOYEES();
    dbms_output.put_line('Total number of Employees: ' || Employees);
End;
/

--Question 6
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

--Question 6a
Declare 
    Employees NUMBER;
    Engineer VARCHAR2(100) := 'Engineer';
Begin
    Employees := NUMBER_OF_EMPLOYEES(Engineer);
    dbms_output.put_line('Total number of engineers at Eagle Electronics: ' || Employees);
End;
/

--Question 6b
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

--Question 6c
Declare 
    Employees NUMBER;
    Engineer VARCHAR2(100) := 'engineer';
Begin
    Employees := NUMBER_OF_EMPLOYEES(Engineer);
    dbms_output.put_line('Total number of engineers at Eagle Electronics: ' || Employees);
End;
/

--Question 6d
Declare 
    Employees NUMBER;
    Engineer VARCHAR2(100) := 'dba';
Begin
    Employees := NUMBER_OF_EMPLOYEES(Engineer);
    dbms_output.put_line('Total number of dba at Eagle Electronics: ' || Employees);
End;
/

--Question 6e
Declare 
    Employees NUMBER;
    Engineer VARCHAR2(100) := 'DBA';
Begin
    Employees := NUMBER_OF_EMPLOYEES(Engineer);
    dbms_output.put_line('Total number of dba at Eagle Electronics: ' || Employees);
End;
/

--Question 6f
Declare 
    Employees NUMBER;
    Engineer VARCHAR2(100) := 'chief sales officer';
Begin
    Employees := NUMBER_OF_EMPLOYEES(Engineer);
    dbms_output.put_line('Total number of chief sales officer at Eagle Electronics: ' || Employees);
End;
/

--Question 6g
Declare 
    Employees NUMBER;
    Engineer VARCHAR2(100) := ' chief sales officer ';
Begin
    Employees := NUMBER_OF_EMPLOYEES(Engineer);
    dbms_output.put_line('Total number of chief sales officer at Eagle Electronics: ' || Employees);
End;
/

--Question 6h
Declare 
    Employees NUMBER;
    Engineer VARCHAR2(100) := 'CEO';
Begin
    Employees := NUMBER_OF_EMPLOYEES(Engineer);
    dbms_output.put_line('Total number of CEO at Eagle Electronics: ' || Employees);
End;
/

--Question 7a
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

--Question 7b
Declare 
    v_number_of_days NUMBER;
Begin
    v_number_of_days := Round(DAYS_AWAY(To_Date('2022-10-04', 'YYYY-MM-DD')),0);
    dbms_output.put_line('Total Days Away: ' || v_number_of_days);
End;
/

--Question 8a
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
    dbms_output.put_line('One day before the day is : ' || day_before);
    dbms_output.put_line('One day after the day is : ' || day_after);
    
END;
/

--Question 8b
Execute DAY_OF_THE_WEEK('4-OCT-21');
/

--Question 9a
CREATE OR REPLACE PROCEDURE DAY_FROM_WEEKEND
(p_day IN DATE)
AS
    day_from_weekend VARCHAR2(30);
    day_weekend VARCHAR2(30);
    day_next_weekend VARCHAR2(30);
    
BEGIN
    day_from_weekend := to_char(to_date(p_day), 'Day');
    day_weekend := to_char(to_date(p_day - 1), 'Day');
    day_next_weekend := to_char(to_date(p_day + 5), 'Day');
    
    dbms_output.put_line('The current date is : ' || day_from_weekend);
    dbms_output.put_line('Happy Weekend!');
    dbms_output.put_line('Next Weekend is : ' || day_next_weekend);
    
END;
/

--Question 9b
Execute DAY_FROM_WEEKEND('4-OCT-21');
/


/* Results
Question 1a
Procedure HELLO_WORLD compiled
It is printed to the Script Output pane

Question 1b

Question 1c
Hello World

Question 1d
The difference is that anonymous blocks are hard to use PL/SQL to build a large complex application
but with named blocks of code, which are procedures, can perform an action and a value can be 
returned. An unnamed block must have an beginning and an end. 

Question 2
CREATE OR REPLACE PROCEDURE hello_world AS
    v_output VARCHAR2(35) := 'Hello World';
BEGIN
    dbms_output.put_line(v_output);
END hello_world;

Question 3

Question 3a
Hello World

Question 3b
Hello Mark

Question 3c
Error starting at line : 46 in command -
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
           
Question 3d
I changed the VARCHAR2 size from 35 to 100

Question 3e
Hello World procedure. I have so much fun coding in SQL and PLSQL

Question 4

Question 4a
Hello World

Question 4b
Error starting at line : 20 in command -
BEGIN HELLO_WORLD('World'); END;
Error report -
ORA-06550: line 1, column 7:
PLS-00306: wrong number or types of arguments in call to 'HELLO_WORLD'
ORA-06550: line 1, column 7:
PL/SQL: Statement ignored
06550. 00000 -  "line %s, column %s:\n%s"
*Cause:    Usually a PL/SQL compilation error.
*Action:

This type of error is an compilation error because there were two IN parameters but
since we only executed one this does not meet the execution requirements. 

Question 4c
Goodbye Hal

Question 4d
Hello null

Question 5

Question 5a
Total number of Employees: 40

Question 6

Question 6a
Total number of engineers at Eagle Electronics: 5

Question 6b
The updated function includes the use of UPPER in jobtitle variable, TRIM() function also 
in the jobtitle variable, and changing the datatype from VARCHAR2 to VARCHAR2(35).

Question 6c
Total number of engineers at Eagle Electronics: 5

Question 6d
Total number of dba at Eagle Electronics: 1

Question 6e
Total number of dba at Eagle Electronics: 1

Question 6f
Total number of chief sales officer at Eagle Electronics: 1

Question 6g
Total number of chief sales officer at Eagle Electronics: 1

Question 6h
Total number of CEO at Eagle Electronics: 0

Question 7a

Question 7b
Total Days Away: 226

Question 8a

Question 8b
The day of the week is : Monday   
One day before the day is : Sunday   
One day after the day is : Tuesday  

Question 9a

Question 9b
The current date is : Monday   
Happy Weekend!
Next Weekend is : Saturday 

*/
