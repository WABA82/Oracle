create or replace package body lucky_pack
as
	--------lucky_num 시작---------------
	function lucky_num return number
	is
	begin
		return trunc(dbms_random.value(1,46));
	end lucky_num;
    --------lucky_num 종료---------------



	
	
	---------숙제 띠 구하는 함수------------------ 
	
	--1.  lucky_pack 패키지에 태어난해를 입력받으면 띠를 반환하는 함수를 추가하세요.
	--  띠 - 태어난해를 12로 나눈 나머지가 11이면 양띠, 10- 말, 9-뱀,8-용,7-토끼,6-호랑이,5-소,4-쥐,3-돼지, 2-개,1-닭,0-원숭이 
	function search_ttee(b_year varchar2) return varchar2
	is
		ttee varchar2(9);		
	
	begin
	
		if mod(b_year,12) = 11 then
			ttee := '양';
		elsif mod(b_year,12) = 10 then
            ttee := '말';
		elsif mod(b_year,12) = 9 then
			ttee := '뱀';
		elsif mod(b_year,12) = 8 then
			ttee := '용';
		elsif mod(b_year,12) = 7 then
			ttee := '토끼';
		elsif mod(b_year,12) = 6 then
			ttee := '호랑이';
		elsif mod(b_year,12) = 5 then
			ttee := '소';
		elsif mod(b_year,12) = 4 then
			ttee := '쥐';
		elsif mod(b_year,12) = 3 then
			ttee := '돼지';
		elsif mod(b_year,12) = 2 then
			ttee := '개';
		elsif mod(b_year,12) = 1 then
			ttee := '닭';
		elsif mod(b_year,12) = 0 then
			ttee := '원숭이';
		else
			ttee := '아무 띠도 아닙니다.';
		end if;	
		
		return ttee;
	end search_ttee;
	                                                                                      
	
	---------숙제 띠 구하는 함수 종료------------------
	
		
	---------숙제 평균 근속 년수 시작------------------
	
	--2. lucky_pack 패키지에 부서번호를 받아 emp 테이블에서 부서별
	--   사원의 평균 근속년수를 out_parameter에 설정하는 procedure를
	--   추가하세요.
	
	procedure avg_dept (i_deptno in number, avg_period out number)
	is
		period number;

	begin
				

		
		if i_deptno = 10 then
		
		end if;
	
	end;
		
	 
	

	
	
	
















	
	---------lucky_name 시작------------------
	procedure lucky_name(name out varchar2)
	is
		type name_tab is table of varchar2(30)
			index by binary_integer;
		
		name_arr name_tab;
		
		temp_num number;		 
	begin
		name_arr(1) := '공선의';
		name_arr(2) := '이봉현';
		name_arr(3) := '백인제';
		name_arr(4) := '김정윤';
		name_arr(5) := '박소영';
		name_arr(6) := '최혜원';
		name_arr(7) := '이재찬';
		
		temp_num := trunc(dbms_random.value(1,name_arr.count+1));
		
		name :=	name_arr( temp_num );
	end lucky_name; 	
	---------lucky_name 종료------------------ 

	
	---------gen_ssn 시작---------------------
	procedure create_ssn(i_birth in varchar2, i_gender in varchar2, i_name in varchar2, ssn out char)
	is
		--주민번호를 저장하는 테이블
		type ssn_tab is table of number(1) index by binary_integer;
		ssn_arr ssn_tab;
		
		
		--입력받은 성별을 숫자로 담는 변수
		gender_num number := 2;
		temp_num number := 0;
		flag_num number :=2;
		
		ssn_value varchar2(14);
		
	begin
	    --주민번호 생성-------------------------------
		--입력받은 생년월일을 ssn_tab추가
		for i in 1 .. length(i_birth) loop
			ssn_arr(i) := substr(i_birth,i,1);
		end loop;
			
		--성별 채우기 1900년	   
	    if i_gender = '남자' then
			gender_num := 1;     
	    end if;
	
		ssn_arr(7) := gender_num;
	    --나머지 번째 방 값을 채운다.
	    --8801011xxxxx
	    for i in 8 .. 12 loop
	    	ssn_arr(i) := trunc(dbms_random.value(0,10),0);
	    end loop;
	    --생성된 주민번호르 가지고 끝자리 채우기 위한 연산
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
		------class4_info 인설트 하기--------------------
		ssn := ssn_value;
		
		insert into class4_info(name, ssn)
		values(i_name, ssn_value );

		
			
	end create_ssn;
	---------gen_ssn 종료---------------------

	
end;
/
