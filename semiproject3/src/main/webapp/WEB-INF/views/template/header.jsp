<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">
<title>
	<c:choose>
		<c:when test="${param.title != null}">
			${param.title}
		</c:when>
		<c:otherwise>
			semi3조
		</c:otherwise>
	</c:choose>
</title>

<!-- 글꼴 cdn -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Serif+KR:wght@300&display=swap" rel="stylesheet">

<!-- 디자인 틀 -->
<link rel="stylesheet" type="text/css" href="/css/reset.css">
<link rel="stylesheet" type="text/css" href="/css/commons.css">
<link rel="stylesheet" type="text/css" href="/css/layout.css">

<!-- 틀 선 디자인할 때 주석 풀기 -->
<!-- <link rel="stylesheet" type="text/css" href="/css/test.css"> -->

<!-- 아이콘 cdn -->
<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"/>

<!-- lightpick 사용을 위한 CDN 추가 -->
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/lightpick@1.6.2/css/lightpick.css">
<script src="https://cdn.jsdelivr.net/npm/moment@2.29.4/moment.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/lightpick@1.6.2/lightpick.min.js"></script>

<!-- jQuery -->
<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"/>
<script src="http://code.jquery.com/jquery-3.6.1.js"></script>
<!-- 배포 시 min 버전으로 -->
<!-- <script src="http://code.jquery.com/jquery-3.6.1.min.js"></script> -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/lodash.js/4.17.21/lodash.min.js"></script>

<style>
	.input.find{
	    padding-left: 2em;
		background-image: url("/image/search.webp");
	    background-size: 1em;
	    background-repeat: no-repeat;
	    background-position-x: 0.5em;
	    background-position-y: center;
	}
	
	li.cart{
		width: 50px;
		padding-right: 20px;
	}
	.ad{
		background-color: black;
		text-align: center;
		color: white;
		padding: 0.5em;
		margin: 0;
	}
	.delete{
		cursor: pointer;
	}
	a img{
		vertical-align: middle;
		height: 1em;
	}
	.required{
		color: darkred;
	}
	
	/* 설문조사 */
	.fullscreen > .modal.survey{
		background-image: url("/image/survey.png");
	    background-size: 100%;
	    background-repeat: no-repeat;
	}
	
	/* 로그인 토글 디자인 */
	.user{
		padding: 0.75em;
		border: 1px solid #D5D5D5;
		border-bottom: none;
		cursor: pointer;
	}
	.user.unchecked{
		color: white;
		background-color: lightgray;
	}
</style>
<script>
	$(function(){
		$(".survey").find(".delete").click(function(){
			$(".fullscreen").removeClass("fullscreen");
			$(".survey").children().addClass("hide");
		});
		
		$(".ad").find(".delete").click(function(){
			$(this).parent().slideUp();
		});
		
		// datepicker 할 때 필요한 기능 - 안 바꿀거면 지워도 됨
		var picker1 = new Lightpick({
            // field : datepicker 적용 대상을 설정하는 공간
            field:document.querySelector(".single-date-picker"),
            // format : 선택한 날짜의 적용 형식 설정
            format: "YYYY-MM-DD",
            // (옵션) 미래/과거를 선택하지 못 하도록 설정(minDate, maxDate)
            maxDate: moment()
		});
	});
	
	/* 프로그레스바 */
	$(function(){
        //1. 첫번째 이전버튼과 마지막 다음버튼을 삭제
        $(".prev").first().remove();
        $(".next").last().remove();

        //2. 1페이지만 남기고 다 숨김 처리
        $(".page").hide();
        $(".page").first().show();

        //3. 페이지당 늘어나야 할 % 계산
        var step = 100 / $(".page").length;
        var percent = step;
        $(".progressbar > .inner").css("width", percent+"%");

        //4. 남은 버튼에 클릭 이벤트를 설정
        //- 다음 버튼을 누르면 해당 페이지의 뒷 페이지 표시 및 나머지 숨김
        //- 이전 버튼을 누르면 해당 페이지의 앞 페이지 표시 및 나머지 숨김
        $(".next").click(function(){
            //this == 클릭한 다음 버튼
            //var target = $(this).parent().parent().parent().next();
            var target = $(this).parents(".page").next();

            //모든 페이지 숨기고 target만 표시
            $(".page").hide();
            target.show();

            //% 증가
            percent += step;
            $(".progressbar > .inner").css("width", percent+"%");
        });
        $(".prev").click(function(){
            var target = $(this).parents(".page").prev();
            $(".page").hide();
            target.show();

            //% 감소
            percent -= step;
            $(".progressbar > .inner").css("width", percent+"%");
        });
	});
	
	/* 로그인 페이지 토글 */
	$(function(){
		$(".user-admin").click(function(){
			$(this).removeClass("unchecked");
			$(this).prev("div").addClass("unchecked");
			$(".customer-join").addClass("hide");
		});
		$(".user-customer").click(function(){
			$(this).removeClass("unchecked");
			$(this).next("div").addClass("unchecked");
			$(".customer-join").removeClass("hide");
		});
	});
</script>

</head>

<body>

<header>
<!-- 
	광고 구현 중
	1. 구글플레이 이미지 중간 맞춤
	2. 새로고침 할 때마다 나옴
	3. 관리자 페이지 들어가면 없애야 할 듯
 -->
<div class="float-container ad">
	"쇼핑몰명 앱" 설치 시 <span style="color:orange;">쿠폰팩 증정!</span> 지금 바로 앱스토어에서 다운 받기
	<a href="https://play.google.com/store/games?utm_source=apac_med&utm_medium=hasem&utm_content=Oct0121&utm_campaign=Evergreen&pcampaignid=MKT-EDR-apac-kr-1003227-med-hasem-py-Evergreen-Oct0121-Text_Search_BKWS-BKWS%7CONSEM_kwid_43700058439438694_creativeid_477136209358_device_c&gclid=Cj0KCQjwnbmaBhD-ARIsAGTPcfVKNmc0jEnLgOhSuzblsyh0eJfXILaAubbz457HBJSfKVSPzXMuzCYaAkcaEALw_wcB&gclsrc=aw.ds">
		<img src="/image/googleplay.png">
	</a>
	<span class="float-right delete" style="font-family:sans-serif;">X</span>
</div>

<div class="row">
	<h2 class="logo">
		<a href="/">Logo</a>
	</h2>
</div>
</header>

<!-- 드롭다운 메뉴 -->
<nav>
<div class="float-container">
<ul class="dropdown-menu">
	<!-- 좌측 드롭다운 메뉴 -->
	<li class="float-left"><a href="#">BEST</a></li>
	<li class="float-left"><a href="#">New 5%</a></li>
	<li class="float-left">
		<a href="#">outer</a>
		<ul>
			<li><a href="#">자켓</a></li>
			<li><a href="#">코트</a></li>
			<li><a href="#">가디건</a></li>
			<li><a href="#">패딩</a></li>
		</ul>
	</li>
	<li class="float-left">
		<a href="#">top</a>
		<ul>
			<li><a href="#">민소매</a></li>
			<li><a href="#">티셔츠</a></li>
			<li><a href="#">맨투맨</a></li>
			<li><a href="#">니트</a></li>
			<li><a href="#">블라우스</a></li>
		</ul>
	</li>
	<li class="float-left">
		<a href="#">pants</a>
		<ul>
			<li><a href="#">청바지</a></li>
			<li><a href="#">면바지</a></li>
			<li><a href="#">슬랙스</a></li>
		</ul>
	</li>
	<li class="float-left">
		<a href="#">skirt</a>
		<ul>
			<li><a href="#">숏치마</a></li>
			<li><a href="#">롱치마</a></li>
		</ul>
	</li>
	<li class="float-left"><a href="#">dress</a></li>
	<li class="float-left">
		<a href="#">acc</a>
		<ul>
			<li><a href="#">쥬얼리</a></li>
			<li><a href="#">모자</a></li>
			<li><a href="#">가방</a></li>
			<li><a href="#">신발</a></li>
			<li><a href="#">양말</a></li>
		</ul>
	</li>
	<!-- 우측 드롭다운 메뉴 : 순서 반대로 구현 -->
	<li class="float-right cart"><a href="#"><i class="fa-solid fa-cart-shopping"></i></a></li>
	<form action="#" method="get">
		<button class="float-right btn btn-neutral" type="submit">search</button>
		<input class="float-right input input-underline find" name="#" id="search" placeholder="가을 신상">
	</form>
		<li class="float-right"><a href="#">MYPAGE</a></li>
	<c:choose>
		<c:when test="${loginId == null}">
			<li class="float-right"><a href="/customer/login">LOGIN</a></li>
			<li class="float-right"><a href="/customer/insert">JOIN US</a></li>
		</c:when>
		<c:otherwise>
			<li class="float-right"><a href="/customer/logout">LOGOUT</a></li>
		</c:otherwise>
	</c:choose>
</ul>
</div>
</nav>

<main>