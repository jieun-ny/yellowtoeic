<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style >
.w3-table{
width: 70%!important;

}

</style>
</head>
<body>
<div align = "center" class= "w3-container">
<b>글쓰기</b>
<form action="${pageContext.request.contextPath}/list/updatePro" name = "writeform" method = "post">
 <input type= "hidden" name = "memberid" value="${list.memberid}">
 <input type= "hidden" name = "ref" value="${li.ref}">
<input type= "hidden" name = "re_level" value="${li.re_level}">
<input type= "hidden" name = "num" value="${list.num}">  
<table  border= "2" class = "w3-table">
<tr>
<td align = "right" colspan = 2 ><a href = "list.jsp"></a></td>
</tr>
<tr>
<td width = "70" align = "center">
아이디 : </td>
<td width = "330">${list.memberid}</td>
</tr>
<tr>
<td width = "70" align = "center">
제목 : </td>
<td width = "330"><input style="border:none" type = "text" size = "40" maxlength = "50" name = "subject" value= "${list.subject}"></td>
</tr>

<td width = "70" align = "center">
내용 : </td>
<td width = "330"><textarea  style="border:none" name = "content" rows = "13" cols = "40">${list.content}</textarea></td>
</tr>
<tr>
<td width = "70" align = "center">
비밀번호 : </td>
<td width = "330"><input style="border:none" type = "text" size = "8" maxlength = "12" name = "password"></td>
</tr>
</table>
<div  align="center" style="margin-top: 20px; margin-bottom: 100px;">
<input class ="w3-button w3-yellow w3-hover-black w3-round-large" type = "submit" value = "수정완료">
<input class ="w3-button w3-yellow w3-hover-black w3-round-large" type = "reset" value = "다시작성">
<input class ="w3-button w3-yellow w3-hover-black w3-round-large" type = "button" value = "목록보기" onclick="window.location='${pageContext.request.contextPath}/list/notice?boardid=${boardid}'">
</div>
</form>
</div>
</body>
</html>