--문자열 연산자 like에서 사용할 테이블
create table test_like(
	num number,
	name varchar2(30),
	loc varchar2(300),
	highschool varchar2(60)
);

insert into test_like(num, name, loc, highschool)
--values(1,'a','b','c');
values(1,'김정윤','서울시 강남구 역삼동','오지고');

insert into test_like(num, name, loc, highschool)
--values(1,'a','b','c');
values(2,'김정운','서울시 구로구 개봉동','지리고');

insert into test_like(num, name, loc, highschool)
--values(1,'a','b','c');
values(3,'박영민','경기도 수원시 영통구','레릿고');

insert into test_like(num, name, loc, highschool)
--values(1,'a','b','c');
values(4,'김희철','서울시 서초구 서초동','먹고');

insert into test_like(num, name, loc, highschool)
--values(1,'a','b','c');
values(5,'김저정은','평양시 평양동','씹고');

insert into test_like(num, name, loc, highschool)
--values(1,'a','b','c');
values(6,'하정운','경기도 수원시 수원동','맛보고');

commit;
select * from TEST_LIKE;

--LIKE 연산자는 %, _ 기호와 같이 사용
--%는 모든 문자열, _ 한개의 문자

--test_like테이블에서 '서울시'에 사는 사람의 번호, 이름, 출신고등학교를 조회
select num, name, loc, highschool,
from test_like
where loc like '서울시%';

--이름이 '운'으로 끝나는 학생의 번호, 이름, 주소를 조회
select num, name, loc
from test_like
where name like '%운';

--이름의 '정'이 포함되어 있는 학생의 번호,이름,주소,고등학교를 조회
select num,name,loc,highschool
from test_like
where name like '%정%';

--이름이 3글자이며 가운데 글자가 정 인 사람의 번호,이름
select num,name
from test_like
where name like '_정_';

--이름이 4글자인 사람의 번호, 이름, 주소, 고등학교
select num, name, loc, highschool
from test_like
where name like '____';

select * from TEST_LIKE;

--지번주소를 저장하는 테이블
create table zipcode(
	zipcode char(7),
	sido varchar2(6),
	gugun varchar2(25),
	dong varchar2(100),
	bunji varchar2(25),
	seq number(5)
);

--zipcode테이블의 dong컬럼 데이터크기 수정
alter table zipcode modify dong varchar2(100);

--기존의 zipcode테이블의 데이터 중복을 위해 한개의 zipcode테이블 삭제
truncate table zipcode;

--테이블의 데이터 보기
select count(*)
from zipcode;

select *
from zipcode;

--우리 동네의 지번 주소를 조회
--동이름)
select zipcode,sido,gugun,dong,bunji,seq
from zipcode
where dong like '상도동%';

--사원테이블에서 사원명에 A이 두개 들어 있는 사원의 사원번호, 사원명, 입사일 조회
select empno, ename, hiredate
from emp
where ename like '%A%A%';

select * from EMP;

--중복배제
--distinct 하나의 컬럼에서만 사용하는 걸 권장
--사원테이블에서 부서번호 조회
--에러가 발생하지 않고 조회결과를 생성할 때 같은 값이 존재하는지 판단해서 중복된 값을 배제한다.
--다른 컬럼과 같이 조회하면 모든 컬럼에 값이 같은 경우만 중복값을 출력하지 않는다.
--사원테이블에서 매니저번호를 조회, 단, 중복되는 매니저번호는 출력하지 않는다
select distinct mgr /*ename*/
from emp;

--group by : 그룹으로 묶여지지 않은 컬럼과 같이 사용되면 error
select mgr /*ename*/
from emp
group by mgr;
