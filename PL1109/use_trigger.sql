create table trigger1(
	name varchar2(30),
	age number(3),
	address varchar2(100)
);

create table trigger2(
	name varchar2(30),
	age number(3)
);

select * from TRIGGER1;
select * from TRIGGER2;

drop trigger test_trigger;
select * from user_triggers;

select * from TRIGGER1;
select * from TRIGGER2;

insert into trigger1(name, age, address)
values('������',26,'��õ�� ������');


update trigger1
set		name = '���ü�', age=30
where name = '������';

delete
from trigger1
where name = '������';

delete from trigger2
where name = '������';

select * from user_triggers;
drop trigger event_compare;

insert into class4_info(num, age) values(99,29);
commit;
select * from CLASS4_INFO;
