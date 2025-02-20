-- 두 개 이상의 테이블을 이용한 SQL질의 방법 
-- 박지성 고객이 주문한 도서의 총구매액은 38000 
-- Join 은 한 테이블의 행을 다른 테이블의 행에 연결하여 두 개 이상의 테이블을 결합하는 연산 

SELECT * FROM customer , orders;
select count(custid) from customer;  -- 5명
select count(orderid) from orders;   -- 10건 
-- 5 x 10 = 50  (조건이 없는 테이블간의 조인을 Cross Join)

-- 고객과 고객의 주문에 관한 데이터를 모두 출력하시오. (동등조인 equi join)
SELECT * FROM customer , orders where customer.custid = orders.custid order by customer.custid;
select * from customer;
select * from orders;

-- 3.23 
SELECT c.name , o.saleprice
from customer c, orders o where c.custid = o.custid;

-- 3.24
 SELECT c.name, sum(saleprice)
 FROM customer c, orders o
 WHERE c.custid = o.custid 
 GROUP BY c.name
 order by c.name;
-- 3.25 
   SELECT c.name, b.bookname
   FROM  customer c, orders o , book b
   WHERE c.custid = o.custid and o.bookid = b.bookid;
   
-- 3.26 
   select * from book;
   select * from orders;
   select * from customer;
   
   SELECT c.name, b.bookname , b.price
   FROM  customer c, orders o , book b
   WHERE c.custid = o.custid and o.bookid = b.bookid and b.price>= 20000;
   
-- 3.27 외부조인(outer join)   
   
   SELECT c.name, o.saleprice
   FROM  customer c LEFT OUTER JOIN orders o 
   on c.custid = o.custid; 
   
   
   
 
