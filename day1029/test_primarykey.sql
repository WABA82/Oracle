-- 제약사항을 확인 : user_constraints
select * from user_constraints;

-- 번호, 이름, 전화번호, 주민번호, 이메일 저장하는 테이블 생성
-- 주민번호는 null을 허용하지 않으면서 유일해야한다.
create		table		column_primary(
	num number,
	name varchar2(30),
	tel	varchar2(13),
	ssn char(14) constraint pk_column_primary primary key,
	email varchar2(50)
);

drop table COLUMN_PRIMARY;
purge recyclebin;

select * from column_primary;

--------------------------------컬럼하나로  PK가 구성되는 경우
--추가성공
--최초 레코드 삽입
insert into column_primary(num,name,tel,ssn,email)
values(1,'이재찬','010-1234-5678','880101_1234567','lee@test.com');
commit;
select * from column_primary;
--주민번호가 다른경우
insert into column_primary(num,name,tel,ssn,email)
values(2,'이재현','010-2222-2789','890101_1234567','lee@test.com');
commit;

--추가실패
--같은 주민번호가 입력되는 경우
insert into column_primary(num,name,tel,ssn,email)
values(3,'정택성','010-1846-4678','880101_1234567','jung@test.com');
commit;
--null이 입려되는 경우
--숫자, 날짜는 컬럼이 생갹되면 null이 입력되고
--문자열(고정길이, 가변길이)는 컬럼이 생략되는 경우와 ''로 데이터가 추가되는 경우에 null 입력된다.
--컬럼이 생략되어 insert 경우
insert into column_primary(num,name,tel,email)
values(3,'정택성','010-1846-4679','jung@test.com');
--컬럼은 정의 되어 있으나''가 입력되는 경우
insert into column_primary(num,name,tel,,ssn,email)
values(3,'정택성','010-1846-6789','','jung@test.com');

select * from column_primary;

--테이블 단위 제약사항
--이름, 아이디, 비밀번호 저장 테이블 생성
--아이디는 null을 허용하지 않으면서 값은 유일해야한다.

create table table_primary(
 name varchar2(30),
 id varchar2(20),
 passwd varchar2(30),
 constraint pk_table_primary primary key(id)
);

-- 추가성공
insert into table_primary(name,id,passwd)
values ('김희철','kim','1234');
select * from TABLE_PRIMARY;
commit;
insert into table_primary(name,id,passwd)
values ('김희철','test','1234');
select * from TABLE_PRIMARY;
commit;

--추가실패
insert into table_primary(name,passwd)
values ('김희철','1234555');

insert into table_primary(name,id,passwd)
values ('김희철','','1234');


--여러개의 컬럼이 PK를 가지는 경우
--table 단위 제약사항으로만 설정가능 함!!!

--가장 마지막 사원번호 보다 1 증가한 값으로
--emp_00007899의 형식을 가진 값을 출력
select * from EMP;

select max(empno)
from emp;

select concat('EMP_',lpad(max(empno)+1,8,0))
from emp;

--아이템 이름, 번호, 설명
--아이템 번호 순차적으로 증가하고, ITEM_0001의 형식이다.
--아이템 번호와, 아이템명은 같을 수 없다.
create table table_multiprimary (
	ITEM_NUM char(9),
	ITEM varchar2(60),
	item_info varchar2(4000),
	constraint pk_table_multi_primary primary key(item_num,item)
);
select * from user_constraints;

select concat('ITEM_',lpad(nvl(max(item),0)+1,4,0))
from table_multiprimary;

--여러개의 컬럼이 하나의 PK로 구성되는 경우
--최초 데이터를 입력
insert into table_multiprimary(item_num,item,item_info)
values ((select concat('ITEM_',lpad(nvl(max(item),0)+1,4,0))
from table_multiprimary),'물파리','바로 앞 라이더에게 날려 라이더를 잠시 띄울수 있다.');
commit;

--nvl함수는 조회된 레코드가 null일때만 값을 변경(조회된 레코드가 없으면 동작을하지않는다.)
select concat('ITEM_',lpad(nvl(max(item),0)+1,4,0))
from table_multiprimary
--두컬럼의 값이 모두 다른경우 : 성공
insert into table_multiprimary(item_num,item,item_info)
values ((select concat('ITEM_',lpad(max(substr(item_num,instr(item_num,'_')+1))+1,4,0))
from table_multiprimary),'물폭탄','일정거리의 앞 라이더에게 날려 라이더를 잠시 띄울수 있다.');
commit;

--두 컬럼중 하나의 컬럼만 달라도 : 성공
insert into table_multiprimary(item_num,item,item_info)
values ('ITEM_0002','물파리','일정거리의 앞 라이더에게 날려 라이더를 잠시 띄울수 있다.');
commit;

select * from TABLE_MULTIPRIMARY;
/*
drop table table_multiprimary;
purge recyclebin;
*/

--에러가 발생하는 경우
--두컬럼이 모두 같은 값을 가질때
insert into table_multiprimary(item_num,item,item_info)
values ('ITEM_0002','물파리','당하면 짜증남');
commit;

--둘중 하나라도 null이 추가될때
insert into table_multiprimary(item_num,item,item_info)
values ('','물파리','당하면 짜증남');

delete from TABLE_MULTIPRIMARY where item_num = 'ITEM_2';
commit;

insert into table_multiprimary(item_num,item,item_info)
values ('ITEM_0003','앞선 특정 라이더를 조준하여 미사일 발사');

select * from EMP;
