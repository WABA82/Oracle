--outer join :
--ANSI
--
--문법>
--select 테이블명.컬럼명, alias.컬럼명
--from 테이블명 alias
--[(참조할 테이블을 정하기)LEFT, RIGHT, FULL] outer join 조인할 테이블명 alias
--on 조인조건
--.
--.
--.
--where 검색조건
--
--ORACLE : 조인조건에 특정 데이터가 없는 테이블에 (+)를 붙여준다. 양쪽에 기호를 사용하면 에러발생
--
--문법> (+)
--select 컬럼명
--from 테이블, 조인할 테이블명,,,,,
--where (컬럼명 = 컬럼명(+))      (컬럼명(+) = 컬럼명)

--모든 부서의 부서번호, 부서명, 사원번호, 사원명, 입사일 조회
--ansi
--disticnt로 테이블을 봤을 때
select d.deptno, d.dname, e.empno, e.ename, e.hiredate
from  dept d
left outer join   emp e
on e.deptno = d.deptno;

select d.deptno, e.deptno, d.dname, e.empno, e.ename, e.hiredate
from  dept d right outer join emp e
on e.deptno = d.deptno;

select d.deptno, e.deptno, d.dname, e.empno, e.ename, e.hiredate
from  dept d
full outer join emp e
on e.deptno = d.deptno;

--oracle 값이 더 없는 조인조건에 쪽에(+)
--full outer join은 오라클문법에서는 지원하지 않는다
select d.deptno,e.deptno, d.dname, e.empno, e.ename, e.hiredate
from emp e, dept d
where (e.deptno(+) = d.deptno);
where (e.deptno = d.deptno(+));

--제조사가 '현대', '기아'인 모든 차량의 제조국,제조사,모델명,연식,가격,옵션을 조회
select cc.COUNTRY, cc.MAKER, cma.MODEL, cmo.CAR_YEAR, cmo.PRICE, cmo.CAR_OPTION
from car_country cc, car_maker cma, car_model cmo
where (cma.maker(+) = cc.maker and cmo.model(+) = cma.model)
and cma.maker in ('현대','기아');

--모델명이 'K5','K7','소나타','아반테','Cclass', 'A6'인 모든차량의 제조국,제조사,모델명,연식,가격을 조회
--단 가격의 내림차순으로 정렬, 가격이 같으면 연식의 내림차순으로 정렬할 것
--ansi
select cc.COUNTRY, cc.MAKER, cma.MODEL, cmo.CAR_YEAR, cmo.PRICE
from car_country cc
left join car_maker cma
on cma.maker = cc.maker
left join car_model cmo
on cmo.model = cma.model
where cma.model in ('K5','K7','소나타','아반테','Cclass', 'A6')
order by cmo.price desc, cmo.CAR_YEAR desc;

--oracle
select cc.COUNTRY, cc.MAKER, cma.MODEL, cmo.CAR_YEAR, cmo.PRICE
from car_country cc, car_maker cma, car_model cmo
where (cma.maker(+) = cc.maker and cmo.model(+) = cma.model)
and cma.model in ('K5','K7','소나타','아반테','Cclass', 'A6')
order by cmo.price desc, cmo.CAR_YEAR desc;

select distinct model from CAR_MODEL;
select * from CAR_MAKER;

--사원테이블에서 'SCOTT'사원 보다 연봉을 적게 받는 사원
select empno,ename,hiredate,sal
from emp
where sal < (select sal from emp where ename = 'SCOTT');

select e1.empno, e1.ename, e1. hiredate, e1.sal
from emp e1, emp e2
where (e1.sal < e2.sal) and e2.ename='SCOTT';

select * from CAR_MODEL;

update car_model
set car_img = 'qm5_001.jpg'
where car_img='qm5_001.jpg,qm5_002.jpg';


update car_model
set car_img = 'qm5_003.jpg'
where car_img='qm5_003.jpg,qm5_004.jpg';

update car_model
set car_img = 'qm5_005.jpg'
where car_img='qm5_005.jpg,qm5_006.jpg';

commit;
