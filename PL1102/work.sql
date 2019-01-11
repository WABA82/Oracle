--���� 2.
--  �л����� ������ ó���ϴ� PL/SQL�ۼ�.
--  ��ȣ, �̸�, ����Ŭ����,�ڹ�����,����,��� �� ������ ���ִ� record��
--  ����� �Ʒ��� �����͸� �Է��� ��
--  �ݺ����� ����Ͽ�  ����,����� ó���ϴ� PL/SQL �ۼ�
--
--1, ������, 80,81
--2, ����ö, 94,80
--3, ������, 97,96
--4, �ڿ���, 86,92
--5, ���ü�, 76,99
--
--���
--��ȣ, �̸�, ����Ŭ����, �ڹ�����, ����, ���
--�ڹ��ְ����� [XX] ����Ŭ �ְ����� [XXX]

set verify on;
set serveroutput on;

declare
	type stu_record is record(num number(1), name varchar2(30), oracle_score number(2), java_score number(2));
	type stu_table is table of stu_record index by binary_integer;

	class4 stu_table;
	oracle_top number := 0;
	java_top number := 0;
begin
	class4(1).num := 1;
	class4(1).name := '������';
	class4(1).oracle_score := 80;
	class4(1).java_score := 81;
	
	class4(2).num := 2;
	class4(2).name := '����ö';
	class4(2).oracle_score := 94;
	class4(2).java_score := 80;
	
	class4(3).num := 3;
	class4(3).name := '������';
	class4(3).oracle_score := 97;
	class4(3).java_score := 96;
	
	class4(4).num := 4;
	class4(4).name := '�ڿ���';
	class4(4).oracle_score := 86;
	class4(4).java_score := 92;
	
	class4(5).num := 5;
	class4(5).name := '���ü�';
	class4(5).oracle_score := 76;
	class4(5).java_score := 99;
	
	dbms_output.put_line('�����ο� : ' || class4.count);
	dbms_output.put_line('��ȣ	�̸�	����Ŭ����	�ڹ�����	����	���');
	
	for i in 1 .. class4.count loop
		dbms_output.put_line(class4(i).num || '---' || class4(i).name || '---' || class4(i).oracle_score || '---' || class4(i).java_score
									|| '---' || (class4(i).oracle_score+class4(i).java_score) || '---' || ((class4(i).oracle_score+class4(i).java_score)/2) );
		
		if class4(i).java_score > java_top then
			java_top := class4(i).java_score;
		end if;
		if class4(i).oracle_score > oracle_top then
			oracle_top := class4(i).oracle_score;
		end if;
	end loop; 
		
		dbms_output.put_line('java top : ' || java_top || ',  oracle top : ' || oracle_top );
end;
/