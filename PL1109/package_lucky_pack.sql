--������ �̿��غ���--
                                                        

--���� ��� ���ν���                        

create or replace package lucky_pack
as
	--����� ���� ��� �Լ� 1~45 �� �ϳ�	
	function lucky_num return number;
    
    --1.  lucky_pack ��Ű���� �¾�ظ� �Է¹����� �츦 ��ȯ�ϴ� �Լ��� �߰��ϼ���.
	--  �� - �¾�ظ� 12�� ���� �������� 11�̸� ���, 10- ��, 9-��,8-��,7-�䳢,6-ȣ����,5-��,4-��,3-����, 2-��,1-��,0-������ 
	function search_ttee return varchar2;
	
	
	--���� ��� ���ν���
	procedure lucky_name(name out varchar2); 	
	
	--�������, ����, �̸��� �Է¹޾� �ֹι�ȣ�� �����Ͽ� out parameter�� �����ϰ� class4_info���̺� �߰��ϴ� procedure�ۼ�
	procedure create_ssn(i_birth in varchar2, i_gender in varchar2, i_name in varchar2, ssn out char);
	
	--2. lucky_pack ��Ű���� �μ���ȣ�� �޾� emp ���̺��� �μ���
	--   ����� ��� �ټӳ���� out_parameter�� �����ϴ� procedure��
	--   �߰��ϼ���.
	procedure avg_dept (i_deptno in number, avg_period out number);
	
	
	
end;
/
