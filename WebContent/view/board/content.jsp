<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
       <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<hr>
<div class = "w3-container"style="width : 80%!important;" align="center">

<br><br>
<p align = "center"><b>${list.subject}</b></p>
<table align="center" class = "w3-table-all" style="width : 100%!important;">
<tr height = "30"><td align = "center">글번호</td>
<td align = "center">${list.num}</td>
<td>조회수</td>
<td align = "center">${list.readcount}</td>
</tr>
<tr height = "30"><td>작성자</td>
<td align = "center">${list.memberid}</td>
<td align = "center">작성일</td>
<td align = "center" colspan = "3">${sf.format(list.reg_date)}</td>
</tr>
<tr height = "300">
<td align = "center">글내용</td>
<td align = "left" colspan = "3"><pre>${list.content}</pre></td>
</tr>
<tr height = "30">
<td colspan = "4" class = "w3-center">
<c:if test="${writer!=null}">
<input  class ="w3-button w3-yellow w3-hover-black w3-round-large" type = "button" value = "글수정" onclick="document.location.href='${pageContext.request.contextPath}/list/updateForm'">&nbsp;&nbsp;&nbsp;&nbsp;
<input class ="w3-button w3-yellow w3-hover-black w3-round-large" type = "button" value = "글삭제" onclick="document.location.href='${pageContext.request.contextPath}/list/deleteForm'">&nbsp;&nbsp;&nbsp;&nbsp;
</c:if>
<%-- <input class ="w3-button w3-yellow w3-hover-black w3-round-large" type = "button" value = "답글쓰기" onclick="document.location.href='${pageContext.request.contextPath}/list/writeBoard'">&nbsp;&nbsp;&nbsp;&nbsp; --%>
<input class ="w3-button w3-yellow w3-hover-black w3-round-large" type = "button" value = "글목록" onclick="document.location.href='${pageContext.request.contextPath}/list/notice?boardid=${boardid}'">
</td>
</tr>
</table>
</div>

</body>
</html>