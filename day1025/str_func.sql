--문자열 함수사용.
--길이 : length
select 'oracle길이' || length ('oracle') || '자', length('테스트')
from dual;

--사원테이블에서 사원명, 사원명의 글자수
select ename, length(ename)
from emp;

--사원테이블에서 사원명이 4인 사원의 사원명을 조회
select ename
from emp
where length(ename) = 4;

--대문자 upper
select upper('test'), upper('테스트AbcdEfG')
from dual;

--소문자 lower
select lower('test')
from dual;

--사원테이블에서 사원명이 scott인 사원의 사원번호, 사원명, 입사일, 연봉 조회
select EMPNO, lower(ENAME), HIREDATE, SAL
from EMP
where lower(ename) = 'scott';
--where ename = upper('scott');

--인덱스 얻기 : str(문자열, 찾을문자열)
select instr('AbcdeF','A'), instr('AbcdeF','F'), instr('AbcdeF','K')
from dual;

select * from CLASS4_INFO;
insert into class4_info( NUM, NAME, EMAIL)
values(6,'테스트', 'test@kr');

insert into class4_info( NUM, NAME, EMAIL)
values(7,'테스트1','test.kr');
commit;

--학생테이블에서 번호, 이름, 이메일 조회
select num, name, email, instr(email,'@'), instr(email,'.')
from class4_info;

--문자열 자르기 : substr(문자열, 시작인덱스, 자를글자수)
select substr('Abcdefg',4,3), substr('Abcdefg',2,5), substr('Abcdefg',1)
from dual;

--class4_info테이블에서 번호, 이름,이메일 컬럼의  '메일주소'만 조회 하세요.
--도메인 주소만 조회 하세요.
select num, name, substr(email,1,(instr(email,'@')-1))
from class4_info;

select num, name, substr(email,(instr(email,'@')))
from class4_info;

--공백제거 : tirm(str), ltrim(str), rtrim(str)
select '['||trim('      A B C      ')||']', '['||ltrim('      A B C      ')||']', '['||trim('      A B C      ')||']',
		trim('-' from '---------Oracle----------' )
from dual;

--첫 글자만 대문자로 : initcap(''str)
select initcap('oracle java jsp jQuery SCOTT')
from dual;

select initcap(ename)
from emp;

--문자열 붙이기 : concat('문자열', '붙일문자열')
select concat('ABC', 'DEF'), concat('ABC', 'DEF'), concat('ABC', 'DEF'),
from dual;

--문자열 채우기 : r | lpad(문자열, 총자릿수, 채울문자열)
select lpad('ABCDE',7,'$'), lpad('ABCDEFG',10,0)
from dual;

select rpad('ABCDEF',10,'가'), rpad('ABC', 10, '#')
from dual;