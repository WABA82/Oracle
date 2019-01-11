--����1.
--�����縦 �ΰ� �Է¹޾� �����翡 �ش��ϴ� ��� ������
-- ������, ������,�𵨸�,���,����,�Է��� ��ȸ �ϼ���.
-- ����� ������ ������������ ��ȸ�Ͽ��� �� ��ȸ�� ����� 
--  3~6��° ���ڵ常  ����ϼ���.
--
--����, ��Ƹ� �Է��Ͽ��� ��
-- ��� ��
-------------------------------------------------------------------
--��ȣ ������  ������  �𵨸�  ���  ����   �Է��� 
-------------------------------------------------------------------
--1     ����     ����    �ƹ���  2001  3,500 mm-dd-yyyy
-------------------------------------------------------------------
--�˻� ��� ���� [x]��, ��� [x]��
--�ƹ��� x��� �ҷ��� x��� �˻� ����� ���� ����� ī��Ʈ �մϴ�.

set verify off
set serveroutput on
	accept maker1 prompt '������1 : ';
	accept maker2 prompt '������2 : ';
declare
	--��ȸ�� ���� ������ ���ڵ�Ÿ�� �����
	type rec_car is record (country car_country.country%type,
								maker car_country.maker%type,
								
								model car_maker.model%type,
								
								car_year car_model.car_year%type,
								price car_model.price%type,
								hiredate car_model.hiredate%type);
	
	--���ڵ�Ÿ���� ���� ���ڵ����̺� ����
	type tab_car is table of rec_car index by binary_integer;
	--���̺��� �̿��� ���� ����
	arr_car tab_car;
	
	--�ε��� ã�¿� ���� ����
	i number := 0;

begin
	--���
	dbms_output.put_line('-------------------------------------------------------------------');		
	dbms_output.put_line('��ȣ	������	������	�𵨸�	���	����	�Է���');
	dbms_output.put_line('-------------------------------------------------------------------');
	
		--Ŀ������� ����
	for temp in (select		rownum, R, country, maker, model, car_year, price, hiredate
					from		(select rownum R, country, maker, model, car_year, price, hiredate
								from ( select	cc.country, cc.maker, cma.model, cmo.car_year, cmo.price, cmo.hiredate
			 							from		car_country cc, car_maker cma, car_model cmo
				       					where		(cma.maker = cc.maker and cmo.model = cma.model)
					 					order by price asc))
					where		(R between 3 and 6) and (maker = '&maker1' or maker = '&maker2'))
	loop
		i := i+1;
		arr_car(i) := temp;	
	end loop;
	
	--Ŀ�����
	for i in 1 .. arr_car.count loop
		dbms_output.put_line( i || '��		' ||
									arr_car(i).country || '	' ||
									arr_car(i).maker || '	' ||
									arr_car(i).model || '	' ||
									arr_car(i).car_year || '	' ||
									arr_car(i).price || '	' ||
									arr_car(i).hiredate);	
	end loop;
end;
/
