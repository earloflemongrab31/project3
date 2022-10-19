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

<!-- 사진 넣고 지우기 -->
<div class="center" style="background-color:#ede8e4; min-height:400px">
	<h1 style="margin:0;"></h1>
</div>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
