--동이름을 입력받아 우편번호 테이블에서 주소를  검색하는 프로시저
--오름차순정렬했을  때  가장 먼저 조회 되는
--우편번호, 시도 , 구군, 동, 번지를 묶어서 out parameter에 할당하고,
--조회된 우편번호의 건수를 out parameter에 할당 할 것

create or replace procedure search_zipcode
(i_dong in varchar2,
address out varchar2, search_cnt out number)
is
	--1. 커서선언
	cursor cur_zipcode is 
		select    zipcode, sido, gugun, dong, nvl(bunji,'번지없음') as bunji
		from		zipcode
		where		dong like i_dong||'%'
		order by zipcode asc;
	
	type rec_zip is record
		(zip char(7), 
		sido char(6), 
		gugun varchar2(25), 
		dong varchar2(100), 
		bunji varchar2(25));
	--인출한 데이터를 저장할 record 변수	
	zip_data rec_zip;
	--가장 처음 레코드를 저장할 record 변수
	first_data rec_zip;
	
--	cnt number := 0;
	
begin
	search_cnt := 0;
	--2. 커서 열기
	if cur_zipcode%isopen then	
		close cur_zipcode;
	end if;
	
	open cur_zipcode;
	
	--3.인출
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
		address := i_dong||'은 존재하지 않습니다.';
	end if;
               
	--커서닫기
	close cur_zipcode;

	exception
	when invalid_cursor then
		address := '커서가 잘못된 연산을 수행';
	when others then
		address := sqlerrm;

end;
 