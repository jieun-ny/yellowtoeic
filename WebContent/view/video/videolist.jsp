<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!-- saved from url=(0059)https://www.hackers.ac/site/?st=lecture&idx=201&loc=2&no=12 -->
<html xmlns="http://www.w3.org/1999/xhtml"><head><meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
            <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    
    <meta name="robots" content="ALL">

    <!-- 메인 페이지 -->
        <meta name="naver-site-verification" content="085fb620bad71331ab789db36623253ef8c4e135">
        <meta name="google-site-verification" content="VxIdFE6jkOf5AoFi91jFgqLCNhmWTWX0hXtZKrJKu_c">
        <meta name="google-site-verification" content="A2Hvw8jTHYOCkOgWiLmSss5h5t2pPINNjuqy4t9d0f8">
        <meta name="google-site-verification" content="JEKUxfE55OKSIp-CHjlde9gUF2JKg8f-PqRKvAvOae8"><!-- 해커스 톡 -->

        <!-- 강의리스트 -->
                    <meta name="description" content="">
            <meta name="keywords" content="강남토익학원, 종로토익학원, 대구토익학원">
            <title> :: 외국어학원 1위 해커스</title>
            <meta property="og:type" content="website">
            <meta property="og:title" content=" :: 외국어학원 1위 해커스">
            <meta property="og:description" content="">
            <meta property="og:image" content="//image.hackers.ac/images/hackersac_new.jpg" alt="1위 해커스어학원">
            <meta property="og:url" content="http://www.hackers.ac/site/?st=lecture&amp;idx=201&amp;loc=2&amp;no=12">
            <link rel="canonical" href="http://www.hackers.ac/site/?st=lecture&amp;idx=201&amp;loc=2&amp;no=12">

            <!-- 등록문의 게시판 -->
        
    
    <!-- test code -->
    <meta name="NaverBot" content="All">
    <meta name="NaverBot" content="index,follow">
    <meta name="Yeti" content="All">
    <meta name="Yeti" content="index,follow">

    <!-- 공통 CSS -->
    <link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/hackers_files/family_site_new.css">
    <link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/hackers_files/default_201805.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/hackers_files/main_re.css" type="text/css"> <!--메인 신규 css   2019-09-09-->

    <!-- 공통 플러그인 -->

        <link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/hackers_files/lecture_new_201805.css">

    <link rel="alternate" media="only screen and (max-width: 640px)" href="<%=request.getContextPath()%>/dev/lecture/main.php?loc=2&amp;no=12">
   <%-- ${sessionScope.member_id="huro"}--%>
</head>
<body data-gr-c-s-loaded="true">


<style>
    #layer_warp {height:0px;position:relative;z-index:99999;margin-left:248px;}
    .layer_banner_image_container {text-align:center;}
    .layer_banner_image_container img{}
    .layer_banner_image_container .chk_wrap{width:100%; background-color: #0a0a0a; overflow: hidden; }
    .layer_banner_image_container .chk_wrap div{color:#fff;}
    .layer_banner_image_container .chk_wrap .today_chk{}
    .layer_banner_image_container .chk_wrap .week_chk{}

    .layer_banner_html_container {text-align:center;}
    .layer_banner_html_container .chk_wrap{width:100%; background-color: #0a0a0a; overflow: hidden; }
</style>
<div class="layer_warp" id="layer_warp">

</div>

<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/hackers_files/lecture_renew.css">
<style>
    .container{width:100%;}
    .contents{width:1000px;margin:0 auto;}
</style>

<style>
    .dc_area{font-weight:bold;}
    .dc_lec > strong{color:#9a9a9a;}
    .area_bg{width:106px;height:104px;border-radius:50%;background-color:rgba(230,230,230,0.5);position:absolute;left:50%;margin-left:-53px;top:0;}
</style>


<div class="container hacademia">
    <div class="contents">

        <div class="test1" style="width:1000px;height:100%;position:absolute;left:-1000px;top:0;">
            <!--임시로 여백 누르면 멈추는거 막기-->
        </div>
        <div class="test1" style="width:1000px;height:100%;position:absolute;top:0;right:-1000px;">
        </div>
        <div class="bn_l2"></div>

        <h2 class="title">
		<span class="f-left">
			  <strong>${sessionScope.memberid}님의 강의 </strong>구매하신 강의를 볼 수 있는 공간입니다.
		</span>
        </h2>
        
        <a href="/site/?st=customer&amp;idx=503" style="position:absolute;top:50px;right:0;" target="_blank"><img src="<%=request.getContextPath()%>/hackers_files/btn_complain.png" alt="불편사항"></a>

        <!--검색영역-->
        <div class="search_wrap">
            <div class="search_top">
                <h3>수강 중 인 강의</h3>


        <style>
          .china_level_pop {
            width: 900px;
            position: absolute;
            left: 50%;
            top: 150px;
            margin-left: -450px;
            z-index: 9999;
            display: none;
          }
        </style>
        <style>
          .pop_slide_box {
            display: none;
            position: absolute;
            top: 35px;
            left: 160px;
            width: 668px;
            z-index: 100000;
          }

          .pop_slide_box .btn_pop_close {
            position: absolute;
            top: -33px;
            right: 0;
          }

          .pop_slide_box .tab_btn {
            overflow: hidden;
          }

          .pop_slide_box .tab_btn li {
            float: left;
            width: 334px;
            height: 80px;
          }

          .pop_slide_box .tab_btn li a {
            display: block;
            width: 334px;
            height: 80px;
            line-height: 80px;
            text-align: center;
            color: #c1c2c4;
            background: #f1f1f2;
            font-size: 30px;
            font-weight: bold;
          }

          .pop_slide_box .tab_btn li a.bt1:hover, .pop_slide_box ul li.on a.bt1 {
            background: #f04f18;
            color: #fff;
          }

          .pop_slide_box .tab_btn li a.bt2:hover, .pop_slide_box ul li.on a.bt2 {
            background: #58c6d3;
            color: #fff;
          }

          .pop_slide_box .pop_tab_con {
          }

          .pop_slide_box .pop_tab_con > div {
            display: none;
          }

          .pop_slide_box .pop_tab_con .on {
            display: block;
          }

          .pop_slide_box .pop_tab_con .bxslider {
            width: 668px;
            height: 974px;
            overflow: hidden;
          }

          .pop_slide_box .sd1 .bx-controls-direction a {
            display: block;
            width: 47px;
            height: 92px;
            background-image: url(//image.hackers.ac/images/lecture/pop_tab_slide/btn_toeic_arrow.png);
          }

          .pop_slide_box .sd2 .bx-controls-direction a {
            display: block;
            width: 47px;
            height: 92px;
            background-image: url(//image.hackers.ac/images/lecture/pop_tab_slide/btn_opic_arrow.png);
          }

          .pop_slide_box .bx-controls-direction a {
            position: absolute;
            top: 50%;
            margin-top: -46px;
            font-size: 0;
            text-indent: -9999em;
          }

          .pop_slide_box .bx-controls-direction a.bx-prev {
            left: -47px;
            background-position: left top;
          }

          .pop_slide_box .bx-controls-direction a.bx-next {
            right: -47px;
            background-position: right top;
          }

          .pop_slide_box .bx-controls-direction a:hover {
            background-position-y: bottom;
          }
        </style>



        <style>
          .eng_level_pop {
            width: 900px;
            height:900px;
            position: absolute;
            left: 50%;
            top: 150px;
            margin-left: -450px;
            z-index: 999999;
            display: none;
            background-color: #fff;
            border: 1px solid #000;
          }

          .eng_pop_cl{position:absolute;right:0;}
        </style>


        <style>
                        .Placement_pop_wrap {
                            display: none;
                        }

                        .Placement_pop {
                            position: fixed;
                            top: 18px;
                            left: 50%;
                            margin-left: -325px;
                            z-index: 1000000;
                        }

                        .Placement_pop_bg {
                            position: fixed;
                            top: 0;
                            left: 0;
                            background-color: #000;
                            opacity: 0.8;
                            width: 100%;
                            height: 100%;
                            z-index: 100000;
                        }
                    </style>
        </div>

            <!-- 검색영역(길재우) -->
<%--              <div class="my_lecture_wrap">
                <form id="searchform" name="searchform" action="<%=request.getContextPath()%>/lecture/printLectures" method="post">
                    <table class="my_lecture" cellpadding="5" cellspacing="0" border="1" align="center" style="border-collapse:collapse; border:1px gray solid;">
                        <colgroup>
                            <col width="15%">
                            <col width="85%">
                        </colgroup>
                        <tbody>
                            <tr>
                                <th>과목</th>
                                <td class="my_lecture_right" id="slslsl">
                                    <label style="background: rgb(243, 243, 243); color: rgb(51, 51, 51); border: 1px solid rgb(204, 204, 204);">
                                    <input type="checkbox" name="subject_name" value="toefl" onclick="style=color:red;">토플</label>
                                    <label style="background: rgb(243, 243, 243); color: rgb(51, 51, 51); border: 1px solid rgb(204, 204, 204);">
                                    <input type="checkbox" name="subject_name" value="toeic" onclick="style=color:red;">토익</label>
                                </td>
                            </tr>
                            <tr>
                                <th>수업종류</th>
                                <td class="my_lecture_right">
                                    <label style="background: rgb(243, 243, 243); color: rgb(51, 51, 51); border: 1px solid rgb(204, 204, 204);">
                                    <input type="checkbox" name="lectureKind" value="All" onclick="getLectureList()">종합반</label>
                                    <label style="background: rgb(243, 243, 243); color: rgb(51, 51, 51); border: 1px solid rgb(204, 204, 204);">
                                    <input type="checkbox" name="lectureKind" value="LC" onclick="getLectureList()">LC</label>
                                    <label style="background: rgb(243, 243, 243); color: rgb(51, 51, 51); border: 1px solid rgb(204, 204, 204);">
                                    <input type="checkbox" name="lectureKind" value="RC" onclick="getLectureList()">RC</label>
                                </td>
                            </tr>
                            <tr>
                            <th>강의명</th>
                            <td class="my_lecture_right lect_name">
                                <input type="text" name="member_id" id="member_id" value="" maxlength="40">
                                <button type="submit" style="background-color: white; "><img src="<%=request.getContextPath()%>/hackers_files/serch_con.png"></button>
                                <img class="loadings" src="<%=request.getContextPath()%>/hackers_files/loading_clock.gif" id="loadingimage" style="display: none;">

                            </td>
                        </tr>
                    </tbody></table>
                </form>
            </div>
        </div>  --%>
        <!--//검색영역-->

        <!-- 수강월 탭 -->
        <div>
            <ul class="day_lec">
                <li class="on day_tab1" style="background-color: lightslategray;"><strong>강의 리스트</strong></li></ul>
        </div>
        <!-- 수강월 탭 -->

        <!-- 강의 리스트 -->
        <div class="table-base" id="lectureList">
            <table border="0" cellspacing="0" cellpadding="0" class="china_go">
		<caption class="hide-text">강의 리스트</caption>
		<colgroup>
			<col width="135px">
			<col width="135px">
			<col width="103px">
			<col width="60px">
			<col width="103px">
			<col width="72px">
			<col width="55px">
		</colgroup>
		<thead>
		<tr>
			<th scope="col" >수강명</th>
			<th scope="col" >강의명</th>
			<th scope="col" ></th>
			<th scope="col" >선생님</th>
			<th scope="col"></th>
			<th scope="col">수강여부</th>
			<th scope="col" >강의보기</th>
		</tr>
		</thead>
		
		<tbody>
		
		<c:if test="${count==0 }">
		 <tr style="border:1px solid #ddd;">
            <th rowspan="1">${subject_name }	</th>
            <td><p style="line-height: 25px;">강의가 없습니다.</p>
            </td>
            <td>
            </td>
            <td class="tr_name">
                    ${teacher}
            </td>
            <td>
            </td>
            <c:choose>
                <c:when test="${sessionScope.memberid == null}">
                    <td>
                        <a href="" class="btn_mdi b_r">수강미신청</a>
                    </td>
                </c:when>
                <c:otherwise>
                    <td>
                        <a href="" class="btn_mdi b_r">수강중</a>
                    </td>
                </c:otherwise>
            </c:choose>
            <td>
            </td>
        </tr>
        </tbody><tbody></tbody></table>
	<!-- Pagination -->
		<c:if test="${startPage>bottomLine }">
		<a href="list.jsp?pageNum=${startPage - bottomLine}">[이전]</a>
		</c:if>
		<c:forEach var="i" begin="${startPage }" end="${endPage }">
		<a href="list.jsp?pageNum=${i }"> ${i }</a>
		</c:forEach>
		<c:if test="${endPage < pageCount}">
		<a href="list.jsp?pageNum=${startPage + bottomLing}">[다음]</a>
		</c:if>
		</c:if>
		
		<c:if test="${count!=0 }">
<!--ForEach-->
    <c:forEach var="article" items="${li }" varStatus="i">
        <tr style="border:1px solid #ddd;">
        
            <th rowspan="1">${article.subject_name }	</th>
            
            <td><p style="line-height: 18px;">${article.class_name }</p>
            </td>
            
            <td>
            
            </td>
            
            <td class="tr_name">
                    ${article.teacher}
            </td>
            
            <td>
            </td>
            
            <c:choose>
                <c:when test="${sessionScope.memberid == null}">
                    <td>
                        <a href="" class="btn_mdi b_r">수강미신청</a>
                    </td>
                </c:when>
                <c:otherwise>
                    <td>
                        <a href="" class="btn_mdi b_r">수강중</a>
                    </td>
                </c:otherwise>
            </c:choose>
            
            <td><input type="button" value="재생" 
			onclick=window.open("${pageContext.request.contextPath}/videocon/content?num=${article.num}&student_id=${sessionScope.memberid}&count=0",'player','width=1000,height=600')>
            </td>
            
        </tr>
    </c:forEach>
    
	</tbody><tbody></tbody></table>
	<!-- Pagination -->
		<c:if test="${startPage>bottomLine }">
		<a href="list.jsp?pageNum=${startPage - bottomLine}">[이전]</a>
		</c:if>
		<c:forEach var="i" begin="${startPage }" end="${endPage }">
		<a href="list.jsp?pageNum=${i }"> ${i }</a>
		</c:forEach>
		<c:if test="${endPage < pageCount}">
		<a href="list.jsp?pageNum=${startPage + bottomLing}">[다음]</a>
		</c:if></c:if>
	
        </div>
    </div><!-- end contents -->
</div>
		
</div>
</body>
</html>