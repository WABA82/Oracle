--�ó�� ����

select * from user_synonyms;

create synonym tmp for TABLE_MULTIPRIMARY;

--�ó�� DML ���
select * from tmp;

insert into tmp (ITEM_NUM, ITEM, ITEM_INFO)
values('item_0003', '�ٳ���', '�ڿ� ���� ���̴��� ������ �̲�����');

update tmp
set item_num = 'ITEM_0003'
where item = '�ٳ���';

drop synonym tmp;