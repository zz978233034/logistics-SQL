/*连接查询*/

/*连接查询1）求购买了货物ID=3072的消费者ID*/

SELECT cid
FROM orderlist
WHERE oid IN (
    SELECT oid
    FROM deliverylist
    WHERE pid = 3072
);
                  
/*或者*/
SELECT cid
FROM orderlist,deliverylist
WHERE orderlist.oid = deliverylist.oid AND deliverylist.pid=3072;   



/*连接查询2）订单号为28005的消费者性别*/
SELECT csex
FROM  customer,orderlist
WHERE customer.cid = orderlist.cid AND orderlist.oid=28005;
/*或者*/
SELECT csex
FROM orderlist,customer 
WHERE customer.cid = orderlist.cid AND orderlist.oid=28005;   

/*连接查询3）所有订单的消费者姓名和订单总金额*/
SELECT c.cname, SUM(o.osum)
FROM customer c
JOIN orderlist o ON c.cid = o.cid
GROUP BY c.cname;
/*或者*/

SELECT c.cname, total_amount
FROM customer c
JOIN (
    SELECT cid, SUM(osum) AS total_amount
    FROM orderlist
    GROUP BY cid
) o ON c.cid = o.cid;

 /*连接查询4）所有货物对应的运输单价*/    
SELECT parcel.pname, deliverylist.dunit_price
FROM parcel
LEFT JOIN deliverylist ON parcel.pid = deliverylist.pid;
/*或者*/
SELECT parcel.pname, deliverylist.dunit_price
FROM parcel
INNER JOIN deliverylist ON parcel.pid = deliverylist.pid;

 /*嵌套查询1）查询所有订单数量为5的消费者的姓名*/   

SELECT customer.cname
FROM customer
JOIN orderlist  ON customer.cid = orderlist.cid
WHERE orderlist.onum = 5;
/*或者*/
SELECT customer.cname
FROM customer 
WHERE cid IN (
    SELECT cid
    FROM orderlist 
    WHERE orderlist.onum = 5);

/*嵌套查询2）求购买了货物名称为薯片并且运输单价小于2的订单ID*/ 

SELECT oid
FROM deliverylist
WHERE pid IN (
    SELECT pid
    FROM parcel
    WHERE pname = '薯片'
)
AND dunit_price <2;
/*或者*/
SELECT oid
FROM deliverylist
WHERE dunit_price < 2
AND pid IN (
    SELECT pid
    FROM parcel
    WHERE pname = '薯片'
);
/*嵌套查询3）购买了茶叶的订单的配送起点和配送终点*/ 
SELECT dstart_add,dend_add
FROM deliverylist
WHERE pid IN (
    SELECT pid
    FROM parcel
    WHERE pname = '茶叶'
);

/*或者*/
SELECT deliverylist.dstart_add, deliverylist.dend_add
FROM (
    SELECT pid
    FROM parcel
    WHERE pname = '茶叶'
) AS subquery
JOIN deliverylist ON deliverylist.pid = subquery.pid;

/*嵌套查询4）至少有一笔订单购买了某产品的产品列表*/ 

SELECT DISTINCT customer.cid, customer.cname
FROM customer
JOIN orderlist ON customer.cid = orderlist.cid;
/*或者*/
SELECT customer.cid, customer.cname
FROM customer 
WHERE EXISTS (
    SELECT 1
    FROM orderlist
    WHERE customer.cid = orderlist.cid
);


