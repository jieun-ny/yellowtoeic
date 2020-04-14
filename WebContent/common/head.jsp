<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<head>
<title>키키키토익</title>
<script type="text/javascript">
 								function logout(){
	 							x = confirm("로그아웃하시겠습니까?");
								if(x){
								alert("로그아웃되었습니다.");
 									}
								</script>
</head>
<body class="page_main bg_gnbSub" data-gr-c-s-loaded="true">
	<div style="display: none;">
		<iframe name="hiddenfrmTop" width="0" height="0" border="0"	frameborder="0" src="${pageContext.request.contextPath }/eduwill_7_files/saved_resource.html">
		</iframe>
	</div>
	<link rel="stylesheet" href="${pageContext.request.contextPath }/eduwill_7_files/Main_gov_nognb.css"/>
	<div id="wrap">
		<!-- wrap -->
		<link rel="stylesheet" href="${pageContext.request.contextPath }/eduwill_7_files/gnb.css"/>
		<div id="section_header" class="gov">
			<div id="area_util">
				<div class="responsive_wrap">
					<div class="area_item"></div>
					<div class="area_link">
						<!-- when : logout  -->
						<c:if test="${join==0}">
						<div class="area_logout">
							<div class="submit">
								<c:if test="${memberid==null}">
								<a href="${pageContext.request.contextPath}/login/login" class="btn">로그인</a>
							</c:if>
							<c:if test="${memberid!=null}">
								<a href="${pageContext.request.contextPath}/list/mypage" class="btn">마이페이지</a>
							</c:if>
							</div>
							<div class="singup">
								<c:if test="${memberid==null}">
								<a href="${pageContext.request.contextPath}/login/join" class="btn">무료회원가입</a>
							</c:if>
							<c:if test="${memberid!=null}">
								<a href="${pageContext.request.contextPath}/login/logOut" class="btn" onclick="logout()">로그아웃</a>
							</c:if>
							</div>
						</div>
						<!-- //when : logout  -->
						<div class="area_sns">
							<div class="favorite">
								<a href="#" class="btn">즐겨찾기</a>
							</div>
							<div class="youtube">
								<a href="#" class="btn">유튜브</a>
							</div>
							<div class="blog">
								<a href="#" class="btn">블로그</a>
							</div>
							<div class="post">
								<a href="#" target="_blank" class="btn">포스트</a>
							</div>
							<div class="facebook">
								<a href="#" target="_blank" class="btn">페이스북</a>
							</div>
						</div>
						</c:if>
					</div>
				</div>
				<!-- //responsive_wrap -->
			</div>
			<!-- //area_util -->
			<div id="area_gnb">
				<div class="responsive_wrap">
					<div class="area_logo">
						<h1>
							<a href="${pageContext.request.contextPath }/login/main.jsp">
							</a>
						</h1>
						<!--과정명-->
						<div class="item">
							<a href="${pageContext.request.contextPath }/login/main">
							<img src="${pageContext.request.contextPath }/photo/pencil2.png" alt="노랑팬" style="width: 10px; height: 25px">
								노랑펜토익 </a>
						</div>
					</div>
					<div class="area_menu">
						<ul>
						
							<c:if test="${memberid!=null}">
							<li>
							<a href="${pageContext.request.contextPath }/lecture/printMyLectures">나의강의실</a>
							</li>
							</c:if>
							
							<c:if test="${memberid==null}">
							<li>
							<a href="${pageContext.request.contextPath}/login/login">나의강의실</a>
							</li>
							</c:if>
							
							<c:if test="${memberid!=null}">
							<li>
							<a href="${pageContext.request.contextPath }/lecture/printLectures">수강신청 <span
									class="icon sale15">15만원 할인</span>
							</a>
							</li>
							</c:if>
							<c:if test="${memberid==null}">
							<li>
							<a href="${pageContext.request.contextPath}/login/login">수강신청 <span
									class="icon sale15">15만원 할인</span>
							</a>
							</li>
							</c:if>
							
							<c:if test="${memberid!=null}">
							<li>
							<a href="${pageContext.request.contextPath}/list/notice?boardid=1">토익게시판</a>
							</li>
							</c:if>
							
							<c:if test="${memberid==null}">
							<li>
							<a href="${pageContext.request.contextPath}/login/login">토익게시판</a>
							</li>
							</c:if>
							
							<li><a href="${pageContext.request.contextPath }/test/start">MiniTest</a></li>
						</ul>
					</div>
				</div>
				<!-- //responsive_wrap -->
			</div>
			<!-- //area_gnb -->
		</div>
		<!-- //section_header -->
	</div>
	<!-- // wrap -->
</body>

</html>
			