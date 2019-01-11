select * from user_procedures;

drop function plus;

--SSN ��ȿ�� ����
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

--class4_info���̺��� ��ȣ �̸� �ֹι�ȣ�� ��ȸ
--�ֹι�ȣ�� ������ üũ�Ͽ� ��� ���ڵ带 ��ȸ
select    num, name, ssn, check_ssn(ssn)
from		class4_info;

--�ֹι�ȣ�� ��ȿ�� �� ���̸� ���ϴ� �Լ� ���
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
values(8,'���ӽ�','890307-5234567');
insert into class4_info(num,name,ssn)
values(9,'����','090307-4234567');
insert into class4_info(num,name,ssn)
values(10,'������','990307-9234567');
commit;

--��ȣ �̸� �ֹι�ȣ  ���� ��ȸ
--���̴� �ֹ� ��ȣ�� ��ȿ���� ���� ���̸� �����ְ�
--��ȿ���� �ʴٸ� 0�� ���

select num, name, ssn,check_ssn(ssn), get_age(ssn)
from class4_info;

--�̸����� ��ȿ�� ����
select	valid_email('@.'),
		valid_email('0@b.c'),
		valid_email('00000000.c'),
		valid_email('00000@0000'),
		valid_email('00000@0000.com')
from dual;

--��ȣ, �̸�, �̸���, �̸����� ��ȿ�� ��ȸ

select num, name, email, valid_email(email)
from	class4_info;

-- 1~9999999 ���� 1�� �����ϴ� ������ �����
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

--�Լ��� ȣ���Ͽ� ������ ������ ��ȣ�� ���
--()�� �־ �ǰ� ������ �����ϴ�.
select	item_num,item_num()
from dual;

--���ڿ������� �����ϴ� ��ȣ�� ����Ͽ� ���̺� �߰�
insert
into test_func(num, name)
values(item_num, '����ö');

select*from test_func;

select	ssn, concat(substr(ssn,1,instr(ssn,'-')-1),substr(ssn,instr(ssn,'-')+1))
from class4_info;

select valid_ssn('121212-1234567')
from dual;

select num,name, ssn, valid_ssn(ssn)
from class4_info;
