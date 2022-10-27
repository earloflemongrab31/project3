<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<div class="swiper main">
    <!-- Additional required wrapper -->
    <div class="swiper-wrapper">
    <!-- Slides -->
   	<c:forEach var="mainImageDto" items="${mainImageList}">
    	<div class="swiper-slide">
    		<a href="${mainImageDto.imagePath}">
				<img src="/download/${mainImageDto.imageNo}" class="w-100">
    		</a>
	    </div>
	</c:forEach>
    </div>

    <!-- If we need pagination -->
    <div class="swiper-pagination"></div>
  
    <!-- If we need navigation buttons -->
<!--     <div class="swiper-button-prev"></div> -->
<!--     <div class="swiper-button-next"></div> -->
  
</div>

<div class="container-1200 mt-50 mb-50">

<c:if test="${mainEditDto.mainContent != null}">
	<div class="row center">
		${mainEditDto.mainContent}
	</div>
</c:if>
<div class="row mt-50">
	<hr>
</div>

<div class="row center mt-50">
	<h1>New :</h1>
</div>

<div class="swiper mySwiper">
	<div class="swiper-wrapper">

   	<c:forEach var="itemDto" items="${itemList}">
    	<div class="swiper-slide">
    		<div class="row">
	    		<div>
		    		<a href="item/buydetail?itemNo=${itemDto.itemNo}">
						<img src="image/download/${itemDto.itemNo}" class="w-100">
		    		</a>
	    		</div>
	    		<div class="row">
	    			${itemDto.itemMemo}
	    		</div>
	    		<div class="row">
	    			${itemDto.itemPrice}
	    		</div>
    		</div>
	    </div>
	</c:forEach>

    </div>

    <div class="swiper-button-prev"></div>
    <div class="swiper-button-next"></div>
  
</div>

</div>


<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
