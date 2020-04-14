<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta charset="utf-8" />
	<meta http-equiv="content-language" content="kr" />
	<meta http-equiv="Pragma" content="no-cache">
	<meta http-equiv="Expires" content="-1">
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
	<link rel="icon" href="${pageContext.request.contextPath }/list/main" type="image/x-icon">
	<title>
		노랑펜
	</title>
	




<link rel="stylesheet" type="text/css" href="https://img.eduwill.net/resources/ea/live/css/common.css" />


	


<script type="text/javascript" src="https://img.eduwill.net/resources/ea/live/js/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="https://img.eduwill.net/resources/ea/live/js/jquery.form.js"></script>
<script type="text/javascript" src="https://img.eduwill.net/resources/ea/live/js/main.js"></script>
<script type="text/javascript" src="https://img.eduwill.net/resources/ea/live/js/EUtils.js"></script>
<script type="text/javascript" src="https://img.eduwill.net/resources/ea/live/js/join.js"></script>
<script type="text/javascript" src="https://img.eduwill.net/resources/ea/live/js/common.js"></script>
<script type="text/javascript" src="https://img.eduwill.net/resources/ea/live/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js" charset="utf-8"></script>
<link rel="stylesheet" href="//img.eduwill.net/resources/eco/library/eduwill.eco-2.0.0.css" type="text/css">
<script type="text/javascript" src="//img.eduwill.net/resources/eco/library/eduwill.eco-2.1.0.min.js"></script>


<style>
.login_item fieldset .btn_type_login {
    width: 165px;
    height: 107px;
    line-height: 107px;
    text-align: center;
    font-size: 24px;
    color: aliceblue;
    font-family: nanum_b, 'nanum_b';
    border: none;
    background: #FFBB00;
    cursor: pointer;
    border: 1px solid;
    border-color: #C98500;
}

</style>
<!-- Google Tag Manager -->
<script>(function(w,d,s,l,i){w[l]=w[l]||[];w[l].push({'gtm.start':
new Date().getTime(),event:'gtm.js'});var f=d.getElementsByTagName(s)[0],
j=d.createElement(s),dl=l!='dataLayer'?'&l='+l:'';j.async=true;j.src=
'https://www.googletagmanager.com/gtm.js?id='+i+dl;f.parentNode.insertBefore(j,f);
})(window,document,'script','dataLayer','GTM-KW25RVW');</script>
<!-- End Google Tag Manager -->

<script>
var siteID = "";

</script>

<!-- Global site tag (gtag.js) - Google Ads: 723073598 -->
<script async src="https://www.googletagmanager.com/gtag/js?id=AW-723073598"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', 'AW-723073598');
</script> 
</head>

<body>
	<div id="wrap">
		<!-- top -->
		


<div id="header">
	<div class="h_wrap" id="h_wrap">
		<h1><a href="${pageContext.request.contextPath }/list/main"><img src="<%=request.getContextPath() %>/photo/pencil.png" alt="에듀윌" style="width:80px;height: 150px;"></a></h1>
		<div class="hd_spot">
			<ul class="hd_gnb">
				<li class="hd_item01"><a class="hd_item active" href="<%=request.getContextPath() %>/login/loginindex">로그인</a></li>
				<li class="hd_item02"><a class="hd_item " href="<%=request.getContextPath() %>/login/join">무료회원가입</a></li>
				<li class="hd_item03"><a class="hd_item " href="<%=request.getContextPath() %>/login/findIdPw">아이디 / 비밀번호찾기</a></li>
			</ul>
		</div>
	</div>
</div>

		<!-- top -->
		<!-- CONTAINER -->
		<div id="container">
			<!-- CONTENT -->
			<div id="content">
			





<script>
var Login= (function() {
	/*공통으로 작성 시작*/
	var root = this;
	var  Login ;

	if(typeof exports !== 'undefined') {
		Login  = exports;
	} else {
		Login  = root.Login  = {};
	}
	/*공통으로 작성 끝 */

	/*모듈 사용자 함수 시작*/
	Login.sendLogin = function() {
		if(($("#usrId").val() =="" || $("#usrId").val().length < 1) && ($("#pwd").val() =="" || $("#pwd").val().length < 1)){
			alert("아이디와 비밀번호를 입력해 주세요.");
			return;
		}
		if($("#usrId").val() =="" || $("#usrId").val().length < 1 ){
			alert("아이디를 입력해 주세요.");
			return;
		}
		if($("#pwd").val() =="" || $("#pwd").val().length < 1){
			alert("비밀번호를 입력해 주세요.");
			return;
		}
		$("#formLogin").submit();
	}
	return  Login;
}());

$(function () {
	$("#pwd").keydown(function (key) {
		if (key.keyCode == 13) {
			Login.sendLogin();
			return false;
		}
	});

	var chooseId = "";

	if(chooseId !="") {
		$("#usrId").val(chooseId);
	}

	var commonFn = new CommonFn();
	var rememberId = replaceAll(commonFn.getCookie("rememberId"), "\"", "");

	if(rememberId != "") {
		$("input[name=rememberIdYn]").attr("checked","checked");
		$("input[name=usrId]").val(rememberId);
	}
});

function sendBenepia(){
	$("#testBenepia").submit();
}

function replaceAll(str, searchStr, replaceStr) {
	if(str == undefined) str = "";
	return str.split(searchStr).join(replaceStr);
}

function snsLogin(type) {
	if(type == 'naver') {
		$("#naverIframe").contents().find("#naverIdLogin_loginButton")[0].click()
	} else if(type == 'kakao') {
		loginWithKakao();
	}
}
</script>
<form id="formLogin"  name="formLogin" action="<%=request.getContextPath() %>/login/loginPro" method="post">

	<div class="g_content login">
		<div class="login_item">
			<h2 class="hidden">로그인</h2>
			<div class="head_txt">
			
			</div>
			<fieldset>
				<legend>로그인</legend>
				<div class="left_area">
					<div class="input_box">
						<label for="member_id" class="hidden">아이디</label>
						<input type="text" id="usrId" name="memberid"  title="아이디를 입력하세요." title="아이디를 입력하세요." class="g_input" placeholder="아이디 (6~13자 영문 소문자, 숫자 입력)">
					</div>
					<div class="input_box">
						<label for="member_pw" class="hidden">비밀번호</label>
						<input type="password" id="autocomplete-password-dummy" autocomplete="off" class="g_input" style="display:none;">
						<input type="password" id="pwd" name="password" title="비밀번호를 입력하세요." title="비밀번호를 입력하세요." autocomplete="off" class="g_input" placeholder="비밀번호 (영문, 숫자, 특수문자 조합. 8~12자 내외)">
					</div>
					<div class="check_wrap">
						<div>
							<input type="checkbox" id="save_id" name="rememberIdYn">
							<label for="save_id">아이디저장</label>
						</div>
					</div>
				</div>
				<div class="right_area">
					<input class="btn_type_login" type="button" onclick="Login.sendLogin();" value="로그인">
				</div>
			</fieldset>
			
			<iframe src="/nobody/naverIframe" id="naverIframe" style="display: none;"></iframe>
			<!-- 네이버아이디로로그인 버튼 노출 영역 -->

			<div class="bottom_ban">
			</div>
		</div>
		<!-- // login_item -->
	</div>
</form>

<form id="formLoginDormancy" name="formLoginDormancy" method="post" action="/login/loginDormancy.action">
	<input type="hidden" name="redirectUrl" value="http://land.eduwill.net/license2/main.asp">
	<input type="hidden" name="systemCd" value="eduwill">
	<input type="hidden" name="AppName" value="">
	<input type="hidden" name="usrId" value="">
	<input type="hidden" name="pwd" value="">
	<input type="hidden" name="usrNo" value="">
	<input type="hidden" name="j_id" value="">
	<input type="hidden" name="socialName" value="">
	<input type="hidden" name="uniqueId" value="">
	<input type="hidden" name="socialUserName" value="">
	<input type="hidden" name="socialGender" value="">
	<input type="hidden" name="socialBirthday" value="">
</form>

<form id="formLoginSocial" name="formLoginSocial" method="post" action="/join/stepGate.action">
	<input type="hidden" name="redirectUrl" value="http://land.eduwill.net/license2/main.asp">
	<input type="hidden" name="systemCd" value="eduwill">
	<input type="hidden" name="AppName" value="">
	<input type="hidden" name="j_id" value="">
	<input type="hidden" name="socialName" value="">
	<input type="hidden" name="uniqueId" value="">
	<input type="hidden" name="socialUserName" value="">
	<input type="hidden" name="socialGender" value="">
	<input type="hidden" name="socialBirthday" value="">
	<input type="hidden" name="systemCd" id="systemCd" value="eduwill">
</form>




<!-- // g_content -->


<!-- // g_content -->





			</div>
			<!-- //CONTENT -->
		</div>
		<!-- //CONTAINER -->
	
		<!-- FOOTER -->
		



<script type="text/javascript">
var dataLayer = dataLayer || [];
var dataGTMKW25RVW = {
		"siteId" : siteID
		,"user_id" : ""
		,"device" : "pc"
		}
</script>


		<!-- //FOOTER -->
	
	</div>
	<!-- // WRAP -->
</body>
</html>