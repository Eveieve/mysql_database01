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
-- SELECT custid '고객번호',  ROUND(SUM(saleprice)/COUNT(*), -2) '평균금액'
SELECT custid '고객번호',  ROUND(AVG(saleprice), -2) '평균금액'
FROM Orders
GROUP BY custid;

SELECT TRIM('=' FROM '==FROM=FROM==');

-- 한문자가 차지하는 바이트의 기준은 데이터베이스시스템에 따라 다르게 적용되는데
-- UTF-8 환경에서는 알파벳 'a' 1byte,  한글 '가' =>  3바이트 로 저장된다. 
-- 그러므로 순수한 문자의 수를 알기위해서는 CHAR_LENGTH(문자열) 사용한다. 
-- 공백도 하나의 문자로 취급됩니다.

SELECT LENGTH('SSSSSGGGG ');
SELECT CHAR_LENGTH('신세계');
SELECT LENGTH('신세계');

SELECT * FROM BOOK;

SELECT bookid, replace(bookname,'야구','농구') bookname
FROM BOOK;




