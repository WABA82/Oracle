--변환 함수
--문자열이 아닌 값(숫자, 날짜)을 문자열로 변환
--숫자 -> 지정한 자리에 , 또는 . 출력

select to_char(20181025,'0,000,000,000'),
		to_char(20181025,'9,999,999,999')
from dual;

select to_char(2018.1025, '099,999.999' )
from dual;

--사원테이블에서 사원번호, 사원명, 입사일, 연봉 조회
--단, 연봉은 데이터가 있는 것 까지만 ,를 넣어 출력
select empno, ename, hiredate, to_char(sal,'9,999,999')
from emp;

--to_char함수로 반환되는 결과는 문자열이므로 연산되지 않는다.
select to_char(sal,'9,999')+100
from emp;

select to_char(sal+100,'9,999')
from emp;

--날짜 -> 문자열변환
select to_char(sysdate, 'yyyy-mm-dd am hh(hh24): mi : ss dy q "분기"')
from dual;
--pattern에 특수문자가 아닌 문자열을 사용할 때 "___"
select to_char(sysdate, 'yyyy"년"mm"월"dd"일"am hh(hh24)"시 "mi"분 "ss"초 "day q"분기"')
from dual;
--pattern을 너무 길게 작성하면 내부버퍼 에러가 발생한다
select to_char(sysdate, 'yyyy"년"mm"월"dd"일 " am hh(hh24)"시 "mi"분 "ss"초 "day q"분기"')
from dual;

--사원테이블에서 사원번호, 사원명, 입사일을 조회하세요
--단, 입사일은 년-월-일- 요일의 형식으로 조회 출력할 것
select empno, ename, to_char(hiredate, 'yyyy-mm-dd day hh24:mi:ss')
from emp;

--사원테이블에서 입사년도가 1981년인 사원들의 사원번호, 사원명, 입사일, 연봉 조회
select empno, ename, hiredate, sal
from emp
where to_char(hiredate, 'yyyy') = '1981'
order by to_char(hiredate, 'mm') asc, sal asc ;

--to_date()
--현재날짜가 아닌 날짜를 추가할 때
-- 날짜 형식의 문자열 추가하기

select * from CLASS4_INFO;

insert into class4_info(num,name,input_date)
values(8,'양세찬','2018-10-21');

insert into class4_info(num,name,input_date)
values(9,'양세찬',to_date('2018-10-22','yyyy-mm-dd'));
commit;

select to_char(input_date, 'yyyy-mm')
from class4_info;

--to_char는 날짜나 숫자를 입력받아야 합니다.(함수의 값(인자))은 데이터타임을 구분한다.)
select to_char(to_date('2018-10-25','yyyy-mm-dd'),'mm')
from dual;

--숫자변환 : to_number('숫자형식의 문자열)
select '25'-'10', to_number('25')-to_number('25')
from dual;

--------------------------------------------------------------------------------------------------------------------------------------------------
---- 조건 함수 : decode(컬럼명, 비교값, 출력값, 비교값, 출력값,,,비교값이 없을때 출력값)
--------------------------------------------------------------------------------------------------------------------------------------------------

--사원테이블에서 사원번호, 사원명, 연봉, 부서명 조회
--단, 부서명은 아래의 표에 해당하는 부서명으로 출력
--10-개발부
--20-유지보수
--30-품질보증부서
--40-탁구부

select empno,ename,sal,deptno,decode(deptno,10,'개발부',20,'유지보수부','탁구부') as dename
from emp;

--사원번호, 사원명, 연봉, 부서번호, 인센티브
-- 단, 인센은 부서별로 아래의 표와 같이 차등지급
-- 10 연봉의 20%, 20 연봉의 50%, 30 연봉의 30% 그외 연봉 10%
select empno, ename, deptno, sal, decode(deptno,10,sal*0.2,20,sal*0.5,30,sal*0.3,sal*0.1) as incen
from emp;

--CASE 문
select empno, ename, deptno, sal,
		case deptno when 10 then '개발부'
						when 20 then '유지보수'
        				when 30 then '품질보증'
        				else '탁구부'
        end as dname
from emp;


-- 사원번호, 사원명, 연봉, 부서번호, 총수령액 조회
-- 총수령액은 연봉+보너스+인센 구성된다.
-- 단, 인센은 부서별로 아래의 표와 같이 차등지급
-- 10 연봉의 20%, 20 연봉의 50%, 30 연봉의 30% 그외 연봉 10%
select empno, ename, deptno, sal,
case deptno when 10 then sal * 0.2 + sal + nvl(comm,0)
				when 20 then sal * 0.5 + sal + nvl(comm,0)
				when 30 then sal * 0.3 + sal + nvl(comm,0)
				else sal * 0.1 + sal + nvl(comm,0)
				end incen
from emp;


--사원테이블에서 사원번호, 이름, 직무를 조회
--단, 직무의 첫 글자가 C는 파리목숨, S는 돈 벌어주는 사람 M은 감시인 A는 살펴보는 사람 P는 두목

select * from emp;

select empno, ename, job, decode(substr(job,1,1),'C','소모품','S','돈 벌어주는 사람','M','감시인','A','살펴보는 사람','P','두목') as SCRIPT
from emp;

select empno, ename, job,
		case substr(job,1,1) when 'C' then '소모품'
								when  'S' then '돈 벌어주는 사람'
								when 'M' then '감시인'
								when 'A' then '살펴보는 사람'
								when 'P' then '두목'
								end as SCRIPT
from emp;                
