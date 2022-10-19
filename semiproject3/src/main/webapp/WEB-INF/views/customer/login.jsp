<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="회원 로그인" name="title"/>
</jsp:include>

<form action="login" method="post">
<div class="container-400 mt-40">
	<!-- 정상/이상 모두 나오는 화면 -->
	<div class="row center">
		<h1>회원 로그인</h1>
	</div>
	
	<div class="row left">
		<input class="input w-100" type="text" name="customerId" placeholder="아이디" required autocomplete="off">
	</div>
	
	<div class="row left">
		<input class="input w-100" type="password" name="customerPw" placeholder="비밀번호" required>
	</div>
	
	<div class="row left">
		<button type="submit" class="btn btn-positive w-100">로그인</button>
	</div>
		

</div>
</form>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
