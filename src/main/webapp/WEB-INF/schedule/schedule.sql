/* schedule.sql */

show tables;

create table schedule (
  idx   int not null auto_increment primary key,
  memberIdx int not null,
  mid   varchar(20) not null,   /* 회원 아이디(일정검색시 필요) */
  sDate datetime not null,			/* 일정 등록 날짜 */
  part	varchar(10) not null,		/* 분류(1.모임, 2.업무, 3.학습, 4.여행, 5:기타) */
  content text not null,					/* 일정 상세내역 */
  foreign key(memberIdx,mid) references member(idx, mid)
);

create table schedule (
  idx   int not null auto_increment primary key,
  mid   varchar(20) not null,   /* 회원 아이디(일정검색시 필요) */
  sDate datetime not null,			/* 일정 등록 날짜 */
  part	varchar(10) not null,		/* 분류(1.모임, 2.업무, 3.학습, 4.여행, 5:기타) */
  content text not null					/* 일정 상세내역 */
);

desc schedule;
drop table schedule;

insert into schedule values (default, 'hkd1234', '2023-05-17', '학습', 'JSP 주제발표');
insert into schedule values (default, 'kms1234', '2023-05-17', '학습', 'JSP 주제발표');
insert into schedule values (default, 'sdh1234', '2023-06-17', '업무', '국취제 수당신청');
insert into schedule values (default, 'hkd1234', '2023-06-07', '학습', '기사 공부');
insert into schedule values (default, 'cbs1234', '2023-07-27', '학습', '정처기 시험');
insert into schedule values (default, 'sdh1234', '2023-06-25', '모임', '햄햄팡팡');
insert into schedule values (default, 'kms1234', '2023-05-28', '여행', '일본 여행');
insert into schedule values (default, 'hkd1234', '2023-05-22', '학습', 'JSP 주제발표');
insert into schedule values (default, 'admin1234', '2023-05-24', '학습', '사이트 리뉴얼');
insert into schedule values (default, 'hihiman', '2023-05-06', '기타', '비밀');
insert into schedule values (default, 'hkd1234', '2023-05-10', '기타', '영화관람');

insert into schedule values (default,'hkd1234','2023-05-17','학습','JSP 주제발표');
insert into schedule values (default,'hkd1234','2023-05-17','학습','JSP 보고서작성');
insert into schedule values (default,'hkd1234','2023-05-17','모임','업무회식, 성안길 가자호프 6시');
insert into schedule values (default,'hkd1234','2023-05-20','기타','영화관람 cgv 6시');
insert into schedule values (default,'hkd1234','2023-05-22','모임','초등학교 동창회');
insert into schedule values (default,'hkd1234','2023-05-22','업무','기획3팀 업무관련');
insert into schedule values (default,'hkd1234','2023-05-24','학습','JSP 발표');
insert into schedule values (default,'hkd1234','2023-06-12','모임','학원6기 모임');
insert into schedule values (default,'hkd1234','2023-06-15','모임','중학교 모임');
insert into schedule values (default,'hkd1234','2023-06-15','업무','제일기획 영업이익표작성');
insert into schedule values (default,'hkd1234','2023-06-27','기타','수영장 가기로한날');
insert into schedule values (default,'kms1234','2023-05-17','학습','JSP 주제발표');
insert into schedule values (default,'kms1234','2023-05-22','기타','친구들과 음악회');
insert into schedule values (default,'kms1234','2023-05-29','모임','초등친구모임 6시 사창사거리');
insert into schedule values (default,'kms1234','2023-05-30','업무','JSP프로그램 TEST');
insert into schedule values (default,'kms1234','2023-06-17','학습','JSP 주제발표');

select * from schedule where mid = 'hkd1234' order by sDate desc;

select * from schedule where mid='hkd1234' and sDate='2023-05-17' order by sDate desc;
select * from schedule where mid='hkd1234' and date_format(sDate,'%Y-%m-%d')='2023-05-17' order by sDate desc;
select * from schedule where mid='hkd1234' and sDate='2023-05' order by sDate desc;
select * from schedule where mid='hkd1234' and date_format(sDate, '%Y-%m')='2023-5' order by sDate desc;
select * from schedule where mid='hkd1234' and date_format(sDate, '%Y-%m')='2023-05' order by sDate desc;
select * from schedule where mid='hkd1234' and date_format(sDate, '%Y-%m')='2023-05' group by part order by sDate desc;

select * from schedule where mid='hkd1234' and date_format(sDate, '%Y-%m')='2023-05' order by sDate desc, part;

