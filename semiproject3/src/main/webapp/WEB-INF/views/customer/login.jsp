<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="로그인" name="title"/>
</jsp:include>

<form action="login" method="post">
<div class="container-300 mt-50">
	<!-- 정상/이상 모두 나오는 화면 -->
	<div class="row center mb-50">
		<h1>LOGIN</h1>
	</div>
	
	<div class="row">
		<input class="input w-100" type="text" name="customerId" placeholder="아이디" required autocomplete="off">
	</div>
	
	<div class="row">
		<input class="input w-100" type="password" name="customerPw" placeholder="비밀번호" required>
	</div>
	
	<div class="row mt-30 mb-50">
		<button type="submit" class="btn btn-positive w-100">로그인</button>
	</div>
	
	<div>
		<a href="#" class="flexbox">
			<span class="w-75">아이디 / 비밀번호 찾기</span>
			<span class="w-25 right"><i class="fa-solid fa-arrow-right"></i></span>
		</a>
	</div>
	<div>
		<a href="insert" class="flexbox">
			<span class="w-75">회원가입</span>
			<span class="w-25 right"><i class="fa-solid fa-arrow-right"></i></span>
		</a>
	</div>
		

</div>
</form>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
