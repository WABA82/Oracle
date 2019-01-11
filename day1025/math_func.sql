--수학 함수
select sin(25), cos(25), tan(25)
from dual;

--절댓값 : abs(값)
select abs(25), abs(-25)
from dual;

--반올림 : round(값, 자릿수)
select round(555.55, -3),round(555.55, -2),round(555.55, -1),round(555.55, 0),round(555.55, 1),

		round(555.55, 2),
		round(555.555, 2)
from dual;
--절삭 : trunc(값, 자릿수)
select trunc(555.55, -3),trunc(555.55, -2),trunc(555.55, -1),trunc(555.55, 0),trunc(555.55, 1),

		trunc(555.55, 2),
		trunc(555.555, 2)
from dual;

--올림 : ceil(값)
select ceil(10.1),ceil(10.01)
from dual;

--내림 : floor(값)
select floor(10.1), floor(10.01)
from dual;

--사원테이블에서 사원번호, 사워명, 입사일, 연봉, 세금을 조회
--단, 세금은 연봉의 3.3%로 계산하고 원단위 절삭하여 출력
select EMPNO, initcap(ENAME), HIREDATE, SAL, trunc(sal*0.033, -1) as tax
from emp;
