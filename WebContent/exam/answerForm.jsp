<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic:400,700,800|Roboto:400,400i,500,500i,700,700i&display=swap&subset=korean" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
<style>
<style>
body{
   	font-family: 'Nanum Gothic', sans-serif;
	font-family: 'Roboto', sans-serif;
}

#floatdiv { 
	position:fixed;
	bottom:auto; 
	top:7%;
	left:5%; 
	margin-bottom:0 auto;
	z-index:900;
}

</style>
<script>
	/* if(id)	 */
	
	
	document.addEventListener('DOMContentLoaded', function() {
	    var elems = document.querySelectorAll('.collapsible');
	    var instances = M.Collapsible.init(elems, 'accordion');
	});
	
	document.addEventListener('DOMContentLoaded', function() {
	    var elems = document.querySelectorAll('.scrollspy');
	    var instances = M.ScrollSpy.init(elems, 'scrollOffset');
	});

</script>

<title>결과보기</title>
</head>
<body>
	<div class="row">
		<div class="col s3" style="padding: 5%;">
			
			<ul id="floatdiv" class="collapsible section table-of-contents" >
			<div>
			<h3 style="text-align: center;"><img src="${pageContext.request.contextPath}/photo/logo_exam.JPG"></h3>
			</div>
				<li class="active">
					<div class="collapsible-header"><i class="material-icons">dehaze</i>시험 결과보기</div>
					<div class="collapsible-body">
						<div style="border: 1px solid;" >
						<table class="centered">
						<thead>
							<tr>
								<th>문  제</th>
								<th>정  답</th>
								<th>선  택</th>
							</tr>
						</thead>
						<tbody>
							<c:set var="i" value="0" />
							<c:forEach var="question" items="${result_exam }" >
							
							<tr>
								<td>
									<a href="#q${question.exam_num }"> ${question.exam_num }</a>							</td>
								<td>${question.answer }</td>
								<c:if test="${question.answer == question.selected_ans}" >
									<td style="color:#ffc107 ;">${question.selected_ans }</td>
								</c:if>
								<c:if test="${question.answer != question.selected_ans}" >
									<td style="color:red;">${question.selected_ans }</td>
								</c:if>
								
							</tr>
							
							
							
							<c:if test="${question.answer == question.selected_ans}" >
								<c:set var="i" value="${i+1}" />
							</c:if>
							</c:forEach>
						</tbody>
						</table>
						</div>				
					</div>
					<div style="text-align : center;">
						<p> 맞힌 답 수/푼 문제 수 </p>
						<p> ${i}/${length } </p>
					</div>
					
				</li>
			</ul>
		</div>
		<div>
			
			<c:if test="${result_exam.get(0).part eq 'part2'}">
					<audio id="player" controls>
					<source src="${pageContext.request.contextPath }/exam/lctest.mp3" type="audio/mp3">
					</audio>
			</c:if> 
			
		</div>
		<div class="col s9">
	<c:forEach var="exam" items="${result_exam}">
			<table class="section scrollspy" id="q${exam.exam_num }" style="border: solid 1px">
				<tr>
					<td>${exam.exam_num }. ${exam.question }</td>
				</tr>
				<tr>
					<td><span >(A) ${exam.no1 }</span></td>
				</tr>
				<tr>
					<td><span >(B) ${exam.no2 }</span></td>
				</tr>
				<tr>
					<td><span >(C) ${exam.no3 }</span></td>
				</tr>
				<c:if test="${exam.part eq 'part5'}">
				<tr>
					<td><span >(D) ${exam.no4 }</span></td>
				</tr>
				</c:if>
				<tr>
					<td>(${exam.answer })</td>
				</tr>
				<c:if test="${exam.part eq 'part5'}">
				<tr>
					<td>${exam.explain_question }</td>
				</tr>
				</c:if>
				<tr>
				</tr>
				
			</table>
	</c:forEach>
	</div>	
</div>
<div>	
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>

</div>
</body>
</html>