--insert서브쿼리

--단수행
--cp_emp3에 레코드 추가
--사원번호 1111, 사원면 김희철, 부서번호 10 , 직무 사원, 연봉 emp테이블의 사원번호가 7566번의 연봉과 동인한 연봉으로 책정

insert into CP_EMP3(empno,ename,deptno, job, sal)
values (1111,'김희철',10,'사원',(
select sal
from emp
where empno = 7566
));

--단일행 서브쿼리가 들어가야하는 곳에서 복수행이 사용되면 에러가 발생한다.
--여러행이 나오는 경우 에러
insert into CP_EMP3(empno,ename,deptno, job, sal)
values (1111,'김희철',10,'사원',(
select sal
from emp
));
--컬럼하나에 값을 넣어야 하는 곳에 컬럼 여러개가 조회되면
--추가하는 값의 갯수가 맞지 않으므로 에러
insert into CP_EMP3(empno,ename,deptno, job, sal)
values (1111,'김희철',10,'사원',(
select sal, deptno
from emp
where empno = 7566
));


--복수행입력
--emp테이블에서 30번 부서의 사원번호 사원명 부서번호 직무 연봉 조회하여 CP_EMP3에 추가
insert into cp_emp3(empno, ename, deptno, job, sal)
(select empno, ename, deptno, job, sal
from emp
where deptno = 30);

select * from CP_EMP3;

--사원테이블에서 1981-02에 입사한 사원의 직무, 연봉, 입사년-월, 입력일을 test테이블에 추가

create table test(job varchar2(9), sal number(7,2), hiredate date);
alter table test add input_date date;
alter table test modify hiredate varchar2(7);

insert into test (job, sal, hiredate, input_date)
(select job, sum(sal), to_char(hiredate, 'yyyy-mm'), sysdate
from emp
where to_char(hiredate,'yyyy-mm') = '1981-02'
group by job, hiredate);

select * from TEST;
