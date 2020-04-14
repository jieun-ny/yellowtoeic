


<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<style type="text/css">
.w3-table td{
       text-align: center !important;
         
}
.w3-light{
background-color: #FF9100;
}

.w3-table{

    width: 82% !important;
  
}
a{
text-decoration:  none;
}
.btn-group button {
  background-color: #FFC314; /* Green background */
  border: 1px solid #FFB400; /* Green border */
  color: white; /* White text */
  padding: 10px 24px; /* Some padding */
  cursor: pointer; /* Pointer/hand icon */
  float: left; /* Float the buttons side by side */
	max-width: 100%;
}
.btn button{
margin-right : 10%;
margin-top : 30px;
background-color: #FF9100; /* Green background */
  border: 1px solid #FF9100; /* Green border */
  color: white; /* White text */
padding: 10px 24px; /* Some padding */
}
.btn button:hover {
  background-color: #FFC314;
}

/* Clear floats (clearfix hack) */
.btn-group:after {
  content: "";
  clear: both;
  display: table;
}

.btn-group button:not(:last-child) {
  border-right: none; /* Prevent double borders */
}

/* Add a background color on hover */
.btn-group button:hover {
  background-color: #FF9100;
}
h5{text-align: center;
}

 
.btn-group>button{


width : 30%
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>시험정보</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
</head>
<body>
<div align="center">
<h2>접수 일정</h2>
<a href="https://appexam.ybmnet.co.kr/toeic/receipt/receipt.asp">접수하기</a>
<table class="w3-table w3-bordered w3-border test w3-hoverable">
<tr class="w3-light" style="text-align: center;">
<td class = "title">회차</td>
<td class = "title">시험일자</td>
<td class = "title">발표일자</td>
<td class = "title">접수일</td>
</tr>
<c:forEach var="info" items="${info}" begin="0" end="4">
<tr>
<td style="text-align: center;">${info.t}<br></td>
<td>${info.date}</td>
<td>${info.pdate}</td>
<td>${info.adate}</td>
</tr>
</c:forEach>
</table>
</div>


<h5><a class = "a" href="${pageContext.request.contextPath}/list/writereply?boardid=${day-3}">${day-3}회 토익시험 난이도 평가하기</a></h5>
<h5><a class = "a" href="${pageContext.request.contextPath}/list/writereply?boardid=${day-2}">${day-2}회 토익시험 난이도 평가하기</a></h5>
<h5><a class = "a" href="${pageContext.request.contextPath}/list/writereply?boardid=${day-1}">${day-1}회 토익시험 난이도 평가하기</a></h5>


<div>
</div>
<div align="center">
<div class="btn-group" style=" margin-left:9%; margin-top: 50px; display:block;">
  <button  onclick="window.location.href='${pageContext.request.contextPath}/list/notice?boardid=1';">토익 후기</button>
  <button  onclick="window.location.href='${pageContext.request.contextPath}/list/notice?boardid=2';">토익정답게시판</button>
  <button  onclick="window.location.href='${pageContext.request.contextPath}/list/notice?boardid=3';">토익시험QnA</button>
</div>

<div style="height: 300px; border: 1px;">
<table class="w3-table w3-bordered w3-border test w3-hoverable">
<tr class="w3-light-gray"  style="text-align: center;">
<td class = "title">번호</td>
<td class = "title">제목</td>
<td class = "title">글쓴이</td>
<td class = "title">조회수</td>
<td class = "title">날짜</td>
</tr>



<c:if test="${count==0}">
<tr><td colspan="5">	<h4>등록된 게시물이 없음</h4></td></tr>
						
						</c:if>
						<c:if test="${count!=0}">
<c:forEach var="list" items="${list}">
<tr>
<td style="text-align: center;">${list.num}<br></td>
<td onclick="window.location.href='${pageContext.request.contextPath}/list/content?num=${list.num}&boardid=${list.boardid}';" style="width:40%;">${list.subject}</td>
<td style="width:20%;">${list.memberid}</td>
<td>${list.readcount}</td>
<td style="width:20%;">${fd.format(list.reg_date)}</td>
</tr>
</c:forEach>
</c:if>
</table>
</div>

				<div class="col-lg-12">
							<div class="pageination">
								<nav aria-label="Page navigation example">
									<ul class="pagination justify-content-center">

										<c:if test="${startPage > bottomLine}">
											<li class="page-item"><a class="page-link"
												href="list/notice?boardid=${boardid}&pageNum=${startPage - bottomLine}#this"
												aria-label="Previous"> <i class="ti-angle-double-left"></i>
											</a></li>
										</c:if>

										<c:forEach var="i" begin="${startPage}" end="${endPage}">
											<li class="page-item"><a class="page-link"
												href="list/notice?boardid=${boardid}&pageNum=${i}#this">${i}</a></li>

										</c:forEach>

										<c:if test="${endPage < pageCount}">
											<li class="page-item"><a class="page-link"
												href="list/notice?boardid=${boardid}&pageNum=${startPage + bottomLine}#this"
												aria-label="Next"> <i class="ti-angle-double-right"></i>
											</a></li>
										</c:if>
									</ul>
								</nav>
							</div>
						</div>


<div class="btn" align="right" style="margin-bottom: 100px;">
<c:if test="${memberid!=null}">
 <button style="width : 10%;" onclick="window.location.href='${pageContext.request.contextPath}/list/writeBoard?boardid=${boardid}';">글쓰기</button>
</c:if>
</div>
</div>



			


		

			







<script >
window.onload = function(){
	var atag = document.getElementsByTagName("button");
	var url = document.location.href.split("/");
	
	if (1==${boardid}){
		atag[0].style.backgroundColor='#FF9100';
	}
	else if (2==${boardid}){
		atag[1].style.backgroundColor='#FF9100';
	}
	else if (3==<%=session.getAttribute("boardid")%>){
		atag[2].style.backgroundColor='#FF9100';
	}
	
}

</script>
</body>
</html>