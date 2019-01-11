--null 변환 함수
--null은 ISERT할 때 컬럼을 명시하지 않을 경우 입력
--varchar2(char) : 컬럼을 명시하지 않거나, ''인 경우
--number, date : 컬럼을 명시하지 않는 경우.

--사원테이블에서 사원명, 연봉, 보너스 조회
--단, 보너스가 null인 경우, 100원으로 일과 지급
select ename, sal, nvl(comm, 100) || '원'
from emp;

--우편번호테이블에서 입력한 동의 우편번호, 시도, 구군, 동, 번지 조회
--단, 번지가 없다면 번지없음을 출력
select  ZIPCODE, SIDO, GUGUN, DONG, nvl(BUNJI, '번지없음')
from zipcode
where dong like '역삼1동%';

--CLASS4_INFO테이블에서 번호 이름 입력일 조회
--단, 입력일이 없다면 현재날짜 출력
select num, name, nvl(input_date, sysdate) as input_date
from class4_info;

select * from CLASS4_INFO;
