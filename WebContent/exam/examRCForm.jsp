<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic:400,700,800|Roboto:400,400i,500,500i,700,700i&display=swap&subset=korean" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
<title>RC test</title>
</head>

<style>
body{
    display: table-cell;
    vertical-align: middle;
   	font-family: 'Nanum Gothic', sans-serif;
	font-family: 'Roboto', sans-serif;
}

html {
    display: table;
    margin: auto;
}

html, body {
    height: 100%;
}
span{
	color:black;
}

#container{
	border: 2px solid #bdbdbd;
	padding: 10px;
	margin: 10px;
}

[type="radio"]:checked + span:after,
[type="radio"].with-gap:checked + span:before,
[type="radio"].with-gap:checked + span:after  {
  border: 2px solid #ffa000;
}

[type="radio"]:checked + span:after,
[type="radio"].with-gap:checked + span:after  {
  background-color: #ffa000;
}
</style>
<script>

	function check_rb(){
		var chk_radio = document.getElementsByName('seleted');
		var sel_type = 0;
		for(var i=0;i<chk_radio.length;i++){
			if(chk_radio[i].checked == true){ 
				sel_type++;
			}
		}
		if(sel_type<1){
            alert("답을 선택해주세요"); 
			return false;
		}else{
			return true;
		}
		
	}


	
	// 뒤로가기 막기
	
	
	// F5버튼 새로고침 막기
	/* function doNotReload(){
	    if(    (event.ctrlKey == true && (event.keyCode == 78 || event.keyCode == 82))        || (event.keyCode == 116) ) // function F5   //78 ,82 ctrl+N , ctrl+R 
	    {
	   	  alert("새로고침은 누르실수 없습니다.")
	      event.keyCode = 0;
	      event.cancelBubble = true;
	      event.returnValue = false;
	    }
	}
	document.onkeydown = doNotReload; */
	
</script>
<body >
	
	<h3 style="text-align: center;"><img src="${pageContext.request.contextPath}/photo/logo_exam.JPG"></h3>
	<h3 style="text-align: center;">RC_${exam.part}</h3>
	<br>
	 <div id="container" >
	<form name="examForm" method="post" onSubmit="return check_rb()">
	<input type="hidden" name="exam_num" value="${exam.exam_num }" >
	<table>
		<thead>
		<tr>
			<td>${exam.exam_num }. ${exam.question }</td>
		</tr>
		</thead>
		<tbody>
		<tr>
			<td><label>
	        <input name="seleted" value="1" type="radio" class="with-gap" />
	        <span >(A) ${exam.no1 }</span>
	     	</label></td>
		</tr>
		<tr>
			<td><label>
	        <input name="seleted" value="2" type="radio" class="with-gap" />
	        <span>(B) ${exam.no2 } </span>
	     	</label></td>
		</tr>
		<tr>
			<td><label>
	        <input name="seleted" value="3" type="radio" class="with-gap" />
	        <span>(C) ${exam.no3 }</span>
	     	</label></td>
		</tr>
		<tr>
			<td><label>
	        <input name="seleted" value="4" type="radio" class="with-gap" />
	        <span>(D) ${exam.no4 }</span>
	     	</label></td>
		</tr>
		</tbody>
		</table>
		<div style="padding: 10px;">
			<button class="btn waves-effect waves-light col s12 amber black-text" type="submit" style="margin-right: 20px;" formaction="exam?check=2&num=${exam.exam_num+1 }" >다음문제	</button>
			<button class="btn waves-effect waves-light col s12 amber black-text" type="submit"  formaction="exam?check=2&num=0" >채점하기	</button>
		</div>
	</form>
	</div>
</body>
</html>