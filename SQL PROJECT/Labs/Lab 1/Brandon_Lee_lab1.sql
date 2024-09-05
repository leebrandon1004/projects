-- Question 1
/*
5. SELECT NAME, COUNT(*), AVG(RATING)
1. FROM BOOKSHELF
2. WHERE RATING>1
3. GROUP BY CATEGORY_NAME
4. HAVING CATEGORY_NAME LIKE ‘A%’
6. ORDER BY COUNT(*);
*/
/

-- Question 2
select distinct substr(Phone,1,3) 
from customer
where state= 'CO';
/

-- Question 3
select substr(Phone,1,3), count(customerid)
from customer
where state = 'CO'
group by substr(Phone,1,3)
order by count(customerid) desc;
/

-- Question 4
select substr(phone,1,3)
from customer
where state = 'CO'
group by substr(phone,1,3)
having count(customerid) =
(
select max(count(customerid))
from customer
where state = 'CO'
group by substr(phone,1,3));
/

-- Question 5
select custlastname || ', ' || custfirstname, city, state, phone
from customer
where substr(phone,1,3) = 
(
select substr(phone,1,3)
from customer
where state = 'CO'
group by substr(phone,1,3)
having count(customerid) =
(
select max(count(customerid))
from customer
where state = 'CO'
group by substr(phone,1,3)));
/

-- Question 6
/*
By identifying the area code for the largest number of customers in the state of CO, we can know how many customers are using an area code. 
Utilizing this in a business perspective, a multicommunication company might distribute area codes in CO in more varieties in order to reduce traffics in the largest amount of used area code. */
/

-- Question 7
select customer.customerid, count(*)
from customer 
inner join custorder 
on customer.customerid = custorder.customerid
where orderdate between '01-AUG-10' and '31-AUG-10'
group by customer.customerid
order by count(*) desc;
/

-- Question 8
select max(cnt) 
from (select customer.customerid, count(*) as cnt 
        from customer 
        inner join custorder on customer.customerid = custorder.customerid
        where orderdate between '01-AUG-10' and '31-AUG-10'
        group by customer.customerid);
/

-- Question 9
select count(*),customer.customerid 
from customer 
inner join custorder 
on customer.customerid = custorder.customerid 
where orderdate between '01-AUG-10' and '31-AUG-10'
group by customer.customerid 
having count(*)=(select max(cnt) 
                from (select customer.customerid, count(*) as cnt 
                from customer 
                inner join custorder 
                on customer.customerid = custorder.customerid 
                where orderdate between '01-AUG-10' and '31-AUG-10'
                group by customer.customerid));
/

-- Question 10
select count(*),customer.customerid 
from customer 
inner join custorder 
on customer.customerid = custorder.customerid 
where orderdate between '01-AUG-10' and '31-AUG-10'
group by customer.customerid 
having count(*) > (select avg(cnt) 
                    from (select customer.customerid, count(*) as cnt 
                    from customer 
                    inner join custorder 
                    on customer.customerid = custorder.customerid 
                    where orderdate between '01-AUG-10' and '31-AUG-10'
                    group by customer.customerid))
order by count(*) desc;
/

-- Question 11
select count(*),customer.customerid 
from customer 
inner join custorder 
on customer.customerid = custorder.customerid 
where orderdate between '01-AUG-10' and '31-AUG-10'
group by customer.customerid 
having count(*) < (select avg(cnt) 
from (select customer.customerid, count(*) as cnt 
        from customer inner join custorder 
        on customer.customerid = custorder.customerid 
        where orderdate between '01-AUG-10' and '31-AUG-10'
        group by customer.customerid))
order by count(*) asc;
/

-- Question 12
/*
Through the results of question number 10 and 11, the business can know which customer
is a curical customer to hold tight on due to their spending data. If customers spend 
more than average, the business might give a coupon to them but not to customers
who target below average number of orders. Gathering results in August might also 
gather information about grossing seasonal products that customers buy which can lead
businesses advertising more of the most ordered product to other customers. */
/

-- Question 13
select customer.customerid, companyname, custlastname || ', ' || custfirstname, to_char(orderdate, 'MM.DD.YYYY')
from customer 
inner join custorder
on customer.customerid = custorder.customerid
where state = 'IN' and orderdate between '01-JAN-2010' and '31-DEC-2010'
order by orderdate asc;
/

-- Question 14
select companyname, custtitle || ' ' || substr(custfirstname,1,1) || '. ' || custlastname,
orderdate, requireddate
from customer
inner join custorder
on customer.customerid = custorder.customerid
where custorder.customerid = 'C-300001'
order by orderdate asc;
/

-- Question 15
select orderid, inventorypart.partnumber, partdescription, unitprice, 
orderquantity, categoryname
from inventorypart
inner join custorderline
on inventorypart.partnumber = custorderline.partnumber
inner join category
on inventorypart.categoryid = category.categoryid
where partdescription = 'BOARD GAMES'
order by orderquantity desc;
/

-- Question 16
select custorder.orderid, custorderline.partnumber, partdescription, unitprice, orderquantity
from custorderline
inner join custorder
on custorderline.orderid = custorder.orderid
inner join inventorypart
on custorderline.partnumber = inventorypart.partnumber
where customerid = 'C-300001' and orderdate between '14-July-2010' and '14-July-2010'
order by orderquantity desc;
/

-- Question 17
select to_char(orderdate, 'MM.DD.YYYY'), custorderline.orderid, 
custorderline.partnumber, inventorypart.partdescription, unitprice, orderquantity
from custorderline
inner join custorder
on custorderline.orderid = custorder.orderid
inner join inventorypart
on custorderline.partnumber = inventorypart.partnumber
inner join customer
on custorder.customerid = customer.customerid
where custorder.orderdate between '01-JAN-2011' and '31-DEC-2011' 
AND companyname = 'Bankruptcy Help'
order by orderdate desc, orderquantity desc;
/

-- Question 18
select to_char(orderdate, 'MM.DD.YYYY'), custorderline.orderid, 
custorderline.partnumber, inventorypart.partdescription, unitprice*orderquantity AS LineItem
from custorderline
inner join custorder
on custorderline.orderid = custorder.orderid
inner join inventorypart
on custorderline.partnumber = inventorypart.partnumber
inner join customer
on custorder.customerid = customer.customerid
where custorder.orderdate between '01-JAN-2011' and '31-DEC-2011' 
AND companyname = 'Bankruptcy Help'
order by orderdate desc, orderquantity desc;
/

-- Question 19
select customer.customerid, companyname, 
custlastname || ', ' || custfirstname, count(orderid)
from customer
inner join custorder 
on customer.customerid = custorder.customerid
where orderdate between '01-JAN-2011' and '31-JAN-2011' and state = 'IN'
group by customer.customerid, companyname, custlastname || ', ' || custfirstname
order by count(orderid) asc;
/

-- Question 20
select categoryname, round(avg(stocklevel),2)
from inventorypart
inner join category
on inventorypart.categoryid = category.categoryid
group by categoryname
order by avg(stocklevel) asc;
/

-- Question 21
select categoryname || ': ' || description as Categorydetail, count(Partnumber) AS NumberofPart
from category
inner join inventorypart
on category.categoryid = inventorypart.categoryid
group by  categoryname || ': ' || description
order by count(Partnumber) asc;
/

-- Question 22
select max(weight)
from inventorypart
inner join category
on inventorypart.categoryid = category.categoryid
where categoryname = 'Software';
/

-- Question 23
select max(weight), categoryname
from inventorypart
inner join category
on inventorypart.categoryid = category.categoryid
where categoryname = 'Software' or categoryname = 'Power' or categoryname = 'Storage'
group by categoryname
order by categoryname asc;
/

-- Question 24
select weight, categoryname, partdescription
from category 
inner join inventorypart
on category.categoryid = inventorypart.categoryid
where (categoryname, weight) in
(select categoryname, max(weight)
from category inner join inventorypart
on category.categoryid = inventorypart.categoryid
where categoryname in ('Software', 'Power', 'Storage')
group by categoryname)
order by categoryname asc;
/

-- Question 25
/* We can make it run faster by using an IN operator rather than a OR condition in a JOIN
and we can avoid using nester queries.*/


/* Results
Question 1
5. SELECT NAME, COUNT(*), AVG(RATING)
1. FROM BOOKSHELF
2. WHERE RATING>1
3. GROUP BY CATEGORY_NAME
4. HAVING CATEGORY_NAME LIKE ‘A%’
6. ORDER BY COUNT(*);

Question 2
SUB
---
719
970
728
644
720

Question 3
SUB COUNT(CUSTOMERID)
--- -----------------
719                 4
970                 2
644                 1
720                 1
728                 1

Question 4
SUB
---
719

Question 5
CUSTLASTNAME||','||CUSTFIRSTNAME      CITY                 ST PHONE       
------------------------------------- -------------------- -- ------------
Kaakeh, Paul                          Gunnison             CO 719-750-4539
Smith, Matt                           Montrose             CO 719-822-8828
Rice, Paul                            Craig                CO 719-541-1837
Rodkey, Daniel                        Lamar                CO 719-748-3205

Question 6
By identifying the area code for the largest number of customers in the state of CO, we can know how many customers are using an area code. 
Utilizing this in a business perspective, a multicommunication company might distribute area codes in CO in more varieties in order to reduce traffics in the largest amount of used area code.

Question 7
CUSTOMERID   COUNT(*)
---------- ----------
C-300006            3
I-300016            2
C-300041            2
C-300031            2
I-300015            2
C-300055            2
I-300010            2
C-300005            2
C-300027            2
I-300014            2
I-300070            1

CUSTOMERID   COUNT(*)
---------- ----------
C-300017            1
I-300031            1
I-300126            1
C-300001            1
I-300091            1
I-300020            1
C-300011            1
I-300069            1
C-300033            1
I-300024            1
I-300117            1

CUSTOMERID   COUNT(*)
---------- ----------
C-300002            1
I-300132            1
I-300005            1
C-300010            1
I-300122            1
C-300013            1
C-300053            1
I-300068            1
C-300020            1
I-300096            1
I-300120            1

CUSTOMERID   COUNT(*)
---------- ----------
I-300112            1
I-300115            1
I-300076            1
C-300035            1
I-300012            1
I-300095            1
I-300017            1
I-300026            1
I-300042            1
I-300097            1
I-300093            1

CUSTOMERID   COUNT(*)
---------- ----------
I-300102            1
I-300007            1
I-300138            1
I-300043            1
I-300108            1
I-300044            1
I-300110            1
C-300051            1
I-300009            1
C-300004            1
C-300026            1

CUSTOMERID   COUNT(*)
---------- ----------
C-300003            1
I-300004            1
I-300025            1
I-300129            1
I-300002            1
I-300011            1
I-300081            1
I-300088            1
I-300013            1
I-300061            1
I-300018            1

66 rows selected. 

Question 8
  MAX(CNT)
----------
         3

Question 9
  COUNT(*) CUSTOMERID
---------- ----------
         3 C-300006  

Question 10
  COUNT(*) CUSTOMERID
---------- ----------
         3 C-300006  
         2 I-300016  
         2 C-300041  
         2 C-300031  
         2 I-300015  
         2 C-300055  
         2 I-300010  
         2 C-300005  
         2 C-300027  
         2 I-300014  

10 rows selected. 

Question 11
  COUNT(*) CUSTOMERID
---------- ----------
         1 I-300070  
         1 I-300018  
         1 I-300031  
         1 I-300126  
         1 C-300001  
         1 I-300091  
         1 I-300020  
         1 C-300011  
         1 I-300069  
         1 C-300033  
         1 I-300024  

  COUNT(*) CUSTOMERID
---------- ----------
         1 I-300117  
         1 C-300002  
         1 I-300132  
         1 I-300005  
         1 C-300010  
         1 I-300122  
         1 C-300013  
         1 C-300053  
         1 I-300068  
         1 C-300020  
         1 I-300096  

  COUNT(*) CUSTOMERID
---------- ----------
         1 I-300120  
         1 I-300112  
         1 I-300115  
         1 I-300076  
         1 C-300035  
         1 I-300012  
         1 I-300095  
         1 I-300017  
         1 I-300026  
         1 I-300042  
         1 I-300097  

  COUNT(*) CUSTOMERID
---------- ----------
         1 I-300093  
         1 I-300102  
         1 I-300007  
         1 I-300138  
         1 I-300043  
         1 I-300108  
         1 I-300044  
         1 I-300110  
         1 C-300051  
         1 I-300009  
         1 C-300004  

  COUNT(*) CUSTOMERID
---------- ----------
         1 C-300026  
         1 C-300003  
         1 I-300004  
         1 I-300025  
         1 I-300129  
         1 I-300002  
         1 I-300011  
         1 I-300081  
         1 I-300088  
         1 I-300013  
         1 I-300061  

  COUNT(*) CUSTOMERID
---------- ----------
         1 C-300017  

56 rows selected. 

Question 12
Through the results of question number 10 and 11, the business can know which customer
is a curical customer to hold tight on due to their spending data. If customers spend 
more than average, the business might give a coupon to them but not to customers
who target below average number of orders. Gathering results in August might also 
gather information about grossing seasonal products that customers buy which can lead
businesses advertising more of the most ordered product to other customers. 

Question 13
CUSTOMERID COMPANYNAME                              CUSTLASTNAME||','||CUSTFIRSTNAME      TO_CHAR(OR
---------- ---------------------------------------- ------------------------------------- ----------
C-300001   Baker and Company                        Abbott, Gregory                       07.08.2010
C-300001   Baker and Company                        Abbott, Gregory                       07.14.2010
C-300001   Baker and Company                        Abbott, Gregory                       08.13.2010
I-300030                                            Quintero, Eric                        09.15.2010
C-300014   R and R Air                              Bending, Cathy                        10.04.2010
C-300001   Baker and Company                        Abbott, Gregory                       12.02.2010
I-300147                                            Yaun, Steven                          12.07.2010

7 rows selected. 

Question 14
COMPANYNAME                              CUSTTITLE||''||SUBSTR(CUSTFIR ORDERDATE REQUIREDD
---------------------------------------- ----------------------------- --------- ---------
Baker and Company                        Mr. G. Abbott                 08-JUL-10 12-JUL-10
Baker and Company                        Mr. G. Abbott                 14-JUL-10 15-JUL-10
Baker and Company                        Mr. G. Abbott                 13-AUG-10 20-AUG-10
Baker and Company                        Mr. G. Abbott                 02-DEC-10 08-DEC-10
Baker and Company                        Mr. G. Abbott                 27-JAN-11 03-FEB-11
Baker and Company                        Mr. G. Abbott                 24-FEB-11 03-MAR-11
Baker and Company                        Mr. G. Abbott                 10-MAR-11 15-MAR-11

7 rows selected. 

Question 15
ORDERID    PARTNUMBER PARTDESCRIPTION                                     UNITPRICE ORDERQUANTITY CATEGORYNAME                  
---------- ---------- -------------------------------------------------- ---------- ------------- ------------------------------
2001000536 SFT-005    BOARD GAMES                                              9.99            15 Software                      
2000000050 SFT-005    BOARD GAMES                                              9.99            14 Software                      
2000000279 SFT-005    BOARD GAMES                                              9.99            10 Software                      
2000000426 SFT-005    BOARD GAMES                                              9.99            10 Software                      
2000000348 SFT-005    BOARD GAMES                                              9.99             2 Software                      
2000000139 SFT-005    BOARD GAMES                                              9.99             2 Software                      
2000000005 SFT-005    BOARD GAMES                                              9.99             1 Software                      
2000000040 SFT-005    BOARD GAMES                                              9.99             1 Software                      
2001000722 SFT-005    BOARD GAMES                                              9.99             1 Software                      
2000000362 SFT-005    BOARD GAMES                                              9.99             1 Software                      
2000000011 SFT-005    BOARD GAMES                                              9.99             1 Software                      

ORDERID    PARTNUMBER PARTDESCRIPTION                                     UNITPRICE ORDERQUANTITY CATEGORYNAME                  
---------- ---------- -------------------------------------------------- ---------- ------------- ------------------------------
2000000436 SFT-005    BOARD GAMES                                              9.99             1 Software                      
2000000206 SFT-005    BOARD GAMES                                              9.99             1 Software                      
2001000600 SFT-005    BOARD GAMES                                              9.99             1 Software                      

14 rows selected. 

Question 16
ORDERID    PARTNUMBER PARTDESCRIPTION                                     UNITPRICE ORDERQUANTITY
---------- ---------- -------------------------------------------------- ---------- -------------
2000000032 BRK-011    2ND PARALLEL PORT                                        5.99            20
2000000032 CTR-019    FLY XPST                                              1717.99             9
2000000032 ADT-003    EXTERNAL SCSI-3 MALE TERMINATOR                         39.99             8
2000000032 CAB-027    2FT 3/1 SCSI CABLE                                      44.99             6
2000000032 SCN-002    SCANJET BUSINESS SERIES COLOR SCANNER                     249             4

Question 17
TO_CHAR(OR ORDERID    PARTNUMBER PARTDESCRIPTION                                     UNITPRICE ORDERQUANTITY
---------- ---------- ---------- -------------------------------------------------- ---------- -------------
03.22.2011 2001000778 BRK-002    1X4 USB CABLE AND BRACKET                                9.99            20
03.22.2011 2001000778 MEM-004    30.7GB HARD DRIVE                                      269.99            10
03.22.2011 2001000778 P-006      600 PENTIUM III PROCESSOR                              339.99             6
02.28.2011 2001000699 MOD-002    112K DUAL MODEM                                         89.99            16
02.28.2011 2001000699 MEM-001    2MB FLASH BUFFER MEMORY                                259.95            12
02.28.2011 2001000699 PRT-003    LASER JET 2500SE                                          699             3
02.24.2011 2001000676 MIC-009    WHEEL MOUSE                                              29.5            27
02.14.2011 2001000622 BB-004     SOCKET MINI BAREBONE                                   199.99             6
02.14.2011 2001000622 P-005      700 PENTIUM III PROCESSOR                              399.99             4

9 rows selected. 

Question 18
TO_CHAR(OR ORDERID    PARTNUMBER PARTDESCRIPTION                                      LINEITEM
---------- ---------- ---------- -------------------------------------------------- ----------
03.22.2011 2001000778 BRK-002    1X4 USB CABLE AND BRACKET                               199.8
03.22.2011 2001000778 MEM-004    30.7GB HARD DRIVE                                      2699.9
03.22.2011 2001000778 P-006      600 PENTIUM III PROCESSOR                             2039.94
02.28.2011 2001000699 MOD-002    112K DUAL MODEM                                       1439.84
02.28.2011 2001000699 MEM-001    2MB FLASH BUFFER MEMORY                                3119.4
02.28.2011 2001000699 PRT-003    LASER JET 2500SE                                         2097
02.24.2011 2001000676 MIC-009    WHEEL MOUSE                                             796.5
02.14.2011 2001000622 BB-004     SOCKET MINI BAREBONE                                  1199.94
02.14.2011 2001000622 P-005      700 PENTIUM III PROCESSOR                             1599.96

9 rows selected. 

Question 19
CUSTOMERID COMPANYNAME                              CUSTLASTNAME||','||CUSTFIRSTNAME      COUNT(ORDERID)
---------- ---------------------------------------- ------------------------------------- --------------
C-300014   R and R Air                              Bending, Cathy                                     1
C-300001   Baker and Company                        Abbott, Gregory                                    1
I-300030                                            Quintero, Eric                                     2

Question 20
CATEGORYNAME                   ROUND(AVG(STOCKLEVEL),2)
------------------------------ ------------------------
Computers                                          2.45
Accessories                                        9.21
Power                                              10.5
Storage                                           20.47
Basics                                             20.5
Processors                                        23.74
Software                                          33.89
Cables                                            35.86

8 rows selected. 

Question 21
CATEGORYDETAIL                                                                                                                       NUMBEROFPART
------------------------------------------------------------------------------------------------------------------------------------ ------------
Power: Power Supplies                                                                                                                           4
Software: Games, maps                                                                                                                           9
Accessories: Scanners, Printers, Modems                                                                                                        14
Processors: Athlon, Celeron, Pentium, Fans                                                                                                     19
Storage: CD-ROM, DVD, Hard Drives, Memory                                                                                                      19
Computers: Assembled Computers                                                                                                                 29
Cables: Printer, Keyboard, Internal, SCSI, Connectors, Brackets                                                                                36
Basics: Casing, Barebone, Monitors, Keyboards, Mice                                                                                            44

8 rows selected. 

Question 22
MAX(WEIGHT)
-----------
       .438

Question 23
MAX(WEIGHT) CATEGORYNAME                  
----------- ------------------------------
          3 Power                         
       .438 Software                      
          4 Storage                       

Question 24
CATEGORYNAME                       WEIGHT PARTDESCRIPTION                                   
------------------------------ ---------- --------------------------------------------------
Power                                   3 250 WATT POWER SUPPLY                             
Power                                   3 300 WATT POWER SUPPLY                             
Software                             .438 BOARD GAMES                                       
Software                             .438 DESKTOP PUBLISHER                                 
Storage                                 4 ETHERNET FIBER OPTIC MINI-TRANSCEIVER                                                                        

Question 25
We can make it run faster by using an IN operator rather than a OR condition in a JOIN
and we can avoid using nester queries
*/