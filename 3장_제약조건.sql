/*
	날짜: 2025/08/08
	이름: 장진원
	내용: 3장 제약조건 실습
 */

-- 실습 3-1
-- 실습 3-1. 기본키 실습하기
CREATE TABLE User2 (
	uid VARCHAR(10) PRIMARY KEY,
	name VARCHAR(10),
	birth CHAR(10),
	addr VARCHAR(50)
);

-- 실습 3-2. User2 데이터 추가하기
INSERT INTO USER2 VALUES ('a101', '김유신', '1999-09-19','김해시');

-- 실습 3-3. 고유키 실습하기
CREATE TABLE User3 (
uid VARCHAR(10) PRIMARY KEY,
name VARCHAR(10),
birth CHAR(10),
hp CHAR(13) UNIQUE, -- 중복된 값을 허용하지 않음
addr VARCHAR(50)
);
-- 실습 3-4. User3 데이터 추가하기
INSERT INTO USER3 VALUES ('a101', '김유신', '1999-09-19','010-1234-1001','김해시');
INSERT INTO USER3 VALUES ('a102', '김춘추', '1999-09-20','010-1234-1002','경주시');
INSERT INTO USER3 VALUES ('a103', '장보고', '1998-01-20',NULL,'완도시');
INSERT INTO USER3 VALUES ('a104', '강감찬', '1997-01-20',NULL,'서울시');
SELECT * FROM USER3;

-- 실습 3-5. 왜리키 실습하기
CREATE TABLE Parent (
pid VARCHAR(10) PRIMARY KEY,
name VARCHAR(10),
birth CHAR(10),
addr VARCHAR(100)
);

CREATE TABLE Child (
	cid VARCHAR(10) PRIMARY KEY,
	name VARCHAR(10),
	hp CHAR(13) UNIQUE,
	parent VARCHAR(10),
	FOREIGN KEY (parent) REFERENCES Parent (pid) -- 존재하지 않는 parent의 pid 값 입력을 차단
 );
 
 -- drop table child;

-- 실습 3-6. Parent, Child 데이터 추가하기
INSERT INTO parent VALUES ('p101', '홍길동', '1999-09-09', '부산시');
INSERT INTO child VALUES ('c101', '홍아들', '010-1234-2001', 'p101');
INSERT INTO child VALUES ('c102', '김아들', '010-1234-3001', 'p110');
select * from parent;
select * from child;
-- 실습 3-7
CREATE TABLE User4(
uid VARCHAR(10) PRIMARY KEY, -- primary key는 not null
name VARCHAR(10) NOT NULL, -- 반드시 입력 허용 
gender CHAR(1), -- 모든 컬럼은 default는 null
age INT DEFAULT 1,
hp CHAR(13) UNIQUE, -- UNIQUE는 default는 null
addr VARCHAR(20)
);

insert into user4 values ('a101','김유신','M','23','010-1223-0001','김해시');
insert into user4 values ('a102','신사임당','F','21',NULL,'강릉시');
select * from user4;


-- 실습 3-8. User4 데이터 추가하기

-- 실습 3-9
CREATE TABLE User5(
seq INT PRIMARY KEY AUTO_INCREMENT,
name VARCHAR(10) NOT NULL,
gender CHAR(1) CHECK (gender IN ('M', 'F')),
age INT DEFAULT 1 CHECK (age > 0 AND age < 100),
addr VARCHAR(20)
);
-- 실습 3-10. User5 데이터 추가하기
insert into user5(name,gender,age,addr) values('김유신','M',23,'김해시');
insert into user5(name,gender,age,addr) values('신사임당','F',21,'강릉시');
delete from user5 where seq=1;
insert into user5(name,gender,age,addr) values('허난설헌','F',21,'광주시');
select * from user5;