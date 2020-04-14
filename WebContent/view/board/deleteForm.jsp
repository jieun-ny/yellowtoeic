
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>


</head>
<body>
<form action = "${pageContext.request.contextPath}/list/deletePro" method = "post">
<input type = "hidden" name = "num" value = "${num}">
<table class = "w3-table" width = "700px" cellspacing = "2" cellpadding = "4" align = "center" >
<tr><td style="text-align: center!important;" colspan = "2" height = "39" align = "center"> 글을 삭제하시겠습니까? </td>
</tr>
<tr><td style="text-align: center!important; margin-right: 80px;"> 비밀번호 확인 </td> 
</tr>
<tr>
<td style="text-align: center!important;"><input type = "password" name = "password" ></td></tr>
<tr>
<td style="text-align: center!important;" colspan = "2" align = "center">
<input type ="submit" value = "삭제">
<input type ="button" value = "돌아가기" onclick="javascript:location.href='${pageContext.request.contextPath}/board/list?num=<%=request.getParameter("num")%>'">
</td>
</tr>


</table>

</form>
</body>
</html>
