
/*
 请查询Caccount1为179615的消费者信息，比较加入索引和未加入索引时查询效率的区别
*/

select * from customer where Caccount1='179615';
EXPLAIN select * from customer where Caccount1='179615';
CREATE INDEX on customer(caccount1); 
select * from customer where Caccount1='179615';
EXPLAIN select * from customer where Caccount1='179615';
drop index customer_caccount1_idx ;
 
 /*
   请查询性别为女的所有消费者信息，并为性别字段加入索引，比较索引加入前后对查询效率的影响。
 */
 
SELECT * FROM customer where csex='女'; 
create INDEX idx_sex on customer(csex); 
EXPLAIN SELECT * FROM customer where csex='女';
drop index idx_sex;

/*
    请查询消费者表中所有性别为男的消费者的年龄的平均岁数，请问如何加索引才能加快查询速度，试分析原因？
    不使用索引的查询时间；
    对Csex字段加入索引的查询时间
*/

EXPLAIN SELECT avg(cage) from customer where Csex='男';

create INDEX idx_sex on customer(csex);

EXPLAIN SELECT avg(cage) from customer where Csex='男';

drop index idx_sex;

CREATE INDEX idx_sex_age on customer(Csex,Cage);

EXPLAIN SELECT avg(cage) from customer where csex='男';

drop index idx_sex_age;

/*
请为（账号1，账号2）加入组合索引，并分别查询账号1为179615的消费者信息和
账号2为1179615的消费者信息，比较两者查询效率的差异，试试用EXPLAIN分析为什么？
*/

CREATE INDEX idx_ac1_ac2 on customer(Caccount1,Caccount2);

EXPLAIN analyze select * from customer where Caccount1='179615';

EXPLAIN analyze  select * from customer where Caccount2='1179615';

drop index idx_ac1_ac2;

/*
⑪某大学生想知道来自安徽的消费者有哪些，为了加快查询速度，对地址一栏加入了索引，并做了如下查询，
select * from Customer where address like ‘%安徽%’;
请问该语句是否能够正确应用索引加快查询速度？如不能，请给出正确的查询方式。
*/

CREATE INDEX idx_add on customer(Caddress);
EXPLAIN analyze SELECT * FROM customer where Caddress like '%安徽%';
EXPLAIN analyze SELECT * FROM customer where Caddress like '安徽%';
drop INDEX idx_add;
SELECT * FROM customer;

