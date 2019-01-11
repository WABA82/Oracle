--테이블복사 :
--사원테이블에서 사원번호, 사원명, 입사일, 연봉 조회하고
--조회한 결과로 CP_EMP라는 테이블을 생성할 것.

select * from EMP;

create table CP_EMP as (
select empno, ename, hiredate, sal
from emp
);

select * from CP_EMP;

alter table cp_emp modify sal number(7,2) not null;
select * from user_constraints;

--not null 조건이 단독으로 설정되어 있으면 복사가 된다.
--cp_emp테이블에서 사원번호
--7500~7599 사이에 속한
--사원의 사원번호, 사원명, 입사일, 연봉 조회
--cp_emp2테이블을 생성

select * from cp_emp
where empno between 7500 and 7599;

create table CP_EMP2 as (
select empno, ename, hiredate, sal
from CP_EMP
where empno between 7500 and 7599
);

select * from CP_EMP2;

--구조만 복사
--사원의 사원번호, 사원명, 부서번호,직무, 부서명, 연봉
--을 레코드가 조회되지 않도록 조회할 것.

select empno, ename, deptno, job, sal
from emp
where 1 = 0;

create table CP_EMP3 as (
select empno, ename, deptno, job, sal
from emp
where 1 = 0
);

select * from CP_EMP3;
