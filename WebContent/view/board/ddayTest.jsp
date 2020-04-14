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

<form action="${pageContext.request.contextPath}/list/ddayPro" method="get">
<select name="dday">
<c:forEach var="info" items="${info}" begin="0" end="4">
<option value="${info.date}">${info.t}-${info.date}</option>
</c:forEach>
</select>
<input type="submit" value="등록">
</form>


</body>
</html>