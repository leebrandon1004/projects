--1
select inventorypart.partnumber, partdescription, round(avg(orderquantity),1)
from inventorypart
inner join custorderline
on inventorypart.partnumber = custorderline.partnumber
where categoryid = 'ACCESS'
group by inventorypart.partnumber, partdescription;
/

--2a 
select to_char(orderdate, 'YYYY-MM'), round(avg(orderquantity),1)
from custorder
inner join custorderline
on custorder.orderid = custorderline.orderid
where partnumber = 'DVD-001'
group by to_char(orderdate, 'YYYY-MM')
order by to_char(orderdate, 'YYYY-MM') desc;
/

--3a
select to_char(orderdate, 'MM-YYYY'), round(sum(orderquantity),1)
from custorder
inner join custorderline
on custorder.orderid = custorderline.orderid
where partnumber = 'DVD-001'
group by to_char(orderdate, 'MM-YYYY');
/

--3b
select to_char(orderdate, 'MM-YYYY'), round(sum(orderquantity),1)
from custorder
inner join custorderline
on custorder.orderid = custorderline.orderid
where partnumber = 'DVD-001'
group by to_char(orderdate, 'MM-YYYY')
order by to_char(orderdate, 'MM-YYYY') desc;
/

--4
select to_char(orderdate,'MM-YYYY'), count(orderquantity)
from custorder
inner join custorderline
on custorder.orderid = custorderline.orderid
where partnumber = 'DVD-001'
group by to_char(orderdate, 'MM-YYYY')
order by to_char(orderdate, 'MM-YYYY') desc;
/

--6a
select shipment.orderid, shipment.shipmentid, shippeditem.packagenumber, shippeddate, shipname, shipaddress
from shipment
inner join shippeditem
on shipment.orderid = shippeditem.orderid
inner join packingslip
on shippeditem.shipmentid = packingslip.shipmentid
where shipment.orderid = '2000000007';
/

--7a
select custlastname || ', ' || custfirstname, customer.customerid, orderid
from customer
left join custorder
on customer.customerid = custorder.customerid
where state = 'PA';
/

--7b
select custlastname || ', ' || custfirstname, customer.customerid, orderid
from custorder
right join customer
on custorder.customerid = customer.customerid
where state = 'PA' AND companyname is null
/

--8
select partnumber, categoryname
from category
full outer join inventorypart
on category.categoryid = inventorypart.categoryid;
/

--9a
select custfirstname || ' ' || custlastname, customer.customerid, orderdate, shippeditem.shipmentid, shippeditem.packagenumber, shipname, shippeddate
from customer
full outer join custorder
on customer.customerid = custorder.customerid
full outer join shippeditem
on custorder.orderid = shippeditem.orderid
full outer join packingslip
on shippeditem.shipmentid = packingslip.shipmentid
full outer join shipment
on packingslip.shipmentid = shipment.shipmentid
where custorder.orderid = '2001000807';
/

--9b
select custfirstname || ' ' || custlastname, customer.customerid, orderdate, shippeditem.shipmentid, shipname
from customer
full outer join custorder
on customer.customerid = custorder.customerid
full outer join shippeditem
on custorder.orderid = shippeditem.orderid
full outer join packingslip
on shippeditem.shipmentid = packingslip.shipmentid
full outer join shipment
on packingslip.shipmentid = shipment.shipmentid
where shippeddate is null;
/

--10a
select customerid
from customer
where state = 'PA'
intersect
select customerid
from custorder;
/

--10b
select customerid
from customer
where state = 'PA'
minus
select customerid
from custorder;
/

--10c
select customerid
from customer 
where state = 'PA'
intersect
select customerid
from custorder
where orderdate between '01-JAN-2011' AND '31-DEC-2011';
/

--10d
select customerid
from customer
where state = 'PA'
minus
select customerid
from custorder
where orderdate between '01-JAN-2011' AND '31-DEC-2011';
/

--11a
select partnumber
from inventorypart
where categoryid = 'CAB'
intersect
select partnumber
from custorderline;
/

--11b
select partnumber
from inventorypart
where categoryid = 'CAB'
minus 
select partnumber
from custorderline;
/

--11c
select partnumber
from inventorypart
where categoryid = 'CAB'
intersect
select partnumber
from custorderline
inner join custorder
on custorderline.orderid = custorder.orderid
where to_char(orderdate, 'YYYY') = '2010';
/

--11d
select partnumber
from inventorypart
where categoryid = 'CAB'
minus 
select partnumber
from custorderline
inner join custorder
on custorderline.orderid = custorder.orderid
where to_char(orderdate, 'YYYY') = '2010';

--12a
select custfirstname as FN, custlastname as LN
from customer 
where state = 'FL'
union
select firstname as FN, lastname as LN
from employee
order by FN, LN asc;
/

--12b
select custfirstname as FN, custlastname as LN
from customer 
where state = 'FL'
union all
select firstname as FN, lastname as LN
from employee
order by FN, LN asc;
/

--13a
select custfirstname || ' ' || custlastname || ', ' || companyname, custorder.customerid, custorder.orderid
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
--13b











