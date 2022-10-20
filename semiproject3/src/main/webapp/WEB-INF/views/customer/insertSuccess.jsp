<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="회원 가입 완료" name="title"/>
</jsp:include>

<div class="container-300 mt-50 mb-50">
	<div class="row center mb-50">
		<h1>WELCOME</h1>
	</div>
	<div class="row center">
		<h3>회원가입을 축하드립니다.</h3>
	</div>
	<div class="row center mb-50">
		<h3>가입 축하금 5000P 지급되었습니다.</h3>
	</div>
	<div class="row">
		<a href="/" class="btn btn-positive w-100">쇼핑하러 가기</a>
	</div>
	<div class="row center">
		&copy; Semi3 Corp. All rights reserved.
	</div>
</div>


<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>