--rank함수
--전체 순위 구하기
--rank() over(order by 컬럼명) - 중복 순위가 가능하다
--사원테이블에서 사원번호, 사원면, 연봉, 연봉순위
select empno, ename, sal, rank() over(order by sal asc)
from emp;

--사원테이블에서 사원번호, 사원면, 연봉, 연봉순위
--단, 중복순위가 발생하지 않도록 처리하여 조회 할 것.
select empno, ename, sal, row_number() over(order by sal asc) as sal_ranking
from emp;

--조회된 레코드를 그룹별 순위 : partition by
--사원테이블에서 부서별 연봉순위 조회
select empno, ename, sal, deptno, row_number() over(partition by deptno order by sal) as sal_ranking
from emp;

------------------------------------------------------------------------------------------------------------------------------------------------------
-- GROUP BY rollup / cube
------------------------------------------------------------------------------------------------------------------------------------------------------
--rollup : 그룹별 소계와 총계를 구할 때 사용하고 결과를 레코드 출력 후에 보여준다.
--사원테이블에서 부서별, 연봉의 합 조회
--총계를 출력
select deptno, sum(sal)
from emp
group by rollup(deptno);

--cube : 그룹별 소계와 총계를 구할 때 사용하고 결과를 레코드 출력 전에 보여준다.
select deptno, sum(sal)
from emp
group by cube(deptno);

--여러 컬럼이 그룹으로 묶여지면 rollup은 그룹별 소계만 출력
--사원 테이블에서 부서별, 직무의 연봉합 조회

select deptno, job, sum(sal)
from emp
group by rollup(deptno, job)
order by deptno, sum(sal);

-- 부서별, 부서별 직무, 직무별, 연봉의 총합
select deptno, job, sum(sal)
from emp
group by cube(deptno, job);

select *
from user_constraints;

desc dept;