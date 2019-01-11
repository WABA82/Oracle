--연산자
set serveroutput on;
set verify off;
accept name prompt '이름입력 : ';
accept age prompt '나이입력 : ';
declare
--변수선언
	name varchar2(90);
	age number;
	birth number;
begin
--입력된 값을 변수에 할당
--입력 값이 문자열인 경우에는 '&name'으로 변수를 사용한다.
--주석에도 사용되니 주석에는 사용하지 말자
	name := '&name';
	age := &age;
	birth := to_char(sysdate,'yyyy')-age+1;
	dbms_output.put_line('이름 : ' || name || '님의 나이는 ' || age || '살 입니다.');
	--가능 태어난해 출력 : XX살 태어난해 XXXX년생
	dbms_output.put_line( age ||'살 태어난해 '|| birth ||'생 입니다.'); 
	--가능(로 연산될 코드를 묶어주었다.)
	dbms_output.put_line( age ||'살 태어난해 '|| (to_char(sysdate,'yyyy')-age+1) ||'생 입니다.');
	
	--err 문자열은 연산이 안된다.
	--||의 우선순위가 -보다 높기 때문에 '살 태어난해 2018'-age+1로 계산이 된다.
	dbms_output.put_line( age ||'살 태어난해 '|| to_char(sysdate,'yyyy')-age+1 ||'생 입니다.');
	
	--err 오라클은 true / false를 출력할 수 없다.
	dbms_output.put_line(age > 10);
	
end;
/