<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/header.jsp">
    <jsp:param value="설문조사" name="title"/>
</jsp:include>

<div class="container-300 mt-50 mb-50">
	<div class="row center mb-50">
		<h1>고객만족 설문조사</h1>
	</div>
	<div class="row center">
		<h3>설문 참여 감사드립니다.</h3>
	</div>
	<div class="row center mb-50">
		<h3>+ 5000P 지급완료</h3>
	</div>
	<div class="row">
		<a href="/" class="btn btn-positive w-100">쇼핑하러 가기</a>
	</div>
	<div class="row center">
		&copy; Semi3 Corp. All rights reserved.
	</div>
</div>

<meta http-equiv="refresh" content="4; url=http:/">
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
