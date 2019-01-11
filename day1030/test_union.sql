select * from CP_EMP3;
insert into cp_emp3(empno, ename, deptno, job, sal)
values(1112,'이재찬',10,'대리',3500);
insert into cp_emp3(empno, ename, deptno, job, sal)
values(1113,'이재현',20,'차장',7500);
insert into cp_emp3(empno, ename, deptno, job, sal)
values(1114,'정택성',20,'알바',1500);
commit;

--emp : 미국본사, cp_emp3 : 한국지사
--미국본사와 한국지사의 연봉이 2000이하인 사원급여를
--올려주고 싶어 2000이하인 사원의 사원번호, 사원명, 연봉, 직무를 조회.
--union : 중복데이터를 disticnt
--union all : 모든데이터를 조회한다.
select empno, ename, sal, job
from emp
where sal <= 2000
union
select empno, ename, sal, job
from cp_emp3
where sal <= 2000;

select * from EMP;
select * from CP_EMP3;
--cp_emp3에 emp테이블의 30번 부서 사원정보를 모두 추가
insert into cp_emp3(empno, ename, deptno, job, sal)
(select empno, ename, deptno, job, sal from emp where deptno=30);
commit;


--컬럼의 갯수가 같지않거나 데이터형이 일치하지 않으면 에러 발생

--컬럼의 갯수가 같지 않을때
select empno, ename, sal
from emp
where sal <= 2000
union
select empno, ename, sal, job
from cp_emp3
where sal <= 2000;

--데이터형이 일치 않을 때
select empno, ename, sal, job
from emp
where sal <= 2000
union
select sal,job,ename,empno
from cp_emp3
where sal <= 2000;

--INTERSECT : 서로 다른 테이블의 중복된 값을 조회
--미국본사의 사원정보와 한국지사의 사원정보중 일치하는 정보만 조회
select empno, ename, sal, job
from emp
where sal <= 2000
intersect
select empno, ename, sal, job
from cp_emp3
where sal <= 2000;

--MINUS : 상위 SELECT의 조회된 결과에서 하위 SELECT의 결과를 빼고 조회 한다.
select empno, ename, sal, job
from emp
minus
select empno, ename, sal, job
from cp_emp3
where sal <= 2000
order by sal desc;