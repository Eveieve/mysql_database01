-- 1 . 운영자적 관점 SQL : 집계 (aggregate) ->  집계함수(aggregate function) 제공 
-- 집계함수란 테이블의 각 열에 대해 계산하는 함수 

-- 3-15 고객(customer)이 주문한 도서의 총판매액을 구해보자 
   SELECT sum(saleprice) as '총매출'
   FROM orders;
-- 3-16    
   select custid from customer where name ='김연아';
   select sum(saleprice)as '총매출' from orders where custid = 2;
 -- 3.17  
 SELECT SUM(saleprice) as 'Total',
		AVG(saleprice) as 'AVERAGE',
        MIN(saleprice) as 'MINIMUM',
        MAX(saleprice) as 'MAXIMUM'
 FROM orders;
 
 -- 3-18  count()-> 행의 개수를 셈  count(*) 전체 튜플의 수 반환하는데 Null을 제하고 반환
    SELECT COUNT(orderid) from orders;
    
    
 