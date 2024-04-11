Select Deliverylist.Did, Orderlist.Oid, Deliverylist.Dunit_Price * Orderlist.Onum AS Delivery_sum_price
  From Deliverylist, Orderlist
 Where Deliverylist.Oid = Orderlist.Oid
   AND Orderlist.Cid = 66
      
Select Did,Oid,Onum*Duint_price AS delivery_sum_price
From Delivery_price_table
Where Cid=66

Create view delivery_order_price
As

Select Deliverylist.Did, Deliverylist.Oid, Orderlist.Cid, Orderlist.Onum, Deliverylist.dunit_price, Orderlist.Onum * Deliverylist.Dunit_price as sum_price
  From Deliverylist, Orderlist
 Where Deliverylist.Oid = Orderlist.Oid
 
Select Did,Oid,sum_price
From delivery_order_price
Where Cid=66

SELECT orderlist.oid, deliverylist.dstart_add, deliverylist.dend_add, orderlist.onum * deliverylist.dunit_price as sum_price
  FROM orderlist, customer, deliverylist
 where orderlist.cid = customer.cid
   AND orderlist.oid = deliverylist.oid
   AND customer.cname = '张勇'
   
create VIEW deliverylist_customer_price
AS

SELECT orderlist.oid, customer.cname, deliverylist.dstart_add, deliverylist.dend_add, orderlist.onum, deliverylist.dunit_price
  from orderlist, customer, deliverylist
 where orderlist.cid = customer.cid
   AND orderlist.oid = deliverylist.oid
   
select deliverylist_customer_price.oid,deliverylist_customer_price.dstart_add,deliverylist_customer_price.dend_add,deliverylist_customer_price.onum*deliverylist_customer_price.dunit_price as sum_price
FROM deliverylist_customer_price
WHERE deliverylist_customer_price.cname='张勇'