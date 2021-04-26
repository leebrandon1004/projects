DESC SHIPMENT

Select SHIPMENTID, ORDERID, SHIPCITY, SHIPPOSTALCODE
    From SHIPMENT
    Where SHIPSTATE = 'HI';
/*
Question 1
SHIPMENTID ORDERID    SHIPCITY             SHIPPOSTAL
---------- ---------- -------------------- ----------
H098       3000000246 Kapaa                96746     
H375       3001000786 Kapaa                96746     
H379       3001000795 Pearl City           96782     
H197       3000000415 Kapaa                96746     
H035       3000000080 Pearl City           96782

In your explanation, define why you would use the DESCRIBE command
Explanation: Because the DESCRIBE commnand describes the result in another table by describing object recursively. This method is needed because the SHIPMENTID, ORDERID, and SHIPPOSTAL are all fixed length and the describe 
method shows the length of each column.
*/

Select DISTINCT INSERVICEDATE 
    From MACHINE;
/*
INSERVICE
---------
20-MAY-16
26-NOV-16
10-FEB-13
23-FEB-16
10-JUN-16
13-JAN-11
24-MAR-13

7 rows selected. 
*/

Select DISTINCT INSERVICEDATE, MAKE
    From MACHINE;

SET LINESIZE 200;
/*
INSERVICE MAKE                     
--------- -------------------------
13-JAN-11 BARCODE SYSTEM           
26-NOV-16 #98577 DEWEL PACK        
10-JUN-16 ADEPT ONE                
10-FEB-13 ADEPT ONE                
23-FEB-16 #98766 PACKAGE           
24-MAR-13 #99234 NEW JERSEY        
20-MAY-16 LINESHAFT CONVEYOR       
24-MAR-13 RFID SYSTEM              

8 rows selected.

In your explanation, explain why you get more rows when adding the Make of the machine. Why do some inservice dates show up more than once now?
Explanation: Because there are multiple machines with the same make and the same goes with the inservice data.
*/
SET LINESIZE 200;
    Select SUPPLIERID, COMPANYNAME, CITY, STATE, EMAILADDR
    From SUPPLIER
    Where CITY= 'Denver' AND STATE= 'CO';

/*
Question 3A
SUPPLIERID COMPANYNAME                    CITY                 ST EMAILADDR                                         
---------- ------------------------------ -------------------- -- --------------------------------------------------
RC-450     Electronics Cafe               Denver               CO thonn@ecafe.com                                   
SE-450     Security Associates            Denver               CO gwendal@securityassoc.com   


*/

Select SUPPLIERID, COMPANYNAME, CITY, STATE, EMAILADDR
    From SUPPLIER
    Where (CITY= 'Denver' OR CITY='Boulder') AND STATE= 'CO';

/*
Question 3B
SUPPLIERID COMPANYNAME                    CITY                 ST EMAILADDR                                         
---------- ------------------------------ -------------------- -- --------------------------------------------------
LU-450     Tech Parts Mart                Boulder              CO almyn@techparts.com                               
RC-450     Electronics Cafe               Denver               CO thonn@ecafe.com                                   
SE-450     Security Associates            Denver               CO gwendal@securityassoc.com 
Explain the difference between using AND and OR in the WHERE clause. 
Explanation: When using the WHERE clause, the AND method shows the intersection between the WHERE clauses in the output and the OR method shows the summation of the two WHERE clauses. 
*/

Select SUPPLIERID, CATALOGNUMBER, UNITCOST, UNITOFMEASURE, (UNITCOST/UNITOFMEASURE) as COST_PER_PIECE
    FROM SUPPLIEDPART
    Where (UNITOFMEASURE Between 40 AND 50) AND ((UNITCOST/UNITOFMEASURE) <=10)
    Order bY UNITCOST;
/* 
SUPPLIERID CATALOGNUM   UNITCOST UNITOFMEASURE COST_PER_PIECE
---------- ---------- ---------- ------------- --------------
MSN-105    350-9206       104.65            45     2.32555556
PA-450     325-2251        107.7            45     2.39333333
EA-103     700-6296        107.7            45     2.39333333
GC-450     200-0121        125.7            45     2.79333333
CA-105     875-9676       126.77            50         2.5354
EA-103     700-2626       167.65            50          3.353
GC-450     200-1149       167.65            45     3.72555556
CA-105     875-5233       175.46            45     3.89911111
LU-450     975-3658        175.8            45     3.90666667
PA-455     150-4568        175.8            45     3.90666667
PA-455     150-1218        175.8            45     3.90666667

SUPPLIERID CATALOGNUM   UNITCOST UNITOFMEASURE COST_PER_PIECE
---------- ---------- ---------- ------------- --------------
CA-105     875-3721       210.65            45     4.68111111
MM-104     900-8700        239.6            50          4.792
LU-450     975-1900        239.6            50          4.792
PA-455     150-2677        239.6            50          4.792
MC-455     625-6302        239.6            50          4.792
LU-450     975-5249        239.6            50          4.792
PP-103     225-4131        239.6            40           5.99

18 rows selected.
Explain how the WHERE clause was constructed
Explanation: The WHERE clause was constructed by setting a range of 40 and 50 and using the sign <=10 for a range setter.

*/

Select EMPLOYEEID, FIRSTNAME || ' ' || LASTNAME AS Empolyee_Name, HOMEPHONE, HIREDATE
    From EMPLOYEE
    Where HIREDATE BETWEEN '01-JAN-2010' AND '31-DEC-2010' OR HIREDATE = NULL;
/*
Question 5 
EMPLOYEEID EMPOLYEE_NAME                        HOMEPHONE    HIREDATE 
---------- ------------------------------------ ------------ ---------
250120     Grayson Nairn                        919-486-6919 04-APR-10
250488     Jamie Osman                          919-486-2519 03-JAN-10
250559     Carmen Romilda                       305-747-8589 03-JAN-10
250700     Charles Jones                        919-774-5552 03-JAN-10
250967     Sandra Daniels                       929-763-4843 25-FEB-10
251166     Harold Sidney                        919-486-0649 25-JUN-10

6 rows selected. 
Explain how to concatenate mutiple columns correctly
Explanation: A || ' ' || is used where ' ' is a space in between two columns that you want to concatenate.
*/

Select SUPPLIERID, CONTACTNAME, EMAILADDR, CITY, STATE
    From SUPPLIER
    WHERE NOT STATE in ('VA', 'NJ', 'CO', 'CA')
    Order by CITY;
/*
Question 6
SUPPLIERID CONTACTNAME          EMAILADDR                                          CITY                 ST
---------- -------------------- -------------------------------------------------- -------------------- --
PP-103     Jennie Fry           Jfry@techtrade.com                                 Alamo                TX
CA-105     Adam Cyr             acyr@itcreate.com                                  Albany               NY
PA-399     Johanna Tighe        jtighe@securesol.com                               Albany               NY
GC-450     Kelli Jones          kjones@techww.com                                  Bonifay              FL
JLI-450    Wade Holle           Wade@serverstore.com                               Carson City          NV
MM-103     David Becker         BeckerDavid@monsterparts.com                       Charleston           SC
CA-103     Timothy Neal         tneal@compcom.com                                  Charlotte            NC
SE-455     Robert Case          rcase@cybertech.com                                Cinncinati           OH
MM-104     Jamie Pickett        jpickett@compsurplus.com                           Cinncinati           OH
MY-450     Lance Andrews        LanceA@tabletrep.com                               Dallas               TX
SW-450     Yauleng Depoe        ydepoe@powsmart.com                                Detroit              MI

SUPPLIERID CONTACTNAME          EMAILADDR                                          CITY                 ST
---------- -------------------- -------------------------------------------------- -------------------- --
WE-450     Brenda Pritchett     bpritchett@compsurplus.com                         Dover                DE
PA-450     Darlene Jenkins      DarJen@beachaudio.com                              Fort Sutton          FL
DCI-450    Debra Cruz           Debra@powadapt.com                                 Fort Wayne           IN
OI-450     Pam Krick            pkrick@beachaudio.com                              Groton               CT
NN-455     Tim White            twhite@qwcomp.com                                  Lansing              MI
LL-455     Elizabeth Clark      eclark@limitcomp.com                               New York City        NY
MSN-105    Donald Blythe        Dblythe@compmedic.com                              Phoenix              AZ
EA-103     Loraine Platt        LoraineP@targetpc.com                              Phoenix              AZ
PA-384     Todd Wolfe           twolfe@cybersaver.com                              Phoenix              AZ
AM-450     Rob Thomas           rthomas@compclub.com                               Pittsburg            PA
MC-455     Gordon Mayes         Gordon@discountprint.com                           Portland             ME

SUPPLIERID CONTACTNAME          EMAILADDR                                          CITY                 ST
---------- -------------------- -------------------------------------------------- -------------------- --
C-455      Sandy Goodman        Sgoodman@compzone.com                              Rexburg              ID
NA-450     Gary Mikels          GaryMikels@cablekit.com                            Santa Fe             NM
PA-385     Julie Evans          jevans@weartech.com                                Springfield          MO
CF-450     Paul Smith           psmith@nw.com                                      Whales               NC
CV-104     Kevin Martin         kmartin@refurbnet.com                              Yale                 KY

27 rows selected.
Explain the use of NOT IN and the benefit of using it
Explanation: NOT IN is used when you want to exclude variables in a column and it is beneficial when you want to exculde few data in a large database.
*/

Select EMAILADDR, COMPANYNAME, CONTACTNAME, STATE
    From SUPPLIER
    Where COMPANYNAME LIKE '%Tech%' OR STATE = 'VA';
/*
Question 7
EMAILADDR                                          COMPANYNAME                    CONTACTNAME          ST
-------------------------------------------------- ------------------------------ -------------------- --
jevans@weartech.com                                Wearable Techies               Julie Evans          MO
kjones@techww.com                                  Tech WorldWide                 Kelli Jones          FL
almyn@techparts.com                                Tech Parts Mart                Alice Mynhier        CO
DarJen@beachaudio.com                              xByte Tech                     Darlene Jenkins      FL
Jfry@techtrade.com                                 Tech Traders                   Jennie Fry           TX
sbird@infosec.com                                  Information Security           Stephen Bird         VA
rcase@cybertech.com                                Cyber Tech                     Robert Case          OH

7 rows selected. 
Explain how to use LIKE
Explanation: The LIKE phrase is used when finding a specific word in a column without restrictions but just the word. 
*/

Select PARTNUMBER, CATEGORYID, WEIGHT, STOCKLEVEL, REORDERLEVEL
    From INVENTORYPART
    Where (CATEGORYID  = 'SFTW' OR CATEGORYID = 'HOME') AND STOCKLEVEL < REORDERLEVEL;

/*
PARTNUMBER CATEGORYID     WEIGHT STOCKLEVEL REORDERLEVEL
---------- ---------- ---------- ---------- ------------
SFT-003    SFTW              .25         19           20
SFT-007    SFTW            1.375         16           20
CS-001     HOME             2.75          4            5
CS-002     HOME            10.75          4            5
CS-003     HOME             1.75          4            5
Explain how the WHERE clause was constructed
Explanation: The WHERE clause was constructed as stating where SFTW and HOME and where STOCKLEVEL is smaller than REORDERLEVEL
*/

Select ORDERID, UNITPRICE, ORDERQUANTITY, DISCOUNT, (UNITPRICE * ORDERQUANTITY) as TOTAL
    FROM CUSTORDERLINE
    Where UNITPRICE > 2000
    Order by (UNITPRICE*ORDERQUANTITY);
/*
ORDERID     UNITPRICE ORDERQUANTITY   DISCOUNT      TOTAL
---------- ---------- ------------- ---------- ----------
3000000209    2202.09             1          5    2202.09
3001000570    2202.09             1          0    2202.09
3000000354    2202.09             1          0    2202.09
3001000754    2202.09             1          0    2202.09
3001000689    2202.09             1          0    2202.09
3000000028    2202.09             1          0    2202.09
3001000535    2202.09             1          0    2202.09
3000000387    2202.09             1          0    2202.09
3000000480    2202.09             6         10   13212.54
3000000351    2202.09             6         10   13212.54
3000000224    2202.09            16         10   35233.44

ORDERID     UNITPRICE ORDERQUANTITY   DISCOUNT      TOTAL
---------- ---------- ------------- ---------- ----------
3001000784    2202.09            20         10    44041.8

12 rows selected. 
Explain use of calulated fields in the Select clause.
Explanation: In the SELECT clause, the multiplication of UNITPRICE and ORDERQUANTITY and naming it as TOTAL
*/






