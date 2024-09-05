-- Question 1
select inventorypart.partnumber, partdescription,
round(avg(custorderline.orderquantity),1)
from inventorypart inner join custorderline
on inventorypart.partnumber = custorderline.partnumber
where categoryid = 'ACCESS'
group by inventorypart.partnumber, partdescription
order by avg(orderquantity) desc;
/

-- Question 2a
select to_char(orderdate,'MM-YYYY'), inventorypart.partdescription, 
round(avg(custorderline.orderquantity),1)
from custorderline 
inner join custorder 
on custorderline.orderid = custorder.orderid
inner join inventorypart 
on custorderline.partnumber = inventorypart.partnumber
where custorderline.partnumber = 'DVD-001'
group by to_char(orderdate,'MM-YYYY'), inventorypart.partdescription
order by to_char(orderdate,'MM-YYYY');
/

-- Question 2b
/*The average quantity changed by flunctuating a lot but in Febuary and September it had it's most demand*/
/

-- Question 3a
select to_char(orderdate,'MM-YYYY'), sum(custorderline.orderquantity)
from custorderline 
inner join custorder 
on custorderline.orderid = custorder.orderid
inner join inventorypart 
on custorderline.partnumber = inventorypart.partnumber
where custorderline.partnumber = 'DVD-001'
group by inventorypart.partdescription, to_char(orderdate,'MM-YYYY')
order by to_char(orderdate,'MM-YYYY');

/

-- Question 3b
select to_char(orderdate,'MM-YYYY'), sum(custorderline.orderquantity)
from custorderline 
inner join custorder 
on custorderline.orderid = custorder.orderid
inner join inventorypart 
on custorderline.partnumber = inventorypart.partnumber
where custorderline.partnumber = 'DVD-001'
group by inventorypart.partdescription, to_char(orderdate,'MM-YYYY')
order by to_char(orderdate,'MM-YYYY') desc;
/

-- Question 3c
/* I would plan the procurement part of DVD-001 from the previous data of 2010, such as purchasing similar order quantity for the same months of 2011 */
/

-- Question 4
select to_char(custorder.orderdate, 'MM-YYYY'),
count(custorderline.orderid)
from custorder inner join custorderline
on custorder.orderid = custorderline.orderid
inner join inventorypart
on custorderline.partnumber = inventorypart.partnumber
where inventorypart.partnumber = 'DVD-001'
group by partdescription, to_char(orderdate, 'MM-YYYY')
order by to_char(orderdate, 'MM-YYYY') desc;
/

-- Question 5a
/* Question 2 attempts to find the "average" quantity of the units sold during each month, Question 3 attempts to fin the 
"total" quantity of the units sold during each month, and Question 4 attempts to find the number of units order placed during
each month. */
/

-- Question 5b
/* From question 2, we can find the average demand of customers during every months, which is useful to predict the future
sales for the DVD-001 parts. From question 3, we can find the total demand from customers every month where we can also determine
how much to order DVD-001 parts from our suppliers. From question 4, we can find the number of order placed during the month where
we can find the quantity of the customer pool and the frequency of demand. These all helps when we have to purchase part DVD-001
and to forecast future demand.*/
/

-- Question 5c
/* From the previous questions, we can find that the data does support each other because it is from the same pool of data table
but by just using different mathematical approaches. Thus, this increases our confidence in the results.*/
/

-- Question 6a
select shipment.orderid, shipment.shipmentid, shippeditem.packagenumber, 
shippeddate, shipname, shipaddress
from shipment
inner join shippeditem
on shipment.orderid = shippeditem.orderid
inner join packingslip
on shipment.shipmentid = packingslip.shipmentid
where shipment.orderid = '2000000007';
/

-- Question 6b
/* Question 6a results the findinds of the order id of "2000000007" by locating who has ordered the id and the address of the 
destination. */
/

-- Question 7a
select custlastname || ', ' || custfirstname, customer.customerid, orderid
from customer
left join custorder
on customer.customerid = custorder.customerid
where state = 'PA' and companyname IS NULL;
/

-- Question 7b
select custlastname || ', ' || custfirstname, customer.customerid, orderid
from customer
right join custorder
on customer.customerid = custorder.customerid
where state = 'PA' and companyname IS NULL;
/

-- Question 8
select partnumber, categoryname
from inventorypart
full outer join category
on inventorypart.categoryid = category.categoryid;
/

-- Question 9a
select custfirstname || ' ' || custlastname, customer.customerid, orderdate, 
shipment.shipmentid, shippeditem.packagenumber, shipname, shippeddate
from custorder
full outer join customer
on custorder.customerid = customer.customerid
full outer join shipment
on custorder.orderid = shipment.orderid
full outer join shippeditem
on custorder.orderid = shippeditem.orderid
full outer join packingslip
on shipment.shipmentid = packingslip.shipmentid
where custorder.orderid = '2001000791';
/

-- Question 9b
select custfirstname || ' ' || custlastname, customer.customerid, orderdate, 
shipment.shipmentid, shipname
from custorder
full outer join customer
on custorder.customerid = customer.customerid
full outer join shipment
on custorder.orderid = shipment.orderid
full outer join shippeditem
on custorder.orderid = shippeditem.orderid
full outer join packingslip
on shipment.shipmentid = packingslip.shipmentid
where custorder.orderid = '2001000791' AND shippeddate is NULL;
/

-- Question 10a
select distinct customerid
from customer
where state = 'PA'
intersect
select customerid
from custorder;
/

-- Question 10b
select distinct customerid
from customer
where state = 'PA'
minus
select customerid
from custorder;
/

-- Question 10c
select distinct customerid
from customer
where state = 'PA'
intersect
select customerid
from custorder
where extract(year from orderdate) = 2011;
/

-- Question 10d
select distinct customerid
from customer
where state = 'PA'
minus
select customerid
from custorder
where extract(year from orderdate) = 2011;
/

-- Question 11a
select distinct partnumber
from inventorypart
where categoryid = 'CAB'
intersect
select distinct partnumber
from custorderline;
/

-- Question 11b
select partnumber
from inventorypart
where categoryid = 'CAB'
minus
select partnumber
from custorderline;
/

-- Question 11c
select distinct partnumber
from inventorypart
where categoryid = 'CAB'
intersect
select distinct partnumber
from custorderline inner join custorder
on custorderline.orderid = custorder.orderid
where to_char(custorder.orderdate, 'YYYY') = '2010';
/

-- Question 11d
select distinct partnumber
from inventorypart
where categoryid = 'CAB'
minus
select distinct partnumber
from custorderline inner join custorder
on custorderline.orderid = custorder.orderid
where to_char(custorder.orderdate, 'YYYY') = '2010';
/

-- Question 12a
select custfirstname as First_Name, custlastname as Last_Name
from customer
where state = 'FL'
union
select firstname as First_Name, lastname as Last_Name
from employee
order by First_Name, Last_Name asc;
/

-- Question 12b
select custfirstname, custlastname
from customer
where state= 'FL'
union all
select firstname, lastname 
from employee
order by custfirstname, custlastname asc;
/

-- Question 13a
select custlastname || ' ' || custfirstname || companyname ||, custorder.customerid, custorder.orderid
from customer
inner join custorder
on customer.customerid = custorder.customerid
where companyname IS NOT NULL AND state = 'PA'
UNION ALL
select custlastname || ' ' || custfirstname || 'Residential'||, companyname, custorder.customerid, custorder.orderid
from custorder
inner join customer
on custorder.customerid = customer.customerid
where companyname IS NULL AND state = 'PA'
order by customerid, orderid;
/

-- Question 13b
select custlastname || ' ' || custfirstname || companyname ||, customer.customerid,
custorder.orderid, custorder.orderdate
from customer 
full join custorder
on customer.customerid = custorder.customerid
where state = 'PA'
order by customer.customerid, custorder.orderid;
/

/* Results
-- Question 1
PARTNUMBER PARTDESCRIPTION                                    ROUND(AVG(CUSTORDERLINE.ORDERQUANTITY),1)
---------- -------------------------------------------------- -----------------------------------------
MOD-001    PCI DATA/FAX/VOICE MODEM                                                                 8.3
MOD-002    112K DUAL MODEM                                                                          5.1
PRT-006    SINGLEHEAD THERMAL INKJET PRINTER                                                        3.8
PRT-004    3-IN-1 COLOR INKJET PRINTER                                                              3.6
SCN-002    SCANJET BUSINESS SERIES COLOR SCANNER                                                    3.5
PRT-003    LASER JET 2500SE                                                                         3.4
MOD-005    V.90/K56 FLEX 56K FAX MODEM                                                              3.1
PRT-001    LASER JET 1999SE                                                                         2.9
MOD-003    PCI MODEM                                                                                2.4
PRT-002    LASER JET 2000SE                                                                         2.3
SCN-001    SCANJET CSE COLOR SCANNER                                                                1.8

PARTNUMBER PARTDESCRIPTION                                    ROUND(AVG(CUSTORDERLINE.ORDERQUANTITY),1)
---------- -------------------------------------------------- -----------------------------------------
MOD-004    PCI V.90 DATA/FAX/VOICE MODEM                                                            1.6

12 rows selected. 

-- Question 2a
TO_CHAR PARTDESCRIPTION                                    ROUND(AVG(CUSTORDERLINE.ORDERQUANTITY),1)
------- -------------------------------------------------- -----------------------------------------
01-2011 6X DVD-ROM KIT                                                                             1
02-2011 6X DVD-ROM KIT                                                                             8
03-2011 6X DVD-ROM KIT                                                                             1
07-2010 6X DVD-ROM KIT                                                                           1.5
09-2010 6X DVD-ROM KIT                                                                             4
10-2010 6X DVD-ROM KIT                                                                             1
11-2010 6X DVD-ROM KIT                                                                             2
12-2010 6X DVD-ROM KIT                                                                             1

8 rows selected. 

-- Question 2b
The average quantity changed by flunctuating a lot but in Febuary and September it had it's most demand


-- Question 3a
TO_CHAR SUM(CUSTORDERLINE.ORDERQUANTITY)
------- --------------------------------
01-2011                                1
02-2011                               16
03-2011                                1
07-2010                                3
09-2010                               12
10-2010                                1
11-2010                                4
12-2010                                3

8 rows selected. 

-- Question 3b
TO_CHAR SUM(CUSTORDERLINE.ORDERQUANTITY)
------- --------------------------------
12-2010                                3
11-2010                                4
10-2010                                1
09-2010                               12
07-2010                                3
03-2011                                1
02-2011                               16
01-2011                                1

8 rows selected. 

-- Question 3c
I would plan the procurement part of DVD-001 from the previous data of 2010, such as purchasing similar order quantity for the same months of 2011


-- Question 4
TO_CHAR COUNT(CUSTORDERLINE.ORDERID)
------- ----------------------------
12-2010                            3
11-2010                            2
10-2010                            1
09-2010                            3
07-2010                            2
03-2011                            1
02-2011                            2
01-2011                            1

8 rows selected. 

-- Question 5a
Question 2 attempts to find the "average" quantity of the units sold during each month, Question 3 attempts to fin the 
"total" quantity of the units sold during each month, and Question 4 attempts to find the number of units order placed during
each month.

-- Question 5b
From question 2, we can find the average demand of customers during every months, which is useful to predict the future
sales for the DVD-001 parts. From question 3, we can find the total demand from customers every month where we can also determine
how much to order DVD-001 parts from our suppliers. From question 4, we can find the number of order placed during the month where
we can find the quantity of the customer pool and the frequency of demand. These all helps when we have to purchase part DVD-001
and to forecast future demand.


-- Question 5c
From the previous questions, we can find that the data does support each other because it is from the same pool of data table
but by just using different mathematical approaches. Thus, this increases our confidence in the results.


-- Question 6a
ORDERID    SHIPMENTID PACKAGENUMBER SHIPPEDDA SHIPNAME             SHIPADDRESS                             
---------- ---------- ------------- --------- -------------------- ----------------------------------------
2000000007 H003                   1 05-JUL-10 Evelyn Cassens       6094 Pearson Ave.                       
2000000007 H003                   1 05-JUL-10 Evelyn Cassens       6094 Pearson Ave.                       
2000000007 H003                   1 05-JUL-10 Evelyn Cassens       6094 Pearson Ave.                       
2000000007 H003                   2 05-JUL-10 Evelyn Cassens       6094 Pearson Ave.                       
2000000007 H003                   2 05-JUL-10 Evelyn Cassens       6094 Pearson Ave.                       
2000000007 H003                   2 05-JUL-10 Evelyn Cassens       6094 Pearson Ave.                       
2000000007 H003                   3 05-JUL-10 Evelyn Cassens       6094 Pearson Ave.                       
2000000007 H003                   3 05-JUL-10 Evelyn Cassens       6094 Pearson Ave.                       
2000000007 H003                   3 05-JUL-10 Evelyn Cassens       6094 Pearson Ave.                       

9 rows selected. 

-- Question 6b
Question 6a results the findinds of the order id of "2000000007" by locating who has ordered the id and the address of the 
destination. 


-- Question 7a

CUSTLASTNAME||','||CUSTFIRSTNAME      CUSTOMERID ORDERID   
------------------------------------- ---------- ----------
Wolfe, Thomas                         I-300149   2000000497
Wolfe, Thomas                         I-300149   2001000670
Wolfe, Thomas                         I-300149   2001000736
Wolfe, Thomas                         I-300149   2001000751
Wolfe, Thomas                         I-300149   2001000768
Kaleta, Don                           I-300028             

6 rows selected. 

-- Question 7b
CUSTLASTNAME||','||CUSTFIRSTNAME      CUSTOMERID ORDERID   
------------------------------------- ---------- ----------
Wolfe, Thomas                         I-300149   2000000497
Wolfe, Thomas                         I-300149   2001000670
Wolfe, Thomas                         I-300149   2001000736
Wolfe, Thomas                         I-300149   2001000751
Wolfe, Thomas                         I-300149   2001000768

-- Question 8
PARTNUMBER CATEGORYNAME                  
---------- ------------------------------
ADT-001    Storage                       
ADT-002    Cables                        
ADT-003    Cables                        
ADT-004    Cables                        
ADT-005    Cables                        
ADT-006    Cables                        
ADT-007    Cables                        
BB-001     Basics                        
BB-002     Basics                        
BB-003     Basics                        
BB-004     Basics                        

PARTNUMBER CATEGORYNAME                  
---------- ------------------------------
BB-005     Basics                        
BRK-001    Cables                        
BRK-002    Cables                        
BRK-003    Cables                        
BRK-004    Cables                        
BRK-005    Cables                        
BRK-006    Cables                        
BRK-007    Cables                        
BRK-008    Cables                        
BRK-009    Cables                        
BRK-010    Cables                        

PARTNUMBER CATEGORYNAME                  
---------- ------------------------------
BRK-011    Cables                        
C-001      Basics                        
C-002      Basics                        
C-003      Basics                        
CAB-001    Cables                        
CAB-002    Cables                        
CAB-003    Cables                        
CAB-004    Cables                        
CAB-005    Cables                        
CAB-006    Cables                        
CAB-007    Cables                        

PARTNUMBER CATEGORYNAME                  
---------- ------------------------------
CAB-008    Cables                        
CAB-009                                  
CAB-010                                  
CAB-011                                  
CAB-012                                  
CAB-013                                  
CAB-014                                  
CAB-015                                  
CAB-016                                  
CAB-017                                  
CAB-018                                  

PARTNUMBER CATEGORYNAME                  
---------- ------------------------------
CAB-019                                  
CAB-020                                  
CAB-021                                  
CAB-022                                  
CAB-023                                  
CAB-024                                  
CAB-025                                  
CAB-026                                  
CAB-027                                  
CAB-028                                  
CD-001     Storage                       

PARTNUMBER CATEGORYNAME                  
---------- ------------------------------
CD-002     Storage                       
CD-003     Storage                       
CD-004     Storage                       
CF-001     Processors                    
CF-002     Processors                    
CF-003     Processors                    
CF-004     Processors                    
CF-005     Processors                    
CF-006     Processors                    
CF-007     Processors                    
CF-008     Processors                    

PARTNUMBER CATEGORYNAME                  
---------- ------------------------------
CF-009     Processors                    
CRD-001                                  
CRD-002                                  
CRD-003                                  
CRD-004                                  
CRD-005                                  
CRD-006                                  
CRD-007                                  
CRD-008                                  
CRD-009                                  
CTR-001    Computers                     

PARTNUMBER CATEGORYNAME                  
---------- ------------------------------
CTR-002    Computers                     
CTR-003    Computers                     
CTR-004    Computers                     
CTR-005    Computers                     
CTR-006    Computers                     
CTR-007    Computers                     
CTR-008    Computers                     
CTR-009    Computers                     
CTR-010    Computers                     
CTR-011    Computers                     
CTR-012    Computers                     

PARTNUMBER CATEGORYNAME                  
---------- ------------------------------
CTR-013    Computers                     
CTR-014    Computers                     
CTR-015    Computers                     
CTR-016    Computers                     
CTR-017    Computers                     
CTR-018    Computers                     
CTR-019    Computers                     
CTR-020    Computers                     
CTR-021    Computers                     
CTR-022    Computers                     
CTR-023    Computers                     

PARTNUMBER CATEGORYNAME                  
---------- ------------------------------
CTR-024    Computers                     
CTR-025    Computers                     
CTR-026    Computers                     
CTR-027    Computers                     
CTR-028    Computers                     
CTR-029    Computers                     
DVD-001    Storage                       
DVD-002    Storage                       
ICAB-001   Cables                        
ICAB-002   Cables                        
ICAB-003   Cables                        

PARTNUMBER CATEGORYNAME                  
---------- ------------------------------
ICAB-004   Cables                        
ICAB-005   Cables                        
ICAB-006   Cables                        
ICAB-007   Cables                        
ICAB-008   Cables                        
KEY-001    Basics                        
KEY-002    Basics                        
KEY-003    Basics                        
KEY-004    Basics                        
KEY-005    Basics                        
KEY-006    Basics                        

PARTNUMBER CATEGORYNAME                  
---------- ------------------------------
KEY-007    Basics                        
KEY-008    Basics                        
KEY-009    Basics                        
MEM-001    Storage                       
MEM-002    Storage                       
MEM-003    Storage                       
MEM-004    Storage                       
MEM-005    Storage                       
MEM-006    Storage                       
MEM-007    Storage                       
MEM-008    Storage                       

PARTNUMBER CATEGORYNAME                  
---------- ------------------------------
MEM-009    Storage                       
MEM-010    Storage                       
MEM-011    Storage                       
MEM-012    Storage                       
MIC-001    Basics                        
MIC-002    Basics                        
MIC-003    Basics                        
MIC-004    Basics                        
MIC-005    Basics                        
MIC-006    Basics                        
MIC-007    Basics                        

PARTNUMBER CATEGORYNAME                  
---------- ------------------------------
MIC-008    Basics                        
MIC-009    Basics                        
MIC-010    Basics                        
MIC-011    Basics                        
MIC-012    Basics                        
MOD-001    Accessories                   
MOD-002    Accessories                   
MOD-003    Accessories                   
MOD-004    Accessories                   
MOD-005    Accessories                   
MOM-001    Basics                        

PARTNUMBER CATEGORYNAME                  
---------- ------------------------------
MOM-002    Basics                        
MOM-003    Basics                        
MOM-004    Basics                        
MON-001    Basics                        
MON-002    Basics                        
MON-003    Basics                        
MON-004    Basics                        
MON-005    Basics                        
MON-006    Basics                        
MON-007    Basics                        
MON-008    Basics                        

PARTNUMBER CATEGORYNAME                  
---------- ------------------------------
P-001      Processors                    
P-002      Processors                    
P-003      Processors                    
P-004      Processors                    
P-005      Processors                    
P-006      Processors                    
P-007      Processors                    
P-008      Processors                    
P-009      Processors                    
P-010      Processors                    
POW-001    Cables                        

PARTNUMBER CATEGORYNAME                  
---------- ------------------------------
POW-002    Cables                        
POW-003    Cables                        
PRT-001    Accessories                   
PRT-002    Accessories                   
PRT-003    Accessories                   
PRT-004    Accessories                   
PRT-005    Accessories                   
PRT-006    Accessories                   
PS-001     Power                         
PS-002     Power                         
PS-003     Power                         

PARTNUMBER CATEGORYNAME                  
---------- ------------------------------
PS-004     Power                         
SCN-001    Accessories                   
SCN-002    Accessories                   
SCN-003    Accessories                   
SFT-001    Software                      
SFT-002    Software                      
SFT-003    Software                      
SFT-004    Software                      
SFT-005    Software                      
SFT-006    Software                      
SFT-007    Software                      

PARTNUMBER CATEGORYNAME                  
---------- ------------------------------
SFT-008    Software                      
SFT-009    Software                      
SP-001     Basics                        
SP-002     Basics                        
SP-003     Basics                        
           Tablets                       

204 rows selected. 

-- Question 9a
CUSTFIRSTNAME||''||CUSTLASTNAME      CUSTOMERID ORDERDATE SHIPMENTID PACKAGENUMBER SHIPNAME             SHIPPEDDA
------------------------------------ ---------- --------- ---------- ------------- -------------------- ---------
Steven Yaun                          I-300147   27-MAR-11 L258                     Michelle Oakley               

-- Question 9b
CUSTFIRSTNAME||''||CUSTLASTNAME      CUSTOMERID ORDERDATE SHIPMENTID SHIPNAME            
------------------------------------ ---------- --------- ---------- --------------------
Steven Yaun                          I-300147   27-MAR-11 L258       Michelle Oakley     

-- Question 10a
CUSTOMERID
----------
C-300006
C-300040
C-300062
I-300149

-- Question 10b
CUSTOMERID
----------
I-300028

-- Question 10c
CUSTOMERID
----------
C-300006
C-300040
I-300149

-- Question 10d
CUSTOMERID
----------
C-300062
I-300028

-- Question 11a
PARTNUMBER
----------
ADT-003
ADT-004
ADT-005
ADT-006
ADT-007
BRK-001
BRK-002
BRK-003
BRK-004
BRK-005
BRK-007

PARTNUMBER
----------
BRK-008
BRK-009
BRK-010
BRK-011
CAB-001
CAB-003
CAB-005
CAB-006
CAB-007
CAB-008
ICAB-001

PARTNUMBER
----------
ICAB-002
ICAB-003
ICAB-004
ICAB-005
ICAB-006
ICAB-007
ICAB-008
POW-002
POW-003

31 rows selected. 

-- Question 11b
PARTNUMBER
----------
ADT-002
BRK-006
CAB-002
CAB-004
POW-001

-- Question 11c
PARTNUMBER
----------
ADT-003
ADT-004
ADT-005
ADT-006
ADT-007
BRK-002
BRK-003
BRK-004
BRK-005
BRK-007
BRK-008

PARTNUMBER
----------
BRK-009
BRK-010
BRK-011
CAB-001
CAB-003
CAB-005
CAB-006
CAB-007
CAB-008
ICAB-001
ICAB-002

PARTNUMBER
----------
ICAB-003
ICAB-004
ICAB-005
ICAB-006
ICAB-007
ICAB-008
POW-002
POW-003

30 rows selected. 

-- Question 11d
PARTNUMBER
----------
ADT-002
BRK-001
BRK-006
CAB-002
CAB-004
POW-001

6 rows selected. 

-- Question 12a
FIRST_NAME      LAST_NAME           
--------------- --------------------
Allison         Roland              
Austin          Ortman              
Beth            Zobitz              
Calie           Zollman             
Charles         Jones               
David           Deppe               
David           Keck                
Edna            Lilley              
Gabrielle       Stevenson           
Gary            German              
Gregory         Hettinger           

FIRST_NAME      LAST_NAME           
--------------- --------------------
Jack            Barrick             
Jack            Brose               
Jamie           Osman               
Jason           Krasner             
Jason           Wendling            
Jim             Manaugh             
Joanne          Rosner              
Joseph          Platt               
Karen           Mangus              
Kathleen        Xolo                
Kathryn         Deagen              

FIRST_NAME      LAST_NAME           
--------------- --------------------
Kathy           Gunderson           
Kelly           Jordan              
Kristen         Gustavel            
Kristey         Moore               
Kristy          Moore               
Laura           Rodgers             
Marla           Reeder              
Meghan          Tyrie               
Melissa         Alvarez             
Michael         Abbott              
Michael         Emore               

FIRST_NAME      LAST_NAME           
--------------- --------------------
Michelle        Nairn               
Nicholas        Albregts            
Patricha        Underwood           
Paul            Eckelman            
Phil            Reece               
Rita            Bush                
Ronald          Day                 
Ryan            Stahley             
Sherman         Cheswick            
Steve           Cochran             
Steve           Hess                

FIRST_NAME      LAST_NAME           
--------------- --------------------
Steven          Hickman             
Tina            Yates               
Todd            Vigus               

47 rows selected. 

-- Question 12b
CUSTFIRSTNAME   CUSTLASTNAME        
--------------- --------------------
Allison         Roland              
Allison         Roland              
Austin          Ortman              
Beth            Zobitz              
Calie           Zollman             
Charles         Jones               
Charles         Jones               
David           Deppe               
David           Keck                
Edna            Lilley              
Gabrielle       Stevenson           

CUSTFIRSTNAME   CUSTLASTNAME        
--------------- --------------------
Gary            German              
Gregory         Hettinger           
Jack            Barrick             
Jack            Brose               
Jamie           Osman               
Jason           Krasner             
Jason           Wendling            
Jim             Manaugh             
Jim             Manaugh             
Joanne          Rosner              
Joseph          Platt               

CUSTFIRSTNAME   CUSTLASTNAME        
--------------- --------------------
Karen           Mangus              
Kathleen        Xolo                
Kathryn         Deagen              
Kathy           Gunderson           
Kelly           Jordan              
Kristen         Gustavel            
Kristey         Moore               
Kristy          Moore               
Laura           Rodgers             
Marla           Reeder              
Meghan          Tyrie               

CUSTFIRSTNAME   CUSTLASTNAME        
--------------- --------------------
Melissa         Alvarez             
Michael         Abbott              
Michael         Emore               
Michelle        Nairn               
Nicholas        Albregts            
Patricha        Underwood           
Paul            Eckelman            
Phil            Reece               
Phil            Reece               
Rita            Bush                
Ronald          Day                 

CUSTFIRSTNAME   CUSTLASTNAME        
--------------- --------------------
Ryan            Stahley             
Ryan            Stahley             
Sherman         Cheswick            
Steve           Cochran             
Steve           Hess                
Steven          Hickman             
Tina            Yates               
Todd            Vigus               

52 rows selected. 

-- Question 13a


-- Question 13b

*/