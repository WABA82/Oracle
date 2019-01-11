--CHECK, not null, default
--check : 컬럼의 값을 유효성 검증된 값으로 추가할때
--not null : 값을 반드시 입력받아야 할 때
--default : 컬럼이 생략되어 null 입력될 때 대신 들어갈 기본 값

--이름, 나이, 주소, 입력일을 저장하는 테이블 생성
--단, 이름은 필수입력이고, 나이는 20~30세 까지 입력가능 하고
--입력일은 생략 되면 현재 날짜로 입력되도록 설정

CREATE table other_constraints(
	name varchar2(30 byte) constraint c_name not null,
	age number(2) constraint c_age check(age between 20  and 39),
	addr varchar2(20 byte) null,
	input_date date default sysdate

);
--user_constraints 에서는 제약사항(PK, FK, UK, check, not null)만 확인가능
select * from user_constraints;

select * from user_tab_cols
where table_name='OTHER_CONSTRAINTS';


--입력성공
--최초생성
insert into other_constraints(name, age, addr, input_date)
values('이재찬',27,'서울시','2018-10-26');
--주소 & 날짜 생략해도 입력가능
insert into other_constraints(name, age)
values('박영민',27);

--입력에러
--이름이 생략되는 경우(not null조건에 위배)
insert into other_constraints(name, age, addr, input_date)
values('',27,'서울시','2018-10-26');
--나이가 체크조건에 부합하지 않을 경우
insert into other_constraints(name, age, addr, input_date)
values('이재찬',15,'서울시','2018-10-26');
insert into other_constraints(name, age, addr, input_date)
values('이재찬',19,'서울시','2018-10-26');
insert into other_constraints(name, age, addr, input_date)
values('이재찬',40,'서울시','2018-10-26');

select * from other_constraints;

--not null은 컬럼단위만 가능
create table temp(
	name varchar2(10),
	constraint c_name1 null(name)
);
