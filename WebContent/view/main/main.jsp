<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xml:lang="ko" lang="ko" xmlns="http://www.w3.org/1999/xhtml">
<head>
<script type="text/javascript">	
	window.jQuery || document.write('<scr'+'ipt type="text/JavaScript" src="/common/js/jquery/jquery-1.7.2.min.js"><\/scr'+'ipt>');
</script>
<script type="text/JavaScript" src="${pageContext.request.contextPath }/eduwill_7_files/jquery-1.7.2.min.js.다운로드"></script>
<!-- //<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script> -->
<title>키키키토익</title>
	<link rel="canonical" href="http://seven.eduwill.net/" />
	<link rel="Bookmark Icon" href="http://seven.eduwill.net/favicon.ico" />
	<link rel="icon" href="http://seven.eduwill.net/favicon.ico" type="image/x-icon" />
	<link rel="shortcut icon" href="http://seven.eduwill.net/favicon.ico" type="image/x-icon"/>
</head>
<body class="page_main bg_gnbSub" data-gr-c-s-loaded="true">
	<div style="display: none;"></div>
	<script type="text/javascript" src="${pageContext.request.contextPath }/eduwill_7_files/jquery.marquee.js.다운로드"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/eduwill_7_files/jquery.bxslider.min2.js.다운로드"></script>
	<link rel="stylesheet" href="${pageContext.request.contextPath }/eduwill_7_files/eduwill.eco-2.0.0.css" type="text/css"/>
	<link rel="stylesheet" href="${pageContext.request.contextPath }/eduwill_7_files/jquery.bxslider.css"/>
	<!-- bxSlider CSS file -->
	<link rel="stylesheet" href="${pageContext.request.contextPath }/eduwill_7_files/main2017.css"/>
	<!-- 180122 renewal -->
	<div id="wrap">
	<!-- wrap -->
	<link rel="stylesheet" href="${pageContext.request.contextPath }/eduwill_7_files/util.css"/>
	<link rel="stylesheet" href="${pageContext.request.contextPath }/eduwill_7_files/gnb.css"/>
	<link rel="stylesheet" href="${pageContext.request.contextPath }/eduwill_7_files/gnb_alarm.css"/>
	<!-- //section_header --> <!--  //section main -->
	
	<div id="container">
	<!-- CSS -->
	<style type="text/css">
		.ban_roll .bx-wrapper .bx-viewport {
			left: 0;
			height: 350px !important;
			border: none;
			background: none;
			-webkit-box-shadow: none;
			box-shadow: none;
		}
		
		.bx-wrapper {
			margin: 0 auto !important;
		}
		
		.bx-wrapper img {
			display: inline;
		}
		
		/* bxSlider Controler */
		.ban_roll .bx-wrapper .bx-controls-direction a {
			background-image: url('/Img2/Gov2/main/renewal/banner/nav_controls.png');
			background-repeat: no-repeat;
		}
		
		.ban_roll .bx-wrapper .bx-prev {
			left: 50%;
			margin-left: -562px;
		}
		
		.ban_roll .bx-wrapper .bx-next {
			right: 50%;
			margin-right: -562px;
		}
		
		.ban_roll .bx-wrapper .bx-prev, .ban_roll .bx-wrapper .bx-prev:hover {
			background-position: 0 0;
		}
		
		.ban_roll .bx-wrapper .bx-next, .ban_roll .bx-wrapper .bx-next:hover {
			background-position: -100px 0;
		}
		
		.ban_roll .bx-wrapper .bx-controls-direction a {
			position: absolute;
			top: 149px;
			outline: 0;
			width: 54px;
			height: 103px;
			text-indent: -9999px;
			z-index: 9999;
		}
		
		/* bxSlider indicator */
		.ban_roll .bx-wrapper .bx-pager {
			position: absolute;
			top: 0px;
			bottom: auto;
			left: 50%;
			width: 1009px;
			height: auto;
			margin: 0 0 0 -504.5px;
			padding: 0;
			text-align: right;
			z-index: 99;
			font-size: 0;
		}
		
		.ban_roll .bx-wrapper .bx-pager .bx-pager-item {
			margin-left: 10px;
		}
		
		.ban_roll .bx-wrapper .bx-pager .bx-pager-item:first-child {
			margin-left: 0;
		}
		
		.ban_roll .bx-wrapper .bx-pager.bx-default-pager a {
			display: inline-block;
			width: 14px;
			height: 14px;
			margin: 0;
			border-radius: 50%;
			background-color: #fff;
			opacity: .5;
		}
		
		.ban_roll .bx-wrapper .bx-pager.bx-default-pager a.active {
			background-color: #fff;
			opacity: 1;
		}
		
		/* bxSlider Slide */
		.ban_roll {
			position: relative;
			width: 100%;
			height: 350px;
			overflow: hidden;
		}
		
		.ban_roll .b_roll {
			position: relative;
			height: 350px;
			background-repeat: no-repeat;
			background-position: center top;
		}
		
		.ban_roll .b_ezone, .ban_roll .b_ezone a {
			display: block;
			position: absolute;
			top: 0;
			z-index: 1;
			width: 1009px;
			height: 350px;
		}
		
		.ban_roll .b_ezone {
			left: 50%;
			margin: 0 0 0 -506px;
		}
		
		.ban_roll .b_ezone a {
			left: 0;
		}
		
		.ban_roll .wings {
			position: absolute;
			top: 0;
			z-index: -1;
			width: 50%;
			height: 100%;
		}
		
		.ban_roll .wings.left {
			left: 0;
		}
		
		.ban_roll .wings.right {
			left: 50%;
		}
	</style>
	<!-- JS -->
	<script type="text/javascript">
		// bxSlider
		$(document).ready(function() {
			// 메인 슬라이드 배너
			$('#slideBanner').bxSlider({
				mode : 'horizontal',
				useCSS : false,
				auto : true,
				pause : 3000,
				pager : ($("#slideBanner li").length < 2) ? false : true,
				controls : true,
				onSliderLoad : function() {
				}
			});
	});
	</script>
	<style>
		.b_roll_190328 {
			text-align: center;
			
		}
		.b_roll.b_roll_winners {
			position: relative;
			text-align: center;
			
		}
	</style>
	<div class="ban_roll ban_type_a progress_7">
		<div class="bx-wrapper" style="max-width: 100%;">
			<div class="bx-viewport" style="width: 100%; overflow: hidden; position: relative; height: 350px;">
				<ul id="slideBanner" class="bxslider" style="width: 415%; position: relative; left: -3806px;">
					<li class="b_roll b_roll_winners bx-clone" style="float: left; list-style: none; position: relative; width: 1903px;">
						<div class="wrap">
							<span class="b_ezone"> 
							<a class="b_ezone01"> 
								<img src="${pageContext.request.contextPath }/photo/big1.jpg"></a>
							</span>
						</div>
					</li>
					<li class="b_roll b_roll_190328" style="float: left; list-style: none; position: relative; width: 1903px;">
						<div class="wrap">
							<span class="b_ezone"> 
							<a class="b_ezone01"> 
								<img src="${pageContext.request.contextPath }/photo/big2.png"></a>
							</span>
						</div>
					</li>
					<li class="b_roll b_roll_winners"
						style="float: left; list-style: none; position: relative; width: 1903px;">
						<div class="wrap">
							<span class="b_ezone"> <a
								href="https://event.eduwill.net/Event/2019/7/Gov_VictoryStory"
								class="b_ezone01"> <img
									src="${pageContext.request.contextPath }/eduwill_7_files/slide_winner01_200122.png"
									alt="올해도 계속되는 합격신화"></a>
							</span>
						</div>
					</li>
					<li class="b_roll b_roll_190328 bx-clone"
						style="float: left; list-style: none; position: relative; width: 1903px;">
						<div class="wrap">
							<span class="b_ezone"> <a
								href="http://seven.eduwill.net/7even/promotion/freebook/190325/index.asp"
								class="b_ezone01"> <img
									src="${pageContext.request.contextPath }/eduwill_7_files/slide_freebook_190328.jpg"
									alt="처음시작하는 7급 합격교과서 무료배포"></a>
							</span>
						</div>
					</li>
				</ul>
			</div>
			<div class="bx-controls bx-has-pager bx-has-controls-direction">
				<div class="bx-pager bx-default-pager">
					<div class="bx-pager-item">
						<a data-slide-index="0" class="bx-pager-link">1</a>
					</div>
					<div class="bx-pager-item">
						<a data-slide-index="1" class="bx-pager-link active">2</a>
					</div>
				</div>
				<div class="bx-controls-direction">
					<a class="bx-prev"
						href="http://seven.eduwill.net/7even/Main.asp?_ga=2.211721943.319011711.1581906459-1577196335.1581906459&amp;_gac=1.53509466.1581906553.Cj0KCQiA7aPyBRChARIsAJfWCgLO5NqyF6QWtrnSZxKK1XB8PBcM0d6-G5oVvklZwv5D9Ci-n6r5p-AaAsHTEALw_wcB">Prev</a>
					<a class="bx-next"
						href="http://seven.eduwill.net/7even/Main.asp?_ga=2.211721943.319011711.1581906459-1577196335.1581906459&amp;_gac=1.53509466.1581906553.Cj0KCQiA7aPyBRChARIsAJfWCgLO5NqyF6QWtrnSZxKK1XB8PBcM0d6-G5oVvklZwv5D9Ci-n6r5p-AaAsHTEALw_wcB">Next</a>
				</div>
			</div>
		</div>
	</div>
	<div class="main_section" id="divBanner">
		<!-- main_section -->
	
		<style>
			.main_content img{
				height:300px;
				border: 0.5px solid gray;
			}
		</style>
		
		<div id="divCenter1">
			<div class="main_content">
				<a href="${pageContext.request.contextPath }/lecture/printLectures"><img src="${pageContext.request.contextPath }/photo/middle.JPG" ></img></a>
				<a href="${pageContext.request.contextPath }/lecture/printLectures"><img src="${pageContext.request.contextPath }/photo/middle2.JPG" style="margin-left : 30px;"></img></a>
				<a href="${pageContext.request.contextPath }/lecture/printLectures"><img src="${pageContext.request.contextPath }/photo/middle3.JPG" style="margin-left : 30px;"></img></a>
				<a href="${pageContext.request.contextPath }/lecture/printLectures"><img src="${pageContext.request.contextPath }/photo/middle4.JPG" style="margin-left : 30px;"></img></a>
			</div>
		</div>
								
								
<script type="text/javascript">
    //롤링배너 만들기
    function fnc_rollingBannerEntry() {
        $('ul[name="rollingArea"]').each(function (i) {
            var durSec = $(this).attr("durSec");
            var bannerType = $(this).attr("bannerType");
            var direction = $(this).attr("direction");
            var slideWidth = $(this).find("img").css("width");
            var sliderID = $(this).attr("id");
            var autoRolling = $(this).attr("autoRolling") == "true";
            var slider = $(this).data(sliderID);
            if (slider != null && slider != undefined) {
                slider.destroySlider();
            }

            if (bannerType == "normal") {
                slider = $(this).bxSlider({
                    mode: direction,
                    auto: autoRolling,
                    pager: false,
                    controls: true,
                    pause: parseInt(durSec) * 1000,
                    slideWidth: slideWidth,
                    onSliderLoad: function () {
                        var margin = ((parseInt(slideWidth) / 2) - 10) * -1
                        $("#" + sliderID).parents('li').find("a.bx-prev").css("margin-left", margin);
                        $("#" + sliderID).parents('li').find("a.bx-next").css("margin-right", margin);
                    }
                });
            } else {
                slider = $(this).bxSlider({
                    mode: direction,
                    auto: autoRolling,
                    pager: false,
                    controls: true,
                    pause: parseInt(durSec) * 1000,
                    slideWidth: slideWidth,
                    prevSelector: '#',
                    nextSelector: '#',
                    nextText: '',
                    prevText: '',
                    onSliderLoad: function () {
                    }
                });
            }

            $(this).data(sliderID, slider);
        });
    }

    $(document).ready(function () {
        //롤링배너 타이머 진입점
        fnc_rollingBannerEntry();

        //탭형식 롤링배너 이미지맵 클릭시 
        $('#bannerList1 map area').live("click", function () {
            var link = $(this).attr("href");
            if (link == "#") {
                var slideNum = $(this).attr("slideNum");
                var sliderID = $(this).closest("li").find("ul").attr("id");
                var slider = $(this).closest("li").find("ul").data(sliderID);
                if (slider != null && slider != undefined) {
                    slider.goToSlide(slideNum);
                    slider.stopAuto();
                }
                return false;
            }
            return true;
        });

        //탭형식 롤링배너 링크 적용
        $('ul[name="rollingArea"] a').live("click", function () {
            var href = $(this).attr("href");
            var target = $(this).attr("target");
            if (target != undefined && target != "_self") {
                window.open(href);
            } else {
                location.href = href;
            }
        });
    });
</script>
		<div data-idx="1987" data-progress="7" data-academy="" data-loc="Main" class="autoPopupFromNgene"></div>

		<iframe name="hiddenFrame"	style="width: 0px; height: 0px; border: 0px; display: none;"
			src="./eduwill_7_files/saved_resource(4).html"></iframe>
		<!-- // 365일 무료 빠른 상담 -->
	</div>

	<div class="main_section">
		<!-- main_section -->
		<div class="container grid customer_section02">
			<!-- customer_section02 -->
			<div class="col cs_box">
				<!-- cs_box -->
				<div class="holder">
					<h4 class="title">
						<span>고객센터</span>
					</h4>
					<p class="desc">에듀윌 고객센터는 365일 여러분과 함께 합니다.</p>
					<p class="tel">
						<img
							src="${pageContext.request.contextPath }/eduwill_7_files/customer_tel.png"
							alt="고객센터 전화번호는 1600-6700입니다.">
					</p>

				</div>
			</div>
			<!-- // cs_box -->
			<div class="col section_app">
				<!-- section_app -->
				<h4 class="title">서비스</h4>
				<ul class="list_app">
					<li class="item success"><a
						href="http://www.eduwill.net/common/promotion/mobile_dokhan/index.asp"
						 class="noto"> <em>평가&amp;리뷰</em> <span>수강후기</span>
					</a></li>
					<li class="item ddakpul"><a
						href="${pageContext.request.contextPath}/list/notice?boardid=1"
						 class="noto"> <em>최신 후기를 한 눈에!</em> <span>시험후기</span>
					</a></li>
				</ul>
			</div>
			<!-- // section_app -->
		</div>
		<!-- // customer_section02 -->
	</div>
	<!-- // main_section -->


	<div class="full_menu">
		<!-- full_menu -->
		<style type="text/css">
/* Full Menu */
.auto_full_menu {
	position: relative;
	width: 1022px;
	margin: 0 auto;
}

.auto_full_menu ul {
	width: 100%;
	*zoom: 1;
}

.auto_full_menu ul:before, .auto_full_menu ul:after {
	content: '';
	display: table;
}

.auto_full_menu ul:after {
	clear: both;
}

.auto_full_menu li {
	float: left;
	vertical-align: top;
}

.auto_full_menu .ct_item7 li {
	width: 13.8%;
	width: calc(100%/ 7 - 1px);
}

.auto_full_menu .ct_item6 li {
	width: 16%;
	width: calc(100%/ 6 - 1px);
}

.auto_full_menu .ct_item5 li {
	width: 19.4%;
	width: calc(100%/ 5);
}

.auto_full_menu .ct_item4 li {
	width: 24.2%;
	width: calc(100%/ 4);
}

.auto_full_menu .ct_item3 li {
	width: 32.5%;
	width: calc(100%/ 3);
}

.auto_full_menu dl {
	text-align: left;
}

.auto_full_menu dt {
	height: 17px;
	line-height: 17px;
	margin: 0 0 17px 0;
	font-size: 14px;
	font-weight: bold;
}

.auto_full_menu dd {
	height: 24px;
	line-height: 24px;
	font-weight: bold;
	letter-spacing: -1px;
}

.auto_full_menu dd a {
	font-weight: normal;
}

.auto_full_menu span.item_sub {
	display: block;
}
</style>

								<div class="auto_full_menu">
									<ul class="ct_item5">
										<li>
											<dl>
												<dt>
													<a
														href="http://seven.eduwill.net/7even/Product/Product_index_new.asp"
														target="_self">수강신청</a>
												</dt>
												<dd>
													<a
														href="http://seven.eduwill.net/Common/Product/goods/auto/index.asp?masterSeq=NTk4"
														target="_self">평생패스</a>
												</dd>
												<dd>
													<a
														href="http://seven.eduwill.net/Common/Product/goods/auto/index.asp?masterSeq=NTk4"
														target="_self">연간패스</a>
												</dd>
												<dd>
													<a
														href="http://seven.eduwill.net/Common/Product/goods/auto/index.asp?masterSeq=MTU3MA=="
														target="_self">공통과목대비반</a>
												</dd>
												<dd>
													<a
														href="http://seven.eduwill.net/7even/product/event/event_160822.asp"
														target="_self">TOEIC 대비반</a>
												</dd>
											</dl>
										</li>
										<li>
											<dl>
												<dt>
													<a
														href="http://seven.eduwill.net/Common/promotion/examGuide7even/index.asp"
														target="_self">수험정보</a>
												</dt>
												<dd>
													<a href="https://govlab.eduwill.net/schedule/summary"
														target="_self">시험 일정</a>
												</dd>
											</dl>
										</li>
										<li>
											<dl>
												<dt>
													<a href="http://seven.eduwill.net/7even/Pds/Pds_index.asp"
														target="_self">학습자료실</a>
												</dt>
												<dd>
													<a
														href="https://seven.eduwill.net/7even/Pds/SpecialLecture/index.asp"
														target="_self">최신기출문제</a>
												</dd>
												<dd>
													<a
														href="https://event.eduwill.net/Lecture/2019/7/Lecture1st"
														target="_self">무료특강</a>
												</dd>
												<dd>
													<a
														href="http://seven.eduwill.net/7even/Pds/Step/Step_Main.asp?Div=C"
														target="_self">모의고사 다운로드</a>
												</dd>
												<dd>
													<a
														href="http://gov.eduwill.net/Gov2/promotion/victoryStory/index.asp"
														target="_self"><b>합격수기</b></a>
												</dd>
											</dl>
										</li>
										<li>
											<dl>
												<dt>
													<a href="http://cs.eduwill.net/" target="_blank">고객센터</a>
												</dt>
												<dd>
													<a href="http://cs.eduwill.net/counsel/index.will"
														target="_blank">고객상담</a>
												</dd>
												<dd>
													<a href="http://cs.eduwill.net/faq/index.will"
														target="_blank">자주묻는 질문</a>
												</dd>
												<dd>
													<a href="http://cs.eduwill.net/support/pcIndex.will"
														target="_blank">PC 수강 안내</a>
												</dd>
												<dd>
													<a href="http://cs.eduwill.net/opinion/voice.will"
														target="_blank">고객의 의견</a>
												</dd>
											</dl>
										</li>
									</ul>
								</div>
							</div>
							<!-- // full_menu -->
						</div>
					</div>
<script type="text/javascript">
	$(document).ready(function () {

		$('#tccSlider').bxSlider({
			mode: 'horizontal',
			auto: true,
			pause: 7000,
			controls: false,
			pagerCustom: '#pager_tcc'
		});

		// section_new bxslider
		var sliderArray = new Array();

		$('.new_slider').each(function (i) {
			sliderArray[i] = $(this).bxSlider({
				auto: true,
				pause: 7000,
				controls: false,
				pager: ($(this).children('li').length < 2) ? false : true
			});
		});

		$('.dday_slider').bxSlider({
			mode: 'vertical',
			auto: true,
			pause: 3000,
			pager: false,
			controls: false
		});

	});
$('#section_exam').hide();
</script>
					<!-- // wrap -->
					