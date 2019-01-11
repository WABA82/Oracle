--1.  class4 �������� �л����� �������� ���ϴ�  PL/SQL�� ����
--   �ϰ����Ѵ�.  ���߱������ ����� �Ʒ��� ������ 
--   [���� : 1200��,  ����ö :1250��] , 10Ű�θ� �ʰ��ϸ� ��4Ű�θ���
--  100���� ��� �� �ΰ��ȴ�.  
--  �� ������ �̿��Ͽ� �Ʒ� �л����� �����͸� ó���ϼ���
--  ������. 
-- 1, ������, ����� ������ ���ﵿ, 5Ű��, ����
--  2, ����ö, ��õ�� ������ ������, 20Ű��, ����ö
--  3, ������, ��õ�� ���� ����, 16Ű��, ����ö
--  4, �ڿ���, ����� ���Ǳ� ��õ��, 10Ű��, ����ö
--  5, ���ü�, ����� ���빮�� ���빮��, 8Ű��, ����
--
--   ���
--   ��ȣ, �̸�,  �ּ�, �Ÿ�, �������, �⺻���, �ѿ��

set serveroutput on

declare
 type stu_record is record (num number(1), name varchar2(30), loc varchar2(60), dist number(2), trans varchar2(30), fee number(4), plus_fee number(4));
 type stu_table is table of stu_record index by binary_integer;
 
 class4 stu_table;
 add_fee number;
begin
	class4(1).num := 1;
	class4(1).name := '������';
	class4(1).loc := '����� ������ ���ﵿ';
	class4(1).dist := 5;
	class4(1).trans := '����';
	
	class4(2).num := 2;
	class4(2).name := '����ö';
	class4(2).loc := '��õ�� ������ ������';
	class4(2).dist := 20;
	class4(2).trans := '����ö';
	
	class4(3).num := 3;
	class4(3).name := '������';
	class4(3).loc := '��õ�� ���� ����';
	class4(3).dist := 16;
	class4(3).trans := '����ö';
	
	class4(4).num := 4;
	class4(4).name := '���ü�';
	class4(4).loc := '����� ���Ǳ� ��õ��';
	class4(4).dist := 10;
	class4(4).trans := '����ö';
	
	class4(5).num := 5;
	class4(5).name := '������';
	class4(5).loc := '����� ���빮�� ���빮��';
	class4(5).dist := 8;
	class4(5).trans := '����';
	
	dbms_output.put_line('�����ο� : ' || class4.count);
	
	add_fee :=100;
	for i in 1 .. class4.count loop 
	
		if class4(i).trans = '����ö' then
			class4(i).fee := 1250;

		end if;
		
		if class4(i).trans = '����'	then
			class4(i).fee := 1200;
		end if;
		
		if class4(i).loc > 10 then
			class4(i).plus_fee := class4(i).fee+add_fee*;
		end if;
		
		dbms_output.put_line(class4(i).num || '		' || class4(i).name || '		' || class4(i).loc || '		' || class4(i).dist || '		' || class4(i).trans || class4(i).fee || class4(i).plus_fee );	
	
	end loop;
	
end;
/

