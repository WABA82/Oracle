--숙제1.
--제조사를 두개 입력받아 제조사에 해당하는 모든 차량의
-- 제조국, 제조사,모델명,년식,가격,입력일 조회 하세요.
-- 출력은 가격의 오름차순으로 조회하였을 때 조회된 결과에 
--  3~6번째 레코드만  출력하세요.
--
--현대, 기아를 입력하였을 때
-- 출력 예
-------------------------------------------------------------------
--번호 제조국  제조사  모델명  년식  가격   입력일 
-------------------------------------------------------------------
--1     국산     현대    아반테  2001  3,500 mm-dd-yyyy
-------------------------------------------------------------------
--검색 결과 현대 [x]대, 기아 [x]대
--아반테 x대와 소렌토 x대는 검색 결과에 나온 대수만 카운트 합니다.

set verify off
set serveroutput on
	accept maker1 prompt '제조사1 : ';
	accept maker2 prompt '제조사2 : ';
declare
	--조회한 행을 저장할 레코드타입 만들기
	type rec_car is record (country car_country.country%type,
								maker car_country.maker%type,
								
								model car_maker.model%type,
								
								car_year car_model.car_year%type,
								price car_model.price%type,
								hiredate car_model.hiredate%type);
	
	--레코드타입을 담을 레코드테이블 선언
	type tab_car is table of rec_car index by binary_integer;
	--테이블을 이용한 변수 선언
	arr_car tab_car;
	
	--인덱스 찾는용 변수 선언
	i number := 0;

begin
	--출력
	dbms_output.put_line('-------------------------------------------------------------------');		
	dbms_output.put_line('번호	제조국	제조사	모델명	년식	가격	입력일');
	dbms_output.put_line('-------------------------------------------------------------------');
	
		--커서만들고 인출
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
	
	--커서사용
	for i in 1 .. arr_car.count loop
		dbms_output.put_line( i || '번		' ||
									arr_car(i).country || '	' ||
									arr_car(i).maker || '	' ||
									arr_car(i).model || '	' ||
									arr_car(i).car_year || '	' ||
									arr_car(i).price || '	' ||
									arr_car(i).hiredate);	
	end loop;
end;
/
