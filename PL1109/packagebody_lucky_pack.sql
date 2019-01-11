create or replace package body lucky_pack
as
	--------lucky_num ����---------------
	function lucky_num return number
	is
	begin
		return trunc(dbms_random.value(1,46));
	end lucky_num;
    --------lucky_num ����---------------



	
	
	---------���� �� ���ϴ� �Լ�------------------ 
	
	--1.  lucky_pack ��Ű���� �¾�ظ� �Է¹����� �츦 ��ȯ�ϴ� �Լ��� �߰��ϼ���.
	--  �� - �¾�ظ� 12�� ���� �������� 11�̸� ���, 10- ��, 9-��,8-��,7-�䳢,6-ȣ����,5-��,4-��,3-����, 2-��,1-��,0-������ 
	function search_ttee(b_year varchar2) return varchar2
	is
		ttee varchar2(9);		
	
	begin
	
		if mod(b_year,12) = 11 then
			ttee := '��';
		elsif mod(b_year,12) = 10 then
            ttee := '��';
		elsif mod(b_year,12) = 9 then
			ttee := '��';
		elsif mod(b_year,12) = 8 then
			ttee := '��';
		elsif mod(b_year,12) = 7 then
			ttee := '�䳢';
		elsif mod(b_year,12) = 6 then
			ttee := 'ȣ����';
		elsif mod(b_year,12) = 5 then
			ttee := '��';
		elsif mod(b_year,12) = 4 then
			ttee := '��';
		elsif mod(b_year,12) = 3 then
			ttee := '����';
		elsif mod(b_year,12) = 2 then
			ttee := '��';
		elsif mod(b_year,12) = 1 then
			ttee := '��';
		elsif mod(b_year,12) = 0 then
			ttee := '������';
		else
			ttee := '�ƹ� �쵵 �ƴմϴ�.';
		end if;	
		
		return ttee;
	end search_ttee;
	                                                                                      
	
	---------���� �� ���ϴ� �Լ� ����------------------
	
		
	---------���� ��� �ټ� ��� ����------------------
	
	--2. lucky_pack ��Ű���� �μ���ȣ�� �޾� emp ���̺��� �μ���
	--   ����� ��� �ټӳ���� out_parameter�� �����ϴ� procedure��
	--   �߰��ϼ���.
	
	procedure avg_dept (i_deptno in number, avg_period out number)
	is
		period number;

	begin
				

		
		if i_deptno = 10 then
		
		end if;
	
	end;
		
	 
	

	
	
	
















	
	---------lucky_name ����------------------
	procedure lucky_name(name out varchar2)
	is
		type name_tab is table of varchar2(30)
			index by binary_integer;
		
		name_arr name_tab;
		
		temp_num number;		 
	begin
		name_arr(1) := '������';
		name_arr(2) := '�̺���';
		name_arr(3) := '������';
		name_arr(4) := '������';
		name_arr(5) := '�ڼҿ�';
		name_arr(6) := '������';
		name_arr(7) := '������';
		
		temp_num := trunc(dbms_random.value(1,name_arr.count+1));
		
		name :=	name_arr( temp_num );
	end lucky_name; 	
	---------lucky_name ����------------------ 

	
	---------gen_ssn ����---------------------
	procedure create_ssn(i_birth in varchar2, i_gender in varchar2, i_name in varchar2, ssn out char)
	is
		--�ֹι�ȣ�� �����ϴ� ���̺�
		type ssn_tab is table of number(1) index by binary_integer;
		ssn_arr ssn_tab;
		
		
		--�Է¹��� ������ ���ڷ� ��� ����
		gender_num number := 2;
		temp_num number := 0;
		flag_num number :=2;
		
		ssn_value varchar2(14);
		
	begin
	    --�ֹι�ȣ ����-------------------------------
		--�Է¹��� ��������� ssn_tab�߰�
		for i in 1 .. length(i_birth) loop
			ssn_arr(i) := substr(i_birth,i,1);
		end loop;
			
		--���� ä��� 1900��	   
	    if i_gender = '����' then
			gender_num := 1;     
	    end if;
	
		ssn_arr(7) := gender_num;
	    --������ ��° �� ���� ä���.
	    --8801011xxxxx
	    for i in 8 .. 12 loop
	    	ssn_arr(i) := trunc(dbms_random.value(0,10),0);
	    end loop;
	    --������ �ֹι�ȣ�� ������ ���ڸ� ä��� ���� ����
	    for i in 1 .. ssn_arr.count loop
			temp_num := temp_num+ssn_arr(i)*flag_num;
			flag_num := flag_num+1;
			if flag_num =10 then
				flag_num := 2;
			end if;			     	
	    end loop;	
			
			ssn_arr(13) := mod(11-mod(temp_num,11),10);
			
			ssn_value := i_birth || '-' || gender_num ||  ssn_arr(8) ||
																		ssn_arr(9) ||
																		ssn_arr(10) ||
																		ssn_arr(11) ||
																		ssn_arr(12) ;
		-------------------------------------------
		------class4_info �μ�Ʈ �ϱ�--------------------
		ssn := ssn_value;
		
		insert into class4_info(name, ssn)
		values(i_name, ssn_value );

		
			
	end create_ssn;
	---------gen_ssn ����---------------------

	
end;
/
