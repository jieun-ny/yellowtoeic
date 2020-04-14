<%@page import="model.Tcal"%>
<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<title>Insert title here</title>
<style>

#calender{
	
	border-collapse: collapse;
	
}
#calender th{
  padding: 30px 25px;
  width: 100%;
  background:  #FFA778;
  text-align: center;
width : 130px;
border-bottom: 1px solid gray;

}
#calender td{
border-bottom: 1px solid gray;
font-size : small;
width : 80px;
height : 80px;

text-align: left;
vertical-align: top;
position: relative;
}
#calender tr :hover {
background-color:#ddd;
}

body {
   
    font-family: noto_sans, "Noto Sans", "Noto Sans Korean Regular", sans-serif, 나눔고딕, "Nanum Gothic", dotum, 돋움, gulim, 굴림, Tahoma;
}

.sub-cont >div{
    display: -webkit-box;
}
.sub-cont {
    background-color: #ffd83f;
    max-width: 1080px;
    margin: 0 auto;
    margin-top: 70px;
    height: 192px;
}
}
.card-box {
   
    height: 192px;
    display: table-cell;
    vertical-align: middle;

}
.card-text .card-name {
    color: #f15a21;
    font-size: 170%;
    letter-spacing: -1px;
    margin-left: 10px;
}
.card-text .card-comment {
    color: #151517;
    font-size: 140%;
    letter-spacing: -1px;
    
 
}
.card-text {
    padding-top: 0px;
    margin-left: 50px;
}

nav-wrapper {
    -webkit-appearance: button;
    -webkit-writing-mode: horizontal-tb !important;
    text-rendering: auto;
    box-sizing: border-box;
    font: 400 13.3333px Arial;
    align-items: flex-start;
        vertical-align: middle !important;
        border: 0 none;
            cursor: pointer;
             
            
    }
   
.my_studyroom {
    width: 266px;
    height: 50px;
    background-color: #ff6b1b;
 
    color: #fff;
    letter-spacing: -1px;
    font-size: 130%;
    padding: 0;
    text-align: left;
    padding-left: 50px;
    vertical-align: right;
}

#result{font-size: 3em !important;}

.study_info_table td {
    font-size: 90%;
    color: #656565;
    height: 30px;
    padding: 20px;
    border: 1px solid #e7e7e7;
    text-align: center;
    vertical-align: middle;
    font-size: 14px;
    background-color: #f5f5f5;
}

.study_info_table th {
    background-color: #000;
    color: #fff;
    border: 1px solid #000;
    height: 20px;
    padding: 20px;
    text-align: center;
    vertical-align: middle;
    font-size: 15px;
    font-weight: 200 !important;
    letter-spacing: -1px;
}
.btn, .btn-large, .btn-small {
    text-decoration: none;
    color: #fff;
    background-color: none !important;
    text-align: center;
    letter-spacing: .5px;
    -webkit-transition: background-color .2s ease-out;
    transition: background-color .2s ease-out;
    cursor: pointer;
}

.study_info_table{
width:60%;

}



.brand-logo{
font-size: 3em;
}

</style>
<script >


</script>

</head>
<body>


    <div style="height: 100px; margin-top: 0px;background-color: #FFBE0A; text-overflow: inherit;">
    <div style=>
      <p style = "font-size: 3em; color: white;padding-top: 20px; ">마이페이지</p>
    </div>
    </div>

  
 <div class="sub-cont">
        <div class="sub-card">
            <div class="card-picture">
               
             <div id="profile_type7" class="my_profile_img" align="center">
						<a href="javascript:void(0);" onclick="gfn_fileUpload2('www.yanadoo.co.kr', 'user_10M', '2020/02/','profileForm','fileUrl');"><img  style="border-radius: 100px; width : 150px; position: relative; margin-top: 20px;margin-left: 20px" src="<%=request.getContextPath() %>/profile.png" id="my_profile_icon"></a>
            </div></div>
            <div class="card-box">
                <div class="card-text">
                    <p class="card-name">님</p>
                    <p class="card-comment text-12"><span id = "startdate"></span>부터 당신의 영어 잠재력을 깨워줄 노랑펜와 함께 하고 있습니다.
                       
                    </p><div align="right">
                    <button class="my_studyroom"  type="button" ><a href="${pageContext.request.contextPath }/lecture/printMyLectures"> 강의실 바로가기<em>&gt;</em></a></button>
                </div>
                </div>
            </div>
        </div>
    </div>

<div align="center" style=" height: 200px;">
<c:if test="${member.getTest_day()!=null}">
<span id = "date1"></span>부터 <span id = "date2"></span>까지
<div  >
<img  style="width:150px;height:150px;" alt="#" src="${pageContext.request.contextPath}/dday.png">
<div style="margin-top: -130px;"><h2 style="color : #002266"><span id = "result"></span>일</h2></div>
</div>
</c:if>


<h5 style="color: gary"><a href="#" onclick="dday()">시험 D-day 등록하기</a></h5>

</div>


<div>
<%
Calendar cal = Calendar.getInstance();
int year = cal.get(Calendar.YEAR);
int month = cal.get(Calendar.MONTH)+1;
session.setAttribute("year", year);
session.setAttribute("month", month);
String pYear;
String pMonth;
String yymm;
if(request.getParameter("year")!=null){
pYear = request.getParameter("year");
pMonth = request.getParameter("month");

if(pYear!=null){
	year = Integer.parseInt(pYear);
}

if(pMonth!=null){
	month = Integer.parseInt(pMonth);
}
if(pMonth.length()<2){
	yymm = year+"0"+pMonth;
}else{
	yymm= year+pMonth;
}

}
cal.set(year, month-1,1);
int dayOfWeek = cal.get(Calendar.DAY_OF_WEEK);
int lastDay = cal.getActualMaximum(Calendar.DAY_OF_MONTH);




if(month>12){
	month = 1;
	year++;
}
if(month<1){
	month = 12;
	year--;
}






%>


<div id = "this" align="center" style="margin-top: 100px; margin-bottom: 100px;" >
<div>
<h2>공부 일정 관리</h2>
<a href="${pageContext.request.contextPath}/list/mypage?year=<%=year-1%>&month=<%=month%>#this">◁</a>
<a href="${pageContext.request.contextPath}/list/mypage?year=<%=year%>&month=<%=month-1%>#this">◀</a>
<span class = "y"><%=year%></span>년도
<span class = "m"><%=month%></span>월
<a href="${pageContext.request.contextPath}/list/mypage?year=<%=year%>&month=<%=month+1%>#this">▶</a>
<a href="${pageContext.request.contextPath}/list/mypage?year=<%=year+1%>&month=<%=month%>#this">▷</a>

</div>
<table id = "calender">
<tr style="height: 30px!important;" >
<th style="border-top-left-radius: 20px;">일</th>
<th>월</th>
<th>화</th>
<th>수</th>
<th>목</th>
<th>금</th>
<th style="border-top-right-radius: 20px;">토</th>
</tr>
<tr style="border-left: 1px solid gray; border-right: 1px solid gray;">
<%
for(int i =0; i<dayOfWeek-1;i++){
out.print("<td>&nbsp;</td>");}
for(int i=1; i<=lastDay;i++){
%>
<td style="border-left: 1px solid gray; border-right: 1px solid gray;">
<a href="${pageContext.request.contextPath}/list/addcal?year=<%=year%>&month=<%=Tcal.isTwo(Integer.toString(month))%>&day=<%=i%>"  style = "color:<%=Tcal.fontColor(i, dayOfWeek)%>">
<% 

request.setAttribute("ii", i+""); %>

${ii}
<img alt="일정추가" style="width: 20px; height: 20px;" src="${pageContext.request.contextPath}/photo/pencil.png">
</a><br>
${map.get(ii)}
<div>

</div>
</td>
<%
if((dayOfWeek-1+i)%7==0){
	out.print("</tr><tr>");
}}
for(int i=0; i< (7-(dayOfWeek-1+lastDay)%7)%7;i++){
	out.print("<td>&nbsp;</td>");
}


	

%>
</tr>
</table>

</div>
<br>




</div>

<script>

<c:if test="${member.getTest_day()!=null}">
let date1 = new Date();

let date = "${fd.format(member.getTest_day())}";

var year = date.substring(0, 4);
var month = date.substring(6, 7);
var day = date.substring(8, 10);
let date2 = new Date(year,month,day);

let date1text = date1.getFullYear()+'-'+(date1.getMonth()+1)+'-'+date1.getDate();
let date2text = date2.getFullYear()+'-'+(date2.getMonth())+'-'+date2.getDate();

document.querySelector('#date1').innerHTML = date1text;
document.querySelector('#date2').innerHTML = date2text;

let du = date2.getTime()-date1.getTime();
let dateTime = 1000*60*60*24;
let result = Math.ceil(du/dateTime)-31;


document.querySelector('#result').innerHTML = result;
</c:if>
document.querySelector('#startdate').innerHTML = "${fd.format(member.getRegdate())}";
document.querySelector('.card-name').innerHTML = "${member.getName()}"+"님";

function dday() {
	window.open('${pageContext.request.contextPath}/list/testdate','child','toolbar=no,location=center,status=no,menubar=no,resizable=no,scrollbars=no,width=400,height=400')
	}
	
function addcal() {
	window.open('${pageContext.request.contextPath}/list/addcal','child','toolbar=no,location=center,status=no,menubar=no,resizable=no,scrollbars=no,width=400,height=400')
	}


</script>



</body>
</html>