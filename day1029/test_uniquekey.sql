--유니크의 사용
--값이 없을 수도 있지만, 있다면 유일한 값을 가져야 할 때.
--이름, 이메일, 주소를 저장하는 테이블을 생성

create table column_unique(
	name varchar2(30),
	email varchar2(50) constraint uk_email unique,
	addr varchar2(100)
);

select * from user_constraints;

--추가성공
--최초입력
insert into column_unique(name,email,addr)
values('이재찬','lee@test','경기도 수원시 영통구');
commit;
--null허용
insert into column_unique(name,addr)
values('이재찬','경기도 수원시 영통구');
commit;

insert into column_unique(name,email,addr)
values('이재찬1','','경기도 수원시 영통구');
commit;


select * from column_unique;

--실패
--같은 이메일이 입력되었을 때
insert into column_unique(name,email,addr)
values('박영민','lee@test','부산시');
commit;

--TCL
--번호, 이름, 전화번호, 카드번호를 저장테이블 생성
--전화번호와 카드번호는 없을수도 있지만 있다면 유일할 것
create table table_unique(
	num number(5),
	name varchar2(30),
	tel varchar2(13),
	card_num char(4),
	constraint uk_tel unique(tel),
	constraint uk_card_num unique(card_num)
);

--추가성공
--최초입력
insert into table_unique(num,name,tel,card_num)
values(1,'김정운','010-8769-6112','1234');
--ㅇ
insert into table_unique(num,name,tel,card_num)
values(2,'이재현','010-1111-2222','1235');

insert into table_unique(num,name,tel,card_num)
values(2,'이재현운','','');

insert into table_unique(num,name)
values(2,'이재현');

insert into table_unique(num,name)
values(3,'이재현');


--에러
--동일한 값이 들어가는 경우
insert into table_unique(num,name,tel,card_num)
values(4,'정택성','010-1111-2222','1235');

insert into table_unique(num,name,tel,card_num)
values(4,'정택성','010-1111-2222','9999');



select * from table_unique;
select * from user_constraints;
select * from user_indexes;

