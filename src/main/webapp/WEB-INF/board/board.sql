show tables;

create table board (
	idx   int not null auto_increment,	/* 게시글의 고유번호 */
	mid   varchar(20) not null,					/* 게시글 올린이 아이디 */
	nickName varchar(20) not null,			/* 게시글 올린이 닉네임 */
	title  varchar(100) not null,				/* 게시글 제목 */
	email	 varchar(50),								/* 이메일 주소 */
	homePage varchar(50), 						/* 홈페이지 주소-개인블로그 */
	content text not null,						/* 게시글 내용 */
	readNum int default 0,						/* 글 조회수 */
	hostIp  varchar(40) not null,			/* 글 올린이의 IP */
	openSw  char(2)	default 'OK',			/* 게시글 공개여부(OK:공개,NO:비공개) */
	wDate   datetime  default now(),		/* 글 올린 날짜/시간 */
	good 		int default 0,						/* '좋아요' 클릭 횟수 누적 */
	primary key(idx)
);

desc board;

insert into board values (default, 'admin', '관리맨', '게시판 서비를 시작합니다.', 'sdh534@gmail.com', 'sdh534.tistory.com', '이곳은 게시판입니다.', default, '192.168.50.95', default, default, default);

/* 날짜함수 처리연습 */  -- 오늘 날짜를 보여주는 함수
select now();
select year(now());
select month(now());
select day(now());
select hour(now());
select concat(year(now()),'년', month(now()),'월',day(now()),'일',hour(now()),'시') as naljja;

select date(now()); /* 년-월-시 */
select weekday(now()); /* 0(월)1(화)2(수)3(목)4(금)5(토)6(일) */
select dayofweek(now()); /* 1(일)2(월)3(화)4(수)5(목)6(금)7(토) */

select year('2023-05-03') as year;
select idx, wDate from board;
select idx, year(wdate) from board;

/* 날짜연산 */
/* date_add(date, interval 값 Type)  얼마나 앞서있느냐 뒤에있느냐 */ 
select date_add(now(), interval 1 day); /* 오늘 날짜보다 +1 -> 내일 날짜 출력 */
select date_add(now(), interval -1 day); /* 오늘 날짜보다 +1 -> 내일 날짜 출력 */
select now(),date_add(now(), interval 10 day_hour);

/* date_sub(date, interval 값, Type)*/
--select date_add(now(), interval -1 day); /* 오늘 날짜보다 +1 -> 내일 날짜 출력 */
select date_sub(now(), interval -1 day); /* 오늘 날짜보다 +1 -> 내일 날짜 출력 */
select date_sub(now(), interval 1 day); /* 오늘 날짜보다 -1 -> 어제 날짜 출력 */

/* board 테이블에 적용하기 */
/* 게시글 중에서 하루 전의 올라온 글만 보여주시오*/
select wDate, date_add(now(), interval -1 day) from board;
select wDate, date_add(now(), interval -1 day) from board where substring(wDate,1,10) = substring((date_add(now(),interval -1 day)),1,10);
/* 24시간 전에 올라온 글만 보여줘 */
select substring(wDate,12,19) from board;
select idx, wDate, now() from board where wDate > date_add(now(),interval -24 day_hour);
select * from board where wDate >= date_add(now(),interval -24 day_hour);
select *, datediff(now(), wDate) as day_diff, timestampdiff(hour, wDate, now()) as hour_diff from board order by idx desc ;

/* 날짜차이 계산 함수 : DATEDIFF(시작날짜, 마지막날짜) */
select datediff('2023-05-04', '2023-05-01');
select datediff(now(), '2023-05-01');
select datediff(now(), wDate) from board;
select datediff(now(), wDate) as day_diff from board;

select *, timestampdiff(hour, wDate, now()) as hour_diff from board order by idx desc;
select *, timestampdiff(hour, wDate, now()) as hour_diff from board order by idx desc limit 0,5;

/* 날짜 양식 date_format() : 년(%Y), 월(%m) 일(%d) */
select date_format(wDate, '%Y-%m-%d %H:%i') as hour_diff from board;
