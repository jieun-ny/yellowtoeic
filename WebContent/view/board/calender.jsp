<%@page import="model.Tcal"%>

<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
#calender{
	border : 1px solid gray;
	border-collapse: collapse;
}
#calender th{
width : 80px;
border: 1px solid gray;
}
#calender td{
width : 80px;
height : 80px;
border: 1px solid gray;
text-align: left;
vertical-align: top;
position: relative;
}


</style>
</head>
<body>
<%
Calendar cal = Calendar.getInstance();
int year = cal.get(Calendar.YEAR);
int month = cal.get(Calendar.MONTH)+1;
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
<div align="center" style="margin-top: 100px; margin-bottom: 100px;">
<div>
<a href="${pageContext.request.contextPath}/list/calendar?year=<%=year-1%>&month=<%=month%>">◁</a>
<a href="${pageContext.request.contextPath}/list/calendar?year=<%=year%>&month=<%=month-1%>">◀</a>
<span class = "y"><%=year%></span>년도
<span class = "m"><%=month%></span>월
<a href="${pageContext.request.contextPath}/list/calendar?year=<%=year%>&month=<%=month+1%>">▶</a>
<a href="${pageContext.request.contextPath}/list/calendar?year=<%=year+1%>&month=<%=month%>">▷</a>

</div>
<table id = "calender">
<tr>
<th>일</th>
<th>월</th>
<th>화</th>
<th>수</th>
<th>목</th>
<th>금</th>
<th>토</th>
</tr>
<tr>
<%
for(int i =0; i<dayOfWeek-1;i++){
out.print("<td>&nbsp;</td>");}
for(int i=1; i<=lastDay;i++){
%>
<td>
<a href="${pageContext.request.contextPath}/list/addcal?year=<%=year%>&month=<%=Tcal.isTwo(Integer.toString(month))%>&day=<%=i%>" style = "color:<%=Tcal.fontColor(i, dayOfWeek)%>">
<% request.setAttribute("ii", i+""); %>

${ii}
<img alt="일정추가" style="width: 20px; height: 20px;" src="${pageContext.request.contextPath}/pencil.png">
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
<div>

<button onclick="">일정 추가하기 </button>
</div>
</body>
</html>