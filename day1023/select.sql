-- Ư�� ���̺��� ���ϴ� �÷��� ��� ���ڵ带 ��ȸ
-- Class4_info ���̺��� �̸�,��ȣ,���� ��ȸ �غ���
/*
select	name,num,age
from	class4_info;
*/
/*
-- ��ȸ�ϴ� �÷��� *�� ����ϸ� ��� �÷��� ��ȸ
 select *
 from	class4_info;
*/
-- �÷�ũ�� ����
-- 0: �����Ͱ� ���ٸ� 0�� ä�� ���
 column num format 0000

-- 9: �����Ͱ� �����ϴ� �͸� ���
 col age format 999
 col eye format 0.000

-- ���ڿ��� a���ڼ��� ����
 column name format a6
 col ssn format a6
 col email format a10


 select * from	class4_info;

--�÷��� alias �ο�
select num, name, input_date as i_date1, input_date as i_date2
from class4_info;

