select *from orders..TR_OrderDetails$;
select *from orders..TR_Products$
select *from orders..TR_PropertyInfo$

--Find the maximum quantity sold in transactions
select max(Quantity) as max_quant,count(*) as tot_count  from orders..TR_OrderDetails$;

--Find the unique products in all transactions
select distinct ProductID from orders..TR_OrderDetails$ order by ProductID asc;

--unique Proudct in max transactions
select distinct
ProductID, Quantity 
from orders..TR_OrderDetails$
where Quantity = 3
order by ProductID asc, Quantity desc

--Find the unique properties
select distinct PropertyID from orders..TR_OrderDetails$ order by PropertyID asc;

--Find the product categeory that has max products
select ProductCategory,count(*) as tot_count from orders..TR_Products$ group by ProductCategory order by 2 desc;

--Find the state where more stores are present
select PropertyState,count(*) as tot_count from orders..TR_PropertyInfo$ group by PropertyState order by 2 desc;

--Find the top 5 ProductId that did max sales interms of quantity
select top 5 ProductID,sum(Quantity) as tot_quant from orders..TR_OrderDetails$  group by ProductID order by tot_quant desc;

--Find the top 5 PropertyId that did max sales interms of quantity
select top 5 PropertyID,sum(Quantity) as tot_quant from orders..TR_OrderDetails$  group by PropertyID order by tot_quant desc;

--Find the top 5 Productnames that did max sales interms of quantity
select top 5  p.ProductName,sum(o.Quantity * p.Price)as sales from orders..TR_OrderDetails$ as o left join  orders..TR_Products$ p on p.ProductID=o.ProductID group by p.ProductName order by 2 desc;

----Find the top 5 cities that did max sales interms of quantity

select top 5 
 pi.PropertyCity
, sum(o.Quantity * p.Price) as Sales 
from orders..TR_OrderDetails$ as o
left join orders..TR_Products$ as p on o.ProductID = p.ProductID
left join orders..TR_PropertyInfo$ as pi on o.PropertyID = pi.[Prop ID]
group by pi.PropertyCity
order by Sales desc


--find the top5 product each of cities.
select top 5 
 pi.PropertyCity
, p.ProductName
, sum(o.Quantity * p.Price) as Sales 
from orders..TR_OrderDetails$ as o
left join orders..TR_Products$ as p on o.ProductID = p.ProductID
left join orders..TR_PropertyInfo$ as pi on o.PropertyID = pi.[Prop ID]
where pi.PropertyCity = 'Arlington'
group by pi.PropertyCity, p.ProductName
order by Sales desc;
