--inner join : 서로 다른 테이블에 같은 값이 있는 경우에만 조회.
select * from emp;
select * from dept;
--사원번호, 사원명, 부서번호, 부서명, 위치, 연봉 조회
--ANSI
select EMPNO, ENAME, e.deptno, dname, loc, sal
from emp e
inner join dept d
on e.deptno=d.deptno;
--ORACLE
select EMPNO, ENAME, e.deptno, dname, loc, sal
from emp e, dept d
where (e.deptno=d.deptno);

--

select * from CAR_COUNTRY;
select * from CAR_MAKER;
select * from CAR_MODEL;

--제약사항 추가
--alter table test_alter add constraint pk_test_alter
--	primary key(id);

--alter TCL만 가능하다
alter table car_country add constraint pk_car_country
	primary key(maker);
alter table car_maker add constraint fk_car_maker
	foreign key(maker) references car_country(maker);

alter table car_maker add constraint pk_car_maker_model
	primary key(model);
alter table car_model add constraint fk_car_model_model
	foreign key(model) references car_maker(model);

select * from user_constraints;

--모델명이 '아반테', '소나타','A8'인 차량의 제조국,제조사,모델명,연식, 가격, 이미지명 조회
select cc.country, cc.maker, cma.model, cmo.car_year, cmo.price, cmo.car_img
from car_country cc
inner join car_maker cma
on         cma.maker = cc.maker
inner join car_model cmo
on          cmo.model = cma.model
where cma.model in ('아반테','소나타','A8');
--ORACLE
select cc.country, cc.maker, cma.model, cmo.car_year, cmo.price, cmo.car_img
from car_country cc,car_maker cma,car_model cmo
where (cma.maker = cc.maker and cmo.model = cma.model) and cma.model in ('아반테','소나타','A8');

--사원번호, 사원명, 연봉, 입사일, 부서번호,부서명, 위치, 우편번호, 시도 ,구군, 동, 번지를 조회 하세요.
--사원테이블의 사원번호와 우편번호 테이블의 SEQ를 조인조건으로 사용하시오
--ansi
select EMPNO, ENAME, SAL, HIREDATE, dt.DEPTNO, DNAME, LOC, SIDO, GUGUN, DONG, BUNJI,zip.seq
from dept dt
inner join emp e
on e.deptno = dt.deptno
inner join zipcode zip
on zip.seq=e.empno;
--oracle
select EMPNO, ENAME, SAL, HIREDATE, dt.DEPTNO, DNAME, LOC, SIDO, GUGUN, DONG, BUNJI, zip.seq
from dept dt, emp e, zipcode zip
where (e.deptno = dt.deptno and  zip.seq=e.empno);

select empno,seq,dong
from emp,zipcode
where (empno=seq);








