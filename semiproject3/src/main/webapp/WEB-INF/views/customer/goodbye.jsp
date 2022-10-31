<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/customerHeader.jsp">
	<jsp:param value="비밀번호 확인" name="title"/>
</jsp:include>

<form action="goodbye" method="post">

<div class="container-400 mt-50 mb-50">
	<div class="row center mb-30">
		<h1>비밀번호 확인</h1>
		<hr>
	</div>
	
	<div class="row left mt-30">
		<input class="input w-100" type="password" name="customerPw" required>
	</div>
	
	<div class="row center mt-30">
		<a href="mypage" class="btn btn-neutral">취소하기</a>
		<button class="btn btn-negative" type="submit">탈퇴하기</button>
	</div>
</div>

	
</form>

<jsp:include page="/WEB-INF/views/template/customerFooter.jsp"></jsp:include>