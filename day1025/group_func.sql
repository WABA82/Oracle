--집계함수 - 컬럼의 값을 하나로 만들어 반환

--count() : null이 아닌 컬럼의 갯수를 셀 때
--사원테이블의 레코드 수 (사원수), 보너스를 수령하는 사원수
--보너스를 수령하지 않는 사원수
--매니저가 있는 사원수
select count(empno), count(comm), count(empno) - count(comm), count(mgr)
from emp;

--여러행이 조회되는 컬럼과 같이 사용되면 에러 발생
--error : 단일 그룹의 그룹 함수가 아닙니다
select count(empno), ename
from emp;

select * from EMP;
--모든 연봉의 합, 보너스 합, 인건비 총합
select sum(sal), sum(comm), sum(sal)+sum(comm)
from emp;

--연봉의 평균, 보너스 평균
select trunc(avg(sal),0), avg(comm),
from emp;

--최고 연봉액, 최저 연봉액, 최고연봉액과 최저의 연봉액의 차이
select max(sal), min(sal), max(sal)-min(sal)
from emp;

--**where절에서는 집계함수를 사용할 수 없다.**
--사원테이블에서 평균연봉보다 많이 수령하는 사원의 사원번호, 사원명, 연봉, 입사일 조회
select EMPNO, ENAME, SAL, HIREDATE
from emp
where sal > avg(sal);

select * from EMP;

--group by절과 집계함수를  함께 사용하여 그룹별 집계를 조회할 수 있다.
--부서별, 부서별인원수, 부서별 연봉 합, 연봉평균, 최고 연봉액
select deptno, count(empno), sum(sal), trunc(avg(sal),2), max(sal), min(sal)
from emp
group by deptno
order by deptno asc;

--사원테이블에서 매니저별 관리인원수, 최고연봉과 최저연봉, 연봉의 차액
select mgr,count(mgr), max(sal), min(sal), max(sal)-min(sal)
from emp
where mgr is not null
group by mgr
order by mgr;

select * from EMP;

--날짜 함수
--날짜 + 정수 = 일수를 계산한다
select sysdate+5
from dual;

select add_months(sysdate,7)
from dual;

select months_between('2018-11-25', sysdate), months_between('2018-12-25', sysdate), months_between('2019-1-25', sysdate)
from dual;
