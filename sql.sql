create table lecture(
num int(11) not null primary key,
writer varchar(50) not null,
subject_name varchar(50) not null,
class_name varchar(50) not null,
filename varchar(50) not null);

create table class(
num int(11) not null primary key,
student_id varchar(50) not null,
video_time int(11) not null);

create table lectures(
subject_name varchar(20),
lectureKind varchar(20),
lectureLevel int (5),
lectureName varchar(500),
termOfProvide int (4),
teacher varchar(20),
price int (10),
in_basket varchar(20)
);

create table ownLectures(
member_id varchar(20),
startDay date,
endDay date
);

create table tmember (
memberid varchar(50) not null primary key,
name   varchar(50) not null,
password   varchar(50) not null,
email   varchar(50) not null,
address   varchar(50) not null,
phone   varchar(50) not null,
birthday   date,
regdate   date,
test_result   int(10) null,
test_day   date);

create table boardlist(
num   int(10) auto_increment primary key,
boardid   varchar(50),
memberid   varchar(50),
subject   varchar(50),
reg_date   date,
ref   int(10),
re_step   int(10),
re_level   int(10),
content   varchar(50),
filename   varchar(50),
readcount   int(10));

create table vreply(
num   int(10),
memberid   varchar(50),
boardid   varchar(50),
grade   int(10),
content   varchar(50),
reg_date   date);

create table lreply(
num   int(10),
memberid   varchar(50),
subject_name   varchar(50),
grade   int(10),
content   varchar(50),
reg_date   date);

create table tcal(
memberid   varchar(50),
dcal   date,
list   varchar(50));

create table exam (
exam_num int not null primary key auto_increment,
part varchar(7) not null,
question varchar(256) not null,
no1 varchar(64) not null,
no2 varchar(64) not null,
no3 varchar(64) not null,
no4 varchar(64),
explain_question varchar(256),
answer int not null);


create table exam_lc (
exam_num int not null primary key auto_increment,
part varchar(7) not null,
question varchar(512),
no1 varchar(64),
no2 varchar(64),
no3 varchar(64),
answer int not null);

create table exam_user (
exam_num int not null primary key,
selected_ans int not null,
id varchar(15));



insert into exam(part, question, no1, no2, no3, no4, explain_question, answer) values('part5', 'The price of titanium has fallen by 15% over the last decade, ______ it will continue to do so due to recent technological breakthroughs.', 'or', 'and', 'in', 'but', '빈칸 앞뒤로 문장이 있으므로, 빈칸은 앞뒤 문장을 이어주는 접속사 자리이다.<br> 보기 중에 접속사인 것은, ‘(A) or 혹은’, ‘(B) and 그리고’, ‘(D) but 그러나’이다.<br> 그런데 앞 문장의 내용은 티타늄 가격이 떨어졌다는 것이고, 뒤 문장의 내용도 가격이 계속 떨어질 것이라 했으므로,<br> 앞뒤 문장을 자연스럽게 이어주는 ‘(B) and 그리고’가 정답이다. ','2'); 

insert into exam(part, question, no1, no2, no3, no4, explain_question, answer) values('part5', 'The university policy guidebook states that all faculty members are eligible for 40 unpaid vacation days ______ 20 days of paid vacation days.', 'so', 'or', 'while', 'but', '문장의 내용은, 교수진들이 40일의 무급 휴가나 20일의 유급 휴가 중 하나를 선택하는 상황이므로, 정답은 ‘(B) or 혹은’이다.<br> 반면, ‘(A) so 그래서’는 결과를 나타낼 때, ‘(B) but 그러나’는 반전을 나타낼 때 사용하므로 해석상 어색하여 정답이 될 수 없고,<br>‘(C) while ~ ~하는 동안’은 부사절 접속사이기 때문에 뒤에 명사가 아닌 문장이 와야 하므로 정답이 될 수 없다.','2');

insert into exam(part, question, no1, no2, no3, no4, explain_question, answer) values('part5', 'The interest rate for mortgages fell to 2.2% nationwide, ______ many prospective buyers are still reluctant to make home purchases', 'by', 'but', 'on', 'so', '빈칸 앞뒤로 문장이 있으므로, 빈칸은 앞뒤 문장을 이어주는 접속사 자리이다. 보기 중에 접속사인 것은, ‘(B) but 그러나’와 ‘(D) so 그래서’이다.<br> 그런데 담보 대 출 이자율이 떨어졌다는 앞 문장의 내용과, 잠재 구매자들이 여전히 구매를 꺼린다 는 뒤 문장의 내용은 서로 ‘반대’되므로,<br> 정답은 ‘(B) but 그러나’이다. ','2');

insert into exam(part, question, no1, no2, no3, no4, explain_question, answer) values('part5', 'JTK Insurance has made various attempts to trim their budgets this year, ______ their total spending is projected to reach the same amount as last year.', 'yet', 'or', 'through', 'in', ' 빈칸 앞뒤로 문장이 있으므로, 빈칸은 앞뒤 문장을 이어주는 접속사 자리이다. 보기 중에 접속사인 것은 ‘(A) yet 그러나’와 ‘(B) or 혹은’이다.<br> 그런데 예산을 삭 감하려는 시도를 했다는 앞 문장의 내용과,<br> 총 지출이 작년과 같을 것이라는 뒤 문 장의 내용은 서로 ‘반대’되므로,<br> 정답은 ‘(A) yet 그러나’이다.','1');

insert into exam(part, question, no1, no2, no3, no4, explain_question, answer) values('part5', ' All vehicle owners must pay ______ which is commensurate with fuel mileage.', 'tax', 'to tax', 'taxed', 'taxable', ' 동사(must pay) 뒤는 목적어가 될 수 있는 명사 자리이다.<br>보기 중에 명사 역할 을 할 수 있는 것은, 명사인 ‘(A) tax 세금’과 to부정사인 ‘(B) to tax 세금을 부과 하는 것’이다. <br>그런데 문장의 내용은 ‘세금’을 내야한다는 것이므로, 해석상 정답은 ‘(A) tax 세금’이다. ','1');
insert into exam(part, question, no1, no2, no3, no4, explain_question, answer) values('part5', 'During the promotional ______, all customers who make a purchase over $500 will receive a 15% discount.', 'periodical', 'periodic', 'periodically', 'period', '형용사(promotional) 뒤는 명사 자리이다. 보기 중에 명사인 것은 ‘(A) periodical 정기간행물’과 ‘(D) period 기간’이다.<br> 그런데 문장의 내용은 ‘판촉기간 동안에’라는 뜻이 되어야 하므로, 해석상 정답은 ‘(D) period’이다.','4');
insert into exam(part, question, no1, no2, no3, no4, explain_question, answer) values('part5', 'Because there were no alternatives to his ______, the manager accepted the proposal.', 'planned', 'plan', 'to plan', 'will plan', ' 소유격(his) 뒤는 명사 자리이다. 보기 중에 명사인 것은 ‘(B) plan 계획’밖에 없 으므로, 정답은 ‘(B) plan’이다.<br> 반면, ‘(A) planned 계획하다’와 ‘(D) will plan’은 동사이기 때문에 정답이 될 수 없고, <br>‘(C) to plan’는 to부정사로서 명사 역할을 할 수 있지만, 소유격(his) 뒤에는 ‘일반적인 명사’만 올 수 있으므로, 정답이 될 수 없다.
','2');
insert into exam(part, question, no1, no2, no3, no4, explain_question, answer) values('part5', 'Thanks to the generous ______ from the local hospitals and schools, the charity organization was able to exceed its funding goal by 15%.', 'donated', 'donations', 'donates', 'donate', ' 관사(the)와 형용사(generous) 뒤는 명사 자리이다. 보기 중에 명사인 것은 ‘(B) donations 기부’밖에 없기 때문에, 정답은 ‘(B) donations 기부’이다.<br> 반면, ‘(A) donated’, ‘(C) donates’, ‘(D) donate 기부하다’는 모두 동사이기 때문 에 명사 자리에 올 수 없다.','2');

insert into exam(part, question, no1, no2, no3, no4, explain_question, answer) values('part5', 'Over the past 15 years, Clariden & Company has earned a strong ______ for conservative banking and high capital standards. ', 'reputation', 'segmentation', 'limitation', 'punctuality', ' 문장의 내용은, 한 회사가 오랜 시간동안 ‘명성’을 얻어왔다는 것이므로, 정답은 ‘(A) reputation 명성’이다.<br> 물론 ‘earn a reputation 명성을 얻다’를 하나의 표현 으로 알고 있다면 더 쉽게 정답을 찾을 수 있다.<br> 반면, ‘(B) segmentation 부분’, ‘(C) limitation 제한’, ‘(D) punctuality 시간 엄 수’는 모두 해석상 어색하여 정답이 될 수 없다.','1');

insert into exam(part, question, no1, no2, no3, no4, explain_question, answer) values('part5', 'After our redesigned touch screen phone model was out on the market last month, we ______ a customer survey to get feedback on its features.', 'decided', 'conducted', 'ensured', 'manipulated', '문장의 내용은, 제품에 대한 고객 설문조사를 ‘수행했다’는 것이므로, 정답은 ‘(B) conducted 수행하다’이다.<br> 물론 ‘conduct a survey 설문조사를 하다’를 하나 의 표현으로 알고 있다면 더 쉽게 정답을 찾을 수 있다.<br> 반면, ‘(A) decide 결정하다’, ‘(C) ensure 보장하다’, ‘(D) manipulate 조작하다’는 모두 해석상 어색하여 정답이 될 수 없다.
','2');


								


insert into exam_lc(part, question, no1, no2, no3, answer) values('part2', 'How far is the bus stop from the train station?','I know how to drive.','Ms. Flores bought a ticket.','Three blocks away.','3');
insert into exam_lc(part, question, no1, no2, no3, answer) values('part2', 'What kind of work do at the factory?','That's one of the most important factors to consider.','I like some of his artwork.','I monitor the production of textiles.','3');
insert into exam_lc(part, question, no1, no2, no3, answer) values('part2', 'Where should I put these order forms?','Please fill them out.','Yes, I was informed.','In the box on my desk.','3');
insert into exam_lc(part, question, no1, no2, no3, answer) values('part2', 'When can we expect the checks to be released?','We do accept those.','At the cashier.','First thing tomorrow.','3');
insert into exam_lc(part, question, no1, no2, no3, answer) values('part2', 'Who's in charge of preparing the documents for the general assembly?','Ask the secretary','Tomorrow afternoon.','He's still assembling it.','1');
insert into exam_lc(part, question, no1, no2, no3, answer) values('part2', 'How far is the bus stop from the train station?','I know how to drive.','Ms. Flores bought a ticket.','Three blocks away.','3');
insert into exam_lc(part, question, no1, no2, no3, answer) values('part2', 'How far is the bus stop from the train station?','I know how to drive.','Ms. Flores bought a ticket.','Three blocks away.','3');
insert into exam_lc(part, question, no1, no2, no3, answer) values('part2', 'What kind of work do at the factory?','That's one of the most important factors to consider.','I like some of his artwork.','I monitor the production of textiles.','1');
insert into exam_lc(part, question, no1, no2, no3, answer) values('part2', 'Where should I put these order forms?','Please fill them out.','Yes, I was informed.','In the box on my desk.','2');
insert into exam_lc(part, question, no1, no2, no3, answer) values('part2', 'When can we expect the checks to be released?','We do accept those.','At the cashier.','First thing tomorrow.','3');
insert into exam_lc(part, question, no1, no2, no3, answer) values('part2', 'Who's in charge of preparing the documents for the general assembly?','Ask the secretary','Tomorrow afternoon.','He's still assembling it.','2');
insert into exam_lc(part, question, no1, no2, no3, answer) values('part2', 'How far is the bus stop from the train station?','I know how to drive.','Ms. Flores bought a ticket.','Three blocks away.','2');
