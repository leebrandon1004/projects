--Question 1
select distinct substr(Phone,1,3) 
from customer
where state='CO';
/

--Question 2
select substr(Phone,1,3),count(customerid)
from customer 
where state ='CO'
group by substr(Phone,1,3)
order by count(customerid) desc;
/

--Question 3
select substr(Phone,1,3) as Phone
from customer
where state ='CO'
group by substr(phone,1,3)
having count(customerid) = 
    (select MAX(max) 
    from (select substr(phone,1,3), 
        count(customerid) as max
from customer 
where state ='CO'
group by substr(Phone,1,3)));
/

--Question 4
select substr(Phone,1,3), phone, city, state, custlastname || ', ' || custfirstname
from customer
where substr(phone,1,3) = '719'
group by customerID, custlastname || ', ' || custfirstname, phone, city, state;
/

--Question 5 

/

--Question 6
select customer.customerid, count(*)
from customer 
inner join custorder 
on customer.customerid = custorder.customerid
where orderdate between '01-AUG-10' and '31-AUG-10'
group by customer.customerid
order by count(*) desc;
/

--Question 7
select max(cnt) 
from (select customer.customerid, count(*) as cnt 
        from customer 
        inner join custorder on customer.customerid = custorder.customerid
        where orderdate between '01-AUG-10' and '31-AUG-10'
        group by customer.customerid);
/

--Question 8
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

--Question 9
select avg(cnt) 
from (select customer.customerid, count(*) as cnt 
        from customer 
        inner join custorder 
        on customer.customerid = custorder.customerid
        where orderdate between '01-AUG-10' and '31-AUG-10'
        group by customer.customerid);
/

--Question 10
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

--Question 11
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

--Question 12

/

--Question 13
select customer.customerid, companyname, custlastname
|| ', ' || custfirstname, to_char(orderdate, 'MM.DD.YYYY')
from customer
inner join custorder
on customer.customerid = custorder.customerid
where state = 'IN' and orderdate between '01-JAN-2010' and '31-DEC-2010'
order by orderdate desc;
/

--Question 14
select companyname, custtitle || ' ' || substr(custfirstname,1,1) || '. ' || custlastname,
orderdate, requireddate
from customer
inner join custorder
on customer.customerid = custorder.customerid
where custorder.customerid = 'C-300001'
order by orderdate desc;
/

--Question 15
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

--Question 16
select custorder.orderid, custorderline.partnumber, partdescription, unitprice, orderquantity
from custorderline
inner join custorder
on custorderline.orderid = custorder.orderid
inner join inventorypart
on custorderline.partnumber = inventorypart.partnumber
where customerid = 'C-300001' and orderdate between '14-July-2010' and '14-July-2010'
order by orderquantity desc;
/

--Question 17
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
order by orderdate asc, orderquantity desc;
/

--Question 18
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
order by orderdate asc, orderquantity desc;
/

--Question 19
select custorder.customerid, companyname, 
custlastname || ', ' || custfirstname, count(orderquantity) AS NumberofOrder
from custorder
inner join customer 
on custorder.customerid = customer.customerid
inner join custorderline
on custorder.orderid = custorderline.orderid
where orderdate between '01-JAN-2011' and '31-JAN-2011' and state = 'IN'
group by companyname, custorder.customerid, custlastname || ', ' || custfirstname
order by count(orderquantity) asc;
/

--Question 20
select categoryname, round(avg(stocklevel),2)
from inventorypart
inner join category
on inventorypart.categoryid = category.categoryid
group by categoryname
order by avg(stocklevel) asc;
/

--Question 21
select categoryname || ': ' || description, count(Partnumber) AS NumberofPart
from category
inner join inventorypart
on category.categoryid = inventorypart.categoryid
group by  categoryname || ': ' || description
order by count(Partnumber) asc;
/

--Question 22
select max(weight)
from inventorypart
inner join category
on inventorypart.categoryid = category.categoryid
where categoryname = 'Software';

/

--Question 23
select max(weight), categoryname
from inventorypart
inner join category
on inventorypart.categoryid = category.categoryid
where categoryname = 'Software' or categoryname = 'Power' or categoryname = 'Storage'
group by categoryname
order by categoryname asc;
/

--Question 24
select max(weight), categoryname, description
from inventorypart
inner join category
on inventorypart.categoryid = category.categoryid
where categoryname = 'Software' or categoryname = 'Power' or categoryname = 'Storage'
group by categoryname, description
order by categoryname asc;
/

/* RESULTS

Question 1
SUB
---
728
970
720
644
719

Question 2
SUB COUNT(CUSTOMERID)
--- -----------------
719                 4
970                 2
644                 1
728                 1
720                 1

Question 3 (Referenced Alex Choi)
PHO
---
719

Question 4 
SUB PHONE        CITY                 ST CUSTLASTNAME||','||CUSTFIRSTNAME     
--- ------------ -------------------- -- -------------------------------------
719 719-822-8828 Montrose             CO Smith, Matt                          
719 719-748-3205 Lamar                CO Rodkey, Daniel                       
719 719-750-4539 Gunnison             CO Kaakeh, Paul                         
719 719-541-1837 Craig                CO Rice, Paul                           



Question 5
By knowing the results to the customer's name, city and state of the most used
area code we can know who and where the area code is used at. In business implications,
communication businesses can find which customers to contact where there is a notification about the 
area code or to gather data about their customers or they might want to use another area 
code due to the overwhelming number of customers in the same area code. 

Question 6
CUSTOMERID   COUNT(*)
---------- ----------
C-300006            3
I-300010            2
I-300016            2
I-300014            2
C-300055            2
C-300041            2
C-300031            2
I-300015            2
C-300027            2
C-300005            2
C-300003            1

CUSTOMERID   COUNT(*)
---------- ----------
I-300004            1
I-300007            1
I-300043            1
I-300108            1
I-300110            1
I-300031            1
C-300053            1
I-300070            1
I-300068            1
I-300093            1
C-300017            1

CUSTOMERID   COUNT(*)
---------- ----------
I-300061            1
C-300051            1
C-300004            1
I-300042            1
I-300091            1
I-300088            1
C-300011            1
I-300017            1
C-300010            1
I-300132            1
I-300076            1

CUSTOMERID   COUNT(*)
---------- ----------
I-300020            1
I-300095            1
I-300120            1
I-300129            1
I-300002            1
C-300002            1
I-300026            1
I-300097            1
C-300001            1
C-300026            1
I-300126            1

CUSTOMERID   COUNT(*)
---------- ----------
I-300081            1
I-300012            1
I-300013            1
I-300138            1
I-300115            1
I-300122            1
I-300009            1
C-300013            1
C-300020            1
I-300102            1
I-300096            1

CUSTOMERID   COUNT(*)
---------- ----------
C-300033            1
I-300044            1
I-300112            1
I-300011            1
C-300035            1
I-300005            1
I-300069            1
I-300024            1
I-300018            1
I-300117            1
I-300025            1

66 rows selected. 

Question 7
  MAX(CNT)
----------
         3

Question 8 (Referenced Alex Choi)
  COUNT(*) CUSTOMERID
---------- ----------
         3 C-300006  

Question 9
  AVG(CNT)
----------
1.16666667

Question 10 (Referenced Alex Choi)
  COUNT(*) CUSTOMERID
---------- ----------
         3 C-300006  
         2 I-300010  
         2 I-300016  
         2 I-300014  
         2 C-300055  
         2 C-300041  
         2 C-300031  
         2 I-300015  
         2 C-300027  
         2 C-300005  

10 rows selected. 



Question 11 (Referenced Alex Choi)
  COUNT(*) CUSTOMERID
---------- ----------
         1 C-300003  
         1 I-300025  
         1 I-300007  
         1 I-300043  
         1 I-300108  
         1 I-300110  
         1 I-300031  
         1 C-300053  
         1 I-300070  
         1 I-300068  
         1 I-300093  

  COUNT(*) CUSTOMERID
---------- ----------
         1 C-300017  
         1 I-300061  
         1 C-300051  
         1 C-300004  
         1 I-300042  
         1 I-300091  
         1 I-300088  
         1 C-300011  
         1 I-300017  
         1 C-300010  
         1 I-300132  

  COUNT(*) CUSTOMERID
---------- ----------
         1 I-300076  
         1 I-300020  
         1 I-300095  
         1 I-300120  
         1 I-300129  
         1 I-300002  
         1 C-300002  
         1 I-300026  
         1 I-300097  
         1 C-300001  
         1 C-300026  

  COUNT(*) CUSTOMERID
---------- ----------
         1 I-300126  
         1 I-300081  
         1 I-300012  
         1 I-300013  
         1 I-300138  
         1 I-300115  
         1 I-300122  
         1 I-300009  
         1 C-300013  
         1 C-300020  
         1 I-300102  

  COUNT(*) CUSTOMERID
---------- ----------
         1 I-300096  
         1 C-300033  
         1 I-300044  
         1 I-300112  
         1 I-300011  
         1 C-300035  
         1 I-300005  
         1 I-300069  
         1 I-300024  
         1 I-300018  
         1 I-300117  

  COUNT(*) CUSTOMERID
---------- ----------
         1 I-300004  

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
I-300147                                            Yaun, Steven                          12.07.2010
C-300001   Baker and Company                        Abbott, Gregory                       12.02.2010
C-300014   R and R Air                              Bending, Cathy                        10.04.2010
I-300030                                            Quintero, Eric                        09.15.2010
C-300001   Baker and Company                        Abbott, Gregory                       08.13.2010
C-300001   Baker and Company                        Abbott, Gregory                       07.14.2010
C-300001   Baker and Company                        Abbott, Gregory                       07.08.2010

7 rows selected. 

Question 14
COMPANYNAME                              CUSTTITLE||''||SUBSTR(CUSTFIR ORDERDATE REQUIREDD
---------------------------------------- ----------------------------- --------- ---------
Baker and Company                        Mr. G. Abbott                 10-MAR-11 15-MAR-11
Baker and Company                        Mr. G. Abbott                 24-FEB-11 03-MAR-11
Baker and Company                        Mr. G. Abbott                 27-JAN-11 03-FEB-11
Baker and Company                        Mr. G. Abbott                 02-DEC-10 08-DEC-10
Baker and Company                        Mr. G. Abbott                 13-AUG-10 20-AUG-10
Baker and Company                        Mr. G. Abbott                 14-JUL-10 15-JUL-10
Baker and Company                        Mr. G. Abbott                 08-JUL-10 12-JUL-10

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
2000000436 SFT-005    BOARD GAMES                                              9.99             1 Software                      
2000000206 SFT-005    BOARD GAMES                                              9.99             1 Software                      
2001000722 SFT-005    BOARD GAMES                                              9.99             1 Software                      
2000000362 SFT-005    BOARD GAMES                                              9.99             1 Software                      
2000000005 SFT-005    BOARD GAMES                                              9.99             1 Software                      

ORDERID    PARTNUMBER PARTDESCRIPTION                                     UNITPRICE ORDERQUANTITY CATEGORYNAME                  
---------- ---------- -------------------------------------------------- ---------- ------------- ------------------------------
2000000040 SFT-005    BOARD GAMES                                              9.99             1 Software                      
2000000011 SFT-005    BOARD GAMES                                              9.99             1 Software                      
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
02.14.2011 2001000622 BB-004     SOCKET MINI BAREBONE                                   199.99             6
02.14.2011 2001000622 P-005      700 PENTIUM III PROCESSOR                              399.99             4
02.24.2011 2001000676 MIC-009    WHEEL MOUSE                                              29.5            27
02.28.2011 2001000699 MOD-002    112K DUAL MODEM                                         89.99            16
02.28.2011 2001000699 MEM-001    2MB FLASH BUFFER MEMORY                                259.95            12
02.28.2011 2001000699 PRT-003    LASER JET 2500SE                                          699             3
03.22.2011 2001000778 BRK-002    1X4 USB CABLE AND BRACKET                                9.99            20
03.22.2011 2001000778 MEM-004    30.7GB HARD DRIVE                                      269.99            10
03.22.2011 2001000778 P-006      600 PENTIUM III PROCESSOR                              339.99             6

9 rows selected. 

Question 18
TO_CHAR(OR ORDERID    PARTNUMBER PARTDESCRIPTION                                      LINEITEM
---------- ---------- ---------- -------------------------------------------------- ----------
02.14.2011 2001000622 BB-004     SOCKET MINI BAREBONE                                  1199.94
02.14.2011 2001000622 P-005      700 PENTIUM III PROCESSOR                             1599.96
02.24.2011 2001000676 MIC-009    WHEEL MOUSE                                             796.5
02.28.2011 2001000699 MOD-002    112K DUAL MODEM                                       1439.84
02.28.2011 2001000699 MEM-001    2MB FLASH BUFFER MEMORY                                3119.4
02.28.2011 2001000699 PRT-003    LASER JET 2500SE                                         2097
03.22.2011 2001000778 BRK-002    1X4 USB CABLE AND BRACKET                               199.8
03.22.2011 2001000778 MEM-004    30.7GB HARD DRIVE                                      2699.9
03.22.2011 2001000778 P-006      600 PENTIUM III PROCESSOR                             2039.94

9 rows selected. 

Question 19
CUSTOMERID COMPANYNAME                              CUSTLASTNAME||','||CUSTFIRSTNAME      NUMBEROFORDER
---------- ---------------------------------------- ------------------------------------- -------------
C-300014   R and R Air                              Bending, Cathy                                    1
C-300001   Baker and Company                        Abbott, Gregory                                   2
I-300030                                            Quintero, Eric                                    5

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
CATEGORYNAME||':'||DESCRIPTION                                                                                                       NUMBEROFPART
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
MAX(WEIGHT) CATEGORYNAME                   DESCRIPTION                                                                                         
----------- ------------------------------ ----------------------------------------------------------------------------------------------------
          3 Power                          Power Supplies                                                                                      
       .438 Software                       Games, maps                                                                                         
          4 Storage                        CD-ROM, DVD, Hard Drives, Memory                                                                    

