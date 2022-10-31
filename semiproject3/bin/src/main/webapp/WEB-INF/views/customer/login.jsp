<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="로그인" name="title"/>
</jsp:include>

<form class="login-form" action="login" method="post" autocomplete="off">
<div class="container-300 mt-50">
	<!-- 정상/이상 모두 나오는 화면 -->
	<div class="row center mb-50">
		<h1>LOGIN</h1>
	</div>
	
	<!-- 
		로그인 에러 뜨면 토글이 자동으로 회원으로 넘어감 -> 수정 필요>
	 -->
	<div class="flexbox">
		<div class='w-50 center user user-customer'>
			회원
		</div>
		<div class='w-50 center unchecked user user-admin'>
			<span>관리자</span>
		</div>
	</div>
	
	<div class="row">
		<input class="input w-100 id" type="text" name="customerId" placeholder="아이디" required autocomplete="off">
	</div>
	
	<div class="row">
		<input class="input w-100 pw" type="password" name="customerPw" placeholder="비밀번호" required>
	</div>
	
	<div class="row mt-30 mb-50">
		<button type="submit" class="btn btn-positive w-100 btn-login">로그인</button>
	</div>
	
	<div class="row">
		<a href="checkPassword" class="flexbox">
			<span class="w-75">아이디 / 비밀번호 찾기</span>
			<span class="w-25 right"><i class="fa-solid fa-arrow-right"></i></span>
		</a>
	</div>
	<div class="row customer-join">
		<a href="insert" class="flexbox">
			<span class="w-75">회원가입</span>
			<span class="w-25 right"><i class="fa-solid fa-arrow-right"></i></span>
		</a>
	</div>
	
	<c:if test="${param.error != null}">
		<div class="row center mt-20">
			<span style="color:darkred;">아이디 / 비밀번호를 잘못 입력했습니다.</span>
		</div>
		<div class="row center">
			<span style="color:darkred;">입력하신 내용을 다시 확인해주세요.</span>
		</div>
	</c:if>
		

</div>
</form>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
