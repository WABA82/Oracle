--select서브쿼리

--단수행 :
-- scalar :select 조회하는 커럼에 서브쿼리를 이용
----emp에서 사원번호, 이름 , 부서번호, 부서명
--부서명은 dept테이블에 존재
select empno, ename, deptno, (select dname from dept where dept.deptno = emp.deptno) as dname
from emp;

--cp_emp3에서 번호,이름,부서
insert into cp_emp3(
select empno, ename, deptno, job, sal
from emp
where deptno in(10,30)
);
commit;

--사원에서 번호가 7698인 사원의 부서번호와 동일한 부서를 cp_emp3에서 조회
--조회 컬럼은 사원번호, 사원명, 부서번호 , 직무
select * from cp_emp3;

select empno, ename, deptno, job
from cp_emp3
where deptno = (select deptno from emp where empno = 7698);

--컬럼값의 다중행 서브쿼리 where in, any, all, exsists
--사원에서 번호가 7698,7566인 사원의 부서번호와 동일한 부서를 cp_emp3에서 조회
--조회 컬럼은 사원번호, 사원명, 부서번호 , 직무

select empno, ename, deptno, job
from cp_emp3
where deptno in (select deptno from emp where empno in (7698,7782));

--외부값 입력 받기
--쿼리문에 &변수명 - 입력창 동작 : 입력창에 입력한 값이 쿼리에 대입된다.
--&변수명이 쿼리문에 그대로 대입됨으로 문자열을 입력한 경우 --
select * from EMP where deptno=&deptno;
select * from EMP where ename='&deptno';

--exists : 서브쿼리에 값이 존재할 경우 슈퍼쿼를 수행
--사원테이블에서 입력되는 부서번호가 존재 한다면,
--사원번호 사원명 입사일 부서번호 조회합니다.
select empno, ename, hiredate, deptno
from emp
where exists (select deptno from emp where deptno = &deptno);

--all : and - < 일때 서브쿼리에 조회된 값 중 가장 작은 값으로 비교 수행
-- 				> 일때 서브쿼리에 조회된 값 중 가장 큰 값으로 비교 수행
--입력된 부서에서 가장 연봉이 작은 사원보다
--연봉이 작은 사원을 조회
select empno, ename, sal, deptno
from emp
where sal > all(select sal from emp where deptno = &d_no);

select * from emp;

--any : or
select empno, ename, sal, deptno
from emp
where sal < any(select sal from emp where deptno = &d_no);

--------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- rownum : 조회된 결과에 순차적인 번호를 붙이는 가상 컬럼
--------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- 번호 , 사원번호, 사원명, 입사일 조회
-- 단, 번호는 조회결과 1부터 순차적으로 부여되어야 한다.

select rownum, empno, ename, hiredate
from emp
where deptno in (10, 20);
select * from EMP;

--rownum
--order by와 같이 사용되면 번호가 섞이게 된다.
select rownum, empno, ename
from emp
order by ename asc;


--rownum은 where절에서 사용하면 1번 부터는 조회가 되지만 아닌번호는 조회 되지 않는다
--단, 출력은 1~5번까지만 출력
select rownum, empno, ename, hiredate, sal
from emp
where rownum between 1 and 5;

--단, 출력은 2~5번까지만 출력은 되지 않는다.
select rownum, empno, ename, hiredate, sal
from emp
where rownum between 2 and 5;

--복수행 서브쿼리
--조회결과(inline view)를 가지고 재조회

/*
	select 컬럼명,,,,
	from (select....)
*/

select rownum, empno, ename, hi
from	(select rownum, empno, ename, sal, hiredate hi from emp order by sal asc);

--사원에서 가장 마지막에  입사한 사원부터 5명을 조회

select rownum, empno, ename, hiredate
from (select rownum, empno, ename, hiredate from emp order by hiredate desc)
where rownum between 1 and 5;

--가장 2번째로 마지막에 입사한 사원부터 5명 조회
select rownum, r, empno, ename, to_char(hiredate)
from (select rownum as R, empno, ename, hiredate
		from (select rownum, empno, ename, hiredate
				from emp order by hiredate desc))
where r between 2 and 6 ;


select * from user_constraints;
