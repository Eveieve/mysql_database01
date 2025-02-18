-- 요구사항 
  
-- 1. shopdb 데이터베이스를 생성해 주세요 

--  ssg계정으로 접속하여 
-- 2. 회원테이블(memberTBL) 
--    memberID 문자열 8글자 널을 허용하지 않음
--    memberName 문자열 10글자   널을 허용하지 않음
--    memberAddress  문자열20 글자  널 허용 

--    제품테이블(productTBL)
--    productName 문자 (4글자) 널 허용하지 않음
--    cost   숫자(INT)  널 허용하지 않음
--    makeDate 날짜(DATE)  널 허용 
use shopdb;
create table memberTBL(
  memberID varchar(8) not null,
  memberName varchar(10) not null,
  memberAddress varchar(20),
  primary key(memberID)
);
drop table productTBL;

CREATE TABLE productTBL(
   -- productID int auto_increment ,
   productName varchar(4) not null,
   cost int not null,
   makeDate date
   -- primary key(productID)
);

desc productTBL;
-- 테이블 수정 (productID 새로운 컬럼 추가)
alter table productTBL ADD COLUMN productID int not null unique;
-- 테이블 수정 ( productID 컬럼 삭제)
alter table productTbl drop column productID;

alter TABLE productTBL CHANGE COLUMN cost price int;

-- productName 컬럼 앞에 productID 컬럼을 추가 
ALTER TABLE productTBL ADD COLUMN productID int not null first;

-- 테이블에 지정 컬럼 뒤에 추가 
alter table productTBL ADD COLUMN descript varchar(100) not null after price;

-- 컬럼 타입 변경 
ALTER TABLE productTBL MODIFY COLUMN price smallint;