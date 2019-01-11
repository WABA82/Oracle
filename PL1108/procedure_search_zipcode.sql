--���̸��� �Է¹޾� �����ȣ ���̺��� �ּҸ�  �˻��ϴ� ���ν���
--����������������  ��  ���� ���� ��ȸ �Ǵ�
--�����ȣ, �õ� , ����, ��, ������ ��� out parameter�� �Ҵ��ϰ�,
--��ȸ�� �����ȣ�� �Ǽ��� out parameter�� �Ҵ� �� ��

create or replace procedure search_zipcode
(i_dong in varchar2,
address out varchar2, search_cnt out number)
is
	--1. Ŀ������
	cursor cur_zipcode is 
		select    zipcode, sido, gugun, dong, nvl(bunji,'��������') as bunji
		from		zipcode
		where		dong like i_dong||'%'
		order by zipcode asc;
	
	type rec_zip is record
		(zip char(7), 
		sido char(6), 
		gugun varchar2(25), 
		dong varchar2(100), 
		bunji varchar2(25));
	--������ �����͸� ������ record ����	
	zip_data rec_zip;
	--���� ó�� ���ڵ带 ������ record ����
	first_data rec_zip;
	
--	cnt number := 0;
	
begin
	search_cnt := 0;
	--2. Ŀ�� ����
	if cur_zipcode%isopen then	
		close cur_zipcode;
	end if;
	
	open cur_zipcode;
	
	--3.����
	loop
		fetch cur_zipcode into zip_data;
		
		exit when cur_zipcode%notfound;
		search_cnt := search_cnt+1;
		
		if search_cnt = 1 then
			first_data := zip_data;
		end if;		
	end loop;
	
	search_cnt := cur_zipcode%rowcount;
	if search_cnt !=0 then
		address :=first_data.zip||'	'||
						first_data.sido||'	'||
						first_data.gugun||'	'||
						first_data.dong||'	'||
						first_data.bunji;
	else
		address := i_dong||'�� �������� �ʽ��ϴ�.';
	end if;
               
	--Ŀ���ݱ�
	close cur_zipcode;

	exception
	when invalid_cursor then
		address := 'Ŀ���� �߸��� ������ ����';
	when others then
		address := sqlerrm;

end;
 