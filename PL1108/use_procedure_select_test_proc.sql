--���޿� ���� �����, ������ ��ȸ

var msg varchar2;
var emp_cnt number;
var sal number;
--�����۵�
exec select_test_proc_cnt('����',:msg, :emp_cnt, :sal);

print msg;
print emp_cnt;
print sal;
--�����۵�
exec select_test_proc_cnt('���',:msg, :emp_cnt, :sal);

print msg;
print emp_cnt;
print sal;

--������� : ������ ������ ����� ���� ���
exec select_test_proc_cnt('�븮',:msg, :emp_cnt, :sal);

print msg;
print emp_cnt;
print sal;

--������� : ���� ������ �Է����� ��
exec select_test_proc_cnt('�˹�',:msg, :emp_cnt, :sal);

print msg;
print emp_cnt;
print sal;
