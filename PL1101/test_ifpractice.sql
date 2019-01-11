--work                        
--xx등급 고객님 xxx상품의 정가는 xx원 입니다.
--상품가격 xx원 할인가 xx원 입니다.

accept product prompt '상품명 : ';
accept grade prompt '고객등급 : ';
accept price prompt '가격 : ';

declare
	product varchar2(9);
	grade varchar(6);
	price number(2);
begin
	product = '&product';
	grade = '&grade';
	price = &price;

	if score='특별' then
	dbms_output.put_line('grade' || '등급 고객님' || product || '상품의 정가는' || price ||'원 입니다.')
	end if;
	dbms_output.put_line('grade' || '등급 고객님' || product || '상품의 정가는' || price ||'원 입니다.')
end;
/                  