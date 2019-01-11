select * from user_procedures;

drop function plus;

--SSN 유효성 검증
select check_ssn('880101-123456'),
		check_ssn('8801011-234567'),
		check_ssn('88010101234567'),
		check_ssn('880101-1234567')
from dual;

select * from CLASS4_INFO;

update class4_info
set			ssn='8801011-234567'
where		num=5;

update class4_info
set			ssn='880101-123456'
where		num=6;
commit;

--class4_info테이블에서 번호 이름 주민번호를 조회
--주민번호의 형식을 체크하여 모든 레코드를 조회
select    num, name, ssn, check_ssn(ssn)
from		class4_info;

--주민번호가 유효할 때 나이를 구하는 함수 사용
select	get_age('880101-123456'),
		get_age('8801011-234567'),
		get_age('88010101234567'),
		get_age('880101-1234567'),
		get_age('010101-4234567'),
		get_age('880101-5234567'),
		get_age('000101-7234567'),
		get_age('990101-0234567')
from dual;

insert into class4_info(num,name,ssn)
values(8,'제임스','890307-5234567');
insert into class4_info(num,name,ssn)
values(9,'혜리','090307-4234567');
insert into class4_info(num,name,ssn)
values(10,'오영군','990307-9234567');
commit;

--번호 이름 주민번호  나이 조회
--나이는 주민 번호가 유효했을 때는 나이를 보여주고
--유효하지 않다면 0을 출력

select num, name, ssn,check_ssn(ssn), get_age(ssn)
from class4_info;

--이메일의 유효성 검증
select	valid_email('@.'),
		valid_email('0@b.c'),
		valid_email('00000000.c'),
		valid_email('00000@0000'),
		valid_email('00000@0000.com')
from dual;

--번호, 이름, 이메일, 이메일의 유효성 조회

select num, name, email, valid_email(email)
from	class4_info;

-- 1~9999999 까지 1씩 증가하는 시퀀스 만들기
create sequence seq_item
increment by 1
start with 1
maxvalue 9999999
cache 10
nocycle;

select * from user_sequences;

select seq_item.currval
from dual;

create table test_func(
	num char(10),
	name varchar2(30),
	input_date date default sysdate,
	constraint pk_test_func primary key(num)
);

--함수를 호출하여 지정된 형식의 번호를 얻기
--()는 있어도 되고 생략도 가능하다.
select	item_num,item_num()
from dual;

--문자열형식의 증가하는 번호를 사용하여 테이블에 추가
insert
into test_func(num, name)
values(item_num, '김희철');

select*from test_func;

select	ssn, concat(substr(ssn,1,instr(ssn,'-')-1),substr(ssn,instr(ssn,'-')+1))
from class4_info;

select valid_ssn('121212-1234567')
from dual;

select num,name, ssn, valid_ssn(ssn)
from class4_info;
