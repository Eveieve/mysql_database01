use ssgdb;
-- ssgdb 데이터베이스의 모든 테이블 이름 리스트를 출력하라
show tables;
-- book테이블의 bookname, publisher 컬럼의 정보를 출력하라 
select bookname, publisher from book;
-- book 테이블의 전체 정보를 출력하라 
select * from book;

SELECT bookname, publisher , price
FROM book
WHERE price <= 10000; 

-- Oracle, MySQL, MariaDB, PostgresSQL 관계형 데이터베이스 시스템 (RDBMS)

-- book 테이블의 구조 
describe book;
desc book;
-- ----------------------------------------------------------------



