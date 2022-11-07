<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="주문완료" name="title"/>
</jsp:include>

<meta http-equiv="refresh" content="5; url=http:/">

<div class="container-400 mt-50 mb-50">

<div class="row center mb-30">
	<h1>ORDER</h1>
</div>
<div class="row center">
	<h3>주문이 정상적으로 완료되었습니다.</h3>
</div>

<div class="row center mb-50">
	<span id="timer">5</span>초 후 메인페이지로 이동합니다.
</div>

<div class="row">
	<a href="${pageContext.request.contextPath}/buy/list" class="btn btn-positive w-100">주문내역 보기</a>
</div>
<div class="row center">
	&copy; Semi3 Corp. All rights reserved.
</div>

</div>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>