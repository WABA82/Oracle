--난수를 이용해보기--
                                                        

--귀인 얻기 프로시저                        

create or replace package lucky_pack
as
	--행운의 수를 얻는 함수 1~45 중 하나	
	function lucky_num return number;
    
    --1.  lucky_pack 패키지에 태어난해를 입력받으면 띠를 반환하는 함수를 추가하세요.
	--  띠 - 태어난해를 12로 나눈 나머지가 11이면 양띠, 10- 말, 9-뱀,8-용,7-토끼,6-호랑이,5-소,4-쥐,3-돼지, 2-개,1-닭,0-원숭이 
	function search_ttee return varchar2;
	
	
	--귀인 얻기 프로시저
	procedure lucky_name(name out varchar2); 	
	
	--생년월일, 성별, 이름을 입력받아 주민번호르 생성하여 out parameter에 설정하고 class4_info테이블에 추가하는 procedure작성
	procedure create_ssn(i_birth in varchar2, i_gender in varchar2, i_name in varchar2, ssn out char);
	
	--2. lucky_pack 패키지에 부서번호를 받아 emp 테이블에서 부서별
	--   사원의 평균 근속년수를 out_parameter에 설정하는 procedure를
	--   추가하세요.
	procedure avg_dept (i_deptno in number, avg_period out number);
	
	
	
end;
/
