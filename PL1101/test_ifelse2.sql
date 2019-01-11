set serveroutput on
set verify off;

accept grade prompt '고객등급 : ';
accept item_name prompt '상품명 : ';
accept price prompt '상품가격 : ';
declare
	grade varchar2(30) :='&grade';
	item_name varchar2(60) :='&item_name';
	price number :=&price;
	sale number;
begin
	if grade in ('특별','일반') then
		if grade = '특별' then
			sale :=0.5;
		else
			sale :=0.3;		
		end if;
		dbms_output.put_line(grade || '고객님 구매하신 상품' ||
								 item_name || '이고 정상가 ' ||
								  price || '원 이며 할인가' || (price-price*sale));	
	end if;

end;
/