--Question 1a
begin
    DBMS_OUTPUT.PUT_LINE ('Hello world');
end;
/

--Question 1b
SET SERVEROUTPUT ON;
/

--Question 1c

/

--Question 1d

/

--Question 2a
begin 
DBMS_OUTPUT.PUT_LINE ('The Ubiquitous Hello World');
end;

--Question 2b
begin
    DBMS_OUTPUT.PUT('The');
    DBMS_OUTPUT.PUT(' ');
    DBMS_OUTPUT.PUT('Ubiquitous');
    DBMS_OUTPUT.PUT(' ');
    DBMS_OUTPUT.PUT('Hello');
    DBMS_OUTPUT.PUT(' ');
    DBMS_OUTPUT.PUT_LINE('World');
end;

--Question 2c

--Question 2d

--Question 2e

--Question 2f

--Question 3
begin
    DBMS_OUTPUT.PUT_LINE('My name is ' || '&sv_YourName');
end;

--Question 4a
SET VERIFY ON;

--Question 4b
begin
    DBMS_OUTPUT.PUT_LINE('My name is ' || '&sv_YourName');
end;

--Question 4c
SET VERIFY OFF;

--Question 4d

--Question 4e

--Question 5
begin
    DBMS_OUTPUT.PUT_LINE('My name is ' || '&sv_YourName');
end;

--Question 6
begin
    DBMS_OUTPUT.PUT_LINE('Today is ' || '&sv_day');
    DBMS_OUTPUT.PUT_LINE('Tomorrow is ' || '&sv_day');
end;

--Question 7a
begin
    DBMS_OUTPUT.PUT_LINE('Today is ' || '&&sv_day');
    DBMS_OUTPUT.PUT_LINE('Tomorrow is ' || '&sv_day');
end;

--Question 7b

--Question 8
declare
    V_DAY varchar2(10) := '&sv_day1';
begin
    DBMS_OUTPUT.PUT_LINE ('Today is ' || V_DAY);
end;

--Question 9
declare
    V_DAY varchar2(10);
begin
    V_DAY := to_char (sysdate, 'Day');
    DBMS_OUTPUT.PUT_LINE ('Today is ' || V_DAY);
    DBMS_OUTPUT.PUT_LINE ('Tomorrow is ' || to_char (sysdate +1, 'Day'));
end;

--Question 10a
select employeeID
from employee
where employeeid = '100001';

--Question 10b
declare 
    V_EMPLOYEEID EMPLOYEE.EMPLOYEEID%TYPE;
    V_LASTNAME EMPLOYEE.LASTNAME%TYPE;
    V_FIRSTNAME EMPLOYEE.FIRSTNAME%TYPE;
    
begin
    select  EMPLOYEEID, LASTNAME, FIRSTNAME
        into    V_EMPLOYEEID, V_LASTNAME, V_FIRSTNAME
    from EMPLOYEE
    where EMPLOYEEID = '100001';
    
    DBMS_OUTPUT.PUT_LINE('Employee ID   LASTNAME    FIRSTNAME');
    DBMS_OUTPUT.PUT_LINE('====================================');
    DBMS_OUTPUT.PUT(V_EMPLOYEEID);
    DBMS_OUTPUT.PUT('              ');
    DBMS_OUTPUT.PUT('V_LASTNAME');
    DBMS_OUTPUT.PUT('          ');
    DBMS_OUTPUT.PUT_LINE(V_FIRSTNAME);
end;

--Question 10c
select employeeID
from employee;

--Question 10d
declare 
    V_EMPLOYEEID EMPLOYEE.EMPLOYEEID%TYPE;
    V_LASTNAME EMPLOYEE.LASTNAME%TYPE;
    V_FIRSTNAME EMPLOYEE.FIRSTNAME%TYPE;
    
begin
    select  EMPLOYEEID, LASTNAME, FIRSTNAME
        into    V_EMPLOYEEID, V_LASTNAME, V_FIRSTNAME
    from EMPLOYEE;
    
    DBMS_OUTPUT.PUT_LINE('Employee ID   LASTNAME    FIRSTNAME');
    DBMS_OUTPUT.PUT_LINE('====================================');
    DBMS_OUTPUT.PUT(V_EMPLOYEEID);
    DBMS_OUTPUT.PUT('              ');
    DBMS_OUTPUT.PUT('V_LASTNAME');
    DBMS_OUTPUT.PUT('          ');
    DBMS_OUTPUT.PUT_LINE(V_FIRSTNAME);
end;

--Question 10e

--Question 10f

--Question 10h
declare 
    V_EMPLOYEE employee%ROWTYPE;
    
begin
    select * INTO V_EMPLOYEE FROM EMPLOYEE WHERE EMPLOYEEID = '100001';
    DBMS_OUTPUT.PUT_LINE('Employee ID   LASTNAME    FIRSTNAME');
    DBMS_OUTPUT.PUT_LINE('====================================');
    DBMS_OUTPUT.PUT_LINE(V_EMPLOYEE.EMPLOYEEID ||'               '|| V_EMPLOYEE.LASTNAME||'           '||V_EMPLOYEE.FIRSTNAME);
end;

--Question 11a
select jobtitle, count(employeeid)
from employee
group by jobtitle;

--Question 11b
declare
    V_NUMBER_EMPLOYEES  NUMBER;
    V_JOBTITLE VARCHAR2(50) := '&v_JOBTITLE';
BEGIN
    SELECT COUNT(EMPLOYEEID)
        INTO V_NUMBER_EMPLOYEES
    FROM EMPLOYEE
    WHERE JOBTITLE=V_JOBTITLE;

IF V_NUMBER_EMPLOYEES <1 THEN
    DBMS_OUTPUT.PUT_LINE ('There are no employees with the job title: ' || V_JOBTITLE);
ELSIF V_NUMBER_EMPLOYEES <4 THEN
    DBMS_OUTPUT.PUT_LINE ('There are between 1 and 3 employees with the job title: ' || V_JOBTITLE);
ELSIF V_NUMBER_EMPLOYEES <7 THEN
    DBMS_OUTPUT.PUT_LINE ('There are between 4 and 6 employees with the job title: ' || V_JOBTITLE);
ELSE
    DBMS_OUTPUT.PUT_LINE ('There are 7 or more employees with the job title: ' || V_JOBTITLE);
    END IF;
    
END;

--Question 11c

--Question 11d

--Question 11e

--Question 12a
DECLARE
    V_NUMBER_EMPLOYEES  NUMBER;
    V_JOBTITLE VARCHAR2(50) := '&v_JOBTITLE';
BEGIN
    SELECT COUNT(EMPLOYEEID)
        INTO V_NUMBER_EMPLOYEES
    FROM EMPLOYEE
    WHERE JOBTITLE=V_JOBTITLE;

    CASE V_NUMBER_EMPLOYEES
        WHEN 0 THEN
            DBMS_OUTPUT.PUT_LINE ('There are no employees with the Job Title: ' || V_JOBTITLE);
        WHEN 1 THEN
            DBMS_OUTPUT.PUT_LINE ('There are between 1 and 3 employees with the Job Title: ' || V_JOBTITLE);        
        WHEN 2 THEN
            DBMS_OUTPUT.PUT_LINE ('There are between 1 and 3 employees with the Job Title: ' || V_JOBTITLE);   
        WHEN 3 THEN
            DBMS_OUTPUT.PUT_LINE ('There are between 1 and 3 employees with the Job Title: ' || V_JOBTITLE);   
        WHEN 4 THEN
            DBMS_OUTPUT.PUT_LINE ('There are between 4 and 6 employees with the Job Title: ' || V_JOBTITLE);   
        WHEN 5 THEN
            DBMS_OUTPUT.PUT_LINE ('There are between 4 and 6 employees with the Job Title: ' || V_JOBTITLE);   
        WHEN 6 THEN
            DBMS_OUTPUT.PUT_LINE ('There are between 4 and 6 employees with the Job Title: ' || V_JOBTITLE);
        ELSE
            DBMS_OUTPUT.PUT_LINE ('There are 7 or more employees with the Job Title: ' || V_JOBTITLE);   
    END CASE;
    
END;

--Question 12b

--Question 12c

--Question 12d

--Question 13a
DECLARE
    V_NUMBER_EMPLOYEES  NUMBER;
    V_JOBTITLE EMPLOYEE.JOBTITLE%TYPE := '&v_JOBTITLE';
BEGIN
    SELECT COUNT(EMPLOYEEID)
        INTO V_NUMBER_EMPLOYEES
    FROM EMPLOYEE
    WHERE JOBTITLE=V_JOBTITLE;

    CASE V_NUMBER_EMPLOYEES
        WHEN 0 THEN
            DBMS_OUTPUT.PUT_LINE ('There are no employees with the Job Title: ' || V_JOBTITLE);
        WHEN 1 THEN
            DBMS_OUTPUT.PUT_LINE ('There are between 1 and 3 employees with the Job Title: ' || V_JOBTITLE);        
        WHEN 2 THEN
            DBMS_OUTPUT.PUT_LINE ('There are between 1 and 3 employees with the Job Title: ' || V_JOBTITLE);   
        WHEN 3 THEN
            DBMS_OUTPUT.PUT_LINE ('There are between 1 and 3 employees with the Job Title: ' || V_JOBTITLE);   
        WHEN 4 THEN
            DBMS_OUTPUT.PUT_LINE ('There are between 4 and 6 employees with the Job Title: ' || V_JOBTITLE);   
        WHEN 5 THEN
            DBMS_OUTPUT.PUT_LINE ('There are between 4 and 6 employees with the Job Title: ' || V_JOBTITLE);   
        WHEN 6 THEN
            DBMS_OUTPUT.PUT_LINE ('There are between 4 and 6 employees with the Job Title: ' || V_JOBTITLE);
        ELSE
            DBMS_OUTPUT.PUT_LINE ('There are 7 or more employees with the Job Title: ' || V_JOBTITLE);   
    END CASE;
    
END;
--Question 13b

--Question 14
DECLARE
    V_NUMBER_EMPLOYEES  NUMBER;
    V_JOBTITLE EMPLOYEE.JOBTITLE%TYPE := '&v_JOBTITLE';
    V_STAFF_LEVEL   VARCHAR2(100);
BEGIN
    SELECT COUNT(EMPLOYEEID)
        INTO V_NUMBER_EMPLOYEES
    FROM EMPLOYEE
    WHERE JOBTITLE=V_JOBTITLE;

    CASE V_NUMBER_EMPLOYEES
        WHEN 0 THEN
            V_STAFF_LEVEL := 'There are no employees with the Job Title: ';
        WHEN 1 THEN
            V_STAFF_LEVEL := 'There are between 1 and 3 employees with the Job Title: ';        
        WHEN 2 THEN
            V_STAFF_LEVEL := 'There are between 1 and 3 employees with the Job Title: ';   
        WHEN 3 THEN
            V_STAFF_LEVEL := 'There are between 1 and 3 employees with the Job Title: ';   
        WHEN 4 THEN
            V_STAFF_LEVEL := 'There are between 4 and 6 employees with the Job Title: ';   
        WHEN 5 THEN
            V_STAFF_LEVEL := 'There are between 4 and 6 employees with the Job Title: ';   
        WHEN 6 THEN
            V_STAFF_LEVEL := 'There are between 4 and 6 employees with the Job Title: ';
        ELSE
            V_STAFF_LEVEL := 'There are 7 or more employees with the Job Title: ';   
    END CASE;
    
    --OUTPUT USER-FRIENDLY RESPONSE
    DBMS_OUTPUT.PUT_LINE (V_STAFF_LEVEL || V_JOBTITLE);
    
END;

/* Results

Question 1a
Hello world

Question 1b
No Output

Question 1c
Hello world
The SQL Developer does not remember the SERVEROUTPUT perference. 

Question 1d
The SERVEROUTPUT setting controls whether SQL*Plus prints the output generated by the
DBMS_OUTPUT package from SQL procedures

Source: https://www.oreilly.com/library/view/oracle-sqlplus-the/0596007469/re85.html

Question 2a
The Ubiquitous Hello World

Question 2b
The Ubiquitous Hello World

Question 2c
I believe that the difference is that DBMS_OUTPUT. PUT procedure outputs results in
chronological order but it has to be followed by DBMS_OUTPUT.PUT_LINE procedure in
order to successfully output the result. However DBMS_OUTPUT.PUT_LINE can solely
stand by itself and successfully output the result.

Question 2d
The DBMS_OUTPUT.PUT is a single/partial package that is skipped by SQLPlus. It does
not output a result on screen without DBMS_OUTPUT.PUT_LINE which writes a full, but
empty line that outputs the results on screen.

Source: https://stackoverflow.com/questions/25722069/oracle-pl-sqls-dbms-output-put-line-vs-dbms-output-put

Question 2e
DBMS_OUTPUT.PUT_LINE is a package that allows to print the output to screen. This procedure
also trims off white space when not placed in the buffer.

Source: https://www.got-it.ai/solutions/sqlquerychat/sql-help/others/oracle-sql-developer-dbms_output-put_line-pl-sql/

Question 2f
The difference is that DBMS_OUTPUT.PUT is a single/partial package that does not output
the results on screen and skipped by SQLPlus but stores it in data. The DBMS_OUTPUT.PUT_LINE
writes a full but empty line which outputs the results on screen. Thus, DBMS_OUTPUT.PUT
itself cannot output the results on screen it has to have DBMS_OUTPUT.PUT_LINE after the 
DBMS_OUTPUT.PUT procedures.

Question 3
A pop-up shows up after the command is ran and requests for a Name to the user.
I inputed my name for the pop-up:

My name is Brandon Lee

Question 4a
No Output

Question 4b
old:begin
    DBMS_OUTPUT.PUT_LINE('My name is ' || '&sv_YourName');
end;
new:begin
    DBMS_OUTPUT.PUT_LINE('My name is ' || 'Brandon Lee');
end;

My name is Brandon Lee

PL/SQL procedure successfully completed.

Question 4c
No Output

Question 4d
My name is Brandon Lee


PL/SQL procedure successfully completed.

Question 4e
The VERIFY attribute controls whether or not SQL*Plus displays before and after
images of each line that has a substitution variable.

Source: https://www.oreilly.com/library/view/oracle-sqlplus-the/0596007469/re106.html

Question 5
I am prompted for the value twice when running the code wrice. This implies that if the
same value of sv_YourName is the same for all twice, the same value is outputted because 
there were no substitution made with the input.

Question 6
Today is Tuesday
Tomorrow is Wednesday

Explanation: Yes, you can use the same variable name twice within the same unnamed block. The system
pop-ups up with the same block asking the: "sv_day" twice. However, the user has to 
remember the order of the same blocks in order to accurately process the output on screen.

Question 7a
Today is Tuesday
Tomorrow is Tuesday

PL/SQL procedure successfully completed.

Explanation: I was not prompted to provide the second ouput for sv_day. The difference of a addition
of another "%" in the first DBMS_OUTPUT at "sv_day" was the reason that caused this.

Question 7b
Today is Tuesday
Tomorrow is Tuesday

PL/SQL procedure successfully completed.

Explanation:I was not promted for any "sv_day". This implies that the previously 
inputted data in sv_day is persistant of its data by using the && command which means
that by using && the variable input is stored. 

Question 8
Today is Tuesday

PL/SQL procedure successfully completed.

Question 9
Today is Tuesday  
Tomorrow is Wednesday

PL/SQL procedure successfully completed.


Question 10a
One row is returned

Question 10b
Employee ID   LASTNAME    FIRSTNAME
====================================
100001              V_LASTNAME          Jim

PL/SQL procedure successfully completed.

Question 10c
40 rows are returned

Question 10d
Error starting at line : 129 in command -
declare 
    V_EMPLOYEEID EMPLOYEE.EMPLOYEEID%TYPE;
    V_LASTNAME EMPLOYEE.LASTNAME%TYPE;
    V_FIRSTNAME EMPLOYEE.FIRSTNAME%TYPE;

begin
    select  EMPLOYEEID, LASTNAME, FIRSTNAME
        into    V_EMPLOYEEID, V_LASTNAME, V_FIRSTNAME
    from EMPLOYEE;

    DBMS_OUTPUT.PUT_LINE('Employee ID   LASTNAME    FIRSTNAME');
    DBMS_OUTPUT.PUT_LINE('====================================');
    DBMS_OUTPUT.PUT(V_EMPLOYEEID);
    DBMS_OUTPUT.PUT('              ');
    DBMS_OUTPUT.PUT('V_LASTNAME');
    DBMS_OUTPUT.PUT('          ');
    DBMS_OUTPUT.PUT_LINE(V_FIRSTNAME);
end;
Error report -
ORA-01422: exact fetch returns more than requested number of rows
ORA-06512: at line 7
01422. 00000 -  "exact fetch returns more than requested number of rows"
*Cause:    The number specified in exact fetch is less than the rows returned.
*Action:   Rewrite the query or change number of rows requested

Question 10e
I am attempting to assign 40 rows to each of the variables in 10d. This creates an error
due to the overflow of the number of rows in each variable.

Question 10f
A scalar variable only can store a value with no internal components. Thus, it only can store one value at once.

Question 10h
Employee ID   LASTNAME    FIRSTNAME
====================================
100001               Manaugh           Jim

Explanation: In 10b, the Lastname is not specified at the data but just shown as V_LASTNAME. But in 10h, it is shown
as the actual name from the database. The difference comes from that at 10h the code selects from all of the data at 
table EMPLOYEE but at 10b it specifies the columns to select from which may lead to a result missing.

Question 11a
JOBTITLE                            COUNT(EMPLOYEEID)
----------------------------------- -----------------
Chief Sales Officer                                 1
Engineer                                            5
President                                           1
DBA                                                 1
Chief Financial Officer                             1
Assembly                                           18
VP Operations                                       1
Programmer Analyst                                  2
Accountant                                          2
Sales                                               3
Chief Information Officer                           1

JOBTITLE                            COUNT(EMPLOYEEID)
----------------------------------- -----------------
Operations Officer                                  2
VP Finance                                          1
VP Information                                      1

14 rows selected. 

Question 11b
There are no employees with the job title: CIO

Question 11c
There are between 1 and 3 employees with the job title: Accountant

Question 11d
There are between 4 and 6 employees with the job title: Engineer

Question 11e
There are 7 or more employees with the job title: Assembly

Question 12a
There are no employees with the Job Title: CIO

Question 12b
There are between 1 and 3 employees with the Job Title: Accountant

Question 12c
There are between 4 and 6 employees with the Job Title: Engineer

Question 12d
There are 7 or more employees with the Job Title: Assembly

Question 13a
There are no employees with the Job Title: CIO

Question 13b
A column type variable lets you declare a parameter to be the same data type of a previously declared column. If there
are item changes, the declaration is updataed automatically. Also, it always inherits the data type of the referenced
item but if the referenced item is not a database column, it only inherits the constaints. 

Question 14
There are between 4 and 6 employees with the Job Title: Engineer
