--SUBJECT,STUDENT,TEST

INSERT INTO SUBJECT(SUB_CODE, TITLE, INFO)
VALUES('O_000001', '오라클', '대용량 DataBase를 관리하는 프로그램');
INSERT INTO SUBJECT(SUB_CODE, TITLE, INFO)
VALUES('J_000001', '자바', '완벽한 OOP언어');
COMMIT;

INSERT INTO SUBJECT(SUB_CODE, TITLE)
VALUES('A0','');

INSERT INTO STUDENT(stu_num, name, age, address, email)
values('S_00000001','이재현', 27,'서울시', 'lee@test.com');

insert into test(test_num,sub_code, stu_num)
values(3,'J_000001','S_00000001');

select * from student;
select * from subject;
select * from test;                              
