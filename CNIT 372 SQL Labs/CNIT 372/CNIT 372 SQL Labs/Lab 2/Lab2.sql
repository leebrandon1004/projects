--Question 1a
select round(avg(custorderline.orderquantity),1), inventorypart.categoryid,
partdescription
from custorderline 
inner join inventorypart 
on custorderline.partnumber = inventorypart.partnumber
inner join category 
on inventorypart.categoryid = category.categoryid
where category.categoryid = 'ACCESS'
group by partdescription, inventorypart.categoryid
order by round(avg(custorderline.orderquantity),1) desc;

/

--Question 1b

/

--Question 2a
select to_char(orderdate,'YYYY'), inventorypart.partdescription, 
round(avg(custorderline.orderquantity),1)
from custorderline 
inner join custorder 
on custorderline.orderid = custorder.orderid
inner join inventorypart 
on custorderline.partnumber = inventorypart.partnumber
where custorderline.partnumber = 'DVD-001'
group by to_char(orderdate,'YYYY'), inventorypart.partdescription
order by to_char(orderdate,'YYYY');


/

--Question 2b

/

--Question 3a
select to_char(orderdate,'YYYY'), inventorypart.partdescription, 
sum(custorderline.orderquantity)
from custorderline 
inner join custorder 
on custorderline.orderid = custorder.orderid
inner join inventorypart 
on custorderline.partnumber = inventorypart.partnumber
where custorderline.partnumber = 'DVD-001'
group by inventorypart.partdescription, to_char(orderdate,'YYYY')
order by to_char(orderdate,'YYYY');

/

--Question 3b

/

--Question 4a 
select to_char(orderdate,'YYYY'), count(*), inventorypart.partdescription
from custorderline 
inner join custorder 
on custorderline.orderid = custorder.orderid
inner join inventorypart 
on custorderline.partnumber = inventorypart.partnumber
where custorderline.partnumber = 'DVD-001'
group by inventorypart.partdescription, to_char(orderdate,'YYYY')
order by to_char(orderdate,'YYYY');

/

--Question 4b

/

--Question 5a

/

--Question 5b

/

--Question 5c

/

--Question 6a 
select shipment.orderid, shipment.shipmentid, shippeditem.packagenumber, 
shippeddate, shipname, shipaddress
from shipment
inner join shippeditem
on shipment.orderid = shippeditem.orderid
inner join packingslip
on shipment.shipmentid = packingslip.shipmentid
where shipment.orderid = '2000000007';
/

--Question 6b

/

--Question 7a
select custlastname || ', ' || custfirstname, customer.customerid, orderid
from customer
left join custorder
on customer.customerid = custorder.customerid
where state = 'PA' and companyname IS NULL;

/

--Question 7b
select custlastname || ', ' || custfirstname, customer.customerid, orderid
from customer
right join custorder
on customer.customerid = custorder.customerid
where state = 'PA' and companyname IS NULL;
/

--Question 7c
select partnumber, categoryname
from inventorypart
full outer join category
on inventorypart.categoryid = category.categoryid;
/

--Question 7d
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

--Question 8a
select distinct customer.customerid
from custorder
inner join customer
on custorder.customerid = customer.customerid
inner join custorderline
on custorder.orderid = custorderline.orderid
where state = 'PA' AND orderquantity IS NOT NULL
intersect
select distinct customerid
from custorder
inner join custorderline
on custorder.orderid = custorderline.orderid
where orderquantity > 0;
/

select distinct customerid
from customer
where state = 'PA'
minus
select distinct customerid
from custorder
where orderid IS NULL;

--Question 8b
select distinct customer.customerid
from custorder
inner join customer
on custorder.customerid = customer.customerid
inner join custorderline
on custorder.orderid = custorderline.orderid
where state = 'PA' AND orderquantity IS NULL
minus
select distinct customerid
from custorder
inner join custorderline
on custorder.orderid = custorderline.orderid
where orderquantity IS NULL;
/

--Question 8c
select distinct customer.customerid
from customer
inner join custorder
on customer.customerid = custorder.customerid
where state = 'PA' AND orderdate between '01-JAN-2011' AND '31-DEC-2011'
intersect
select distinct customerid
from custorder
where orderdate between '01-JAN-2011' AND '31-DEC-2011';
/

--Question 8d
select distinct customerid
from customer
where state = 'PA'
minus
select distinct customerid
from custorder
where NOT orderdate between '01-JAN-2011' AND '31-DEC-2011';
/

--Question 9a
select distinct inventorypart.partnumber
from inventorypart
inner join custorderline
on inventorypart.partnumber = custorderline.partnumber
where categoryid = 'CAB' AND orderquantity > 0
minus
select distinct custorderline.partnumber
from custorderline 
inner join inventorypart
on custorderline.partnumber = inventorypart.partnumber
where orderquantity > 0 AND categoryid = 'CAB';
/

select distinct partnumber
from custorderline
where orderquantity >= 1;
minus
select distinct partnumber
from inventorypart
where categoryid = 'CAB';

--Question 9b
select distinct inventorypart.partnumber
from inventorypart
inner join custorderline
on inventorypart.partnumber = custorderline.partnumber
where categoryid = 'CAB' AND orderquantity = 0
intersect
select distinct custorderline.partnumber
from custorderline 
inner join inventorypart
on custorderline.partnumber = inventorypart.partnumber
where orderquantity = 0 AND categoryid = 'CAB';
/

--Question 9c
select distinct inventorypart.partnumber
from inventorypart
inner join custorderline
on inventorypart.partnumber = custorderline.partnumber
inner join custorder
on custorderline.orderid = custorder.orderid
where categoryid = 'CAB' AND 
orderquantity >= 1 AND custorder.orderdate between '01-JAN-2011' AND '31-DEC-2011'
minus
select distinct partnumber
from custorderline
inner join custorder
on custorderline.orderid = custorder.orderid
where orderquantity >= 1 AND custorder.orderdate between '01-JAN-2011' AND '31-DEC-2011';
/

--Question 9d
select distinct inventorypart.partnumber
from inventorypart
inner join custorderline
on inventorypart.partnumber = custorderline.partnumber
inner join custorder
on custorderline.orderid = custorder.orderid
where categoryid = 'CAB' AND 
NOT custorder.orderdate between '01-JAN-2011' AND '31-DEC-2011'
minus
select distinct partnumber
from custorderline
inner join custorder
on custorderline.orderid = custorder.orderid
where NOT custorder.orderdate between '01-JAN-2011' AND '31-DEC-2011';
/

--Question 10a


select distinct custfirstname, custlastname
from customer
where state= 'FL'
union
select distinct firstname, lastname 
from employee
order by custfirstname, custlastname asc;

/

--Question 10b
select custfirstname, custlastname
from customer
where state= 'FL'
union all
select firstname, lastname 
from employee
order by custfirstname, custlastname asc;

/

--Question 11
select companyname, custorder.customerid, custorder.orderid
from customer
inner join custorder
on customer.customerid = custorder.customerid
where companyname IS NOT NULL AND state = 'PA'
UNION ALL
select companyname, custorder.customerid, custorder.orderid
from custorder
inner join customer
on custorder.customerid = customer.customerid
where companyname IS NOT NULL AND state = 'PA'
order by customerid, orderid;
/

/* Results
Question 1a
ROUND(AVG(CUSTORDERLINE.ORDERQUANTITY),1) CATEGO PARTDESCRIPTION                                   
----------------------------------------- ------ --------------------------------------------------
                                      8.3 ACCESS PCI DATA/FAX/VOICE MODEM                          
                                      5.1 ACCESS 112K DUAL MODEM                                   
                                      3.8 ACCESS SINGLEHEAD THERMAL INKJET PRINTER                 
                                      3.6 ACCESS 3-IN-1 COLOR INKJET PRINTER                       
                                      3.5 ACCESS SCANJET BUSINESS SERIES COLOR SCANNER             
                                      3.4 ACCESS LASER JET 2500SE                                  
                                      3.1 ACCESS V.90/K56 FLEX 56K FAX MODEM                       
                                      2.9 ACCESS LASER JET 1999SE                                  
                                      2.4 ACCESS PCI MODEM                                         
                                      2.3 ACCESS LASER JET 2000SE                                  
                                      1.8 ACCESS SCANJET CSE COLOR SCANNER                         

ROUND(AVG(CUSTORDERLINE.ORDERQUANTITY),1) CATEGO PARTDESCRIPTION                                   
----------------------------------------- ------ --------------------------------------------------
                                      1.6 ACCESS PCI V.90 DATA/FAX/VOICE MODEM                     

12 rows selected. 

Question 1b
This caveat is critical due to its condition that it gives to the question.
If this was not included, it might have meant to include a restricted order for the
question which might have lessened the number of rows in the results. However, since it
says to include all order we get to include every order in the question.

Question 2a (Referenced Alex Choi)
TO_C PARTDESCRIPTION                                    ROUND(AVG(CUSTORDERLINE.ORDERQUANTITY),1)
---- -------------------------------------------------- -----------------------------------------
2010 6X DVD-ROM KIT                                                                           2.1
2011 6X DVD-ROM KIT                                                                           4.5

Question 2b
Average quantity sold per order changed increasingly as the year changed to 2010 to 2011.
This means that there were about twice as much quantities of 6X DVD-ROM KIT sold over a year. 

Question 3a
TO_C PARTDESCRIPTION                                    SUM(CUSTORDERLINE.ORDERQUANTITY)
---- -------------------------------------------------- --------------------------------
2010 6X DVD-ROM KIT                                                                   23
2011 6X DVD-ROM KIT                                                                   18

Question 3b
Comparing the two years, there were more 6X DVD-ROM KIT total quantity sold in 2010 than 2011

Question 4a
TO_C   COUNT(*) PARTDESCRIPTION                                   
---- ---------- --------------------------------------------------
2010         11 6X DVD-ROM KIT                                    
2011          4 6X DVD-ROM KIT                                    

Question 4b
In comparison, there were more 6X DVD-ROM KIT sold in 2010 than 2011 by using the command
count(*)

Question 5a
The similarities between 2b,3b,4b are that they all use part 6X DVD-ROM KIT but they calculate
different results average quantity, total sum quantity, and number of quantities, 
respectively

Question 5b
We can see that in 2b, there were more average quantities sold in 2011 than in 2010.
In 3b, there are more total quantity sold in 2010 than 2011. In 4b, there are more
number of quantities sold in 2011 than in 2010. We can see that the sales of 
6X DVD-ROM KIT is more successful in the year 2010 than 2011 due to its number 
of quantities sold and total sum quantity. In the year 2011 the average might be 
higher due to an execption of a enormously high number which can change the average
of the sold quantities. Thus, in the sales part, 2010 was more successful than 2011.

Question 5c
It does conflict each other with the 2011 average quantity sold higher than 2010 but 
2010 having total quantities sold and number of quantities sold higher than 2011. 
However, since the total quantities and number of quantities are higher in 2010, the 
2011's average might be just an outlier being too high at some point of time. This 
decreases our confidence in the results due to an unexpected outlier.

Question 6a
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

Question 6b
For 6a, it displays the orderid, shipmentid, packagenumber, shipddate, shipname, 
shipaddress for the order id "2000000007" to the shipments that has been sent. 

Question 7a
CUSTLASTNAME||','||CUSTFIRSTNAME      CUSTOMERID ORDERID   
------------------------------------- ---------- ----------
Wolfe, Thomas                         I-300149   2001000768
Wolfe, Thomas                         I-300149   2000000497
Wolfe, Thomas                         I-300149   2001000670
Wolfe, Thomas                         I-300149   2001000736
Wolfe, Thomas                         I-300149   2001000751
Kaleta, Don                           I-300028             

6 rows selected. 

Question 7b
CUSTLASTNAME||','||CUSTFIRSTNAME      CUSTOMERID ORDERID   
------------------------------------- ---------- ----------
Wolfe, Thomas                         I-300149   2001000768
Wolfe, Thomas                         I-300149   2000000497
Wolfe, Thomas                         I-300149   2001000670
Wolfe, Thomas                         I-300149   2001000736
Wolfe, Thomas                         I-300149   2001000751

Question 7c
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
ADT-001    Storage                       
ADT-002    Cables                        
ADT-003    Cables                        
ADT-004    Cables                        
ADT-005    Cables                        
ADT-006    Cables                        

PARTNUMBER CATEGORYNAME                  
---------- ------------------------------
ADT-007    Cables                        
BB-001     Basics                        
BB-002     Basics                        
BB-003     Basics                        
BB-004     Basics                        
BB-005     Basics                        
BRK-001    Cables                        
BRK-002    Cables                        
BRK-003    Cables                        
BRK-004    Cables                        
BRK-005    Cables                        

PARTNUMBER CATEGORYNAME                  
---------- ------------------------------
BRK-006    Cables                        
BRK-007    Cables                        
BRK-008    Cables                        
BRK-009    Cables                        
BRK-010    Cables                        
BRK-011    Cables                        
C-001      Basics                        
C-002      Basics                        
C-003      Basics                        
CAB-001    Cables                        
CAB-002    Cables                        

PARTNUMBER CATEGORYNAME                  
---------- ------------------------------
CAB-003    Cables                        
CAB-004    Cables                        
CAB-005    Cables                        
CAB-006    Cables                        
CAB-007    Cables                        
CAB-008    Cables                        
CAB-009                                  
CAB-010                                  
CAB-011                                  
CAB-012                                  
CAB-013                                  

PARTNUMBER CATEGORYNAME                  
---------- ------------------------------
CAB-014                                  
CAB-015                                  
CAB-016                                  
CAB-017                                  
CAB-018                                  
CAB-019                                  
CAB-020                                  
CAB-021                                  
CAB-022                                  
CAB-023                                  
CAB-024                                  

PARTNUMBER CATEGORYNAME                  
---------- ------------------------------
CAB-025                                  
CAB-026                                  
CAB-027                                  
CAB-028                                  
CD-001     Storage                       
CD-002     Storage                       
CD-003     Storage                       
CD-004     Storage                       
CF-001     Processors                    
CF-002     Processors                    
CF-003     Processors                    

PARTNUMBER CATEGORYNAME                  
---------- ------------------------------
CF-004     Processors                    
CF-005     Processors                    
CF-006     Processors                    
CF-007     Processors                    
CF-008     Processors                    
CF-009     Processors                    
CRD-001                                  
CRD-002                                  
CRD-003                                  
CRD-004                                  
CRD-005                                  

PARTNUMBER CATEGORYNAME                  
---------- ------------------------------
CRD-006                                  
CRD-007                                  
CRD-008                                  
CRD-009                                  
CTR-001    Computers                     
CTR-002    Computers                     
CTR-003    Computers                     
CTR-004    Computers                     
CTR-005    Computers                     
CTR-006    Computers                     
CTR-007    Computers                     

PARTNUMBER CATEGORYNAME                  
---------- ------------------------------
CTR-008    Computers                     
CTR-009    Computers                     
CTR-010    Computers                     
CTR-011    Computers                     
CTR-012    Computers                     
CTR-013    Computers                     
CTR-014    Computers                     
CTR-015    Computers                     
CTR-016    Computers                     
CTR-017    Computers                     
CTR-018    Computers                     

PARTNUMBER CATEGORYNAME                  
---------- ------------------------------
CTR-019    Computers                     
CTR-020    Computers                     
CTR-021    Computers                     
CTR-022    Computers                     
CTR-023    Computers                     
CTR-024    Computers                     
CTR-025    Computers                     
CTR-026    Computers                     
CTR-027    Computers                     
CTR-028    Computers                     
CTR-029    Computers                     

PARTNUMBER CATEGORYNAME                  
---------- ------------------------------
DVD-001    Storage                       
DVD-002    Storage                       
ICAB-001   Cables                        
ICAB-002   Cables                        
ICAB-003   Cables                        
ICAB-004   Cables                        
ICAB-005   Cables                        
ICAB-006   Cables                        
ICAB-007   Cables                        
ICAB-008   Cables                        
KEY-001    Basics                        

PARTNUMBER CATEGORYNAME                  
---------- ------------------------------
KEY-002    Basics                        
KEY-003    Basics                        
KEY-004    Basics                        
KEY-005    Basics                        
KEY-006    Basics                        
           Tablets                       

204 rows selected. 

Question 7d
CUSTFIRSTNAME||''||CUSTLASTNAME      CUSTOMERID ORDERDATE SHIPMENTID PACKAGENUMBER SHIPNAME             SHIPPEDDA
------------------------------------ ---------- --------- ---------- ------------- -------------------- ---------
Steven Yaun                          I-300147   27-MAR-11 L258                     Michelle Oakley               

Question 8a
CUSTOMERID
----------
C-300006
C-300040
C-300062
I-300149

Question 8b
no rows selected

Question 8c
CUSTOMERID
----------
C-300006
C-300040
I-300149

Question 8d
CUSTOMERID
----------
I-300028

Question 9a
no rows selected

Question 9b
no rows selected

Question 9c
no rows selected

Question 9d
no rows selected

Question 10a
CUSTFIRSTNAME   CUSTLASTNAME        
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

CUSTFIRSTNAME   CUSTLASTNAME        
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

CUSTFIRSTNAME   CUSTLASTNAME        
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

CUSTFIRSTNAME   CUSTLASTNAME        
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

CUSTFIRSTNAME   CUSTLASTNAME        
--------------- --------------------
Steven          Hickman             
Tina            Yates               
Todd            Vigus               

47 rows selected. 

Question 10b
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

Question 11
COMPANYNAME                              CUSTOMERID ORDERID   
---------------------------------------- ---------- ----------
BMA Advertising Design                   C-300006   2000000050
BMA Advertising Design                   C-300006   2000000050
BMA Advertising Design                   C-300006   2000000083
BMA Advertising Design                   C-300006   2000000083
BMA Advertising Design                   C-300006   2000000110
BMA Advertising Design                   C-300006   2000000110
BMA Advertising Design                   C-300006   2000000130
BMA Advertising Design                   C-300006   2000000130
BMA Advertising Design                   C-300006   2000000355
BMA Advertising Design                   C-300006   2000000355
BMA Advertising Design                   C-300006   2001000643

COMPANYNAME                              CUSTOMERID ORDERID   
---------------------------------------- ---------- ----------
BMA Advertising Design                   C-300006   2001000643
BMA Advertising Design                   C-300006   2001000729
BMA Advertising Design                   C-300006   2001000729
Computer Consultants                     C-300040   2000000012
Computer Consultants                     C-300040   2000000012
Computer Consultants                     C-300040   2000000284
Computer Consultants                     C-300040   2000000284
Computer Consultants                     C-300040   2001000721
Computer Consultants                     C-300040   2001000721
Computer Consultants                     C-300040   2001000782
Computer Consultants                     C-300040   2001000782

COMPANYNAME                              CUSTOMERID ORDERID   
---------------------------------------- ---------- ----------
Security Installation                    C-300062   2000000361
Security Installation                    C-300062   2000000361
Security Installation                    C-300062   2000000421
Security Installation                    C-300062   2000000421
Security Installation                    C-300062   2000000440
Security Installation                    C-300062   2000000440
Security Installation                    C-300062   2000000496
Security Installation                    C-300062   2000000496

30 rows selected. 




