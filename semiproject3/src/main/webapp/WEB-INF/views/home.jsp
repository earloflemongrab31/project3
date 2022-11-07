<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="메인페이지" name="title"/>
</jsp:include>

<c:if test="${blockSurvey != 'Y' && loginGrade != '일반관리자' && loginGrade != '메인관리자' && researchOverlap < 1}">
	<!-- 풀스크린 수정 필요할 듯... -->
	<div class="fullscreen">
		<div class="modal screen-center survey">
			<div class="row right delete" style="margin:3px 5px 0 0;"><i class="fa-solid fa-xmark"></i></div>
			<div class="row" style="min-height:285px; opacity:0;">
				<span>-</span>
			</div>
			<div class="row center">
				<h3><a href="research/insert">설문조사 페이지 이동</a></h3>
			</div>
			<div class="row right mt-50">
				<a href="${pageContext.request.contextPath}/block-survey">
					한동안 보지 않기 <i class="fa-solid fa-xmark"></i>
				</a>
			</div>
		</div>
	</div>
</c:if>

<!-- Slider main container -->
<div class="swiper main">
    <!-- Additional required wrapper -->
    <div class="swiper-wrapper">
    <!-- Slides -->
   	<c:forEach var="mainImageDto" items="${mainImageList}">
    	<div class="swiper-slide">
    		<a href="${mainImageDto.imagePath}">
				<img src="${pageContext.request.contextPath}/download/${mainImageDto.imageNo}" class="w-100">
    		</a>
	    </div>
	</c:forEach>
    </div>

    <!-- If we need pagination -->
    <div class="swiper-pagination"></div>
  
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
    		<div class="row" style="font-size:14px;">
	    		<div>
		    		<a href="item/buydetail?itemNo=${itemDto.itemNo}">
						<img src="${pageContext.request.contextPath}/image/download/${itemDto.imageNo}">
		    		</a>
	    		</div>
	    		<div class="row left float-container mb-20" style="font-weight:bold;">
	    			<div class="float-left">
		    			${itemDto.itemName}
	    			</div>
	    			<div class="float-right">
		    			<fmt:formatNumber value="${itemDto.itemPrice}" pattern="#,##0"/>원
	    			</div>
	    		</div>
	    		<div class="row left">
	    			${itemDto.itemMemo}
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
