--alter

--계정 잠그기 : 관리자만 가능
alter user scott account lock;
--계정 : system, 비번 : managerum

--계정열기
alter user scott account unlock;

--비번 변경
alter user scott identified by tiger;

--테이블 생성
create table test_atler(
num number,
numver varchar2 (30),
addr number
);

--테이블명 변경
alter table test_atler rename to test_alter;

--컬럼명 변경:
alter table test_alter rename column neam to name;

--컬럼의 데이터형 변경 : 레코드가 없기 때문에 테이터형까지 변경가능
--addr의 number데이터형을 varchar2(100)
alter table test_alter modify addr varchar2(100) not null;

insert into test_alter(num, numver, addr)
values(1,'테스트','서울시 강남구');
commit;
--데이터형을 변경 할 때에는 레코드가 비어있어야 가능하다
alter table test_alter modify addr number;
--레코드가 존재할때에는 동일 데이터형에 크기만 변경가능
alter table test_alter modify addr varchar2(200);

--컬럼추가 : 추가되는 컬럼은 가장 마지막에 추가된다.
--레코드가 존재하지 않으면 모든 제약사항을 부여할 수 있다.
alter table test_alter add id varchar2(16);

--컬럼삭제
alter table test_alter drop column addr;

--제약사항 추가 : 레코드의 값이 제약사항의 조건을 만족하는지 판단해야 한다.
update test_alter
set id='test'
where num=1;

alter table test_alter add constraint pk_test_alter
	primary key(id);

select * from TEST_ALTER;
select * from user_constraints
where table_name = 'TEST_ALTER';

--제약사항 비활성화 : disable
alter table test_alter disable constraint pk_test_alter;

insert into test_alter(num,numver,id) values(2,'이재찬','test');

--제약사항 활성화 : enable 레코드의 구성을 판단해야 한다.
delete from test_alter where num=2;
alter table test_alter enable constraint pk_test_alter;

--제약사항 삭제
alter table test_alter drop constraint pk_test_alter;
