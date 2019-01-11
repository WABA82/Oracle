--����
--1. ���� ���� �Է¹޾� car_model ���̺��� ���, ����, �ɼ�, �Է����� ��ȸ.
--���
--xxxx�� �˻� ���
-------------------------------------------------------
--����	����		�Է���					�ɼ�
-------------------------------------------------------
--2010	1,990	��-��-yy	�б�				ó��, ������
-------------------------------------------------------
--�˻� ��� [ x ] ��
--������ ������������ ����
--(���ڵ�� ���̺��� ��� ����ϼ���)

set verify off;
set serveroutput on;

accept model prompt '������ : ';
declare
	--1.Ŀ������
	cursor cur_cmo is
		select car_year, to_char(price,'0,000'), to_char(hiredate,'mm-dd-yy q') hiredate, substr(car_option,1,instr(car_option,',')-1) 
		from	 car_model
		where model = '&model'
		order by price asc;
	
	--���ڵ� ���� ����
	type rec_cmo is record(
	 	car_year car_model.car_year%type,
	 	price varchar2(30),
	 	hiredate	varchar2(15),
	 	car_option varchar2(30)
	);
	cmo_data rec_cmo;
	
	--���ڵ� ������ ��� ���� ���� PL/SQL���̺� �����
	type tab_cmo is table of rec_cmo index by binary_integer;
    --���̺� ���� �����
	arr_cmo tab_cmo;
	
    --���� i ����
    i number := 0;
begin
	--2.Ŀ������
	if cur_cmo%isopen then
		close cur_cmo
	end if; 
	open cur_cmo;
	
	--3.Ŀ�����(����)
	loop
		fetch cur_cmo into cmo_data;		
		exit when cur_cmo%notfound; 
		i := i+1;
		arr_cmo(i) := cmo_data;
	end loop;
	
	--����� �κ�
	-- i�� 0�� �ƴ϶�� �Ʒ��� ����� �ȴ�.
	if i !=0 then	
		dbms_output.put_line('&model' || '�� �˻� ���');
		dbms_output.put_line('����	����	�Է���	�ɼ�');
			for idx in 1 .. arr_cmo.count loop
				dbms_output.put_line(arr_cmo(idx).car_year || '	' || arr_cmo(idx).price || '	' || arr_cmo(idx).hiredate || '	' || arr_cmo(idx).car_option );	
			end loop;
	-- i�� 0�� �̶�� �Ʒ��� ����� �ȴ�.
	else
		dbms_output.put_line('&model' || '���� �����ϴ�.');
		dbms_output.put_line('�˻� ��� [' || cur_cmo%rowcount || '] ��');
	end if;
		dbms_output.put_line('����� �ּż� �����մϴ�.');
	close cur_cmo;	
end;
/