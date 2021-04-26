/* <Begin Comment>
Brandon Lee
CNIT 27200 Spring 2020
Lab Time: Monday 3:30PM-5:20PM
Duration: 1:50MIN
******************************************************
Question 1
<End comment> */
Select SuppliedPart.SupplierID, ContactName, CellPhone
From SuppliedPart
Right JOIN Supplier ON SuppliedPart.SupplierID = Supplier.SupplierID
Where SuppliedPart.SupplierID IS NULL;

/* Results:
SUPPLIERID CONTACTNAME          CELLPHONE   
---------- -------------------- ------------
           Rob Thomas           484-374-8030
           Julie Evans                      
           Johanna Tighe        315-654-9976
           Gina Wendal          303-455-5775
           Robert Case          937-776-8273



Explanation: To complete this task with a nested query, you call another SELECT
clause inside the Supplier and compare the SupplierID inside the Supplier table and 
in the nested query you add the where clause there. 
*/
/*
******************************************************
Question 2
<End comment> */
Select CompanyName, ContactName, Phone, SUM(UnitCost) AS TOTAL_UC
From Supplier
Left JOIN SuppliedPart ON Supplier.SupplierID = SuppliedPart.SupplierID
Group by CompanyName, ContactName, Phone;


/* Results:
COMPANYNAME                    CONTACTNAME          PHONE          TOTAL_UC
------------------------------ -------------------- ------------ ----------
TargetPC                       Loraine Platt        520-475-5322    6178.87
Limited Comp                   Elizabeth Clark      471-846-6232   13111.16
Computer Surplus               Jamie Pickett        937-147-2569       7092
Toner Recyclers                Thurman Mezzo        303-967-1415     614.15
Security Associates            Gina Wendal          303-455-8685           
Computer Club                  Rob Thomas           484-374-1998           
Beach Audio                    Pam Krick            860-624-2539    2924.62
Electronics Cafe               Travis Honn          303-564-1515    7159.98
Cyber Tech                     Robert Case          937-776-2640           
Net Works                      Paul Smith           919-703-2277    1670.18
Tech WorldWide                 Kelli Jones          305-647-0391    8628.48

COMPANYNAME                    CONTACTNAME          PHONE          TOTAL_UC
------------------------------ -------------------- ------------ ----------
Tech Parts Mart                Alice Mynhier        303-696-0557      892.6
Power Smart                    Yauleng Depoe        313-475-1177      456.2
DealsPC                        Dorothy Beering      303-465-4900    7648.66
Cables and Kits                Gary Mikels          505-660-9632     815.22
Wearable Techies               Julie Evans          417-473-7839           
xByte Tech                     Darlene Jenkins      305-490-5461    1140.55
Computer Zone                  Sandy Goodman        208-614-3136    1218.43
Power Adapter Shop             Debra Cruz           812-547-7359     698.62
Tablet Repair                  Lance Andrews        972-534-7322    1396.32
Cyber Saver                    Todd Wolfe           520-534-8834     656.66
Secure Solutions               Johanna Tighe        315-654-8845           

COMPANYNAME                    CONTACTNAME          PHONE          TOTAL_UC
------------------------------ -------------------- ------------ ----------
CompCom                        Timothy Neal         919-736-9458    1669.69
Computer Visions               William Newlon       909-452-4936    2875.29
Qwerty Comp                    Tim White            517-777-1905     817.65
RefurbNet                      Kevin Martin         606-677-9789    5054.56
Monster Parts                  David Becker         843-646-4187     495.51
Computer Medic                 Donald Blythe        520-486-6025     1975.2
IT Creations                   Adam Cyr             315-474-5634    3148.98
Server Store                   Wade Holle           887-746-6174    3830.95
Discount Print                 Gordon Mayes         207-634-1969   15683.97
Tech Traders                   Jennie Fry           806-456-6285   14128.46
Information Security           Stephen Bird         540-514-1415    6594.94

COMPANYNAME                    CONTACTNAME          PHONE          TOTAL_UC
------------------------------ -------------------- ------------ ----------
Computer Surplus               Brenda Pritchett     302-696-1000    8369.18

34 rows selected. 

Explanation: My query is comparing Supplier and SuppliedParts and it is grouping all 
except the aggregate function SUM(UNITCOST)because you cant group by an aggregate function.
*/
/*
******************************************************
Question 3
<End comment> */
Select PartNumber, Category.CategoryID, CategoryName, Weight, StockPrice
From Category
Right JOIN InventoryPart ON Category.CategoryID = InventoryPart.CategoryID
Where StockPrice < 5 AND Weight > (Select AVG(Weight) 
From InventoryPart 
Where CategoryID = 'CBL');

/* Results:
PARTNUMBER CATEGORYID CATEGORYNAME                       WEIGHT STOCKPRICE
---------- ---------- ------------------------------ ---------- ----------
BRK-007    CBL        Cables                                 .5       3.59
BRK-008    CBL        Cables                                 .5       3.59
BRK-010    CBL        Cables                                 .5       2.99
CAB-007    CBL        Cables                               .688       2.79
ICAB-008   CBL        Cables                                 .5       2.99
CF-009     PROC       Processors                             .5       3.57
CAB-009                                                      .5       4.59
CAB-010                                                    .813       4.59
CAB-023                                                    .625       3.59

9 rows selected. 

Explanation: The average weight is 0.57 

Select PartNumber, Category.CategoryID, CategoryName, Weight, StockPrice
From Category
Right JOIN InventoryPart ON Category.CategoryID = InventoryPart.CategoryID
Where StockPrice < 5 AND Weight > (Select AVG(Weight) 
From InventoryPart 
Where CategoryID = 'CBL');

/* Results:
PARTNUMBER CATEGORYID CATEGORYNAME                       WEIGHT STOCKPRICE
---------- ---------- ------------------------------ ---------- ----------
BRK-007    CBL        Cables                                 .5       3.59
BRK-008    CBL        Cables                                 .5       3.59
BRK-010    CBL        Cables                                 .5       2.99
CAB-007    CBL        Cables                               .688       2.79
ICAB-008   CBL        Cables                                 .5       2.99
CF-009     PROC       Processors                             .5       3.57
CAB-009                                                      .5       4.59
CAB-010                                                    .813       4.59
CAB-023                                                    .625       3.59

9 rows selected. 

The difference between left and right join is that the left join returns all rows from the left table 
and the right join returns all rows from the right table even though they both 
don't have matches. 

*/
/*
******************************************************
Question 4
<End comment> */
Select CustomerID
From Customer
MINUS
Select CustomerID
From CustOrder;

/* Results:

CUSTOMERID
----------
C-200055
C-200075
C-200077
C-200078
C-200080
I-200028
I-200055
I-200057
I-200077
I-200107
I-200113

CUSTOMERID
----------
I-200136
I-200158
I-200159
I-200160

15 rows selected. 

Explanation:
Yes, it does matter if the query order is switched, the result becomes "no rows selected"
Minus works by extracting the rows that are in the first half that are not in the second half.
*/
/*
******************************************************
Question 5
<End comment> */
SELECT  FirstName||' '||LastName AS MATCHING, City
FROM Employee
INTERSECT
SELECT ShipName, ShipCity
FROM Shipment;

/* Results:

MATCHING                             CITY                
------------------------------------ --------------------
Allison Roland                       Palma      

Explanation: If we add another attribute to the SELECT statement such as State 
or ShipState there will be another column added to the result such as:

MATCHING                             CITY                 ST
------------------------------------ -------------------- --
Allison Roland                       Palma                FL

*/
/*
******************************************************
Question 6
<End comment> */
SELECT FirstName, LastName, HireDate, BirthDate, TO_CHAR(HireDate, 'MONTH') AS Hire_Birthday
FROM EMPLOYEE
INTERSECT
SELECT FirstName, LastName, HireDate, BirthDate, TO_CHAR(BirthDate, 'MONTH') AS Hire_Birthday
FROM EMPLOYEE;


/* Results:


FIRSTNAME       LASTNAME             HIREDATE  BIRTHDATE HIRE_BIRT
--------------- -------------------- --------- --------- ---------
David           Gostler              06-JUN-12 04-JUN-84 JUNE     
Gregory         Hettinger            25-JAN-02 20-JAN-84 JANUARY  
Maria           Guiomar              01-DEC-13 01-DEC-79 DECEMBER 
Melissa         Alvarez              23-JUL-05 17-JUL-85 JULY     
Ryan            Thompson             20-JUN-06 20-JUN-76 JUNE     
Shannon         Darby                14-APR-19 14-APR-93 APRIL    
Todd            Vigus                11-NOV-04 20-NOV-90 NOVEMBER 

7 rows selected. 

Explanation: We can intersect in the same table because it is identical with each other
and removes all duplicated row from the results set. The query is only comparing the month
by selecting the clause 'MONTH' from HireDate or BirthDate columns. 


*/
/*
******************************************************
Question 7
<End comment> */
Select 


/* Results:
Explanation: The UNION operator is used to combine the result-set of two or more
SELECT statements, the number of columns must be same, similar data types, and same 
order.

*/
/*
******************************************************
Question 8
<End comment> */
Select ShipName
From Shipment
MINUS
Select CustFirstName||' '||CustLastName
From Customer;


/* Results:

SHIPNAME                            
------------------------------------
Adrian McGrew
Arika Bross
Ben Baltz
Bruce Fogarty
Carl Turley
Carrie Buchko
Cecil Scheetz
Crissy Jones
Dan Lagaveen
Danika Sharp
Dean Katpally

SHIPNAME                            
------------------------------------
Deb Compton
Dennis Eberle`
Don Torres
Eugene Gasper
Frank Aamodt
George Purcell
Gregory Abbott
Heather Waters
Jack Akers
Jana Gritffith
Janet Umbarger

SHIPNAME                            
------------------------------------
Jared Meers
Jeffery  Jordan
Jennefer Hundley
Jill Reece
Joan Flynn
Jonathan Blanco
June Idle
Kathleen Plyman
Kenneth Hughes
Krsity Moore
Larry Moore

SHIPNAME                            
------------------------------------
Mary Basham
Megan Stahley
Michael Godby
Michael Mumford
Norman Fields
Orville Gilliland
Phil Reece
Richard Akropolis
Richard Dalder
Robert Belt
Roy Beer

SHIPNAME                            
------------------------------------
Samantha Akers
Scott Alexander
Scott Slutz
Shelia Eagon
Sherry Garlin
Sherry Leathers
Terry Young
Tom Moore
Tommy McFerren
Trevor Snuffer

54 rows selected.
Explanation: Both inner and outer join combine rows from two or more tables into a single 
result. However, the inner join does not include non-matching rows, whereas outer joins
include them.
*/
/*
******************************************************
Question 9
<End comment> */
Select PartNumber
From InventoryPart
MINUS
Select PartNumber
From CustOrderLine;

/* Results
PARTNUMBER
----------
ADT-002
BRK-006
C-004
CAB-002
CAB-004
CAB-014
CAB-019
CAB-024
CS-001
CS-002
CS-003

PARTNUMBER
----------
CTR-010
CTR-020
POW-001
PRT-005
SCN-003
SFT-009

17 rows selected. 
Explanation: This query represents that the difference between the PartNumber
column from the InventoryPart table and CustOrderLine table. This can be written
by using a INNER JOIN clause.
*/
/*
******************************************************
Question 10
<End comment> */
Select Supplier.SupplierID, ContactName, SuppliedPart.UnitCost 
From Supplier
INNER JOIN SuppliedPart ON Supplier.SupplierID = SuppliedPart.SupplierID
Where SuppliedPart.UnitCost IN (Select MIN(UnitCost) From SuppliedPart)
UNION
Select Supplier.SupplierID, Supplier.ContactName, UnitCost 
From Supplier
INNER JOIN SuppliedPart ON Supplier.SupplierID = SuppliedPart.SupplierID
Where UnitCost IN (Select MAX(UnitCost) From SuppliedPart);


/* Results:

SUPPLIERID CONTACTNAME            UNITCOST
---------- -------------------- ----------
LL-455     Elizabeth Clark          8275.8
PA-450     Darlene Jenkins            22.4

Explanation: The IN caluse is non-sargable so it will not use the index
to resolve the query, but the = are sargable and support that index.
*/
/*
******************************************************