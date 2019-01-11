--정렬
--사원테이블에서 사원번호, 사원명, 연봉, 입사일을 조회
--단, 연봉의 오름차순으로 정렬하여 출력할 것.
--연봉이 같다면 입사일의 내림차순으로 정렬.

select empno, ename, sal, hiredate
from emp
order by sal, hiredate desc, ename;

--사원테이블에서 매니저번호, 사원번호, 사원명, 연봉을 조회
--단, 매니저번호의 내림차순으로 정렬 하되 중복이 발생하면 사원명의 오름차순으로 정렬

select mgr, ename, empno, sal
from emp
order by mgr desc, ename asc;

select * from EMP;

create table test_orderby(
num varchar2(10)
);

insert into test_orderby(num) values('1000');
insert into test_orderby(num) values('1');
insert into test_orderby(num) values('204');
insert into test_orderby(num) values('21');
insert into test_orderby(num) values('191');
insert into test_orderby(num) values('300');
insert into test_orderby(num) values('20001');
insert into test_orderby(num) values('0001');
insert into test_orderby(num) values('00000002');
commit;

select * from TEST_ORDERBY;

--번호의 오름차순으로 정렬 : 문자열의 정렬은 자릿수의 크기대로 정렬
select num
from TEST_ORDERBY
order by num asc;

