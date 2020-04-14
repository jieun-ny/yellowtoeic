<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
<script   src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<title>LC test</title>
</head>

<style>
body {
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

h3,h4{
   text-align: center;
}
span {
   color: black;
}

[type="radio"]:checked+span:after, [type="radio"].with-gap:checked+span:before,
   [type="radio"].with-gap:checked+span:after {
   border: 2px solid #ffa000;
}

[type="radio"]:checked+span:after, [type="radio"].with-gap:checked+span:after
   {
   background-color: #ffa000;
}
#container{
   border: 2px solid #bdbdbd;
   padding: 10px;
   margin: 10px;
}

</style>
<script>
   var min = 2;
   var sec = 59;   

   var timer1 = setInterval(function(){
      if(min==0 && sec==0){
         alert("시간 종료");
         $("#LCexam").submit();
         /* location.href='${pageContext.request.contextPath }/test/checkLC' */
      }
      if(sec>=10){
         document.getElementById('timer').innerHTML= min +" : "+ sec;
      }else{
         document.getElementById('timer').innerHTML= min +" : 0"+ sec;
      }
      sec--;
      if(sec<0){
         min--;
         sec=5;
      }
   }, 1000)

   var isChrome = /Chrome/.test(navigator.userAgent) && /Google Inc/.test(navigator.vendor);
     if (!isChrome){
         $('#iframeAudio').remove()
     }
     else {
         $('#playAudio').remove() // just to make sure that it will not have 2x audio in the background 
     }


     function check_rb() {
         var total = 0;
         for(var q= 1; q <= 10; q++){
            var question = "question"+q;
            var chk_radio = document.getElementsByName(question);
            var sel_type = false;
            for(var i=0; i<chk_radio.length; i++){
               if(chk_radio[i].checked == true){ 
                  sel_type=true;
                  total++;
               }
            }
         }
         if(total<10){
        	 alert("답을 선택해주세요"); 
            return false;
         }else{
            return true;
         }
      }

   // 뒤로가기 막기

   // F5버튼 새로고침 막기
   function doNotReload() {
      if ((event.ctrlKey == true && (event.keyCode == 78 || event.keyCode == 82))
            || (event.keyCode == 116)) // function F5   //78 ,82 ctrl+N , ctrl+R 
      {
         alert("새로고침은 누르실수 없습니다.")
         event.keyCode = 0;
         event.cancelBubble = true;
         event.returnValue = false;
      }
   }
   document.onkeydown = doNotReload;
</script>
<body>

   
   <%--<iframe src="${pageContext.request.contextPath }/exam/lctest.mp3" allow="autoplay" style="display:none;" id="iframeAudio">
   </iframe> --%>
   <audio id="player" autoplay>
   <source src="${pageContext.request.contextPath }/exam/lctest.mp3" type="audio/mp3">
   </audio>
   
   
   <h3><img src="${pageContext.request.contextPath}/photo/logo_exam.JPG"></h3>
   <h3>LC_part2</h3><p style="font-size= 15; text-align: center;"><span id="timer">3:00</span></p>
   <div id="container">
   <form id="LCexam" name="LCexam" method="post" action="${pageContext.request.contextPath }/test/checkLC?" onSubmit="return check_rb()">
   <!--onSubmit="return check_rb()"  -->
      <table class="answer" >
      <c:set var="total" value="0"/>
      <c:forEach var="i" begin="1" end="10" step="1">
         <c:set var="total" value="${total+1}"/>
         <tr>
            <td colspan="3">${i}. Mark your answer on your answer sheet.</td>
         </tr>
         <tr>
            <td><label><input name="question${i}" value="1"
                  type="radio" class="with-gap" /> <span>(A)</span>
            </label></td>
            <td><label> <input name="question${i}" value="2"
                  type="radio" class="with-gap" /> <span>(B)</span>
            </label></td>
            <td><label> <input name="question${i}" value="3"
                  type="radio" class="with-gap" /> <span>(C)</span>
            </label></td>
         </tr>
      </c:forEach>
      <input type="hidden" name="total" value="${total }" >         
      </table>
      <div style="padding: 10px;">
      <c:out value="${i }"/> 
         <button class="btn waves-effect waves-light col s12 amber black-text" type="submit" >채점하기   </button>
      </div>
   </form>
   </div>

</body>
</html>