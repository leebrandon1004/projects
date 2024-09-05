--Question 1a
CREATE OR REPLACE PROCEDURE print_employee_roster
AS
    current_employeeid employee.employeeid%TYPE;
    current_lastname employee.lastname%TYPE;
    current_firstname employee.firstname%TYPE;
    
    CURSOR all_employees
    IS
        SELECT employeeid, lastname, firstname FROM employee;
    
BEGIN
    OPEN all_employees;
    
    FETCH all_employees into current_employeeid, current_lastname, current_firstname;
    
    WHILE all_employees%FOUND LOOP
    
        DBMS_OUTPUT.PUT (RPAD(current_employeeid, 15, ' '));
        DBMS_OUTPUT.PUT (RPAD(current_lastname, 30, ' '));
        DBMS_OUTPUT.PUT_LINE (current_firstname);
        FETCH all_employees into current_employeeid, current_lastname, current_firstname;
    END LOOP;
    
    CLOSE all_employees;
END print_employee_roster;
/

--Question 1b
Execute print_employee_roster;
/

--Question 2a
CREATE OR REPLACE PROCEDURE print_employee_roster
AS
    CURSOR all_employees
    IS
        SELECT employeeid, lastname, firstname FROM employee;
    
    current_employee all_employees%ROWTYPE;
BEGIN
    OPEN all_employees;
    
    FETCH all_employees into current_employee;
    
    WHILE all_employees%FOUND LOOP
    
        DBMS_OUTPUT.PUT (RPAD(current_employee.employeeid, 15, ' '));
        DBMS_OUTPUT.PUT (RPAD(current_employee.lastname, 30, ' '));
        DBMS_OUTPUT.PUT_LINE (current_employee.firstname);
        FETCH all_employees into current_employee;
    END LOOP;
    
    CLOSE all_employees;
END print_employee_roster;
/

--Question 2b
Execute print_employee_roster;
/

--Question 2c

/

--Question 3a
CREATE OR REPLACE PROCEDURE print_employee_roster
AS
    CURSOR all_employees
    IS
        SELECT employeeid, 
                lastname || ', ' || firstname as name
        FROM employee;
    
    current_employee all_employees%ROWTYPE;
BEGIN
    OPEN all_employees;
    
    FETCH all_employees into current_employee;
    
    WHILE all_employees%FOUND LOOP
    
        DBMS_OUTPUT.PUT (RPAD(current_employee.employeeid, 15, ' '));
        DBMS_OUTPUT.PUT_LINE (current_employee.name);
        FETCH all_employees into current_employee;
    END LOOP;
    
    CLOSE all_employees;
END print_employee_roster;
/

--Question 3b
Execute print_employee_roster;
/

--Question 4a
CREATE OR REPLACE PROCEDURE print_employee_roster
AS
    CURSOR all_employees
    IS
        SELECT employeeid, 
                lastname || ', ' || firstname as name
        FROM employee;
    
    current_employee all_employees%ROWTYPE;
BEGIN

    FOR current_employee IN all_employees LOOP
    
        DBMS_OUTPUT.PUT (RPAD(current_employee.employeeid, 15, ' '));
        DBMS_OUTPUT.PUT_LINE (current_employee.name);
    END LOOP;
    
END print_employee_roster;
/

--Question 4b
Execute print_employee_roster;
/

--Question 4c

/

--Question 5a
CREATE OR REPLACE PROCEDURE print_employee_roster
    (p_jobtitle IN employee.jobtitle%type)
AS
    CURSOR all_employees
    IS
        SELECT employeeid,
                lastname || ', ' || firstname as name
        FROM employee
        WHERE UPPER(TRIM(JOBTITLE)) = UPPER(TRIM(p_jobtitle));
    
BEGIN

    FOR current_employee IN all_employees LOOP
    
        DBMS_OUTPUT.PUT (RPAD(current_employee.employeeid, 15, ' '));
        DBMS_OUTPUT.PUT_LINE (current_employee.name);
    END LOOP;
    
END print_employee_roster;
/

--Question 5b
Execute print_employee_roster('sales');
/

--Question 5c
Execute print_employee_roster('assembly');
/

--Question 5d
Execute print_employee_roster('student');
/

--Question 6a
CREATE OR REPLACE PROCEDURE print_employee_roster
    (p_jobtitle IN employee.jobtitle%type)
AS
    CURSOR all_employees
    IS
        SELECT employeeid,
                lastname || ', ' || firstname as name
        FROM employee
        WHERE UPPER(TRIM(JOBTITLE)) = UPPER(TRIM(p_jobtitle));
    
BEGIN

    FOR current_employee IN all_employees LOOP
    
        DBMS_OUTPUT.PUT (RPAD(current_employee.employeeid, 15, ' '));
        DBMS_OUTPUT.PUT_LINE (current_employee.name);
    END LOOP;

EXCEPTION

    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT (SQLCODE);
        DBMS_OUTPUT.PUT (': ');
        DBMS_OUTPUT.PUT_LINE (SUBSTR(SQLERRM, 1, 100));
    
END print_employee_roster;
/

--Question 6b
Execute print_employee_roster('assembly');
/

--Question 6c

/

--Question 7a
CREATE OR REPLACE PROCEDURE customer_roster
    (p_state IN customer.state%type)
AS
    CURSOR all_customer
    IS
        SELECT companyname, city, state, 
                custlastname || ', ' || custfirstname as name
        FROM customer
        WHERE UPPER(TRIM(state)) = UPPER(TRIM(p_state));
        
    current_customer all_customer%ROWTYPE;
    
BEGIN
    OPEN all_customer;
    
    FETCH all_customer into current_customer;
    
    WHILE all_customer%FOUND LOOP
    
        DBMS_OUTPUT.PUT (RPAD(current_customer.companyname, 15, ' '));
        DBMS_OUTPUT.PUT (RPAD(current_customer.city, 30, ' '));
        DBMS_OUTPUT.PUT (RPAD(current_customer.state, 30, ' '));
        DBMS_OUTPUT.PUT_LINE (current_customer.name);
        FETCH all_customer into current_customer;
    END LOOP;
    
    CLOSE all_customer;
    
EXCEPTION

    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT (SQLCODE);
        DBMS_OUTPUT.PUT (': ');
        DBMS_OUTPUT.PUT_LINE (SUBSTR(SQLERRM, 1, 100));
        
END customer_roster;
/

--Question 7b
execute customer_roster('GA');
/

--Question 8a
CREATE OR REPLACE PROCEDURE customer_search
    (p_name IN customer.custlastname%type)
AS
    CURSOR all_search
    IS
        SELECT companyname, custfirstname, custlastname, custtitle
        FROM customer
        WHERE UPPER(TRIM(custlastname)) LIKE '%' || UPPER(TRIM(p_name)) || '%';
        
    current_search all_search%ROWTYPE;
    
BEGIN
    OPEN all_search;
    
    FETCH all_search into current_search;
    
    WHILE all_search%FOUND LOOP
    
        DBMS_OUTPUT.PUT (RPAD(current_search.companyname, 30, ' '));
        DBMS_OUTPUT.PUT (RPAD(current_search.custfirstname, 30, ' '));
        DBMS_OUTPUT.PUT (RPAD(current_search.custlastname, 30, ' '));
        DBMS_OUTPUT.PUT_LINE (RPAD(current_search.custtitle,30, ' '));
        FETCH all_search into current_search;
    END LOOP;
    
    CLOSE all_search;
    
EXCEPTION

    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT (SQLCODE);
        DBMS_OUTPUT.PUT (': ');
        DBMS_OUTPUT.PUT_LINE (SUBSTR(SQLERRM, 1, 100));
        
END customer_search;
/

--Question 8b
execute customer_search('NA');
/

--Question 8c
CREATE OR REPLACE PROCEDURE customer_search
    (p_name IN customer.custlastname%type)
AS
    CURSOR all_search
    IS
        SELECT companyname, custfirstname, custlastname, custtitle
        FROM customer
        WHERE UPPER(TRIM(custlastname)) LIKE '%' || UPPER(TRIM(p_name)) || '%' OR
        UPPER(TRIM(custfirstname)) LIKE '%' || UPPER(TRIM(p_name)) || '%';
        
    current_search all_search%ROWTYPE;
    
BEGIN
    OPEN all_search;
    
    FETCH all_search into current_search;
    
    WHILE all_search%FOUND LOOP
    
        DBMS_OUTPUT.PUT (RPAD(current_search.companyname, 30, ' '));
        DBMS_OUTPUT.PUT (RPAD(current_search.custfirstname, 30, ' '));
        DBMS_OUTPUT.PUT (RPAD(current_search.custlastname, 30, ' '));
        DBMS_OUTPUT.PUT_LINE (RPAD(current_search.custtitle,30, ' '));
        FETCH all_search into current_search;
    END LOOP;
    
    CLOSE all_search;
    
EXCEPTION

    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT (SQLCODE);
        DBMS_OUTPUT.PUT (': ');
        DBMS_OUTPUT.PUT_LINE (SUBSTR(SQLERRM, 1, 100));
        
END customer_search;
/

--Question 8d
execute customer_search('na');
/

--Question 8e
CREATE OR REPLACE PROCEDURE customer_search
    (p_name IN customer.custlastname%type)
AS
    CURSOR all_search
    IS
        SELECT companyname, custfirstname, custlastname, custtitle
        FROM customer
        WHERE UPPER(TRIM(custlastname)) LIKE '%' || UPPER(TRIM(p_name)) || '%' OR
        UPPER(TRIM(custfirstname)) LIKE '%' || UPPER(TRIM(p_name)) || '%';
    
    current_search  all_search%ROWTYPE;
    
BEGIN

    FOR current_search  IN all_search LOOP
    
        DBMS_OUTPUT.PUT (RPAD(current_search.companyname, 30, ' '));
        DBMS_OUTPUT.PUT (RPAD(current_search.custfirstname, 30, ' '));
        DBMS_OUTPUT.PUT (RPAD(current_search.custlastname, 30, ' '));
        DBMS_OUTPUT.PUT_LINE (RPAD(current_search.custtitle,30, ' '));
    END LOOP;

EXCEPTION

    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT (SQLCODE);
        DBMS_OUTPUT.PUT (': ');
        DBMS_OUTPUT.PUT_LINE (SUBSTR(SQLERRM, 1, 100));
    
END customer_search;
/

--Question 8f
execute customer_search('na');
/

/* RESULTS
Question 1a



Question 1b
100001         Manaugh                       Jim
100101         Rosner                        Joanne
100103         Bush                          Rita
100104         Abbott                        Michael
100106         Eckelman                      Paul
100112         Hickman                       Steven
100120         Nairn                         Michelle
100125         Stevenson                     Gabrielle
100127         Wendling                      Jason
100200         Zobitz                        Beth
100204         Keck                          David
100206         Xolo                          Kathleen
100209         Yates                         Tina
100220         Vigus                         Todd
100330         Gustavel                      Kristen
100365         Cheswick                      Sherman
100399         Day                           Ronald
100475         Hess                          Steve
100488         Osman                         Jamie
100550         Roland                        Allison
100559         Tyrie                         Meghan
100600         Zollman                       Calie
100650         Lilley                        Edna
100700         Jones                         Charles
100880         German                        Gary
100892         Platt                         Joseph
100944         Stahley                       Ryan
100967         Albregts                      Nicholas
100989         Deagen                        Kathryn
101007         Krasner                       Jason
101030         Moore                         Kristey
101045         Ortman                        Austin
101066         Rodgers                       Laura
101088         Underwood                     Patricha
101089         Alvarez                       Melissa
101097         Brose                         Jack
101115         Cochran                       Steve
101135         Deppe                         David
101154         Hettinger                     Gregory
101166         Reece                         Phil

Question 2a



Question 2b
100001         Manaugh                       Jim
100101         Rosner                        Joanne
100103         Bush                          Rita
100104         Abbott                        Michael
100106         Eckelman                      Paul
100112         Hickman                       Steven
100120         Nairn                         Michelle
100125         Stevenson                     Gabrielle
100127         Wendling                      Jason
100200         Zobitz                        Beth
100204         Keck                          David
100206         Xolo                          Kathleen
100209         Yates                         Tina
100220         Vigus                         Todd
100330         Gustavel                      Kristen
100365         Cheswick                      Sherman
100399         Day                           Ronald
100475         Hess                          Steve
100488         Osman                         Jamie
100550         Roland                        Allison
100559         Tyrie                         Meghan
100600         Zollman                       Calie
100650         Lilley                        Edna
100700         Jones                         Charles
100880         German                        Gary
100892         Platt                         Joseph
100944         Stahley                       Ryan
100967         Albregts                      Nicholas
100989         Deagen                        Kathryn
101007         Krasner                       Jason
101030         Moore                         Kristey
101045         Ortman                        Austin
101066         Rodgers                       Laura
101088         Underwood                     Patricha
101089         Alvarez                       Melissa
101097         Brose                         Jack
101115         Cochran                       Steve
101135         Deppe                         David
101154         Hettinger                     Gregory
101166         Reece                         Phil

Question 2c
current_employee is a cursor variable declaration name that is based upon the declared
cursor above that selects rows from the employee table. 

Question 3a



Question 3b
100001         Manaugh, Jim
100101         Rosner, Joanne
100103         Bush, Rita
100104         Abbott, Michael
100106         Eckelman, Paul
100112         Hickman, Steven
100120         Nairn, Michelle
100125         Stevenson, Gabrielle
100127         Wendling, Jason
100200         Zobitz, Beth
100204         Keck, David
100206         Xolo, Kathleen
100209         Yates, Tina
100220         Vigus, Todd
100330         Gustavel, Kristen
100365         Cheswick, Sherman
100399         Day, Ronald
100475         Hess, Steve
100488         Osman, Jamie
100550         Roland, Allison
100559         Tyrie, Meghan
100600         Zollman, Calie
100650         Lilley, Edna
100700         Jones, Charles
100880         German, Gary
100892         Platt, Joseph
100944         Stahley, Ryan
100967         Albregts, Nicholas
100989         Deagen, Kathryn
101007         Krasner, Jason
101030         Moore, Kristey
101045         Ortman, Austin
101066         Rodgers, Laura
101088         Underwood, Patricha
101089         Alvarez, Melissa
101097         Brose, Jack
101115         Cochran, Steve
101135         Deppe, David
101154         Hettinger, Gregory
101166         Reece, Phil

Question 4a



Question 4b
100001         Manaugh, Jim
100101         Rosner, Joanne
100103         Bush, Rita
100104         Abbott, Michael
100106         Eckelman, Paul
100112         Hickman, Steven
100120         Nairn, Michelle
100125         Stevenson, Gabrielle
100127         Wendling, Jason
100200         Zobitz, Beth
100204         Keck, David
100206         Xolo, Kathleen
100209         Yates, Tina
100220         Vigus, Todd
100330         Gustavel, Kristen
100365         Cheswick, Sherman
100399         Day, Ronald
100475         Hess, Steve
100488         Osman, Jamie
100550         Roland, Allison
100559         Tyrie, Meghan
100600         Zollman, Calie
100650         Lilley, Edna
100700         Jones, Charles
100880         German, Gary
100892         Platt, Joseph
100944         Stahley, Ryan
100967         Albregts, Nicholas
100989         Deagen, Kathryn
101007         Krasner, Jason
101030         Moore, Kristey
101045         Ortman, Austin
101066         Rodgers, Laura
101088         Underwood, Patricha
101089         Alvarez, Melissa
101097         Brose, Jack
101115         Cochran, Steve
101135         Deppe, David
101154         Hettinger, Gregory
101166         Reece, Phil

Question 4c
The processing steps from the SELECT statement until the end of FROM statement is 
associated with the cursor all_employees.

Question 5a

Question 5b
100600         Zollman, Calie
101007         Krasner, Jason
101066         Rodgers, Laura

Question 5c
100101         Rosner, Joanne
100120         Nairn, Michelle
100204         Keck, David
100399         Day, Ronald
100475         Hess, Steve
100550         Roland, Allison
100892         Platt, Joseph
100967         Albregts, Nicholas
100989         Deagen, Kathryn
101030         Moore, Kristey
101045         Ortman, Austin
101088         Underwood, Patricha
101089         Alvarez, Melissa
101097         Brose, Jack
101115         Cochran, Steve
101135         Deppe, David
101154         Hettinger, Gregory
101166         Reece, Phil

Question 5d
It displays nothing.

Question 6a



Question 6b
100101         Rosner, Joanne
100120         Nairn, Michelle
100204         Keck, David
100399         Day, Ronald
100475         Hess, Steve
100550         Roland, Allison
100892         Platt, Joseph
100967         Albregts, Nicholas
100989         Deagen, Kathryn
101030         Moore, Kristey
101045         Ortman, Austin
101088         Underwood, Patricha
101089         Alvarez, Melissa
101097         Brose, Jack
101115         Cochran, Steve
101135         Deppe, David
101154         Hettinger, Gregory
101166         Reece, Phil

Question 6c
If an exception occured, the functions SQLCODE would return the number of errors
to the user and it returns a negative unless the error is "no data found". The SQLERRM 
returns the corresponding error message. Thus, when an exception is occured, the number
of errors and the error message/code will be displayed. 

For user-defined exceptions, SQLCODE will display +1 and SQLERRM will display 
"User-Defined Exception". 

Question 7a



Question 7b
Swainsboro                    GA                            Osborne, Shirley
Athens                        GA                            Thompson, Jamie
Macon                         GA                            Vanderhoff, Rosemary
Nahunta                       GA                            Malady, Frank
Family Medical Adel                          GA                            Strong, Susan
Down Deep DrillElberton                      GA                            Torres, Don

Question 8a



Question 8b
Bobs Repair Service           Daniel                        Hundnall                      Mr.                           
Automart                      Jessica                       Nakamura                      Ms.                           
Dorlan                        Bresnaham                     Dr.                           
Jay                           Hanau                         Mr.                           
Matt                          Nakanishi                     Mr.                           
Jim                           Manaugh                       Mr.                           




Question 8c

Question 8d
Bobs Repair Service           Daniel                        Hundnall                      Mr.                           
Automart                      Jessica                       Nakamura                      Ms.                           
Anna                          Mayton                        Dr.                           
Ronald                        Miller                        Mr.                           
Dorlan                        Bresnaham                     Dr.                           
Verna                         McGrew                        Ms.                           
Christina                     Wilson                        Mrs.                          
Jay                           Hanau                         Mr.                           
Matt                          Nakanishi                     Mr.                           
Nancy                         Basham                        Mrs.                          
Jim                           Manaugh                       Mr.                           
Jonathon                      Blanco                        Mr.                           



Question 8e

Question 8f
Bobs Repair Service           Daniel                        Hundnall                      Mr.                           
Automart                      Jessica                       Nakamura                      Ms.                           
Anna                          Mayton                        Dr.                           
Ronald                        Miller                        Mr.                           
Dorlan                        Bresnaham                     Dr.                           
Verna                         McGrew                        Ms.                           
Christina                     Wilson                        Mrs.                          
Jay                           Hanau                         Mr.                           
Matt                          Nakanishi                     Mr.                           
Nancy                         Basham                        Mrs.                          
Jim                           Manaugh                       Mr.                           
Jonathon                      Blanco                        Mr.                           


*/
