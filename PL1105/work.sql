--숙제
--1. 차량 모델을 입력받아 car_model 테이블에서 년식, 가격, 옵션, 입력일을 조회.
--출력
--xxxx모델 검색 결과
-------------------------------------------------------
--연식	가격		입력일					옵션
-------------------------------------------------------
--2010	1,990	월-일-yy	분기				처음, 까지만
-------------------------------------------------------
--검색 대수 [ x ] 대
--가격의 오름차순으로 정렬
--(레코드와 테이블을 모두 사용하세요)

set verify off;
set serveroutput on;

accept model prompt '차량모델 : ';
declare
	--1.커서선언
	cursor cur_cmo is
		select car_year, to_char(price,'0,000'), to_char(hiredate,'mm-dd-yy q') hiredate, substr(car_option,1,instr(car_option,',')-1) 
		from	 car_model
		where model = '&model'
		order by price asc;
	
	--레코드 변수 선언
	type rec_cmo is record(
	 	car_year car_model.car_year%type,
	 	price varchar2(30),
	 	hiredate	varchar2(15),
	 	car_option varchar2(30)
	);
	cmo_data rec_cmo;
	
	--레코드 변수에 담긴 값을 넣을 PL/SQL테이블 만들기
	type tab_cmo is table of rec_cmo index by binary_integer;
    --테이블 변수 만들기
	arr_cmo tab_cmo;
	
    --변수 i 선언
    i number := 0;
begin
	--2.커서열기
	if cur_cmo%isopen then
		close cur_cmo
	end if; 
	open cur_cmo;
	
	--3.커서사용(인출)
	loop
		fetch cur_cmo into cmo_data;		
		exit when cur_cmo%notfound; 
		i := i+1;
		arr_cmo(i) := cmo_data;
	end loop;
	
	--출력할 부분
	-- i가 0이 아니라면 아래가 출력이 된다.
	if i !=0 then	
		dbms_output.put_line('&model' || '모델 검색 결과');
		dbms_output.put_line('연식	가격	입력일	옵션');
			for idx in 1 .. arr_cmo.count loop
				dbms_output.put_line(arr_cmo(idx).car_year || '	' || arr_cmo(idx).price || '	' || arr_cmo(idx).hiredate || '	' || arr_cmo(idx).car_option );	
			end loop;
	-- i가 0이 이라면 아래가 출력이 된다.
	else
		dbms_output.put_line('&model' || '모델이 없습니다.');
		dbms_output.put_line('검색 대수 [' || cur_cmo%rowcount || '] 대');
	end if;
		dbms_output.put_line('사용해 주셔서 감사합니다.');
	close cur_cmo;	
end;
/