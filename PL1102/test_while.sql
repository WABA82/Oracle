--while �ݺ���

--�ּ� 0�� ����, �ִ� ���Ǳ��� �ݺ������ϴ� while

set serveroutput on
declare
	i number;
begin
	--1���� ���� 10���� 1�� �����ϴ� �ݺ��� ����ϴ� while
	i :=1;
	while i <= 10 loop
		dbms_output.put_line(i);	
	i := i +1;
	end loop;                   
	
dbms_output.put_line('-------------------------------------------------');	
	
	--1~100 ������ Ȧ���� ����ϴ� while
	i :=1;
	while i <= 100 loop
		dbms_output.put_line(i);	
		
		i := i+2;
	end loop;	
		
end;
/