--���� �Լ�
select sin(25), cos(25), tan(25)
from dual;

--���� : abs(��)
select abs(25), abs(-25)
from dual;

--�ݿø� : round(��, �ڸ���)
select round(555.55, -3),round(555.55, -2),round(555.55, -1),round(555.55, 0),round(555.55, 1),

		round(555.55, 2),
		round(555.555, 2)
from dual;
--���� : trunc(��, �ڸ���)
select trunc(555.55, -3),trunc(555.55, -2),trunc(555.55, -1),trunc(555.55, 0),trunc(555.55, 1),

		trunc(555.55, 2),
		trunc(555.555, 2)
from dual;

--�ø� : ceil(��)
select ceil(10.1),ceil(10.01)
from dual;

--���� : floor(��)
select floor(10.1), floor(10.01)
from dual;

--������̺��� �����ȣ, �����, �Ի���, ����, ������ ��ȸ
--��, ������ ������ 3.3%�� ����ϰ� ������ �����Ͽ� ���
select EMPNO, initcap(ENAME), HIREDATE, SAL, trunc(sal*0.033, -1) as tax
from emp;
