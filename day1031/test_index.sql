--������ ��ȸ
select * from user_indexes;

create table cp_zipcode as (select * from zipcode);

select count(*) from cp_zipcode;
select count(*) from zipcode;

--cp_zipcode���̺� seq�÷��� unique index ����
create unique index idx_zipcode on cp_zipcode(seq);

select * from user_indexes;

drop index idx_zipcode;

--�ε����� ������� �ʴ� ��ȸ(FULL SCAN)
select zipcode,sido,gugun,bunji,seq
from	zipcode
where zipcode='402-866';

--�ε����� ����� ���(B-TREE)
select /*+ ordered index (bit_zipcode)*/zipcode,sido,gugun,bunji,seq
from	cp_zipcode
where zipcode='402-866';

--�����ȣ�� �߸������ ��Ư�� ���¸� ������.
create index bit_zipcode on cp_zipcode(zipcode);

select * from user_indexes;

--�ε��� ������ �ϱ� : �ε����� ������ ���̺��� ����Ǹ� ��������� �������� �ʴ´�.
alter index idx_zipcode rebuild;

--group by ~ having (�����Լ��� ����� �� �ִ�.)~
--�μ��� ������� 4�� �̻��� �μ��� �μ���ȣ, �����, ������, �ְ����� ��ȸ
select deptno, count(deptno), sum(sal), max(sal)
from	emp
group by deptno having count(deptno)>4;

--replace : ���ڿ��� ���� ġȯ�Ѵ�.
select replace('������ ����� �Դϴ�.','������ ','������ ')
from dual;

select replace('���ü�, ������, ������, ����ö','������','���� ������')
from dual;

select * from user_objects;

drop table zipcode;
drop table cp_zipcode;
purge recyclebin;
