--null ��ȯ �Լ�
--null�� ISERT�� �� �÷��� ������� ���� ��� �Է�
--varchar2(char) : �÷��� ������� �ʰų�, ''�� ���
--number, date : �÷��� ������� �ʴ� ���.

--������̺��� �����, ����, ���ʽ� ��ȸ
--��, ���ʽ��� null�� ���, 100������ �ϰ� ����
select ename, sal, nvl(comm, 100) || '��'
from emp;

--�����ȣ���̺��� �Է��� ���� �����ȣ, �õ�, ����, ��, ���� ��ȸ
--��, ������ ���ٸ� ���������� ���
select  ZIPCODE, SIDO, GUGUN, DONG, nvl(BUNJI, '��������')
from zipcode
where dong like '����1��%';

--CLASS4_INFO���̺��� ��ȣ �̸� �Է��� ��ȸ
--��, �Է����� ���ٸ� ���糯¥ ���
select num, name, nvl(input_date, sysdate) as input_date
from class4_info;

select * from CLASS4_INFO;
