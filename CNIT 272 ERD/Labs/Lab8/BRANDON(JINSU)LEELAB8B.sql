/*
Brandon (Jin Su) Lee
CNIT 27200 Spring 2020
Lab Time: Online
Duration: 1:50 MIN
******************************************************
Question 1
*/
create table Jennifer
(   CustomerID char(10),
    CompanyName varchar2(20),
    Address varchar2(20),
    City varchar2(20),
    State varchar2(20),
    PostalCode varchar2(20),
    Email varchar2(20)
    );

insert into Jennifer (Companyname, address, city, state, postalcode, email)
    values ('York Ballet School', '492 Harold Blvd', 'York', 'PA', '17401', 'jkballet@gmail.com');
        
select CustomerID, companyname, address, city, state, postalcode, email
from Jennifer;

COMMIT;
  
/* Results:
CUSTOMERID COMPANYNAME          ADDRESS              CITY                 STATE                POSTALCODE           EMAIL               
---------- -------------------- -------------------- -------------------- -------------------- -------------------- --------------------
           York Ballet School   492 Harold Blvd      York                 PA                   17401                jkballet@gmail.com  


Explanation: To show that how the result of the query changed before and after by adding the 
changes. 

*/
/*
******************************************************
Question 2
*/
insert into Supplier (SupplierID, CompanyName, ContactName, ContactTitle, Address, City, State,
PostalCode, Phone, Cellphone, emailaddr)
    values ('SE-203', 'Brandon', 'Brandon', 'Brand', 'Brandon','Brandon','BR',
    'Brandon','Brandon','Brandon','Brandon');

insert into Supplier (SupplierID, CompanyName, ContactName, ContactTitle, Address, City, State,
PostalCode, Phone, Cellphone, emailaddr)
    values ('SE-204', 'Lee', 'Lee', 'Lee', 'Lee','Lee','BL',
    'Lee','Lee','Lee','Lee');
    
Select *
from Supplier
where supplierid IN ('SE-203' , 'SE-204');

select count(*)
from supplier;

COMMIT;

/* Results:
1 row inserted.

1 row inserted.

SUPPLIERID COMPANYNAME                    CONTACTNAME          CONTA ADDRESS                                  CITY                 ST POSTALCODE PHONE        CELLPHONE    EMAILADDR                                         
---------- ------------------------------ -------------------- ----- ---------------------------------------- -------------------- -- ---------- ------------ ------------ --------------------------------------------------
SE-203     Brandon                        Brandon              Brand Brandon                                  Brandon              BR Brandon    Brandon      Brandon      Brandon                                           
SE-204     Lee                            Lee                  Lee   Lee                                      Lee                  BL Lee        Lee          Lee          Lee                                               


  COUNT(*)
----------
        36


Commit complete.

Explanation: Because the supplier ID is the primary key in this situation so the two suplier IDs must
unique. If it is the same, it violates the primary key rule. 

*/
/*
******************************************************
Question 3
*/
select count(*)
from inventorypart
group by categoryid;

update inventorypart
    set categoryid = 'HOME'
    where categoryid = 'POW';

select count(*)
from inventorypart
group by categoryid;

Rollback;

select count(*)
from inventorypart
group by categoryid;

update inventorypart
    set categoryid = 'HOME'
    where categoryid = 'POW';
    
COMMIT;

delete from inventorypart
where categoryid = 'POW';

COMMIT;

/* Results:

  COUNT(*)
----------
        32
        19
         3
        36
         3
        44
        19
        29
         5
         8
         9

11 rows selected. 

3 rows updated.

  COUNT(*)
----------
        32
        19
        36
         6
        44
        19
        29
         5
         8
         9

10 rows selected. 


Rollback complete.

  COUNT(*)
----------
        32
        19
         3
        36
         3
        44
        19
        29
         5
         8
         9

11 rows selected. 

3 rows updated.

Commit complete.

0 rows deleted.

Commit complete.

Explanation: COMMIT permanantely fixes the query statements on the database since the last
commit or rollback and rollback reverses all changes in the data base since the last 
commit or rollback.
*/
/*
******************************************************
Question 4
*/
insert into suppliedpart (supplierid, catalognumber, partnumber)
    values ('SE-203', '400-5109', 'ADT-004');
    
insert into suppliedpart (supplierid, catalognumber, partnumber)
    values ('SE-203', '400-6148', 'ADT-005');

select suppliedpart.supplierid, companyname, suppliedpart.partnumber, 
catalognumber, unitcost, stockprice
from ((suppliedpart
inner join supplier on suppliedpart.supplierid = supplier.supplierid)
inner join inventorypart on suppliedpart.partnumber = inventorypart.partnumber);

COMMIT;
/* Results:
1 row inserted.

1 row inserted.


SUPPLIERID COMPANYNAME                    PARTNUMBER CATALOGNUM   UNITCOST STOCKPRICE
---------- ------------------------------ ---------- ---------- ---------- ----------
AC-450     DealsPC                        CAB-011    950-1065       117.85       6.79
AC-450     DealsPC                        KEY-006    950-3685        175.8      17.97
AC-450     DealsPC                        ADT-001    950-4252        539.9      55.99
AC-450     DealsPC                        CF-001     950-7951        89.95      17.99
AC-450     DealsPC                        BB-002     950-5122       1379.9    1717.99
AC-450     DealsPC                        P-002      950-6879      4799.44     239.99
AC-450     DealsPC                        MEM-003    950-4490       545.82      29.99
C-455      Computer Zone                  PS-003     750-8009       258.44      71.77
C-455      Computer Zone                  POW-002    750-8451        23.44       1.19
C-455      Computer Zone                  POW-001    750-5081        65.55       4.17
C-455      Computer Zone                  PS-002     750-8008       155.56      53.97

SUPPLIERID COMPANYNAME                    PARTNUMBER CATALOGNUM   UNITCOST STOCKPRICE
---------- ------------------------------ ---------- ---------- ---------- ----------
C-455      Computer Zone                  ADT-004    750-5452       715.44      22.99
CA-103     CompCom                        MEM-010    400-1364       360.44      17.99
CA-103     CompCom                        MIC-001    400-4378      1049.25      41.97
CA-103     CompCom                        CF-003     400-6418        120.7      11.97
CA-103     CompCom                        POW-003    400-8163        23.44       1.19
CA-103     CompCom                        KEY-007    400-5109       115.86      14.97
CA-105     IT Creations                   CAB-028    875-9792       269.85      15.99
CA-105     IT Creations                   CAB-018    875-9676       126.77      24.59
CA-105     IT Creations                   ICAB-004   875-8000       239.46      11.99
CA-105     IT Creations                   CAB-016    875-7063        62.85      14.19
CA-105     IT Creations                   CAB-013    875-5233       175.46       5.99

SUPPLIERID COMPANYNAME                    PARTNUMBER CATALOGNUM   UNITCOST STOCKPRICE
---------- ------------------------------ ---------- ---------- ---------- ----------
CA-105     IT Creations                   CAB-014    875-3721       210.65      20.99
CA-105     IT Creations                   CAB-004    875-2327       194.75       8.79
CA-105     IT Creations                   CAB-020    875-1121       239.44       7.99
CA-105     IT Creations                   CAB-001    875-1086       554.44      25.99
CA-105     IT Creations                   CAB-025    875-0112       449.85      31.99
CA-105     IT Creations                   ICAB-002   875-8200       625.46      20.99
CCS-106    Computer Visions               MEM-009    450-5082       431.94      51.99
CCS-106    Computer Visions               CF-007     450-4784        71.88       5.99
CCS-106    Computer Visions               P-008      450-1872      1799.85     119.99
CCS-106    Computer Visions               KEY-003    450-3301       235.86      29.97
CCS-106    Computer Visions               SP-003     450-3086       335.76      41.97

SUPPLIERID COMPANYNAME                    PARTNUMBER CATALOGNUM   UNITCOST STOCKPRICE
---------- ------------------------------ ---------- ---------- ---------- ----------
CF-450     Net Works                      BB-001     425-7588       622.95     725.99
CF-450     Net Works                      ADT-003    425-6287       225.85      42.99
CF-450     Net Works                      KEY-004    425-3265       322.64      29.97
CF-450     Net Works                      CF-009     425-2413        49.49       3.57
CF-450     Net Works                      MIC-007    425-3488       449.25      17.97
CV-104     RefurbNet                      CRD-008    600-2931       322.85      23.99
CV-104     RefurbNet                      CRD-007    600-3338       479.46      23.99
CV-104     RefurbNet                      CRD-001    600-3645       3229.6      89.99
CV-104     RefurbNet                      CRD-005    600-2257      1022.65      29.99
DCI-450    Power Adapter Shop             ICAB-005   275-0854       224.75       8.99
DCI-450    Power Adapter Shop             MOD-005    275-3559        239.9      53.99

SUPPLIERID COMPANYNAME                    PARTNUMBER CATALOGNUM   UNITCOST STOCKPRICE
---------- ------------------------------ ---------- ---------- ---------- ----------
DCI-450    Power Adapter Shop             MOD-001    275-2998       233.97       7.99
EA-103     TargetPC                       BRK-007    700-0252        72.46       3.59
EA-103     TargetPC                       CAB-017    700-0684       104.75      12.19
EA-103     TargetPC                       PRT-004    700-2006        179.4      179.4
EA-103     TargetPC                       KEY-002    700-2547       355.46      35.99
EA-103     TargetPC                       ICAB-006   700-2626       167.65       4.79
EA-103     TargetPC                       DVD-002    700-7497      1727.82      95.99
EA-103     TargetPC                       MEM-005    700-2800      1619.85      47.99
EA-103     TargetPC                       KEY-008    700-3644       107.88       8.99
EA-103     TargetPC                       SP-002     700-3849       577.64      47.97
EA-103     TargetPC                       BRK-011    700-6296        107.7       3.59

SUPPLIERID COMPANYNAME                    PARTNUMBER CATALOGNUM   UNITCOST STOCKPRICE
---------- ------------------------------ ---------- ---------- ---------- ----------
EA-103     TargetPC                       CAB-024    700-6920        622.8      29.99
EA-103     TargetPC                       MIC-006    700-2635       535.46      17.99
GC-450     Tech WorldWide                 P-010      100-1308      2699.85     179.99
GC-450     Tech WorldWide                 MEM-007    100-2370      1511.82      63.99
GC-450     Tech WorldWide                 MOM-001    100-2758       1797.7      59.93
GC-450     Tech WorldWide                 ADT-002    100-2911        480.8      63.99
GC-450     Tech WorldWide                 MIC-002    100-3164       494.55      32.97
GC-450     Tech WorldWide                 CF-004     100-4732        22.85      11.97
GC-450     Tech WorldWide                 PS-002     200-6483        45.17      53.97
GC-450     Tech WorldWide                 BRK-004    200-1149       167.65      62.79
GC-450     Tech WorldWide                 PRT-002    200-3926        299.4      299.4

SUPPLIERID COMPANYNAME                    PARTNUMBER CATALOGNUM   UNITCOST STOCKPRICE
---------- ------------------------------ ---------- ---------- ---------- ----------
GC-450     Tech WorldWide                 CAB-015    200-5382        107.8      22.39
GC-450     Tech WorldWide                 PS-001     200-6482       719.64      59.97
GC-450     Tech WorldWide                 MIC-011    200-6640       155.55       8.97
GC-450     Tech WorldWide                 BRK-005    200-0121        125.7      18.99
JLI-450    Server Store                   MOM-002    500-3143      3322.65      95.99
JLI-450    Server Store                   ICAB-001   500-3176       322.85      23.99
JLI-450    Server Store                   CAB-006    500-8441        89.85       5.99
JLI-450    Server Store                   CAB-010    500-4865         72.8       4.59
JLI-450    Server Store                   ICAB-008   500-3900         22.8       2.99
LL-455     Limited Comp                   BB-004     375-0795       1099.9     457.99
LL-455     Limited Comp                   ICAB-003   375-1400       224.85      14.99

SUPPLIERID COMPANYNAME                    PARTNUMBER CATALOGNUM   UNITCOST STOCKPRICE
---------- ------------------------------ ---------- ---------- ---------- ----------
LL-455     Limited Comp                   P-004      375-2475       8275.8     275.99
LL-455     Limited Comp                   BB-005     375-2846       2639.8     211.99
LL-455     Limited Comp                   CF-005     375-3209        53.82       8.97
LL-455     Limited Comp                   MIC-012    375-3500         75.8       7.79
LL-455     Limited Comp                   SP-001     375-3877        480.7      47.97
LL-455     Limited Comp                   BRK-006    375-6212        80.55      11.79
LL-455     Limited Comp                   CD-002     375-4660       179.94      29.99
LU-450     Tech Parts Mart                SFT-008    975-1900        239.6       5.99
LU-450     Tech Parts Mart                SFT-002    975-3131        119.8       5.99
LU-450     Tech Parts Mart                SFT-004    975-3658        175.8       5.99
LU-450     Tech Parts Mart                SFT-001    975-3166        117.8       5.99

SUPPLIERID COMPANYNAME                    PARTNUMBER CATALOGNUM   UNITCOST STOCKPRICE
---------- ------------------------------ ---------- ---------- ---------- ----------
LU-450     Tech Parts Mart                SFT-007    975-5249        239.6       5.99
MC-455     Discount Print                 MEM-006    625-0668        960.9      95.99
MC-455     Discount Print                 PS-004     625-2469       287.76      35.97
MC-455     Discount Print                 ICAB-007   625-9450        53.75       3.59
MC-455     Discount Print                 MIC-004    625-8316        235.8      23.97
MC-455     Discount Print                 MIC-008    625-7273        619.5      17.75
MC-455     Discount Print                 CF-008     625-2767        89.55       5.97
MC-455     Discount Print                 MEM-002    625-3060        839.8      41.99
MC-455     Discount Print                 BB-003     625-4520      2069.85     317.99
MC-455     Discount Print                 MOM-003    625-4701       1655.8      83.99
MC-455     Discount Print                 MEM-012    625-5458      1435.86      99.99

SUPPLIERID COMPANYNAME                    PARTNUMBER CATALOGNUM   UNITCOST STOCKPRICE
---------- ------------------------------ ---------- ---------- ---------- ----------
MC-455     Discount Print                 P-005      625-6136       7195.8     239.99
MC-455     Discount Print                 BRK-003    625-6302        239.6       5.99
MM-103     Monster Parts                  CAB-007    800-5899         45.8       2.79
MM-103     Monster Parts                  MOD-002    800-2119       215.96      53.99
MM-103     Monster Parts                  CAB-008    800-7540         83.8       5.19
MM-103     Monster Parts                  MOD-004    800-9473       149.95      49.99
MM-104     Computer Surplus               CAB-027    900-4824       805.85      25.99
MM-104     Computer Surplus               BRK-002    900-8700        239.6       5.99
MM-104     Computer Surplus               C-003      900-8260        415.8      40.97
MM-104     Computer Surplus               MIC-009    900-7095        239.4      11.97
MM-104     Computer Surplus               CRD-004    900-6303       1075.8      35.99

SUPPLIERID COMPANYNAME                    PARTNUMBER CATALOGNUM   UNITCOST STOCKPRICE
---------- ------------------------------ ---------- ---------- ---------- ----------
MM-104     Computer Surplus               CRD-009    900-6242      1799.85     119.99
MM-104     Computer Surplus               P-009      900-6198      2429.85     161.99
MM-104     Computer Surplus               BRK-009    900-6111        85.85       3.59
MSN-105    Computer Medic                 DVD-001    350-4362       1199.9     119.99
MSN-105    Computer Medic                 BRK-010    350-9206       104.65       2.99
MSN-105    Computer Medic                 PS-002     305-0815        535.8      53.97
MSN-105    Computer Medic                 MIC-010    350-1756       134.85       8.99
MY-450     Tablet Repair                  CAB-002    300-2466       554.75      21.19
MY-450     Tablet Repair                  MON-001    300-2829        322.4       99.4
MY-450     Tablet Repair                  MON-008    300-9006        83.99      83.99
MY-450     Tablet Repair                  MON-004    300-3181       165.89     167.99

SUPPLIERID COMPANYNAME                    PARTNUMBER CATALOGNUM   UNITCOST STOCKPRICE
---------- ------------------------------ ---------- ---------- ---------- ----------
MY-450     Tablet Repair                  CAB-005    300-5441        119.8       5.99
MY-450     Tablet Repair                  MON-005    300-3162       149.49     149.99
NA-450     Cables and Kits                PRT-003    250-1642        419.4      419.4
NA-450     Cables and Kits                MOD-003    250-5970       125.97     121.99
NA-450     Cables and Kits                ADT-006    250-8450       269.85      18.99
NN-455     Qwerty Comp                    BRK-008    650-6888         71.8       3.59
NN-455     Qwerty Comp                    CAB-026    650-7156       745.85      31.99
OI-450     Beach Audio                    MON-003    175-2503        179.4       79.4
OI-450     Beach Audio                    MON-007    175-3675       105.89     107.99
OI-450     Beach Audio                    MON-006    175-9506        95.99      95.99
OI-450     Beach Audio                    MON-002    175-9470       239.46      139.4

SUPPLIERID COMPANYNAME                    PARTNUMBER CATALOGNUM   UNITCOST STOCKPRICE
---------- ------------------------------ ---------- ---------- ---------- ----------
OI-450     Beach Audio                    CD-003     175-5737      2303.88     171.99
PA-384     Cyber Saver                    PS-001     676-9001       167.22      59.97
PA-384     Cyber Saver                    PS-002     676-9002       285.56      53.97
PA-384     Cyber Saver                    PS-003     676-9003       203.88      71.77
PA-450     xByte Tech                     CAB-022    325-3891       145.85       6.99
PA-450     xByte Tech                     CAB-023    325-2251        107.7       3.59
PA-450     xByte Tech                     CAB-019    325-9617        535.8       7.99
PA-450     xByte Tech                     PRT-006    325-8002         22.4       59.4
PA-450     xByte Tech                     PRT-001    325-4667        239.4      239.4
PA-450     xByte Tech                     PRT-005    325-5811         89.4       89.4
PA-455     Toner Recyclers                SFT-005    150-4568        175.8       5.99

SUPPLIERID COMPANYNAME                    PARTNUMBER CATALOGNUM   UNITCOST STOCKPRICE
---------- ------------------------------ ---------- ---------- ---------- ----------
PA-455     Toner Recyclers                SFT-003    150-2677        239.6       5.99
PA-455     Toner Recyclers                SFT-009    150-2210        22.95       5.99
PA-455     Toner Recyclers                SFT-006    150-1218        175.8       5.99
PP-103     Tech Traders                   CAB-003    225-6102        467.7      14.59
PP-103     Tech Traders                   C-002      225-6546       922.45      42.97
PP-103     Tech Traders                   CAB-021    225-0155        179.8       5.99
PP-103     Tech Traders                   MIC-003    225-2758        229.4      29.97
PP-103     Tech Traders                   CAB-009    225-3272         71.8       4.59
PP-103     Tech Traders                   KEY-005    225-3427        71.96      17.99
PP-103     Tech Traders                   MIC-005    225-7278        539.1      17.97
PP-103     Tech Traders                   BRK-001    225-4131        239.6       5.99

SUPPLIERID COMPANYNAME                    PARTNUMBER CATALOGNUM   UNITCOST STOCKPRICE
---------- ------------------------------ ---------- ---------- ---------- ----------
PP-103     Tech Traders                   CRD-002    225-4497       1919.6      47.99
PP-103     Tech Traders                   CRD-006    225-5829       745.85      29.99
PP-103     Tech Traders                   P-006      225-5281       6115.8     203.99
PP-103     Tech Traders                   MOM-004    225-7931      1545.85      65.99
PP-103     Tech Traders                   C-001      225-3992      1079.55      70.97
RC-450     Electronics Cafe               KEY-009    875-4749       117.88       8.99
RC-450     Electronics Cafe               CRD-003    875-0214       2399.6      59.99
RC-450     Electronics Cafe               P-001      875-6392       4199.8     209.99
RC-450     Electronics Cafe               ADT-005    875-9569        322.8      16.99
RC-450     Electronics Cafe               CF-002     875-9611        119.9      11.99
SE-203     Brandon                        ADT-004    400-5109                   22.99

SUPPLIERID COMPANYNAME                    PARTNUMBER CATALOGNUM   UNITCOST STOCKPRICE
---------- ------------------------------ ---------- ---------- ---------- ----------
SE-203     Brandon                        ADT-005    400-6148                   16.99
SS-455     Information Security           CD-001     550-23104      115.94      33.99
SS-455     Information Security           CD-004     550-2602      1245.82     153.99
SS-455     Information Security           MEM-008    550-3435        679.9      77.99
SS-455     Information Security           MEM-004    550-4737      1943.88     161.99
SS-455     Information Security           MEM-011    550-5782       269.85      12.99
SS-455     Information Security           MEM-001    550-9888      2339.55     155.97
SW-450     Power Smart                    SCN-002    775-3712        149.4      149.4
SW-450     Power Smart                    SCN-001    775-6528         67.4       77.4
SW-450     Power Smart                    SCN-003    775-8926        239.4      239.4
WE-450     Computer Surplus               P-003      525-0254       5122.8     257.99

SUPPLIERID COMPANYNAME                    PARTNUMBER CATALOGNUM   UNITCOST STOCKPRICE
---------- ------------------------------ ---------- ---------- ---------- ----------
WE-450     Computer Surplus               P-007      525-0683      2211.85     460.79
WE-450     Computer Surplus               KEY-001    525-2901       251.82      41.97
WE-450     Computer Surplus               ADT-007    525-4314        535.8      74.99
WE-450     Computer Surplus               CAB-012    525-6339       184.75      10.79
WE-450     Computer Surplus               CF-006     525-6527        62.16       7.77

181 rows selected. 


Commit complete.

Explanation: This could be done by doing an outer join with the three tables. 
*/
/*
******************************************************
Question 5
*/
select count(*)
from Timecardline;

select employeeid, hiredate, salarywage, type
from employee
where salarywage < 18 AND type = 'Temporary';

insert into timecardline
    select employeeid, 
    from employee
    where salarywage < 18 AND type = 'Temporary';
    

/* Results:
  COUNT(*)
----------
         0

EMPLOYEEID HIREDATE  SALARYWAGE TYPE      
---------- --------- ---------- ----------
250220     11-NOV-04         17 Temporary 
250967     25-FEB-10       17.5 Temporary 
251045     06-JUN-04       17.5 Temporary 
251115     17-DEC-13       17.5 Temporary 
251166     25-JUN-10       17.5 Temporary 
251167     25-JAN-17       16.5 Temporary 

6 rows selected. 

Explanation:  The difference is that tochar is used to convert the given data into character
and todate is to convert the given data into the provided data type. 
*/
/*
******************************************************
Question 6
*/
select supplierid, catalognumber, partnumber, unitcost
from suppliedpart;

update suppliedpart
set unitcost = unitcost * 1.1
where supplierid = 'DCI-450';

select supplierid, catalognumber, partnumber, unitcost
from suppliedpart;

COMMIT;

/* Results:

SUPPLIERID CATALOGNUM PARTNUMBER   UNITCOST
---------- ---------- ---------- ----------
SE-203     400-5109   ADT-004              
SE-203     400-6148   ADT-005              
AC-450     950-1065   CAB-011        117.85
AC-450     950-3685   KEY-006         175.8
AC-450     950-4252   ADT-001         539.9
AC-450     950-4490   MEM-003        545.82
AC-450     950-5122   BB-002         1379.9
AC-450     950-6879   P-002         4799.44
AC-450     950-7951   CF-001          89.95
C-455      750-5081   POW-001         65.55
C-455      750-5452   ADT-004        715.44

SUPPLIERID CATALOGNUM PARTNUMBER   UNITCOST
---------- ---------- ---------- ----------
C-455      750-8009   PS-003         258.44
C-455      750-8451   POW-002         23.44
CA-103     400-1364   MEM-010        360.44
CA-103     400-4378   MIC-001       1049.25
CA-103     400-5109   KEY-007        115.86
CA-103     400-6418   CF-003          120.7
CA-103     400-8163   POW-003         23.44
CA-105     875-0112   CAB-025        449.85
CA-105     875-1086   CAB-001        554.44
CA-105     875-1121   CAB-020        239.44
CA-105     875-2327   CAB-004        194.75

SUPPLIERID CATALOGNUM PARTNUMBER   UNITCOST
---------- ---------- ---------- ----------
CA-105     875-3721   CAB-014        210.65
CA-105     875-5233   CAB-013        175.46
CA-105     875-7063   CAB-016         62.85
CA-105     875-8000   ICAB-004       239.46
CA-105     875-8200   ICAB-002       625.46
CA-105     875-9676   CAB-018        126.77
CA-105     875-9792   CAB-028        269.85
CCS-106    450-1872   P-008         1799.85
CCS-106    450-3086   SP-003         335.76
CCS-106    450-3301   KEY-003        235.86
CCS-106    450-4784   CF-007          71.88

SUPPLIERID CATALOGNUM PARTNUMBER   UNITCOST
---------- ---------- ---------- ----------
CCS-106    450-5082   MEM-009        431.94
CF-450     425-2413   CF-009          49.49
CF-450     425-3265   KEY-004        322.64
CF-450     425-3488   MIC-007        449.25
CF-450     425-6287   ADT-003        225.85
CF-450     425-7588   BB-001         622.95
CV-104     600-2257   CRD-005       1022.65
CV-104     600-2931   CRD-008        322.85
CV-104     600-3338   CRD-007        479.46
CV-104     600-3645   CRD-001        3229.6
DCI-450    275-0854   ICAB-005       224.75

SUPPLIERID CATALOGNUM PARTNUMBER   UNITCOST
---------- ---------- ---------- ----------
DCI-450    275-2998   MOD-001        233.97
DCI-450    275-3559   MOD-005         239.9
EA-103     700-0252   BRK-007         72.46
EA-103     700-0684   CAB-017        104.75
EA-103     700-2006   PRT-004         179.4
EA-103     700-2547   KEY-002        355.46
EA-103     700-2626   ICAB-006       167.65
EA-103     700-2635   MIC-006        535.46
EA-103     700-2800   MEM-005       1619.85
EA-103     700-3644   KEY-008        107.88
EA-103     700-3849   SP-002         577.64

SUPPLIERID CATALOGNUM PARTNUMBER   UNITCOST
---------- ---------- ---------- ----------
EA-103     700-6296   BRK-011         107.7
EA-103     700-6920   CAB-024         622.8
EA-103     700-7497   DVD-002       1727.82
GC-450     100-1308   P-010         2699.85
GC-450     100-2370   MEM-007       1511.82
GC-450     100-2758   MOM-001        1797.7
GC-450     100-2911   ADT-002         480.8
GC-450     100-3164   MIC-002        494.55
GC-450     100-4732   CF-004          22.85
GC-450     200-0121   BRK-005         125.7
GC-450     200-1149   BRK-004        167.65

SUPPLIERID CATALOGNUM PARTNUMBER   UNITCOST
---------- ---------- ---------- ----------
GC-450     200-3926   PRT-002         299.4
GC-450     200-5382   CAB-015         107.8
GC-450     200-6482   PS-001         719.64
GC-450     200-6640   MIC-011        155.55
JLI-450    500-3143   MOM-002       3322.65
JLI-450    500-3176   ICAB-001       322.85
JLI-450    500-3900   ICAB-008         22.8
JLI-450    500-4865   CAB-010          72.8
JLI-450    500-8441   CAB-006         89.85
LL-455     375-0795   BB-004         1099.9
LL-455     375-1400   ICAB-003       224.85

SUPPLIERID CATALOGNUM PARTNUMBER   UNITCOST
---------- ---------- ---------- ----------
LL-455     375-2475   P-004          8275.8
LL-455     375-2846   BB-005         2639.8
LL-455     375-3209   CF-005          53.82
LL-455     375-3500   MIC-012          75.8
LL-455     375-3877   SP-001          480.7
LL-455     375-4660   CD-002         179.94
LL-455     375-6212   BRK-006         80.55
LU-450     975-1900   SFT-008         239.6
LU-450     975-3131   SFT-002         119.8
LU-450     975-3166   SFT-001         117.8
LU-450     975-3658   SFT-004         175.8

SUPPLIERID CATALOGNUM PARTNUMBER   UNITCOST
---------- ---------- ---------- ----------
LU-450     975-5249   SFT-007         239.6
MC-455     625-0668   MEM-006         960.9
MC-455     625-2469   PS-004         287.76
MC-455     625-2767   CF-008          89.55
MC-455     625-3060   MEM-002         839.8
MC-455     625-4520   BB-003        2069.85
MC-455     625-4701   MOM-003        1655.8
MC-455     625-5458   MEM-012       1435.86
MC-455     625-6136   P-005          7195.8
MC-455     625-6302   BRK-003         239.6
MC-455     625-7273   MIC-008         619.5

SUPPLIERID CATALOGNUM PARTNUMBER   UNITCOST
---------- ---------- ---------- ----------
MC-455     625-8316   MIC-004         235.8
MC-455     625-9450   ICAB-007        53.75
MM-103     800-2119   MOD-002        215.96
MM-103     800-5899   CAB-007          45.8
MM-103     800-7540   CAB-008          83.8
MM-103     800-9473   MOD-004        149.95
MM-104     900-4824   CAB-027        805.85
MM-104     900-6111   BRK-009         85.85
MM-104     900-6198   P-009         2429.85
MM-104     900-6242   CRD-009       1799.85
MM-104     900-6303   CRD-004        1075.8

SUPPLIERID CATALOGNUM PARTNUMBER   UNITCOST
---------- ---------- ---------- ----------
MM-104     900-7095   MIC-009         239.4
MM-104     900-8260   C-003           415.8
MM-104     900-8700   BRK-002         239.6
MSN-105    305-0815   PS-002          535.8
MSN-105    350-1756   MIC-010        134.85
MSN-105    350-4362   DVD-001        1199.9
MSN-105    350-9206   BRK-010        104.65
MY-450     300-2466   CAB-002        554.75
MY-450     300-2829   MON-001         322.4
MY-450     300-3162   MON-005        149.49
MY-450     300-3181   MON-004        165.89

SUPPLIERID CATALOGNUM PARTNUMBER   UNITCOST
---------- ---------- ---------- ----------
MY-450     300-5441   CAB-005         119.8
MY-450     300-9006   MON-008         83.99
NA-450     250-1642   PRT-003         419.4
NA-450     250-5970   MOD-003        125.97
NA-450     250-8450   ADT-006        269.85
NN-455     650-6888   BRK-008          71.8
NN-455     650-7156   CAB-026        745.85
OI-450     175-2503   MON-003         179.4
OI-450     175-3675   MON-007        105.89
OI-450     175-5737   CD-003        2303.88
OI-450     175-9470   MON-002        239.46

SUPPLIERID CATALOGNUM PARTNUMBER   UNITCOST
---------- ---------- ---------- ----------
OI-450     175-9506   MON-006         95.99
PA-450     325-2251   CAB-023         107.7
PA-450     325-3891   CAB-022        145.85
PA-450     325-4667   PRT-001         239.4
PA-450     325-5811   PRT-005          89.4
PA-450     325-8002   PRT-006          22.4
PA-450     325-9617   CAB-019         535.8
PA-455     150-1218   SFT-006         175.8
PA-455     150-2210   SFT-009         22.95
PA-455     150-2677   SFT-003         239.6
PA-455     150-4568   SFT-005         175.8

SUPPLIERID CATALOGNUM PARTNUMBER   UNITCOST
---------- ---------- ---------- ----------
PP-103     225-0155   CAB-021         179.8
PP-103     225-2758   MIC-003         229.4
PP-103     225-3272   CAB-009          71.8
PP-103     225-3427   KEY-005         71.96
PP-103     225-3992   C-001         1079.55
PP-103     225-4131   BRK-001         239.6
PP-103     225-4497   CRD-002        1919.6
PP-103     225-5281   P-006          6115.8
PP-103     225-5829   CRD-006        745.85
PP-103     225-6102   CAB-003         467.7
PP-103     225-6546   C-002          922.45

SUPPLIERID CATALOGNUM PARTNUMBER   UNITCOST
---------- ---------- ---------- ----------
PP-103     225-7278   MIC-005         539.1
PP-103     225-7931   MOM-004       1545.85
RC-450     875-0214   CRD-003        2399.6
RC-450     875-4749   KEY-009        117.88
RC-450     875-6392   P-001          4199.8
RC-450     875-9569   ADT-005         322.8
RC-450     875-9611   CF-002          119.9
SS-455     550-23104  CD-001         115.94
SS-455     550-2602   CD-004        1245.82
SS-455     550-3435   MEM-008         679.9
SS-455     550-4737   MEM-004       1943.88

SUPPLIERID CATALOGNUM PARTNUMBER   UNITCOST
---------- ---------- ---------- ----------
SS-455     550-5782   MEM-011        269.85
SS-455     550-9888   MEM-001       2339.55
SW-450     775-3712   SCN-002         149.4
SW-450     775-6528   SCN-001          67.4
SW-450     775-8926   SCN-003         239.4
WE-450     525-0254   P-003          5122.8
WE-450     525-0683   P-007         2211.85
WE-450     525-2901   KEY-001        251.82
WE-450     525-4314   ADT-007         535.8
WE-450     525-6339   CAB-012        184.75
WE-450     525-6527   CF-006          62.16

SUPPLIERID CATALOGNUM PARTNUMBER   UNITCOST
---------- ---------- ---------- ----------
GC-450     200-6483   PS-002          45.17
C-455      750-8008   PS-002         155.56
PA-384     676-9001   PS-001         167.22
PA-384     676-9002   PS-002         285.56
PA-384     676-9003   PS-003         203.88

181 rows selected. 


3 rows updated.


SUPPLIERID CATALOGNUM PARTNUMBER   UNITCOST
---------- ---------- ---------- ----------
SE-203     400-5109   ADT-004              
SE-203     400-6148   ADT-005              
AC-450     950-1065   CAB-011        117.85
AC-450     950-3685   KEY-006         175.8
AC-450     950-4252   ADT-001         539.9
AC-450     950-4490   MEM-003        545.82
AC-450     950-5122   BB-002         1379.9
AC-450     950-6879   P-002         4799.44
AC-450     950-7951   CF-001          89.95
C-455      750-5081   POW-001         65.55
C-455      750-5452   ADT-004        715.44

SUPPLIERID CATALOGNUM PARTNUMBER   UNITCOST
---------- ---------- ---------- ----------
C-455      750-8009   PS-003         258.44
C-455      750-8451   POW-002         23.44
CA-103     400-1364   MEM-010        360.44
CA-103     400-4378   MIC-001       1049.25
CA-103     400-5109   KEY-007        115.86
CA-103     400-6418   CF-003          120.7
CA-103     400-8163   POW-003         23.44
CA-105     875-0112   CAB-025        449.85
CA-105     875-1086   CAB-001        554.44
CA-105     875-1121   CAB-020        239.44
CA-105     875-2327   CAB-004        194.75

SUPPLIERID CATALOGNUM PARTNUMBER   UNITCOST
---------- ---------- ---------- ----------
CA-105     875-3721   CAB-014        210.65
CA-105     875-5233   CAB-013        175.46
CA-105     875-7063   CAB-016         62.85
CA-105     875-8000   ICAB-004       239.46
CA-105     875-8200   ICAB-002       625.46
CA-105     875-9676   CAB-018        126.77
CA-105     875-9792   CAB-028        269.85
CCS-106    450-1872   P-008         1799.85
CCS-106    450-3086   SP-003         335.76
CCS-106    450-3301   KEY-003        235.86
CCS-106    450-4784   CF-007          71.88

SUPPLIERID CATALOGNUM PARTNUMBER   UNITCOST
---------- ---------- ---------- ----------
CCS-106    450-5082   MEM-009        431.94
CF-450     425-2413   CF-009          49.49
CF-450     425-3265   KEY-004        322.64
CF-450     425-3488   MIC-007        449.25
CF-450     425-6287   ADT-003        225.85
CF-450     425-7588   BB-001         622.95
CV-104     600-2257   CRD-005       1022.65
CV-104     600-2931   CRD-008        322.85
CV-104     600-3338   CRD-007        479.46
CV-104     600-3645   CRD-001        3229.6
DCI-450    275-0854   ICAB-005       247.23

SUPPLIERID CATALOGNUM PARTNUMBER   UNITCOST
---------- ---------- ---------- ----------
DCI-450    275-2998   MOD-001        257.37
DCI-450    275-3559   MOD-005        263.89
EA-103     700-0252   BRK-007         72.46
EA-103     700-0684   CAB-017        104.75
EA-103     700-2006   PRT-004         179.4
EA-103     700-2547   KEY-002        355.46
EA-103     700-2626   ICAB-006       167.65
EA-103     700-2635   MIC-006        535.46
EA-103     700-2800   MEM-005       1619.85
EA-103     700-3644   KEY-008        107.88
EA-103     700-3849   SP-002         577.64

SUPPLIERID CATALOGNUM PARTNUMBER   UNITCOST
---------- ---------- ---------- ----------
EA-103     700-6296   BRK-011         107.7
EA-103     700-6920   CAB-024         622.8
EA-103     700-7497   DVD-002       1727.82
GC-450     100-1308   P-010         2699.85
GC-450     100-2370   MEM-007       1511.82
GC-450     100-2758   MOM-001        1797.7
GC-450     100-2911   ADT-002         480.8
GC-450     100-3164   MIC-002        494.55
GC-450     100-4732   CF-004          22.85
GC-450     200-0121   BRK-005         125.7
GC-450     200-1149   BRK-004        167.65

SUPPLIERID CATALOGNUM PARTNUMBER   UNITCOST
---------- ---------- ---------- ----------
GC-450     200-3926   PRT-002         299.4
GC-450     200-5382   CAB-015         107.8
GC-450     200-6482   PS-001         719.64
GC-450     200-6640   MIC-011        155.55
JLI-450    500-3143   MOM-002       3322.65
JLI-450    500-3176   ICAB-001       322.85
JLI-450    500-3900   ICAB-008         22.8
JLI-450    500-4865   CAB-010          72.8
JLI-450    500-8441   CAB-006         89.85
LL-455     375-0795   BB-004         1099.9
LL-455     375-1400   ICAB-003       224.85

SUPPLIERID CATALOGNUM PARTNUMBER   UNITCOST
---------- ---------- ---------- ----------
LL-455     375-2475   P-004          8275.8
LL-455     375-2846   BB-005         2639.8
LL-455     375-3209   CF-005          53.82
LL-455     375-3500   MIC-012          75.8
LL-455     375-3877   SP-001          480.7
LL-455     375-4660   CD-002         179.94
LL-455     375-6212   BRK-006         80.55
LU-450     975-1900   SFT-008         239.6
LU-450     975-3131   SFT-002         119.8
LU-450     975-3166   SFT-001         117.8
LU-450     975-3658   SFT-004         175.8

SUPPLIERID CATALOGNUM PARTNUMBER   UNITCOST
---------- ---------- ---------- ----------
LU-450     975-5249   SFT-007         239.6
MC-455     625-0668   MEM-006         960.9
MC-455     625-2469   PS-004         287.76
MC-455     625-2767   CF-008          89.55
MC-455     625-3060   MEM-002         839.8
MC-455     625-4520   BB-003        2069.85
MC-455     625-4701   MOM-003        1655.8
MC-455     625-5458   MEM-012       1435.86
MC-455     625-6136   P-005          7195.8
MC-455     625-6302   BRK-003         239.6
MC-455     625-7273   MIC-008         619.5

SUPPLIERID CATALOGNUM PARTNUMBER   UNITCOST
---------- ---------- ---------- ----------
MC-455     625-8316   MIC-004         235.8
MC-455     625-9450   ICAB-007        53.75
MM-103     800-2119   MOD-002        215.96
MM-103     800-5899   CAB-007          45.8
MM-103     800-7540   CAB-008          83.8
MM-103     800-9473   MOD-004        149.95
MM-104     900-4824   CAB-027        805.85
MM-104     900-6111   BRK-009         85.85
MM-104     900-6198   P-009         2429.85
MM-104     900-6242   CRD-009       1799.85
MM-104     900-6303   CRD-004        1075.8

SUPPLIERID CATALOGNUM PARTNUMBER   UNITCOST
---------- ---------- ---------- ----------
MM-104     900-7095   MIC-009         239.4
MM-104     900-8260   C-003           415.8
MM-104     900-8700   BRK-002         239.6
MSN-105    305-0815   PS-002          535.8
MSN-105    350-1756   MIC-010        134.85
MSN-105    350-4362   DVD-001        1199.9
MSN-105    350-9206   BRK-010        104.65
MY-450     300-2466   CAB-002        554.75
MY-450     300-2829   MON-001         322.4
MY-450     300-3162   MON-005        149.49
MY-450     300-3181   MON-004        165.89

SUPPLIERID CATALOGNUM PARTNUMBER   UNITCOST
---------- ---------- ---------- ----------
MY-450     300-5441   CAB-005         119.8
MY-450     300-9006   MON-008         83.99
NA-450     250-1642   PRT-003         419.4
NA-450     250-5970   MOD-003        125.97
NA-450     250-8450   ADT-006        269.85
NN-455     650-6888   BRK-008          71.8
NN-455     650-7156   CAB-026        745.85
OI-450     175-2503   MON-003         179.4
OI-450     175-3675   MON-007        105.89
OI-450     175-5737   CD-003        2303.88
OI-450     175-9470   MON-002        239.46

SUPPLIERID CATALOGNUM PARTNUMBER   UNITCOST
---------- ---------- ---------- ----------
OI-450     175-9506   MON-006         95.99
PA-450     325-2251   CAB-023         107.7
PA-450     325-3891   CAB-022        145.85
PA-450     325-4667   PRT-001         239.4
PA-450     325-5811   PRT-005          89.4
PA-450     325-8002   PRT-006          22.4
PA-450     325-9617   CAB-019         535.8
PA-455     150-1218   SFT-006         175.8
PA-455     150-2210   SFT-009         22.95
PA-455     150-2677   SFT-003         239.6
PA-455     150-4568   SFT-005         175.8

SUPPLIERID CATALOGNUM PARTNUMBER   UNITCOST
---------- ---------- ---------- ----------
PP-103     225-0155   CAB-021         179.8
PP-103     225-2758   MIC-003         229.4
PP-103     225-3272   CAB-009          71.8
PP-103     225-3427   KEY-005         71.96
PP-103     225-3992   C-001         1079.55
PP-103     225-4131   BRK-001         239.6
PP-103     225-4497   CRD-002        1919.6
PP-103     225-5281   P-006          6115.8
PP-103     225-5829   CRD-006        745.85
PP-103     225-6102   CAB-003         467.7
PP-103     225-6546   C-002          922.45

SUPPLIERID CATALOGNUM PARTNUMBER   UNITCOST
---------- ---------- ---------- ----------
PP-103     225-7278   MIC-005         539.1
PP-103     225-7931   MOM-004       1545.85
RC-450     875-0214   CRD-003        2399.6
RC-450     875-4749   KEY-009        117.88
RC-450     875-6392   P-001          4199.8
RC-450     875-9569   ADT-005         322.8
RC-450     875-9611   CF-002          119.9
SS-455     550-23104  CD-001         115.94
SS-455     550-2602   CD-004        1245.82
SS-455     550-3435   MEM-008         679.9
SS-455     550-4737   MEM-004       1943.88

SUPPLIERID CATALOGNUM PARTNUMBER   UNITCOST
---------- ---------- ---------- ----------
SS-455     550-5782   MEM-011        269.85
SS-455     550-9888   MEM-001       2339.55
SW-450     775-3712   SCN-002         149.4
SW-450     775-6528   SCN-001          67.4
SW-450     775-8926   SCN-003         239.4
WE-450     525-0254   P-003          5122.8
WE-450     525-0683   P-007         2211.85
WE-450     525-2901   KEY-001        251.82
WE-450     525-4314   ADT-007         535.8
WE-450     525-6339   CAB-012        184.75
WE-450     525-6527   CF-006          62.16

SUPPLIERID CATALOGNUM PARTNUMBER   UNITCOST
---------- ---------- ---------- ----------
GC-450     200-6483   PS-002          45.17
C-455      750-8008   PS-002         155.56
PA-384     676-9001   PS-001         167.22
PA-384     676-9002   PS-002         285.56
PA-384     676-9003   PS-003         203.88

181 rows selected. 


Commit complete.

Explanation: I created an sql query before the increase of unitcost and then ran it then
updated the query then ran the same query again to show that it was updated successfully. To
make the update, I did an update statement and multiplied the unitcost by 1.1 in the set statement.
*/
/*
******************************************************
Question 7
*/
select *
from 
where CustomerID = 'C-200045';

/* Results:
I must delete in a particular order because if the parent entity is deleted first,
there must be an error in the child entity due to missing foreign primary key from the 
parent key. So you cannot delete the keys from the child entity. 
*/
/*
******************************************************
Question 8
*/
select Sysdate, User
  FROM DUAL;



/* Results:

SYSDATE   USER                                                                                                                            
--------- --------------------------------------------------------------------------------------------------------------------------------
13-APR-20 LEE3118                                                                                                                         

*/
/*