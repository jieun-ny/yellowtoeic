<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
 <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Insert title here</title>
</head>
<body>
<div>
<h2>일정 추가</h2>
<form action="${pageContext.request.contextPath}/list/addcalPro">
<table class = "w3-table" >
<tr ><td style="text-align: center !important;"> 날짜 : 
<input type="hidden" name = "memberid" value = "${memberid}">
<input type="date" name = "dcal" value = "${dcal}">
</td>
</tr>
<tr><td style="text-align: center !important;">
일정 : <input type="text" name = "list" size="15">
</td>
</tr>
<tr><td  class="btn btn-default btn-sm" style="text-align: center !important;">
<input  type="submit" value = "일정등록">
</td>
</tr>
</table>
</form>
</div>
<div>

<h2>일정 삭제</h2>
<form action="${pageContext.request.contextPath}/list/deletecal">
<input type="hidden" name = "memberid" value = "${memberid}">
<input type="hidden" name = "dcal" value = "${dcal}">
<c:forEach var="li" items="${list}">
<label><input type="checkbox" name="list" value="${li.list}"> ${li.list} </label><br>
</c:forEach>

<input  type="submit" value = "일정 삭제">
</form>



</div>
</body>
</html>