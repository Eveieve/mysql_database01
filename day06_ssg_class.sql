-- 1.숫자함수 
-- ABS() 숫자의 절댓값을 반환
-- 상수값 -78 과 +78 을 대상으로 ABS함수를 수행하여라 (절댓값)
SELECT ABS(-78) , ABS(+78) FROM DUAL;  -- 오라클일 경우 DUAL(가상테이블)
SELECT ABS(-78) , ABS(+78);  -- MYSQL일 경우 

-- 10   10.1  -10.1     10   11  -10   CEIL() => 올림함수
SELECT CEIL(10),CEIL(10.1),CEIL(-10.1);

SELECT ceiling(3.14) AS ceil_value;
SELECT floor(3.14) AS floor_value;

-- TRUNCATE() => 숫자를 지정한 소수점 자리수로 잘라낸다. (반올림을 하지 않는다.)
SELECT truncate(3.141592,2) as truncate_ex;

-- 4.875 를 소수 첫째 자리까지 반올림한 값을 구하시오 
SELECT ROUND(4.875,1);
-- MOD() => 숫자의 나머지를 반환하는 함수 
SELECT MOD(10,3) AS 나머지;

-- 고객별 평균 주문 금액을 (백원 단위)로 반올림한 값을 구하시오 
SELECT custid '고객번호',  ROUND(SUM(saleprice)/COUNT(*), -2) '평균금액'
FROM Orders
GROUP BY custid;


