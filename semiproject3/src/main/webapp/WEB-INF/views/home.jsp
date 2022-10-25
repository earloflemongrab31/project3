<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="메인페이지" name="title"/>
</jsp:include>

<!-- 풀스크린 수정 필요할 듯... -->
<div class="fullscreen">
	<div class="modal screen-center survey">
		<div class="row right delete" style="font-family:sans-serif; margin:5px;">X</div>
		<div class="row" style="min-height:285px; opacity:0;">
			<span>-</span>
		</div>
		<div class="row center">
			<h3><a href="research/insert">설문조사 페이지 이동</a></h3>
		</div>
	</div>
</div>

<!-- Slider main container -->
<div class="swiper">
    <!-- Additional required wrapper -->
    <div class="swiper-wrapper">
    <!-- Slides -->
    <!-- 사진 테이블 연결해서 여러개 출력하기 -->
	    <div class="swiper-slide"><img class="w-100" src="/image/goodbyesummer.png"></div>
    </div>

    <!-- If we need pagination -->
    <div class="swiper-pagination"></div>
  
    <!-- If we need navigation buttons -->
    <div class="swiper-button-prev"></div>
    <div class="swiper-button-next"></div>
  
</div>

<div class="container-1200 mt-50 mb-50">
	<div class="row center">
		<h2>Welcome to 쇼핑몰명</h2>
	</div>
	<div class="row center">
		<h3>코 앞으로 다가온 겨울</h3>
	</div>
	<div class="row center">
		<h3>쇼핑몰명에서 하루 빨리 만나보세요:)</h3>
	</div>
</div>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
