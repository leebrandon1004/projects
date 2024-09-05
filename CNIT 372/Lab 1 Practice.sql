--2
select distinct substr(phone,1,3)
from customer
where state = 'CO';
/

--3
select substr(phone,1,3), count(*)
from customer
where state = 'CO'
group by substr(phone,1,3);
/

--4
select substr(phone,1,3)
from customer
where state = 'CO'
group by substr(phone,1,3)
having count(customerid) = 
    (select max(count(customerid))
    from customer
    where state = 'CO'
    group by substr(phone,1,3))
/

--5
select custlastname || ', ' || custfirstname, city, state, phone
from customer
where substr(phone,1,3) =
    (select substr(phone,1,3)
    from customer
    where state = 'CO'
    group by substr(phone,1,3)
    having count(customerid) = 
        (select max(count(customerid))
        from customer
        where state = 'CO'
        group by substr(phone,1,3)));
/

--7
select customer.customerid, count(*)
from customer
inner join custorder
on customer.customerid = custorder.customerid
where custorder.orderdate between '01-AUG-10' and '31-AUG-10'
group by customer.customerid
order by count(*) desc;
/

--8
select max(count(*))
from customer
inner join custorder
on customer.customerid = custorder.customerid
where custorder.orderdate between '01-AUG-10' and '31-AUG-10'
group by customer.customerid
/

--9
select customer.customerid, count(*)
from customer
inner join custorder
on customer.customerid = custorder.customerid
where custorder.orderdate between '01-AUG-10' and '31-AUG-10'
group by customer.customerid
having count(*) = 
    (select max(count(*))
    from customer
    inner join custorder
    on customer.customerid = custorder.customerid
    where custorder.orderdate between '01-AUG-10' and '31-AUG-10'
    group by customer.customerid)
/

--10
select customer.customerid, count(*)
from customer
inner join custorder
on customer.customerid = custorder.customerid
where custorder.orderdate between '01-AUG-10' and '31-AUG-10'
group by customer.customerid
having count(*) >
    (select avg(count(*))
    from customer
    inner join custorder
    on customer.customerid = custorder.customerid
    where custorder.orderdate between '01-AUG-10' and '31-AUG-10'
    group by customer.customerid);
/

--11
select customer.customerid, count(*)
from customer
inner join custorder
on customer.customerid = custorder.customerid
where custorder.orderdate between '01-AUG-10' and '31-AUG-10'
group by customer.customerid
having count(*) <
    (select avg(count(*))
    from customer
    inner join custorder
    on customer.customerid = custorder.customerid
    where custorder.orderdate between '01-AUG-10' and '31-AUG-10'
    group by customer.customerid);
/

--13
select customer.customerid, companyname, custlastname || ', ' || custfirstname, to_char(orderdate, 'MM.DD.YYYY')
from customer
inner join custorder
on customer.customerid = custorder.customerid
where state = 'IN' AND orderdate between '01-JAN-2010' and '31-DEC-2010'
order by orderdate asc;
/

--14
select companyname, custtitle || ' ' || substr(custfirstname,1,1) || '. ' || custlastname, orderdate, requireddate
from customer
inner join custorder
on customer.customerid = custorder.customerid
where custorder.customerid = 'C-300001'
order by orderdate asc;
/

--15
select orderid, custorderline.partnumber, partdescription, unitprice, orderquantity, categoryname
from custorderline
inner join inventorypart
on custorderline.partnumber = inventorypart.partnumber
inner join category
on inventorypart.categoryid = category.categoryid
where partdescription = 'BOARD GAMES'
order by orderquantity desc;
/

--16
select custorder.orderid, custorderline.partnumber, partdescription, unitprice, orderquantity, categoryname
from custorder
inner join custorderline
on custorder.orderid = custorderline.orderid
inner join inventorypart
on custorderline.partnumber = inventorypart.partnumber
inner join category
on inventorypart.categoryid = category.categoryid
where customerid = 'C-300001' and orderdate = '14-JUL-10';
/

--19
select to_char(orderdate, 'MM.DD.YYY'), custorder.orderid, custorderline.partnumber, partdescription, unitprice * orderquantity AS LineItemTotal
from customer
inner join custorder
on customer.customerid = custorder.customerid
inner join custorderline
on custorder.orderid = custorderline.orderid
inner join inventorypart
on custorderline.partnumber = inventorypart.partnumber
where state = 'IN' AND orderdate between '01-JAN-11' and '31-JAN-11';
/

--20
select categoryname, round(avg(stocklevel),2) as average
from inventorypart
inner join category
on inventorypart.categoryid = category.categoryid
group by categoryname
order by average asc;

--21
select categoryname || ': ' || description, count(partnumber) as numberofpart
from category
inner join inventorypart
on category.categoryid = inventorypart.categoryid
group by categoryname || ': ' || description
order by numberofpart asc;

--22
select max(weight)
from inventorypart
inner join category
on inventorypart.categoryid = inventorypart.categoryid
where categoryname = 'Software';

-23
select categoryname, max(weight)
from inventorypart
inner join category
on inventorypart.categoryid = inventorypart.categoryid
where categoryname = 'Software' OR categoryname = 'Power' OR categoryname = 'Storage'
group by categoryname
order by max(weight) asc;

-24
select categoryname, weight, partdescription
from inventorypart
inner join category
on inventorypart.categoryid = inventorypart.categoryid
where (categoryname, weight) in
(select categoryname, max(weight)
from inventorypart
inner join category
on inventorypart.categoryid = inventorypart.categoryid
where categoryname = 'Software' OR categoryname = 'Power' OR categoryname = 'Storage'
group by categoryname)
order by categoryname asc;

--25
