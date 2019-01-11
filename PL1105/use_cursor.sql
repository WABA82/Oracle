-- �������� ��ȸ�� �� ����ϴ� Ŀ��
-- dept ���̺��� ��� ���ڵ带 ��ȸ�ϴ� Ŀ��
select * from dept;

set serveroutput on

declare
	--1.���� : cursor Ŀ���� is select ....;
	cursor cur_dept is
		select deptno, dname, loc 
		from dept;
	
	--��ȸ����� ������ ���� ����
	deptno dept.deptno%type;
	dname dept.dname%type;
	loc dept.loc%type;
	
	dept_data dept%rowtype;	
	
	
begin
	open cur_dept;      
	if cur_dept%isopen then
	    --Ŀ���� ���� �ִٸ� ����Ŀ�����ݰ�
	    dbms_output.put_line('Ŀ���� ��������');
		close cur_dept;
	else
	    dbms_output.put_line('Ŀ���� ��������');
	end if;
    --2.����
	open cur_dept;
	
	--3. ���� : �ݺ�
	loop
		--into���� ���� ������ ����Ͽ� ó��.	
		--fetch cur_dept into deptno, dname, loc;
		
		--into���� ���� ������ ����Ͽ� ó��.		
		fetch cur_dept into dept_data;
		exit when cur_dept%notfound;
		
--		if cur_dept%notfound then
--			dbms_output.put_line('���ڵ� ����');
--			exit;
--		else
--			dbms_output.put_line('���ڵ� ����');	
--		end if;
			dbms_output.put_line(dept_data.deptno || ' ' || dept_data.dname || ' ' || dept_data.loc);
	end loop;      
	
		dbms_output.put_line('��ȸ�� ���ڵ� �� : ' || cur_dept%rowcount);
			
		
	--4. Ŀ�� �ݱ�
	close cur_dept;
end;
/