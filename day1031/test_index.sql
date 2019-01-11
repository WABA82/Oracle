--엔덱스 조회
select * from user_indexes;

create table cp_zipcode as (select * from zipcode);

select count(*) from cp_zipcode;
select count(*) from zipcode;

--cp_zipcode테이블에 seq컬럼에 unique index 설정
create unique index idx_zipcode on cp_zipcode(seq);

select * from user_indexes;

drop index idx_zipcode;

--인덱스를 사용하지 않는 조회(FULL SCAN)
select zipcode,sido,gugun,bunji,seq
from	zipcode
where zipcode='402-866';

--인덱스를 사용한 경우(B-TREE)
select /*+ ordered index (bit_zipcode)*/zipcode,sido,gugun,bunji,seq
from	cp_zipcode
where zipcode='402-866';

--우편번호는 중목되지만 독특한 형태를 가진다.
create index bit_zipcode on cp_zipcode(zipcode);

select * from user_indexes;

--인덱스 리빌드 하기 : 인덱스는 원래의 테이블이 변경되면 변경사항을 적용하지 않는다.
alter index idx_zipcode rebuild;

--group by ~ having (집계함수를 사용할 수 있다.)~
--부서별 사원수가 4명 이상인 부서의 부서번호, 사원수, 연봉합, 최고연봉을 조회
select deptno, count(deptno), sum(sal), max(sal)
from	emp
group by deptno having count(deptno)>4;

--replace : 문자열인 값을 치환한다.
select replace('오늘은 목요일 입니다.','오늘은 ','내일은 ')
from dual;

select replace('정택성, 이재현, 이재찬, 김희철','이재찬','반장 이재찬')
from dual;

select * from user_objects;

drop table zipcode;
drop table cp_zipcode;
purge recyclebin;
