--�� ���� �Է¹޾� ���ϱ� ������ ����� out parameter�� �����ϴ� procedure
create or replace procedure proc_plus(num1 in number,
	num2 in number, num3 out number)
	
is
		--parameter��� ���� ������ �ۼ��� �� ����.
		--num varchar2(30);
		--�������� ������ ������ procedure��� �ٸ��� �����Ѵ�.
begin
	--in parameter�� ���� �Ҵ� �� �� ����.
	--out parameter����
	num3 := num1+num2;
end;
/

--1. �ҽ��ۼ�
--2. ������
--3. ���ε� ������ ���� :var val number
--4. �ܵ� ���� : exec proc_plus(11,7,:val)
--5. ���ε庯���� �� ��� : print val