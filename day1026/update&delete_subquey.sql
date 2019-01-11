--update서브쿼리

--단수행
--cp_emp3 테이블에서 사원번호가 '1111'인 사원의 연봉을
--emp테이블의 사원번호가 7788인 사원의 연봉으로 변경

update cp_emp3
set sal = (
select sal
from emp
where empno=7788
)
where empno = '1111';



--단수행에 복수행이 발생하면 에러
update cp_emp3
set sal = (
select sal
from emp
)
where empno = '1111';
-- 컬럼이 여러개
update cp_emp3
set sal = (
select sal, deptno
from emp
where empno=7788
)
where empno = '1111';

--복수행 where in
insert into cp_emp3 (empno, ename, deptno, job, sal)
values(2222,'테스트',30,'SALESMAN',2000);
commit;
-- cp_emp
update cp_emp3
set sal = (
select sal
from emp
where empno=7788
)
where empno = '1111';

select * from CP_EMP3;

--cp_emp3에서 emp테이블의 부서번호가 30번인 모든사원들의 사원번호가 같은 사람의 연봉을 1000으로 변경
select empno
from emp
where deptno=30;

update cp_emp3
set sal = 1000
where empno in (select empno
from emp
where deptno=30
);

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--delete서브쿼리
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--다른 테이블 값을 참조해 현재 테이블의 레코드를 삭제

--단수행
--cp_emp3에서 사원정보 삭제
-- 조건 : emp에서 ''BLAKE'인 사원번호와 같은 사원을 cp_emp3 삭제

update cp_emp3
set ename='블랑카'
where empno = 7698;
commit;

delete
from CP_emp3
where empno = (
select empno
from emp
where ename = 'BLAKE');

--복수행 : 권장하지 않음
--emp에서 부서번호가 30인 사람들을 참조해서 cp_emp3에서 부서번호가 같은 사람들을 모두 지워라
delete
from CP_emp3
where empno in (
select empno
from emp
where deptno = 30);

select * from CP_EMP3;
