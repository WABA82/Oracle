--FOR �ݺ���

--set serveroutput on
--
--declare
--
--begin 
--
--	for i in 1 .. 10 loop
--		dbms_output.put_line('i = ' || i);
--	end loop;
--end;
--/   

---- 1~9���� 1�� �����ϴ� for
--
--set serveroutput on
--
--declare
--	num number(1)
--begin 
--	num := 2;
--	for i in 1 .. 9 loop
--		dbms_output.put_line(num || ' * ' || i || ' = ' || num*i);
--	end loop;
--end;
--/   

--1~100���� �ձ��Ͽ� ��� : 5050

--set serveroutput on
--
--declare
--	num number;
--begin 
--	num := 0;
--	for i in 1 .. 100 loop
--		num := num+i;	
--	end loop;
--	dbms_output.put_line(num);
--end;
--/                                           


--������
set serveroutput on

declare
	msg varchar2(30);
begin                   
--	for i in 2 .. 9 loop
--		dbms_output.put_line( i || '�� ����');
--		for j in 1 .. 9 loop
--			dbms_output.put_line(i*j);
--		end loop;
--		dbms_output.put_line( i || '�� ��');
--	end loop;	
	
	msg := '������ �ݿ��� �Դϴ�.';
--	for�� ����Ͽ� ���� ���ھ� �߶� ���
	for i in 1 .. length(msg) loop
		dbms_output.put_line(substr(msg,i,1));
	end loop;
	
--	for�� ����Ͽ� ���� ���ھ� �߶� ������ �Ųٷ� ���
	for i in reverse 1 .. length(msg) loop
		dbms_output.put_line(substr(msg,i,1));
	end loop;
	
end;
/