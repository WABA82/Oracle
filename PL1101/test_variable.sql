--����
set serveroutput on
declare
-- 1.������ ���� : ������ ��������(ũ��);
	name varchar2(60);

begin
--2. ���Ҵ� : ������:=��;
	name := 'ȫ�浿';
	name := '������';
--3. ��� : ���, ��������, ���Ҵ�
	dbms_output.put_line('�̸� : ' || name);
end;
/

--���̺��� ���������� �����ϴ� ����
set serveroutput on
declare
-- 1.������ ���� : ���̺��� �÷����������� �����Ͽ� ���� ����
	e_name emp.ename%type;
begin
--2.�� �Ҵ�
	e_name :='������';
--3. ��� : ���, ��������, ���Ҵ�
	dbms_output.put_line('�������� ��� : ' || e_name);
end;
/

--���̺��� ��� �÷��� ���������� �����ϴ� ����
set serveroutput on
declare
-- 1.������ ���� : ���̺��� ��� �÷����������� �����Ͽ� ���� ����
	row_type cp_emp%rowtype;
begin
--2.�� �Ҵ�
	row_type.empno := 1111;
	row_type.ename :='���ü�';
	row_type.hiredate := sysdate;
	row_type.sal :=2800;
--3. ��� : ���, ��������, ���Ҵ�
	dbms_output.put_line('�����ȣ : ' || row_type.empno || ', ����� : ' || row_type.ename || ', �Ի��� : ' || row_type.hiredate || ', ���� : ' || row_type.sal);
end;
/