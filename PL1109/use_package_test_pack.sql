--��Ű�� ȣ��--

--��Ű�� �Լ� ȣ��--
select TEST_PACK.FUNC_GET_NAME('������')
from dual;


--��Ű�� ���ν��� ȣ��--
var age number;

exec TEST_PACK.PROC_GET_AGE(1993, :age);

print age;


--���� ���ϱ�
--���� : ������ ���� �����Ͽ� ��ȯ�ϴ� ��.

--dbms_random.value(����, �� ������) - ���ڸ� ��� �Լ�
--1~9���� ���� �ϳ��� ��ȯ
select trunc(dbms_random.value(1,10))
from dual;

--dbms_random.string('����', ���Ұ���) - ���ڿ��� ���� ��� �Լ�

--����
--'u' ������ �빮��
select dbms_random.string('u',10)
from dual;
--'l' ������ �ҹ���
select dbms_random.string('l',10)
from dual;
--'a' �Ҵ빮�� ȥ��
select dbms_random.string('a',10)
from dual;
--'x' ����ڿ� ������ ȥ��
select dbms_random.string('x',10)
from dual;
--'p' �����ڿ� Ư������ ȥ��
select dbms_random.string('p',10)
from dual;