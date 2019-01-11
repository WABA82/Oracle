--컬럼을 붙여 문자열로 조회: ||
--EMP테이블에서 사원번호, 사원명, 직무를 조회
--출력형식은 : 사원명(사원번호)님 XXX직무입니다.
--alias를 ""로 묶어서 부여하면 대소문자가 가려진 컬럼이 나온다.
select		ename ||' ('|| empno ||')님은 '|| job || '직무 입니다.' as ouput
from		emp;

--alias는 바로 아래 where 절에서 사용할 수 없다.
select		empno, ename, sal as s
from		emp
where		sal < 3000;

--산술 연산자 : +, -, *, /
--사원 테이블에서 사원번호, 사원명, 연봉, 세금을 조회
--단, 세금은 연봉의 3.3%.로 계산해서 출력
--사원번호는 현재 번호의 10을 더한 값으로 출력
select     empno, empno+10 as new_empno, ename, sal, sal* 0.033 as tax
from		emp;

--컬럼끼리 연산
select		empno - mgr
from		emp;

--null은 연산되면 결과가 null이 나온다.
--사원테이블에서 사원번호, 연봉, 보너스, 총수령액을 조회
--단, 총 수령액은 연봉과 보너스를 합산한 금액으로 조회
--null인 컬럼에 연산을 하기 위해서 nvl()함수를 사용.
select		empno, sal, comm, sal+nvl(comm,0) as total
from		emp;

--나눈 나머지를 구하는 함수 : mod(컬럼명, 나눌값) 함수 사용
--dual 테이블 : 모든 계정에서 사용할 수 있는 가상 테이블
--					입려되는 값으로 컬럼을 생성하여 조회처리
select		'이재현' as name, mod(11,2), mod(1993,12)
from		dual;
-- 11 : 양띠, 10 : 말, 9 : 뱀, 8 : 용, 7 : 토끼, 6 : 호랑이, 5 : 소, 4 : 쥐, 3 : 돼지, 2 : 개, 1 : 닭, 0 : 원숭이

--조회하는 컬럼에 관계연산자를 사용하면 Error
select sal > 300
from emp;

--관계연산자 : where절에서, having절 사용
--> , <, >=, <=, =, !=

--사원테이블에서 연봉이 3000이하 사원의 사원번호,
--사원면, 매니저번호, 연봉, 입사일, 부서번호 조회
select  empno, ename, mgr, sal, hiredate, deptno
from EMP
where sal <= 3000;

--사원테이블에서 연봉이 3000을 초과한 사원의 사원번호,
--사원면, 매니저번호, 연봉, 입사일, 부서번호 조회
select empno, ename, mgr, sal, hiredate, deptno
from emp
where sal >= 3000;

--사원테이블에서 부서번호가 '30'번인 사원들의
--사원번호, 사원명, 직무, 입사일 조회
select empno, ename, job, hiredate
from emp
where deptno=30;

--사원테이블에서 부서번호가 20번이 아닌 사원들의
--사원번호, 부서번호, 사원명, 직무 조회
select empno, deptno, ename, job
from emp
where deptno !=20;
--where deptno<> 20;

--사원테이블에서 보너스가 없는 사원의
--사원번호,사원명,연봉,보너스를 조회
--null은 관계연산자로 비교할수 없다. 대신 is null, is not null로 조회
select empno, ename, sal, comm
from emp
where comm is null;

--논리연산자 : and(전부 true일 경우), or(하나만 이라도 true인 경우), not()


--사원테이블에서 사원번호가 7369이면서 직무가 clerk인
--사원의 사원번호, 사원명, 직무, 입사일, 연봉 조회
select empno, ename, job, hiredate, sal
from emp
where empno=7369 and job='CLERK';

--사원테이블에서 연봉이 1500이상 이면서 3000이하인 사원들의 사원번호, 사원명, 직무, 입사일, 연봉 조회
--범위를 검색조건으로 사용할 때에는 between 을 사용할 수 있다.
--문법> 컬럼명 between 작은값 and 큰값
select empno, ename, job, hiredate, sal
from emp
where sal between 1500 and 3000;
--where sal >= 1500 and sal <=3000;

--사원테이블에서 7902, 7839 매니저의 관리를 받는 사원의
--사원번호, 사원명, 매니저번호, 연봉, 입사일을 조회
--or는 in으로 대체 될 수 있다.
--사용법> 컬럼명 in (값,,,)
--in은 포함하는, not in은 포함하지 않는
select empno, ename, mgr, sal, hiredate
from emp
where mgr in (7902, 7839, 7566);
--where mgr=7902 or mgr=7839 or mgr=7566;
