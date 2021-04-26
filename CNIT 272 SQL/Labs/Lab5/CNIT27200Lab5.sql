/*
BRANDON LEE
CNIT 272

Q1.
*/
Select EMPLOYEEID, LASTNAME || ', '|| FIRSTNAME AS CONTACT
From EMPLOYEE
Where EMPLOYEEID NOT IN(Select EMPLOYEEID From PACKINGSLIP);

/*
RESULTS: 


EMPLOYEEID CONTACT                              
---------- -------------------------------------
250600     Zollman, Calie                       
251089     Alvarez, Melissa                     
250700     Jones, Charles                       
250206     Guiomar, Maria                       
250104     Blair, Michael                       
250365     Cheswick, Gina                       
250944     Thompson, Ryan                       
251135     Gostler, David                       
251030     Moore, Jaylen                        
251066     Rodgers, Laura                       
251007     Krastner, Malik                      

EMPLOYEEID CONTACT                              
---------- -------------------------------------
250127     Watson, Shelby                       
250488     Osman, Jamie                         
250112     Hickman, Hunter                      
250650     Lilley, Edna                         
250209     Reyes, Trinidad                      
250200     Hernandez, Lauren                    
250559     Romilda, Carmen                      
250103     Jones, Rita                          
250106     Loreto, Harper                       
250001     Howard, Marilyn                      
250330     Gustavel, Kristen                    

EMPLOYEEID CONTACT                              
---------- -------------------------------------
250880     Goldwear, Gary                       
251115     Cochran, Steve                       
251175     Darby, Shannon                       
250125     Stevens, Kasey                       
250220     Vigus, Todd                          
250475     Hess, Steve                          

28 rows selected. 

Explanation: Nested query operates within another SQL query and embedded within the WHERE clause, 
and ORDER BY cannot be used in the nested query. 


/*
Q2.
*/
Select PURCHASEORDER.EMPLOYEEID, LASTNAME, FIRSTNAME, DATEORDERED
From EMPLOYEE INNER JOIN PURCHASEORDER ON EMPLOYEE.EMPLOYEEID = PURCHASEORDER.EMPLOYEEID
Where PAIDINFULL = 'Y' AND DATEORDERED BETWEEN '01-SEP-2019' AND '30-SEP-2019';

/*
RESULTS: 


EMPLOYEEID LASTNAME             FIRSTNAME       DATEORDER
---------- -------------------- --------------- ---------
250600     Zollman              Calie           05-SEP-19
250880     Goldwear             Gary            10-SEP-19
250880     Goldwear             Gary            10-SEP-19
250880     Goldwear             Gary            07-SEP-19
250880     Goldwear             Gary            05-SEP-19
250880     Goldwear             Gary            03-SEP-19
251007     Krastner             Malik           06-SEP-19
251007     Krastner             Malik           06-SEP-19
251007     Krastner             Malik           10-SEP-19
251007     Krastner             Malik           10-SEP-19
251066     Rodgers              Laura           04-SEP-19

EMPLOYEEID LASTNAME             FIRSTNAME       DATEORDER
---------- -------------------- --------------- ---------
251167     Natlen               Devin           09-SEP-19
251167     Natlen               Devin           09-SEP-19
251167     Natlen               Devin           05-SEP-19

14 rows selected. 




Explanation: The INNER JOIN syntax within two tables by using a comparison operator:
Select...DISTINCT...Value Expression...
From...TableName...INNER JOIN...TABLE NAME2
ON... Condition
*/

/*
Q3A.
*/

Select CATEGORY.CATEGORYID, CATEGORYNAME, COUNT(INVENTORYPART.PARTNUMBER) AS PARTS,
ROUND(AVG(STOCKPRICE),2) AS AVG_PRICE, MIN(STOCKPRICE) AS MIN_PRICE, MAX(STOCKPRICE) AS MAX_PRICE
From CATEGORY INNER JOIN INVENTORYPART ON CATEGORY.CATEGORYID = INVENTORYPART.CATEGORYID 
GROUP BY CATEGORY.CATEGORYID, CATEGORYNAME
ORDER BY CATEGORY.CATEGORYID; 

/*
RESULTS: 

CATEGORYID CATEGORYNAME                        PARTS  AVG_PRICE  MIN_PRICE  MAX_PRICE
---------- ------------------------------ ---------- ---------- ---------- ----------
ACS        Accessories                             8     189.15       59.4      419.4
BASE       Basics                                 44     122.27       7.79    1717.99
CBL        Cables                                 36      15.53       1.19      74.99
COMP       Computers                              29    1132.38     788.54    1572.93
HOME       Monitoring                              3      90.97      21.97     199.97
NET        Networking                              5      57.59       7.99     121.99
POW        Power                                   3       55.9      35.97      71.77
PROC       Processors                             19     128.26       3.57     460.79
SFTW       Software                                9       5.99       5.99       5.99
STOR       Storage                                19      80.04      12.99     171.99

10 rows selected. 



Explanation:
*/
/*
Q3B.
*/
Select INVENTORYPART.CATEGORYID, CATEGORYNAME, COUNT(INVENTORYPART.PARTNUMBER) AS PARTS,
ROUND(AVG(STOCKPRICE),2) AS AVG_PRICE, MIN(STOCKPRICE) AS MIN_PRICE, MAX(STOCKPRICE) AS MAX_PRICE
From CATEGORY INNER JOIN INVENTORYPART ON CATEGORY.CATEGORYID = INVENTORYPART.CATEGORYID 
HAVING ROUND(AVG(STOCKPRICE),2) > 75
GROUP BY INVENTORYPART.CATEGORYID, CATEGORYNAME
ORDER BY INVENTORYPART.CATEGORYID; 

/*
RESULTS: 


CATEGORYID CATEGORYNAME                        PARTS  AVG_PRICE  MIN_PRICE  MAX_PRICE
---------- ------------------------------ ---------- ---------- ---------- ----------
ACS        Accessories                             8     189.15       59.4      419.4
BASE       Basics                                 44     122.27       7.79    1717.99
COMP       Computers                              29    1132.38     788.54    1572.93
HOME       Monitoring                              3      90.97      21.97     199.97
PROC       Processors                             19     128.26       3.57     460.79
STOR       Storage                                19      80.04      12.99     171.99

6 rows selected. 

Explanation: You should compare the INNER JOIN by using the format:
SELECT * 
FROM table1 
INNER JOIN table2
      ON table1.primaryKey=table2.table1Id
INNER JOIN table3
      ON table1.primaryKey=table3.table1Id
      
      After you compate table 1 and table 2 you should compare table 1 and table 3 to
      add a third table to the query.
*/

/*
Q4.
*/
Select CUSTORDER.ORDERID, ORDERDATE, SHIPMENTID, CUSTLASTNAME, CUSTOMER.STATE
From CUSTOMER INNER JOIN CUSTORDER ON CUSTOMER.CUSTOMERID = CUSTORDER.CUSTOMERID 
INNER JOIN SHIPMENT ON CUSTORDER.ORDERID = SHIPMENT.ORDERID 
Where SHIPMENTID NOT IN(SELECT SHIPMENTID FROM PACKINGSLIP);

/*
RESULTS: 


ORDERID    ORDERDATE SHIPMENTID CUSTLASTNAME         ST
---------- --------- ---------- -------------------- --
3001000750 13-MAR-19 M147       Cool                 ID
3001000790 27-MAR-19 L257       McGrew               AL
3001000802 30-MAR-19 L260       Jones                FL
3000000030 13-JUL-18 L006       Manaugh              FL
3001000667 23-FEB-19 M129       Lageveen             WY
3001000804 30-MAR-19 L261       Moore                KY
3001000798 29-MAR-19 L259       Umbarger             ME
3001000806 31-MAR-19 L262       Williams             VT
3001000791 27-MAR-19 L258       Illingworth          NY
3001000808 31-MAR-19 M162       Marko                OK
3001000796 29-MAR-19 M159       Hari                 KY

ORDERID    ORDERDATE SHIPMENTID CUSTLASTNAME         ST
---------- --------- ---------- -------------------- --
3001000797 29-MAR-19 H380       Robles               CO
3001000805 31-MAR-19 H383       Kmec                 MD
3001000800 30-MAR-19 H381       Gilliland            DC
3001000807 31-MAR-19 H384       Smith                VT
3001000801 30-MAR-19 H382       Marcus               NV
3001000803 30-MAR-19 M161       Osborne              GA
3001000799 29-MAR-19 M160       Mangus               FL
3001000703 01-MAR-19 M137       Hedden               AR

19 rows selected. 



Explanation: The similarities between INNER JOIN and nester query are that they both use query data
from different tables and share the same query plan. But the similarities are that nested queries are 
used to return a scalar value or a row set whereas INNER JOIN return rows. 
*/

/*
Q5.
*/

Select SUPPLIEDPART.SUPPLIERID, COMPANYNAME, CELLPHONE, COUNT(PARTNUMBER) AS SUPPLIER_COUNT
From SUPPLIER 
INNER JOIN SUPPLIEDPART ON SUPPLIER.SUPPLIERID = SUPPLIEDPART.SUPPLIERID
GROUP BY SUPPLIEDPART.SUPPLIERID, COMPANYNAME, CELLPHONE;

/*
RESULTS: 


SUPPLIERID COMPANYNAME                    CELLPHONE    SUPPLIER_COUNT
---------- ------------------------------ ------------ --------------
AC-450     DealsPC                        303-465-2392              7
C-455      Computer Zone                  208-614-8076              5
CA-103     CompCom                        919-736-0594              5
CA-105     IT Creations                   315-474-1341             11
CCS-106    Computer Visions               909-452-7153              5
CF-450     Net Works                      919-703-0048              5
CV-104     RefurbNet                      606-677-0457              4
DCI-450    Power Adapter Shop             812-547-3650              3
EA-103     TargetPC                       520-475-9737             12
GC-450     Tech WorldWide                 305-647-7525             13
JLI-450    Server Store                   887-746-3374              5

SUPPLIERID COMPANYNAME                    CELLPHONE    SUPPLIER_COUNT
---------- ------------------------------ ------------ --------------
LL-455     Limited Comp                   471-846-9658              9
LU-450     Tech Parts Mart                303-696-8277              5
MC-455     Discount Print                 207-634-0003             12
MM-103     Monster Parts                  843-646-0893              4
MM-104     Computer Surplus               937-147-1168              8
MSN-105    Computer Medic                 520-486-4013              4
MY-450     Tablet Repair                  972-534-8447              6
NA-450     Cables and Kits                505-660-6852              3
NN-455     Qwerty Comp                    517-777-7156              2
OI-450     Beach Audio                    860-624-7384              5
PA-384     Cyber Saver                    520-534-8890              3

SUPPLIERID COMPANYNAME                    CELLPHONE    SUPPLIER_COUNT
---------- ------------------------------ ------------ --------------
PA-450     xByte Tech                     305-490-1134              6
PA-455     Toner Recyclers                303-967-0610              4
PP-103     Tech Traders                   806-456-9178             13
RC-450     Electronics Cafe               303-564-6516              5
SS-455     Information Security           540-514-6031              6
SW-450     Power Smart                    313-475-4786              3
WE-450     Computer Surplus               302-696-5615              6

29 rows selected. 

Explanation: We are grouping suppliedpart from supplierid, companyname, and cellpone in chronological
order so supplierid is prioritized first. The counts are divided up by partnumber that are stored and the joins
work by nesting supplypart on supplierid.

*/

/*
Q6.
*/
Select CUSTOMER.CUSTOMERID, CUSTORDER.ORDERID, CUSTORDERLINE.PARTNUMBER, UNITPRICE, PACKAGENUMBER, SHIPMENTID, QUANTITYSHIPPED
From CUSTOMER 
INNER JOIN CUSTORDER ON CUSTOMER.CUSTOMERID = CUSTORDER.CUSTOMERID 
INNER JOIN CUSTORDERLINE ON CUSTORDER.ORDERID = CUSTORDERLINE.ORDERID
INNER JOIN SHIPPEDITEM ON CUSTORDERLINE.PARTNUMBER = SHIPPEDITEM.PARTNUMBER 
AND CUSTORDERLINE.ORDERID = SHIPPEDITEM.ORDERID
WHERE ORDERDATE = '16-DEC-2018' AND (UNITPRICE < 10);

/*
RESULTS: 


CUSTOMERID ORDERID    PARTNUMBER  UNITPRICE PACKAGENUMBER SHIPMENTID QUANTITYSHIPPED
---------- ---------- ---------- ---------- ------------- ---------- ---------------
I-200003   3000000466 CF-008           9.95             1 H248                     1
I-200069   3000000468 BRK-008          5.99             1 H250                     3
I-200069   3000000468 ICAB-007         5.49             1 H250                     1
I-200069   3000000468 POW-003          1.99             1 H250                     1
I-200093   3000000469 BRK-010          4.99             1 H251                     5
I-200093   3000000469 CAB-016          6.99             1 H251                     1
I-200093   3000000469 SFT-001          9.99             1 H251                     1
C-200013   3000000473 BRK-008          5.99             8 H255                    15
C-200013   3000000473 BRK-011          5.99             9 H255                    20
I-200072   3000000478 CAB-016          6.99             4 H260                     3
I-200085   3000000479 ICAB-008         4.99             1 H261                     1

CUSTOMERID ORDERID    PARTNUMBER  UNITPRICE PACKAGENUMBER SHIPMENTID QUANTITYSHIPPED
---------- ---------- ---------- ---------- ------------- ---------- ---------------
I-200102   3000000481 SFT-008          9.99             1 H263                     1
C-200010   3000000482 BRK-009          5.99             1 H264                    26
I-200100   3000000486 SFT-008          9.99             1 H268                     2
I-200019   3000000487 CAB-008          6.99             1 H269                     4
I-200032   3000000488 BRK-003          9.99             1 H270                     3
I-200032   3000000488 BRK-010          4.99             1 H270                     5
C-200008   3000000489 CAB-022          9.99            21 H271                     3
C-200011   3000000493 SFT-001          9.99            15 H275                     3
C-200011   3000000493 SFT-002          9.99            15 H275                     4
C-200011   3000000493 SFT-008          9.99            15 H275                     2

21 rows selected. 

Explanation: You can use the AND in the expression and ON to demand the fields like:
SELECT * 
FROM Table1
INNER JOIN Table2
ON Table1.Key1 = Table2.Key1 AND Table1.Key2 = Table2.Key2 AND Table1.Key3 = Table2.Key3

It is different by taking out the AND clause in between the key2 and key 3

*/

/*
Q8.
*/

Select CUSTORDER.ORDERID, ORDERDATE, CUSTOMER.CUSTOMERID, EMAILADDR, COUNT(CUSTORDER.ORDERID) AS COUNT_ORDER
From CUSTOMER 
INNER JOIN CUSTORDER ON CUSTOMER.CUSTOMERID = CUSTORDER.CUSTOMERID 
INNER JOIN CUSTORDERLINE ON CUSTORDER.ORDERID = CUSTORDERLINE.ORDERID
Where STATE = 'WY' AND (EMAILADDR LIKE '%comcast.net' OR EMAILADDR is NULL)
Group by CUSTORDER.ORDERID, ORDERDATE, CUSTOMER.CUSTOMERID, EMAILADDR;


/*
RESULTS: 


ORDERID    ORDERDATE CUSTOMERID EMAILADDR                                          COUNT_ORDER
---------- --------- ---------- -------------------------------------------------- -----------
3000000329 18-NOV-18 I-200120   dlageveen@comcast.net                                        1
3000000486 16-DEC-18 I-200100                                                                3
3000000123 25-AUG-18 I-200120   dlageveen@comcast.net                                        1
3000000437 14-DEC-18 C-200066   closetoheaven@comcast.net                                    2
3000000222 07-OCT-18 I-200100                                                                4
3000000276 31-OCT-18 I-200120   dlageveen@comcast.net                                        3
3001000509 11-JAN-19 C-200066   closetoheaven@comcast.net                                    3
3001000696 28-FEB-19 C-200066   closetoheaven@comcast.net                                    3
3000000275 31-OCT-18 I-200089                                                                1
3001000667 23-FEB-19 I-200120   dlageveen@comcast.net                                        2
3000000270 29-OCT-18 I-200100                                                                3

ORDERID    ORDERDATE CUSTOMERID EMAILADDR                                          COUNT_ORDER
---------- --------- ---------- -------------------------------------------------- -----------
3000000459 15-DEC-18 I-200120   dlageveen@comcast.net                                        1

12 rows selected. 

Explanation: Table aliases are used to avoid ambiguity with respect to columns selected in 
select statements but column alias is used to name a column in a understandable format

*/

/*
Q9.
*/
Set Linesize 200;
Select COMPANYNAME, SUPPLIEDPART.SUPPLIERID, SUPPLIEDPART.CATALOGNUMBER,
PARTNUMBER, UNITCOST, PURCHORDERID, UNITCOST, ORDEREDUNITCOST
From SUPPLIER
INNER JOIN SUPPLIEDPART ON SUPPLIER.SUPPLIERID = SUPPLIEDPART.SUPPLIERID 
INNER JOIN PURCHORDERLINE ON SUPPLIEDPART.SUPPLIERID = PURCHORDERLINE.SUPPLIERID
AND SUPPLIEDPART.CATALOGNUMBER = PURCHORDERLINE.CATALOGNUMBER
Where COMPANYNAME = 'DealsPC';

/*
RESULTS: 


COMPANYNAME                    SUPPLIERID CATALOGNUM PARTNUMBER   UNITCOST PURCHORDER   UNITCOST ORDEREDUNITCOST
------------------------------ ---------- ---------- ---------- ---------- ---------- ---------- ---------------
DealsPC                        AC-450     950-1065   CAB-011        117.85 EE99-001       117.85          210.33
DealsPC                        AC-450     950-3685   KEY-006         175.8 EE99-001        175.8          323.46
DealsPC                        AC-450     950-4252   ADT-001         539.9 EE99-001        539.9         1457.73
DealsPC                        AC-450     950-4490   MEM-003        545.82 EE99-001       545.82          585.84
DealsPC                        AC-450     950-5122   BB-002         1379.9 EE99-001       1379.9         2483.82
DealsPC                        AC-450     950-6879   P-002         4799.44 EE99-001      4799.44         5319.82
DealsPC                        AC-450     950-7951   CF-001          89.95 EE99-001        89.95          242.87

7 rows selected. 

Explanation: More results come out:

ORDERID    ORDERDATE COMPANYNAME                              CELLPHONE    ST
---------- --------- ---------------------------------------- ------------ --
3000000434 13-DEC-18 Greenpart Steet Metal                    307-944-3950 WY
3000000437 14-DEC-18 North Street Church                      307-359-8090 WY
3001000509 11-JAN-19 North Street Church                      307-359-8090 WY
3001000696 28-FEB-19 North Street Church                      307-359-8090 WY
3000000121 25-AUG-18 Greenpart Steet Metal                    307-944-3950 WY
3000000153 07-SEP-18 Rydell High School                       307-892-1477 WY
3000000185 20-SEP-18 Rydell High School                       307-892-1477 WY
3000000216 05-OCT-18 Rydell High School                       307-892-1477 WY
3000000273 31-OCT-18 Greenpart Steet Metal                    307-944-3950 WY
3000000319 16-NOV-18 Greenpart Steet Metal                    307-944-3950 WY
3000000333 19-NOV-18 Greenpart Steet Metal                    307-944-3950 WY

11 rows selected. 


COMPANYNAME                    SUPPLIERID CATALOGNUM PARTNUMBER   UNITCOST PURCHORDER   UNITCOST ORDEREDUNITCOST
------------------------------ ---------- ---------- ---------- ---------- ---------- ---------- ---------------
DealsPC                        AC-450     950-1065   CAB-011        117.85 EE99-001       117.85          210.33
DealsPC                        AC-450     950-3685   KEY-006         175.8 EE99-001        175.8          210.33
DealsPC                        AC-450     950-4252   ADT-001         539.9 EE99-001        539.9          210.33
DealsPC                        AC-450     950-4490   MEM-003        545.82 EE99-001       545.82          210.33
DealsPC                        AC-450     950-5122   BB-002         1379.9 EE99-001       1379.9          210.33
DealsPC                        AC-450     950-6879   P-002         4799.44 EE99-001      4799.44          210.33
DealsPC                        AC-450     950-7951   CF-001          89.95 EE99-001        89.95          210.33
DealsPC                        AC-450     950-1065   CAB-011        117.85 EE99-001       117.85          323.46
DealsPC                        AC-450     950-3685   KEY-006         175.8 EE99-001        175.8          323.46
DealsPC                        AC-450     950-4252   ADT-001         539.9 EE99-001        539.9          323.46
DealsPC                        AC-450     950-4490   MEM-003        545.82 EE99-001       545.82          323.46

COMPANYNAME                    SUPPLIERID CATALOGNUM PARTNUMBER   UNITCOST PURCHORDER   UNITCOST ORDEREDUNITCOST
------------------------------ ---------- ---------- ---------- ---------- ---------- ---------- ---------------
DealsPC                        AC-450     950-5122   BB-002         1379.9 EE99-001       1379.9          323.46
DealsPC                        AC-450     950-6879   P-002         4799.44 EE99-001      4799.44          323.46
DealsPC                        AC-450     950-7951   CF-001          89.95 EE99-001        89.95          323.46
DealsPC                        AC-450     950-1065   CAB-011        117.85 EE99-001       117.85         1457.73
DealsPC                        AC-450     950-3685   KEY-006         175.8 EE99-001        175.8         1457.73
DealsPC                        AC-450     950-4252   ADT-001         539.9 EE99-001        539.9         1457.73
DealsPC                        AC-450     950-4490   MEM-003        545.82 EE99-001       545.82         1457.73
DealsPC                        AC-450     950-5122   BB-002         1379.9 EE99-001       1379.9         1457.73
DealsPC                        AC-450     950-6879   P-002         4799.44 EE99-001      4799.44         1457.73
DealsPC                        AC-450     950-7951   CF-001          89.95 EE99-001        89.95         1457.73
DealsPC                        AC-450     950-1065   CAB-011        117.85 EE99-001       117.85          585.84

COMPANYNAME                    SUPPLIERID CATALOGNUM PARTNUMBER   UNITCOST PURCHORDER   UNITCOST ORDEREDUNITCOST
------------------------------ ---------- ---------- ---------- ---------- ---------- ---------- ---------------
DealsPC                        AC-450     950-3685   KEY-006         175.8 EE99-001        175.8          585.84
DealsPC                        AC-450     950-4252   ADT-001         539.9 EE99-001        539.9          585.84
DealsPC                        AC-450     950-4490   MEM-003        545.82 EE99-001       545.82          585.84
DealsPC                        AC-450     950-5122   BB-002         1379.9 EE99-001       1379.9          585.84
DealsPC                        AC-450     950-6879   P-002         4799.44 EE99-001      4799.44          585.84
DealsPC                        AC-450     950-7951   CF-001          89.95 EE99-001        89.95          585.84
DealsPC                        AC-450     950-1065   CAB-011        117.85 EE99-001       117.85         2483.82
DealsPC                        AC-450     950-3685   KEY-006         175.8 EE99-001        175.8         2483.82
DealsPC                        AC-450     950-4252   ADT-001         539.9 EE99-001        539.9         2483.82
DealsPC                        AC-450     950-4490   MEM-003        545.82 EE99-001       545.82         2483.82
DealsPC                        AC-450     950-5122   BB-002         1379.9 EE99-001       1379.9         2483.82

COMPANYNAME                    SUPPLIERID CATALOGNUM PARTNUMBER   UNITCOST PURCHORDER   UNITCOST ORDEREDUNITCOST
------------------------------ ---------- ---------- ---------- ---------- ---------- ---------- ---------------
DealsPC                        AC-450     950-6879   P-002         4799.44 EE99-001      4799.44         2483.82
DealsPC                        AC-450     950-7951   CF-001          89.95 EE99-001        89.95         2483.82
DealsPC                        AC-450     950-1065   CAB-011        117.85 EE99-001       117.85         5319.82
DealsPC                        AC-450     950-3685   KEY-006         175.8 EE99-001        175.8         5319.82
DealsPC                        AC-450     950-4252   ADT-001         539.9 EE99-001        539.9         5319.82
DealsPC                        AC-450     950-4490   MEM-003        545.82 EE99-001       545.82         5319.82
DealsPC                        AC-450     950-5122   BB-002         1379.9 EE99-001       1379.9         5319.82
DealsPC                        AC-450     950-6879   P-002         4799.44 EE99-001      4799.44         5319.82
DealsPC                        AC-450     950-7951   CF-001          89.95 EE99-001        89.95         5319.82
DealsPC                        AC-450     950-1065   CAB-011        117.85 EE99-001       117.85          242.87
DealsPC                        AC-450     950-3685   KEY-006         175.8 EE99-001        175.8          242.87

COMPANYNAME                    SUPPLIERID CATALOGNUM PARTNUMBER   UNITCOST PURCHORDER   UNITCOST ORDEREDUNITCOST
------------------------------ ---------- ---------- ---------- ---------- ---------- ---------- ---------------
DealsPC                        AC-450     950-4252   ADT-001         539.9 EE99-001        539.9          242.87
DealsPC                        AC-450     950-4490   MEM-003        545.82 EE99-001       545.82          242.87
DealsPC                        AC-450     950-5122   BB-002         1379.9 EE99-001       1379.9          242.87
DealsPC                        AC-450     950-6879   P-002         4799.44 EE99-001      4799.44          242.87
DealsPC                        AC-450     950-7951   CF-001          89.95 EE99-001        89.95          242.87

49 rows selected. 

Since there is not every composite PK attributes, the query ignore the rest of the PK attributes and
loads the results.

*/

/*
Q10.
*/

Select ORDERID, ORDERDATE, COMPANYNAME, CELLPHONE, STATE
From CUSTOMER 
INNER JOIN CUSTORDER ON CUSTOMER.CUSTOMERID = CUSTORDER.CUSTOMERID 
Where SUBSTR(CELLPHONE,1,3) ='307';

/*
RESULTS: 


ORDERID    ORDERDATE COMPANYNAME                              CELLPHONE    ST
---------- --------- ---------------------------------------- ------------ --
3000000434 13-DEC-18 Greenpart Steet Metal                    307-944-3950 WY
3000000437 14-DEC-18 North Street Church                      307-359-8090 WY
3001000509 11-JAN-19 North Street Church                      307-359-8090 WY
3001000696 28-FEB-19 North Street Church                      307-359-8090 WY
3000000121 25-AUG-18 Greenpart Steet Metal                    307-944-3950 WY
3000000153 07-SEP-18 Rydell High School                       307-892-1477 WY
3000000185 20-SEP-18 Rydell High School                       307-892-1477 WY
3000000216 05-OCT-18 Rydell High School                       307-892-1477 WY
3000000273 31-OCT-18 Greenpart Steet Metal                    307-944-3950 WY
3000000319 16-NOV-18 Greenpart Steet Metal                    307-944-3950 WY
3000000333 19-NOV-18 Greenpart Steet Metal                    307-944-3950 WY

11 rows selected. 

Explanation: Because the query did not group by company name but did join by CUSTORDER and CUSTOMER
where the ORDERID and ORDERDATE varies between the where clause, cellphone number "307...". 

*/