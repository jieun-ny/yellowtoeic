<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="../js/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
	var cnt = 3;
</script>
<!-- <script>
  $(document).ready(function(){
	  $("#b1").click(function(){//[결과]버튼을 클릭하면 자동실행
		  cnt = +3;
		//요청페이지에 전송할 데이터
		var query = {rowCnt : String(cnt), 
				     stus : "homebody"};
		//process.jsp페이지에 요청데이터를 보낸 후 결과를 반환받음
		//for(var printRowCont=0; printRowCont<3; printRowCont++){
	    $.ajax({
	    	type: "get", //전송방식
	    	url: "/zlzlzlzlzlzlzlzlzlzl/ajax/process2.jsp", //요청페이지
	    	data: query, //전송데이터
	    	//error:function(request,status,error){
	        //    alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	        //   },	  
	    	success: function(data){ //요청페이지를 실행한 결과
	    		console.log(data);
	    		document.getElementById('result').innerHTML+=data	    	}
	    });
		//}
     });
  });
</script> -->
<script>
  $(document).ready(function(){
	  
	  $("#b1").click(function(){//[결과]버튼을 클릭하면 자동실행
		  var cnt = '3';
		//요청페이지에 전송할 데이터
		var query = {rowCnt : cnt, 
				     stus : "homebody"};
		//process.jsp페이지에 요청데이터를 보낸 후 결과를 반환받음
		//for(var printRowCont=0; printRowCont<3; printRowCont++){
	    $.ajax({
	    	type: "get", //전송방식
	    	url: "/zlzlzlzlzlzlzlzlzlzl/ajax/process2.jsp", //요청페이지
	    	data: query, //전송데이터
	    	//error:function(request,status,error){
	        //    alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	        //   },	  
	    	success: function(data){ //요청페이지를 실행한 결과
	    		console.log(data);
	    		document.getElementById('result').innerHTML+=data	    	}
	    });
		//}
     });
  });
</script>
</head>
<body>
<div style="text-align: center;">
	<table style="border: 0px; width: 1000px; text-align: center; margin: auto;">
		<tr style="background-color: yellow;">
			<td style="width:70%; height: 50px;"><h2 style="font-size: 2em;">불편사항</h2></td>
			<td style="width: 15%;"><h2 style="font-size: 2em;">작성자</h2></td>
			<td style="width: 15%;"><h2 style="font-size: 2em;">작성일</h2></td>
		</tr>
		<c:forEach var="feed" items="${feedbacks}" begin="1" end="5">
			<tr>
				<td style="height: 50px;"><h6 style="font-size: 1.2em;">${feed.content}</h6></td>
				<td><h6 style="font-size: 1.2em;">${feed.member_id}</h6></td>
				<td><h6 style="font-size: 1.2em;">${feed.reg_date}</h6></td>
			
			</tr>
		</c:forEach>
		<tbody id="result">

		</tbody>
	</table>
	   <a id="b1"><img src="${pageContext.request.contextPath}/hackers_files/arrowtobot.png" style="width:50px; height:60px;" alt="more"></a>
</div>
<c:choose>
	<c:when test="${sessionScope.memberid!=null}">
		<div><button onclick="location.href='${pageContext.request.contextPath}/feedback/gotoFeedbackForm'"
			style="background-color: yellow; border: 0px; height: 50px; width: 200px;">글쓰기2</button></div>
	</c:when>
	<c:otherwise>
		<div><button onclick="alert('로그인 후 이용 가능합니다.')"
		style="background-color: yellow; border: 0px; height: 50px; width: 200px;">글쓰기</button></div>
	</c:otherwise>
</c:choose>
  <div id="result"></div>
</body>
</html>