<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
<meta charset="utf-8" />
   <meta http-equiv="content-language" content="kr" />
   <meta http-equiv="Pragma" content="no-cache">
   <meta http-equiv="Expires" content="-1">
   <meta http-equiv="X-UA-Compatible" content="IE=edge" />
   <link rel="icon" href="<%=request.getContextPath() %>/pencil2.png" type="image/x-icon">
   <title>
      노란펜
   </title>

<style>

</style>
<script type="text/javascript" src="https://img.eduwill.net/resources/ea/live/js/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="https://img.eduwill.net/resources/ea/live/js/jquery.form.js"></script>
<script type="text/javascript" src="https://img.eduwill.net/resources/ea/live/js/main.js"></script>
<script type="text/javascript" src="https://img.eduwill.net/resources/ea/live/js/EUtils.js"></script>
<script type="text/javascript" src="https://img.eduwill.net/resources/ea/live/js/join.js"></script>
<script type="text/javascript" src="https://img.eduwill.net/resources/ea/live/js/common.js"></script>
<script type="text/javascript" src="https://img.eduwill.net/resources/ea/live/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js" charset="utf-8"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
<script>
document.addEventListener('DOMContentLoaded', function() {
    var elems = document.querySelectorAll('.datepicker');
    var instances = M.Datepicker.init(elems, 'autoClose');
    var instance = M.DatePicker.format('yyyy-MM-dd');
    
  });
  

</script>

<script type="text/javascript">
         document.addEventListener('DOMContentLoaded', function() {
            const options = {
               format: 'yyyy-mm-dd',
            };
            var elems = document.querySelectorAll('.datepicker');
            var instances = M.Datepicker.init(elems, options);
         })
         
         
         
function inputPhoneNumber(obj) {



    var number = obj.value.replace(/[^0-9]/g, "");
    var phone = "";



    if(number.length < 4) {
        return number;
    } else if(number.length < 7) {
        phone += number.substr(0, 3);
        phone += "-";
        phone += number.substr(3);
    } else if(number.length < 11) {
        phone += number.substr(0, 3);
        phone += "-";
        phone += number.substr(3, 3);
        phone += "-";
        phone += number.substr(6);
    } else {
        phone += number.substr(0, 3);
        phone += "-";
        phone += number.substr(3, 4);
        phone += "-";
        phone += number.substr(7);
    }
    obj.value = phone;
}
         
         
      </script>
</head>
<body>
<div>

<div id="header">
   <div class="h_wrap" id="h_wrap">
      <h1><a href="#"><img src="<%=request.getContextPath() %>/pencil2.png" alt="노랑펜" style="width:200px;height: 150px;"></a></h1>
      <div class="hd_spot">
         <ul class="hd_gnb">
            <li class="hd_item01"><a class="hd_item " href="<%=request.getContextPath() %>/login/login">로그인</a></li>
            <li class="hd_item02"><a class="hd_item active" href="<%=request.getContextPath() %>/login/join">무료회원가입</a></li>
            <li class="hd_item03"><a class="hd_item " href="<%=request.getContextPath() %>/login/findIdPw">아이디 / 비밀번호찾기</a></li>
         </ul>
      </div>
   </div>
</div>

</div>


<c:if test="${error==1}">
<script>
alert('이미 사용중인 아이디입니다.');
</script>
</c:if>
<form action="<%=request.getContextPath() %>/login/joinPro" method="post">
<div class="row" style="width: 400px;">
    <div class="col s12">
      <div class="row">

        <div class="input-field col s12">
          <i class="material-icons prefix"></i>
          <input type="text" id="autocomplete-input" name = "memberid" class="autocomplete" value = "${param.memberid}">
          <label for="autocomplete-input">아이디</label>
      
        </div>
        <div class="input-field col s12">
          <i class="material-icons prefix"></i>
          <input type="password" id="autocomplete-input" name = "password" class="autocomplete"value = "${param.password}">
          <label for="autocomplete-input">비밀번호</label>
         
        </div>
     
        <div class="input-field col s12">
          <i class="material-icons prefix"></i>
          <input type="text" id="autocomplete-input" name = "name" class="autocomplete" value = "${param.name}">
          <label for="autocomplete-input">이름</label>
        </div>
        <div class="input-field col s12">
          <i class="material-icons prefix"></i>
          <input type="text" id="autocomplete-input" name = "email" class="autocomplete" value = "${param.email}">
          <label for="autocomplete-input">이메일</label>
        </div>
       <div class="input-field col s12">
          <i class="material-icons prefix"></i>
          <input type="text" id="autocomplete-input" name = "address" class="autocomplete" value = "${param.address}">
          <label for="autocomplete-input">주소</label>
        </div>
        
        <div class="input-field col s12">
          <i class="material-icons prefix"></i>
          <input type="text" onKeyup="inputPhoneNumber(this);" id="autocomplete-input" name = "phone" class="autocomplete" value = "${param.phone}">
          <label for="autocomplete-input">전화번호</label>
        </div>
      <div  class="input-field col s12">
      <i class="material-icons prefix"></i>
       <input type="date" name = "birthday" value = "${param.birthday}">
        <label for="autocomplete-input">생년월일</label>
      </div>
      <div align="center">
      <input type="submit" value="가입하기" style="width : 100px; height: 30px;">
      </div>
      </div>
    </div>
  </div>
</form>

    <script type="text/javascript" src="js/materialize.min.js">
document.addEventListener('DOMContentLoaded', function() {
    var elems = document.querySelectorAll('.autocomplete');
    var instances = M.Autocomplete.init(elems, 'autoClose');
 
  });


  // Or with jQuery

  </script>

</body>
</html>