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

-- Question 7a
select custlastname || ', ' || custfirstname, customer.customerid, orderid
from customer
left join custorder
on customer.customerid = custorder.customerid
where state = 'PA' and companyname IS NULL;
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

-- Question 12a
select custfirstname as First_Name, custlastname as Last_Name
from customer
where state = 'FL'
union
select firstname as First_Name, lastname as Last_Name
from employee
order by First_Name, Last_Name asc;
/

/* Results
Question 3a
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

Question 3b
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

Question 7a
CUSTLASTNAME||','||CUSTFIRSTNAME      CUSTOMERID ORDERID   
------------------------------------- ---------- ----------
Wolfe, Thomas                         I-300149   2000000497
Wolfe, Thomas                         I-300149   2001000670
Wolfe, Thomas                         I-300149   2001000736
Wolfe, Thomas                         I-300149   2001000751
Wolfe, Thomas                         I-300149   2001000768
Kaleta, Don                           I-300028             

6 rows selected. 

Question 10a
CUSTOMERID
----------
C-300006
C-300040
C-300062
I-300149

Question 10b
CUSTOMERID
----------
I-300028

Question 10c
CUSTOMERID
----------
C-300006
C-300040
I-300149

Question 10d
CUSTOMERID
----------
C-300062
I-300028

Question 12a
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

*/