--패키지 호출--

--패키지 함수 호출--
select TEST_PACK.FUNC_GET_NAME('이재현')
from dual;


--패키지 프로시저 호출--
var age number;

exec TEST_PACK.PROC_GET_AGE(1993, :age);

print age;


--난수 구하기
--난수 : 임의의 수를 생성하여 반환하는 것.

--dbms_random.value(시작, 끝 전까지) - 숫자를 얻는 함수
--1~9중의 숫자 하나를 반환
select trunc(dbms_random.value(1,10))
from dual;

--dbms_random.string('형식', 구할갯수) - 문자열의 난수 얻는 함수

--형식
--'u' 영문자 대문자
select dbms_random.string('u',10)
from dual;
--'l' 영문자 소문자
select dbms_random.string('l',10)
from dual;
--'a' 소대문자 혼합
select dbms_random.string('a',10)
from dual;
--'x' 대분자와 숫자의 혼합
select dbms_random.string('x',10)
from dual;
--'p' 영문자와 특수문자 혼합
select dbms_random.string('p',10)
from dual;