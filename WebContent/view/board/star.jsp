<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta http-equiv="Content-Type" content="text/html" charset="utf-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<title>별점</title>
<style>
w3-table{
width : 80%!important;}
.star-input>.input,
.star-input>.input>label:hover,
.star-input>.input>input:focus+label,
.star-input>.input>input:checked+label{display: inline-block;vertical-align:middle;background:url('<%=request.getContextPath()%>/grade_img.png')no-repeat;}
.star-input{display:inline-block; white-space:nowrap;width:225px;height:40px;padding:25px;line-height:30px;}
.star-input>.input{display:inline-block;width:150px;background-size:150px;height:28px;white-space:nowrap;overflow:hidden;position: relative;}
.star-input>.input>input{position:absolute;width:1px;height:1px;opacity:0;}
star-input>.input.focus{outline:1px dotted #ddd;}
.star-input>.input>label{width:30px;height:0;padding:28px 0 0 0;overflow: hidden;float:left;cursor: pointer;position: absolute;top: 0;left: 0;}
.star-input>.input>label:hover,
.star-input>.input>input:focus+label,
.star-input>.input>input:checked+label{background-size: 150px;background-position: 0 bottom;}
.star-input>.input>label:hover~label{background-image: none;}
.star-input>.input>label[for="p1"]{width:30px;z-index:5;}
.star-input>.input>label[for="p2"]{width:60px;z-index:4;}
.star-input>.input>label[for="p3"]{width:90px;z-index:3;}
.star-input>.input>label[for="p4"]{width:120px;z-index:2;}
.star-input>.input>label[for="p5"]{width:150px;z-index:1;}
.star-input>output{display:inline-block;width:60px; font-size:18px;text-align:right; vertical-align:middle;}

img{width:30px;z-index:5;}
h2{
text-align: center;
}


</style>

</head>

<body>
<div class = "w3-panel w3-orange">

<h2 class="w3-opacity">${boardid}회 토익시험 난이도 평가</h2>



</div>
<div>
현재 난이도 평균
<td style="width: 100px">
<img alt="#" src="${pageContext.request.contextPath}/star${garde}.png" style="width: 100px;">
</td>
</div>
<div align="left" style="margin-left: 100px; margin-top: 80px;">
<form class="star-input" method="post" action="${pageContext.request.contextPath}/list/writereplypro">
<input type="hidden" name = "memberid" value="${memberid}">
<input type="hidden" name = "boardid" value="${boardid}">
	<span class="input">
    	<input type="radio" name="star-input" value="1" id="p1">
    	<label for="p1">쉬웠어요</label>
    	<input type="radio" name="star-input" value="2" id="p2">
    	<label for="p2">조금 쉬웠어요</label>
    	<input type="radio" name="star-input" value="3" id="p3">
    	<label for="p3">무난했어요</label>
    	<input type="radio" name="star-input" value="4" id="p4">
    	<label for="p4">조금 어려웠어요</label>
    	<input type="radio" name="star-input" value="5" id="p5">
    	<label for="p5">어려웠어요</label>
  	</span>
  	<output for="star-input"><b></b></output>
  	<div >
  	<table>
  	<tr>
  	<td><textarea rows="5" cols="80" name = "content"></textarea></td>
  	<td><input type="submit" value = "평가하기" style="height: 60px;"></td>
  	</tr>
  	</table>
  	</div>
 </div>						
</form>


<div style="margin-top: 200px; margin-left: 100px; margin-bottom: 100px; width : 80%!important;" align="left" >

<c:forEach var="replylist" items="${replylist}">
<table  class = "w3-table w3-bordered" style="width : 80%!important;" border="1" >
<tr><td rowspan="2" width="100px">
${replylist.memberid}</td>
<td style="width: 100px">
<img alt="#" src="${pageContext.request.contextPath}/star${replylist.grade}.png" style="width: 100px;">
</td>
<td>${fd.format(replylist.reg_date)}</td></tr>
<tr><td colspan="2" style="height: 80px;">${replylist.content}</td>
</tr>
</table>
</c:forEach>

</div>


<script>
var starRating = function(){
	var $star = $(".star-input"),
	    $result = $star.find("output>b");
		
	  	$(document)
		.on("focusin", ".star-input>.input", 
			function(){
	   		 $(this).addClass("focus");
	 	})
			 
	   	.on("focusout", ".star-input>.input", function(){
	    	var $this = $(this);
	    	setTimeout(function(){
	      		if($this.find(":focus").length === 0){
	       			$this.removeClass("focus");
	     	 	}
	   		}, 100);
	 	 })
	  
	    .on("change", ".star-input :radio", function(){
	    	$result.text($(this).next().text());
	  	})
	    .on("mouseover", ".star-input label", function(){
	    	$result.text($(this).text());
	    })
	    .on("mouseleave", ".star-input>.input", function(){
	    	var $checked = $star.find(":checked");
	    		if($checked.length === 0){
	     	 		$result.text("별을 클릭해주세요");
	   		 	} 
	    		
	    		if($checked.length === 1){
	     	 		$result.text("쉬웠어요");
	   		 	}
	    		if($checked.length === 2){
	     	 		$result.text("조금 쉬웠어요");
	   		 	}
	    		if($checked.length === 3){
	     	 		$result.text("무난했어요");
	   		 	}
	    		if($checked.length === 4){
	     	 		$result.text("조금 어려웠어요");
	   		 	}
	    		if($checked.length === 5){
	     	 		$result.text("어려웠어요");
	   		 	}
	    		else {
	     	 		$result.text($checked.next().text());
	    		}
	  	});
	};

	starRating();
</script>
</body>
</html>
