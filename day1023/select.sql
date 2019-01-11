-- 특정 테이블의 원하는 컬럼에 모든 레코드를 조회
-- Class4_info 테이블에서 이름,번호,나이 조회 해보기
/*
select	name,num,age
from	class4_info;
*/
/*
-- 조회하는 컬럼에 *을 사용하면 모든 컬럼을 조회
 select *
 from	class4_info;
*/
-- 컬럼크기 변경
-- 0: 데이터가 없다면 0을 채워 출력
 column num format 0000

-- 9: 데이터가 존재하는 것만 출력
 col age format 999
 col eye format 0.000

-- 문자열은 a글자수를 설정
 column name format a6
 col ssn format a6
 col email format a10


 select * from	class4_info;

--컬럼명에 alias 부여
select num, name, input_date as i_date1, input_date as i_date2
from class4_info;

