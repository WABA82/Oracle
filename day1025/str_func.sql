--���ڿ� �Լ����.
--���� : length
select 'oracle����' || length ('oracle') || '��', length('�׽�Ʈ')
from dual;

--������̺��� �����, ������� ���ڼ�
select ename, length(ename)
from emp;

--������̺��� ������� 4�� ����� ������� ��ȸ
select ename
from emp
where length(ename) = 4;

--�빮�� upper
select upper('test'), upper('�׽�ƮAbcdEfG')
from dual;

--�ҹ��� lower
select lower('test')
from dual;

--������̺��� ������� scott�� ����� �����ȣ, �����, �Ի���, ���� ��ȸ
select EMPNO, lower(ENAME), HIREDATE, SAL
from EMP
where lower(ename) = 'scott';
--where ename = upper('scott');

--�ε��� ��� : str(���ڿ�, ã�����ڿ�)
select instr('AbcdeF','A'), instr('AbcdeF','F'), instr('AbcdeF','K')
from dual;

select * from CLASS4_INFO;
insert into class4_info( NUM, NAME, EMAIL)
values(6,'�׽�Ʈ', 'test@kr');

insert into class4_info( NUM, NAME, EMAIL)
values(7,'�׽�Ʈ1','test.kr');
commit;

--�л����̺��� ��ȣ, �̸�, �̸��� ��ȸ
select num, name, email, instr(email,'@'), instr(email,'.')
from class4_info;

--���ڿ� �ڸ��� : substr(���ڿ�, �����ε���, �ڸ����ڼ�)
select substr('Abcdefg',4,3), substr('Abcdefg',2,5), substr('Abcdefg',1)
from dual;

--class4_info���̺��� ��ȣ, �̸�,�̸��� �÷���  '�����ּ�'�� ��ȸ �ϼ���.
--������ �ּҸ� ��ȸ �ϼ���.
select num, name, substr(email,1,(instr(email,'@')-1))
from class4_info;

select num, name, substr(email,(instr(email,'@')))
from class4_info;

--�������� : tirm(str), ltrim(str), rtrim(str)
select '['||trim('      A B C      ')||']', '['||ltrim('      A B C      ')||']', '['||trim('      A B C      ')||']',
		trim('-' from '---------Oracle----------' )
from dual;

--ù ���ڸ� �빮�ڷ� : initcap(''str)
select initcap('oracle java jsp jQuery SCOTT')
from dual;

select initcap(ename)
from emp;

--���ڿ� ���̱� : concat('���ڿ�', '���Ϲ��ڿ�')
select concat('ABC', 'DEF'), concat('ABC', 'DEF'), concat('ABC', 'DEF'),
from dual;

--���ڿ� ä��� : r | lpad(���ڿ�, ���ڸ���, ä�﹮�ڿ�)
select lpad('ABCDE',7,'$'), lpad('ABCDEFG',10,0)
from dual;

select rpad('ABCDEF',10,'��'), rpad('ABC', 10, '#')
from dual;