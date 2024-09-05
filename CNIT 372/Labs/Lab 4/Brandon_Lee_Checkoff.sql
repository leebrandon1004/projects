--Question 1a
select jobtitle, count(employeeid)
from employee
group by jobtitle;

/

--Question 1b
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
/

--Question 2a
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
/

--Question 4a
DECLARE
    MY_COUNT INTEGER := '&MY_COUNT';
    MY_COUNTER INTEGER := 1;
    MY_NUMBER INTEGER;
BEGIN
    LOOP
        MY_NUMBER := dbms_random.value(1,MY_COUNT);
        DBMS_OUTPUT.PUT(MY_NUMBER || ', ');
        MY_COUNTER := MY_COUNTER + 1;
        EXIT WHEN MY_COUNTER > MY_COUNT;
    END LOOP;
    DBMS_OUTPUT.PUT_LINE('');
END;
/

--Question 4b

/

/* Results
Question 1a
JOBTITLE                            COUNT(EMPLOYEEID)
----------------------------------- -----------------
VP Finance                                          1
Sales                                               3
VP Information                                      1
Chief Information Officer                           1
Chief Sales Officer                                 1
VP Operations                                       1
Accountant                                          2
President                                           1
DBA                                                 1
Chief Financial Officer                             1
Engineer                                            5

JOBTITLE                            COUNT(EMPLOYEEID)
----------------------------------- -----------------
Programmer Analyst                                  2
Operations Officer                                  2
Assembly                                           18

14 rows selected. 

Question 1b
There are no employees with the job title: CIO

Question 2a
There are no employees with the Job Title: CIO

Question 4a
3, 2, 1, 2, 4, 

Question 4b
Within a loop statement, it runs and control returns to the top of the loop. The loop statement ends when a statement inside the loop transfers control outside
the loop or raises an exception. 
*/