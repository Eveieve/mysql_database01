set @myvar1 = 5;
set @myvar2 = 6;
set @myvar3 = 7;
set @myvar4 = 8;
set @myvarName = '이름 ==>';

SELECT @myvar1 + @myvar2;
SELECT @myvarName, memberName FROM membertbl; 
select * from membertbl;
insert into membertbl values (1,'ssg','서울');
commit;

use 극장;
create table movie(
  movie_id int,
  movie_title varchar(50),
  movie_director varchar(30),
  movie_star varchar(30),
  movie_script longtext,
  movie_film longblob
) default charset=utf8mb4;   -- LONGBLOB,LONGTEXT 형식의 한글 처리 문제가 없게 하기 위해 설정 

INSERT INTO movie values(1,'쉰들러 리스트','스필버그','리암 니슨',load_file('C:/movies/Schidler.txt'),load_file('C:/movies/Schidler.mp4'));
INSERT INTO movie values(2,'쇼생크탈출','프랭크 다라본트','팀 로빈슨/모건 프리먼',load_file('C:/movies/Shawshank.txt'),load_file('C:/movies/Shawshank.mp4'));
INSERT INTO movie values(3,'라스트모히칸','마이클 만','다니엘 데이 루이스',load_file('C:/movies/Mohicans.txt'),load_file('C:/movies/Mohicans.mp4'));
commit;
select * from movie;

-- movie_script 와 movie_film 이 null 인 이유 
-- 1) 최대 패킷 크기가 설정된 시스템 변수  max_allowed_packet 값 확인 
 SHOW variables like 'max_allowed_packet';    -- 4MByte 기본 설정 
 -- my.ini(my.cnf) 시스템 변수값=>  내가 원하는 값으로 max_allowed_packet = 1024M;   
-- 2) 파일 업로드/다운로드 할 폴더 경로를 별도로 허용해 주어야 한다. 시스템 변수 secure_file_priv 확인 
SHOW variables like 'secure_file_priv'; 
-- # Secure File Priv.
-- my.ini(my.cnf) 시스템 변수값=>  내가 원하는 값으로 secure-file-priv="C:/movies/";
use 극장;
select * from movie;
TRUNCATE movie;
drop table movie;


-- ------------------------------------------------------------
use shopdb;

-- 피벗 테이블 : 한 열에 여러값을 출력하고, 이를 여러 열로 변환하여 테이블로 반환하는 방식 

create table pivotTest(
      userName CHAR(10),
      season CHAR(2),
      amount int
);

 insert into pivotTest values
               ('김범수','겨울',10),('유노윤호','여름',15),
               ('김범수','가을',25),('김범수','봄',3),
               ('김범수','봄',37),('윤종신','겨울',40),
               ('김범수','여름',14),('김범수','겨울',22),('윤종신','여름',64);
               commit;
               select * from pivotTest;

SELECT username, 
       SUM(if(season='봄',amount,0)) AS 봄,
       SUM(if(season='여름',amount,0)) AS 여름,
       SUM(if(season='가을',amount,0)) AS 가을,
       SUM(if(season='겨울',amount,0)) AS 겨울,
       SUM((amount)) AS 합계 
FROM pivotTest Group by username;

-- JSON 데이터 (JavaScript Object Notation) : 웹과 모바일 응용 프로그램에서 데이터 교환을 위한 개방형 표준 데이터 포맷
-- 속성 : 값   
  -- { 
--      "아이디" : "winder",
--      "이름" : "ssg"
--   }
-- MYSQL JSON 관련된 다양한 내장 함수 제공 
  select * from membertbl;
  select json_object('memberID',memberid,'memberName',membername) as 'json값' from membertbl;
  
  SET @json = '{
             "membertbl" :
             [
                      {"memberID":2,"membername":"신세계1"},
                      {"memberID":3,"membername":"신세계1"},
                      {"memberID":4,"membername":"신세계3"}
             ]
     }';

 SELECT JSON_VALID(@json) as JSON_VALID;         -- JSON_VALID() : 
 SELECT JSON_SEARCH(@json,'one','신세계1') as JSON_SEARCH;  -- 해당 member의 저장 위치를 확인 
 SELECT JSON_SEARCH(@json,'all','신세계1') as JSON_SEARCH;



















