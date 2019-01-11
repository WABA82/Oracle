--외래키 : 부모테이블의 값으로만 값을 추가 해야 할 때.
--null, 중복값을 허용

--CLC : 컬럼 단위 제약사항에서는 foreign key를 정의하지 않는다.
--table_primary 테이블의 id값을 참조해서 데이터 추가하기
--자식테이블의 컬럼명은 같을 필요는 없다.
--데이터형, 크기는 동일 해야한다.
select * from column_primary;

select * from TABLE_PRIMARY;

select * from user_constraints;
create table column_foreign(
	f_id varchar2(20) constraint fk_f_id
		references TABLE_PRIMARY(id),
	tel varchar2(13), address varchar2(400)
);


--추가성공
--부모테이블에 존재하는 값 추가
select * from COLUMN_FOREIGN;
insert into  column_foreign(f_id, tel, address)
values('kim','010-6784-9713','SM');

insert into  column_foreign(f_id, tel, address)
values('test','010-6784-9713','서울시 강남구 한독빌딩');

--같은 아이디로 값을 추가할 수 있다.(중복허용)
insert into  column_foreign(f_id, tel, address)
values('kim','010-6784-9713','SM');

--null 허용
insert into  column_foreign(tel, address)
values('010-6784-9713','미스틱');

--부모테이블의 없는 값을 추가하면 에러
insert into  column_foreign(f_id, tel, address)
values('kim1','010-6784-9713','SM');

--부모테이블은 참조하는 자식레코드가 존재 한다면
--삭제되지 않는다
insert into TABLE_PRIMARY(name,id,passwd)
values('강호동','kang','1234');
commit;

--kang을 참조하는 레코드가 없기 때문에 삭제 가능
delete from table_primary where id = 'kang';
--kim, test는 column_foreign테이블에서 참조하고 있기 때문에 삭제 불가
delete from table_primary where id = 'kim';

--on delete cascade를 설정하지 않았을 때에는 자식레코드의 참조값을 삭제한 후

delete from column_foreign where f_id='kim';
delete from table_primary where id='kim';
commit;

--TCL : 테이블 단위 제약사항
create table table_foreign(
	id varchar2(20),
	java_score number(3),
	oracle_score number(3),
	constraint fk_table_foreign_id foreign key(id)
		references table_primary(id)
);

--부모테이블에 존재하는 값으로 추가
insert into table_foreign(id,java_score,oracle_score)
values('kim',97,78);
commit;

--참조하는 자식 레코드가 존재한다면 부모테이블에서 바로 삭제가 되지 않는다
delete from table_primary
where id='kim';

insert into table_primary(name,id,passwd)
values('송중기',',song','1234');
insert into table_primary(name,id,passwd)
values('공유',',gong','1234');
commit;

--on delete cascade : 부모레코드를 삭제하면 참조하는 모든 레코드를 동시에 삭제하는 옵션
create table test_cascade(
	id varchar2(20),
	address varchar(100),
	constraint fk_test_id foreign key(id)
	references table_primary(id)
	on delete cascade
);

insert into test_cascade(id,address)
values(',song','강남구 역삼동');
insert into test_cascade(id,address)
values(',gong','강남구 역삼동');
commit;
--on delete cascade가 삭제되면 부모레코드가 삭제되면 자식 레코드도 삭제 된다.
delete from table_primary where id=',song';
delete from table_primary where id=',gong';

select * from TEST_CASCADE;
select * from TABLE_FOREIGN;
select * from user_constraints;
select * from COLUMN_FOREIGN;
select * from TABLE_PRIMARY;

