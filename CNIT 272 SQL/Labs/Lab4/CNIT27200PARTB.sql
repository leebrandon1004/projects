/*
Brandon Lee
CNIT 27200 Lab04 part B
Lab Time: 3:30-5:20 Monday

/*
Question 1)
*/

Select CEIL(6867.65785), USER
From DUAL;
/*

CEIL(6867.65785) USER                                                                                                                            
---------------- --------------------------------------------------------------------------------------------------------------------------------
            6868 LEE3118   
*/

Select FLOOR(6867.65785), USER
From DUAL;

/*
FLOOR(6867.65785) USER                                                                                                                            
----------------- --------------------------------------------------------------------------------------------------------------------------------
             6867 LEE3118  
*/

Select TRUNC(6867.65785,2), USER
From DUAL;
/*
TRUNC(6867.65785,2) USER                                                                                                                            
------------------- --------------------------------------------------------------------------------------------------------------------------------
            6867.65 LEE3118 
*/

Select ROUND(6867.65785,2), USER
From DUAL;

/*
ROUND(6867.65785,2) USER                                                                                                                            
------------------- --------------------------------------------------------------------------------------------------------------------------------
            6867.66 LEE3118   
Round function rounds the number to the nearest while the Trunc is used to delete the number from some position
DUAL is used to get OS function like time, date, and expressions.
*/


/*
Question 2)
*/

Select EMPLOYEEID, LASTNAME || ' ' || FIRSTNAME AS Employee, HIREDATE, NVL(EMAILADDR,'*Need Email*') AS EMAIL_ADDRESS
FROM EMPLOYEE
WHERE HIREDATE BETWEEN '01-JAN-2013' AND '31-DEC-2013';

/*


EMPLOYEEID EMPLOYEE                             HIREDATE  EMAIL_ADDRESS                                     
---------- ------------------------------------ --------- --------------------------------------------------
250104     Blair Michael                        25-JAN-13 mblair@eagle.com                                  
250106     Loreto Harper                        04-APR-13 hloreto@eagle.com                                 
250206     Guiomar Maria                        01-DEC-13 mguiomar@eagle.com                                
250209     Reyes Trinidad                       09-JAN-13 treyes@eagle.com                                  
250365     Cheswick Gina                        20-JAN-13 gcheswick@eagle.com                               
250399     Day Ronald                           04-MAY-13 *Need Email*                                      
250550     Roland Allison                       04-APR-13 *Need Email*                                      
250600     Zollman Calie                        04-APR-13 *Need Email*                                      
250650     Lilley Edna                          25-NOV-13 elilley@eagle.com                                 
251115     Cochran Steve                        17-DEC-13 *Need Email*                                      

10 rows selected. 
Like is used in a WHERE clause to search for a pattern in a column and allows partial matching
while = checks for exact matches.

*/

/*
Question 3
*/

Select SUPPLIERID, MIN(ORDEREDUNITCOST) AS MIN_UNITCOST, MAX(ORDEREDUNITCOST) AS MAX_UNITCOST, 
ROUND(AVG(ORDEREDUNITCOST),2) AS AVG_COST, COUNT(SUPPLIERID) AS NUMBER_PURCHASED
From PURCHORDERLINE
Where SUPPLIERID LIKE 'C%' OR SUPPLIERID LIKE 'P%'
Group by SUPPLIERID;

/*
SUPPLIERID MIN_UNITCOST MAX_UNITCOST   AVG_COST NUMBER_PURCHASED
---------- ------------ ------------ ---------- ----------------
PP-103            64.62       5507.7    1276.12               13
CA-103            21.42      1888.65     598.16                5
CA-105           113.09       809.73      369.3               11
CV-104           328.87      3239.64    1264.49                4
PA-450            98.93      2585.52     773.13                6
PA-455           215.64       648.92     372.87                4
CCS-106            65.7      3239.73    1264.15                5
CF-450            54.99      2375.85     824.66                5
C-455             21.42      1624.83     602.64                4

9 rows selected. 
Nost sql functions are column functions but sinfle row functions are character functions,
numeric functions, date, conversion functions.
*/

/*
Question 4)
*/
Select SUPPLIERID, MIN(ORDEREDUNITCOST) AS MIN_UNITCOST, MAX(ORDEREDUNITCOST) AS MAX_UNITCOST, 
ROUND(AVG(ORDEREDUNITCOST),2) AS AVG_COST, COUNT(SUPPLIERID) AS NUMBER_PURCHASED
From PURCHORDERLINE
Where SUPPLIERID LIKE 'C%' OR SUPPLIERID LIKE 'P%' AND (Select ROUND(AVG(UNITCOST),2) From SUPPLIEDPART) > 800
Group by SUPPLIERID;

/*
SUPPLIERID MIN_UNITCOST MAX_UNITCOST   AVG_COST NUMBER_PURCHASED
---------- ------------ ------------ ---------- ----------------
CA-103            21.42      1888.65     598.16                5
CA-105           113.09       809.73      369.3               11
CV-104           328.87      3239.64    1264.49                4
CCS-106            65.7      3239.73    1264.15                5
CF-450            54.99      2375.85     824.66                5
C-455             21.42      1624.83     602.64                4

6 rows selected. 

Having and Where is used in a groupby. Where is used to filter ros before grouping and having
is used to exclude records after grouping. 
*/

/*
Queston 5)
*/
Select PARTNUMBER, LPAD(LOWER(PARTDESCRIPTION),40,'*'),CATEGORYID,WEIGHT,STOCKPRICE
From INVENTORYPART
Where STOCKPRICE < (Select AVG(STOCKPRICE) From INVENTORYPART) AND WEIGHT BETWEEN 2.50 AND 10.00; 

/*
PARTNUMBER LPAD(LOWER(PARTDESCRIPTION),40,'*')      CATEGORYID     WEIGHT STOCKPRICE
---------- ---------------------------------------- ---------- ---------- ----------
MEM-004    **************************4tb hard drive STOR                3     161.99
MEM-005    **************************1tb hard drive STOR             2.75      47.99
MEM-006    **************************3tb hard drive STOR              2.5      95.99
MOM-001    ********************x370 atx motherboard BASE                5      59.93
MOM-002    *******************intel atx motherboard BASE              5.5      95.99
MOM-003    **************intel atx x299 motherboard BASE             5.75      83.99
MOM-004    ****************************raspberry pi BASE                6      65.99
MON-003    *****************23in multimedia monitor BASE                9       79.4
MON-006    *********************23in gaming monitor BASE                9      95.99
MON-007    *********************23in curved monitor BASE                9     107.99
MON-008    ******************22in ultraslim monitor BASE                7      83.99

PARTNUMBER LPAD(LOWER(PARTDESCRIPTION),40,'*')      CATEGORYID     WEIGHT STOCKPRICE
---------- ---------------------------------------- ---------- ---------- ----------
PRT-004    *************3-in-1 color inkjet printer ACS                 6      179.4
PRT-005    ********************color inkjet printer ACS                 8       89.4
PRT-006    *******singlehead thermal inkjet printer ACS                 9       59.4
PS-001     *******************750 watt power supply POW                 3      59.97
PS-002     *******************500 watt power supply                     3      53.97
PS-003     *************760 watt ax760 power supply POW                 4      71.77
SCN-001    ***************scanjet cse color scanner ACS               3.5       77.4
SCN-002    ***scanjet business series color scanner ACS                 4      149.4
CS-001     *************************security camera HOME             2.75      50.97
ADT-001    ***ethernet fiber optic mini-transceiver STOR                4      55.99
C-001      *************************full tower case BASE                5      70.97

PARTNUMBER LPAD(LOWER(PARTDESCRIPTION),40,'*')      CATEGORYID     WEIGHT STOCKPRICE
---------- ---------------------------------------- ---------- ---------- ----------
C-002      **************************mid tower case BASE             5.75      42.97
C-003      *************************mini tower case BASE              2.5      40.97
C-004      *********************laptop plastic case BASE                3      21.93
CD-004     **********************bluray drive usb 3 STOR                3     153.99
DVD-001    **************************6x dvd-rom kit STOR              2.5     119.99

27 rows selected.
Average Stock PRice: 84.36

*/


/*
Question 6)
*/




/*
Question 7)
*/
Select SUBSTR(PARTNUMBER,1,3), COUNT(PARTNUMBER), OPERATIONSTEP
From OPERATION
Where OPERATIONSTEP IN ('BOX','WRAP','LABEL') 
Group by OPERATIONSTEP, SUBSTR(PARTNUMBER,1,3)
Having COUNT(PARTNUMBER) >= 10
Order by SUBSTR(PARTNUMBER,1,3);
/*
SUB COUNT(PARTNUMBER) OPERATIONS
--- ----------------- ----------
BRK                11 BOX       
BRK                11 LABEL     
BRK                11 WRAP      
CAB                28 BOX       
CAB                28 LABEL     
CAB                28 WRAP      
CTR                29 BOX       
CTR                29 LABEL     
CTR                29 WRAP      
MEM                12 BOX       
MEM                12 LABEL     

SUB COUNT(PARTNUMBER) OPERATIONS
--- ----------------- ----------
MEM                12 WRAP      
MIC                12 BOX       
MIC                12 LABEL     
MIC                12 WRAP      
P-0                10 BOX       
P-0                10 LABEL     
P-0                10 WRAP      

18 rows selected. 

Substring extracts a substring with a specified length starting from a location in an input string
SUBSTRING(input_string, start, length)
*/


/*
Question 8)
*/
Select JOBTITLE, ROUND(AVG(TRUNC(MONTHS_BETWEEN(HIREDATE,BIRTHDATE)/12)),2), COUNT(JOBTITLE)
From EMPLOYEE
Group by JOBTITLE;

/*
JOBTITLE                            ROUND(AVG(TRUNC(MONTHS_BETWEEN(HIREDATE,BIRTHDATE)/12)),2) COUNT(JOBTITLE)
----------------------------------- ---------------------------------------------------------- ---------------
Chief Sales Officer                                                                         34               1
Engineer                                                                                    34               5
President                                                                                   44               1
DBA                                                                                         34               1
Chief Financial Officer                                                                     34               1
Assembly                                                                                 24.37              19
VP Operations                                                                               29               1
Programmer Analyst                                                                        27.5               2
Accountant                                                                                  19               2
Sales                                                                                       29               4
Chief Information Officer                                                                   23               1

JOBTITLE                            ROUND(AVG(TRUNC(MONTHS_BETWEEN(HIREDATE,BIRTHDATE)/12)),2) COUNT(JOBTITLE)
----------------------------------- ---------------------------------------------------------- ---------------
Operations Officer                                                                        29.5               2
VP Finance                                                                                  34               1
VP Information                                                                              35               1

14 rows selected. 

By creating aggregate functions, averaged the whole trunced function then grouped the count function where the aggregate function is not used.
*/



Select 
/*
Question 9a
*/
Select STATUS, COUNT(ORDERQUANTITY), ROUND(SUM(UNITPRICE * ORDERQUANTITY),2) AS SUBTOTAL 
From CUSTORDERLINE 
GROUP BY STATUS;

/*
STATUS          COUNT(ORDERQUANTITY)   SUBTOTAL
--------------- -------------------- ----------
PENDING                           43   38151.27
SHIPPED                         2225 2971646.08
PICKED                            13   11168.79
PACKED                             8    5003.04
PART SHIP                          3   21076.67
*/

/*
Question 9b
*/
Select UNITPRICE, ORDERQUANTITY, ORDERID
From CUSTORDERLINE
Where STATUS = 'PACKED';
/*
 UNITPRICE ORDERQUANTITY ORDERID   
---------- ------------- ----------
     14.99            29 3001000797
     12.99             1 3001000667
     69.99             1 3001000667
     31.95             3 3001000703
      5.99             1 3001000703
     44.99             2 3001000703
   1846.79             2 3001000810
    119.99             5 3001000810

8 rows selected. 
*/
/*
Question 9c
*/
Select STATUS, COUNT(ORDERQUANTITY), ROUND(SUM(UNITPRICE * ORDERQUANTITY),2) AS SUBTOTAL 
From CUSTORDERLINE
Group by STATUS
Having  ROUND(SUM(UNITPRICE * ORDERQUANTITY),2) <= 30000;
/*
STATUS          COUNT(ORDERQUANTITY)   SUBTOTAL
--------------- -------------------- ----------
PICKED                            13   11168.79
PACKED                             8    5003.04
PART SHIP                          3   21076.67

Aggregate function allows you to perform a calculation in a single scalar value, and by using
the GROUP BY clauses you can group functions in a aggregate function together.
*/

/*
Question 10)
*/
Select TO_CHAR(SYSDATE,'FMMONTHDD,YYYY') from DUAL;

/*
Question 10a
TO_CHAR(SYSDATE,
----------------
MARCH8,2020

*/

Select TO_CHAR(SYSDATE, 'day') from DUAL;
/*
Question 10b

TO_CHAR(S
---------
sunday   
*/

Select TO_CHAR(TO_DATE('04-OCT-2000'),'day') from DUAL;
      
/*
Quesiton 10c      
TO_CHAR(T
---------
wendnesday

To_CHAR converts date to VARCHAR2 datatype
TO_DATE converts character to a date datatype
*/
