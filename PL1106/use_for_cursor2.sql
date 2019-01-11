--����
--1. ���� ���� �Է¹޾�  car_model ���̺��� 
--  ������, ������, ���,����,�ɼ�,�Է��� ��ȸ.

set serveroutput on
set verify off
	accept model prompt '�𵨸� : '
declare
	--��ȸ�� ���� �����ϰ� ����ϱ� ���� record type ����
	type rec_car is record (country car_country.country%type,
								maker car_country.maker%type, 
								car_year car_model.car_year%type,
								price car_model.price%type,
								car_option car_model.car_option%type,
								hiredate car_model.hiredate%type);
	--����� record������������ table ����
	type tab_car is table of rec_car index by binary_integer;
	
	--����� table�� table���� ����
	arr_car tab_car;
	
	--�ɼ��� ó�� ',' ������ ����ϱ� ���� �ɼ��� �����ϱ� ���� ����
	car_option car_model.car_option%type;
	--��ü �˻������ �����ϴ� ����
	search_cnt number :=0;
	--�ε����� �����ϱ� ���� ����
	i number := 0;	
begin

	dbms_output.put_line('------------------------------------------------');
	dbms_output.put_line('������	������	���	����	�ɼ�	�Է���');
	dbms_output.put_line('------------------------------------------------');
	
	--�˻��� ����� table�� ���� (�ڵ� �и�) - ����� ������ ����
	
	for temp in (
		select 	cc.country, cc.maker, 
					cmo.car_year, cmo.price, cmo.car_option, cmo.hiredate
		from 		car_country cc, car_maker cma, car_model cmo
		where 	(cma.maker = cc.maker and cmo.model = cma.model) and cmo.model = '&model'
		order by cmo.price asc
		)
	loop
		i := i+1;
		arr_car(i) := temp;	
	end loop;
	

	--������ �����͸� ����Ͽ� ��� ������ ����� ����Ѵ�.
	for idx in 1 .. arr_car.count loop

				car_option := arr_car(idx).car_option;				
				if instr(car_option,',') > 0 then 
					car_option := substr(car_option,1,instr(car_option,',')-1);
				end if;
	
	dbms_output.put_line(arr_car(idx).country || ' ' || 
								arr_car(idx).maker || ' ' || 
								arr_car(idx).car_year || ' ' || 
								to_char(arr_car(idx).price,'9,999') || ' ' || 
								car_option || ' ' || 
								to_char(arr_car(idx).hiredate,'mm-dd-yy q'));
	end loop;
	
	search_cnt := i;
	dbms_output.put_line('------------------------------------------------');
	dbms_output.put_line('�˻� ��� [' || search_cnt || '] �� ');		
	
		
end;
/

