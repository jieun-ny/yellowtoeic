<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<div class = "w3-container w3-display-middle">

<br><br>
<p align = "center"><b>글내용보기</b></p>
<table class = "w3-table-all">
<tr height = "30"><td align = "center">글번호</td>
<td align = "center">${boardlist.num}</td>

</tr>
<tr height = "30"><td>작성자</td>
<td align = "center">${boardlist.memberid}</td>
<td align = "center">글제목</td>
<td align = "center" colspan = "3">${boardlist.subject}</td>
</tr>
<tr height = "300">
<td align = "center">글내용</td>
<td align = "left" colspan = "3"><pre>${boardlist.content}</pre></td>
</tr>
<tr height = "30">
<td colspan = "4" class = "w3-center">
<input type = "button" value = "글수정" onclick="document.location.href='updateForm?num=${article.num}'">&nbsp;&nbsp;&nbsp;&nbsp;
<input type = "button" value = "글삭제" onclick="document.location.href='deleteForm?num=${article.num}'">&nbsp;&nbsp;&nbsp;&nbsp;
<input type = "button" value = "답글쓰기" onclick="document.location.href='writeForm?num=${article.num}&ref=${article.ref}&re_level=${article.re_level}&re_step=${article.re_step}'">&nbsp;&nbsp;&nbsp;&nbsp;
<input type = "button" value = "글목록" onclick="document.location.href='list?pageNum=${pageNum}'">
</td>
</tr>
</table>

</div>

</body>
</html>