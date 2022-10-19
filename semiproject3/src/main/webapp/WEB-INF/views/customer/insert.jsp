<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="회원 등록" name="title"/>
</jsp:include>

<link rel="stylesheet" type="text/css" href="./css/reset.css">
<link rel="stylesheet" type="text/css" href="./css/commons.css">

<form action="insert" method="post">
<div class="container-300">
	<div class="row center">
	<h1>회원 등록</h1>
	</div>
	<div class="row center">
		<input class="input w-100" type="text" name="customerId" required placeholder="아이디">
	</div>
	<div class="row center">
		<input class="input w-100" type="password" name="customerPw" required placeholder="비밀번호">
	</div>
	<div class="row center">
		<input class="input w-100" type="password" name="customerPwsearch" required placeholder="비밀번호 확인">
	</div>
	
	<div class="row center">
		<input class="input w-100" type="text" name="customerNick" placeholder="닉네임">
	</div>
	
	<div class="row center">
		<input class="input w-100" type="text" name="customerName" required placeholder="이름">
	</div>
	
	<div class="row center">
		<input class="input w-100" type="tel" name="customerPhone"  required placeholder="핸드폰번호">
	</div>
	
	<div class="row center">
		<input class="input w-100" type="tel" name="customerTel" placeholder="전화번호">
	</div>
	
	<div class="row center">
	생년월일 <input class="input w-100" type="date" name="customerBirth" required>
	</div>
	
	<div class="row center">
		<input class="input w-100" type="email" name="customerEmail" required placeholder="이메일">
	</div>
	
	<div class="row center">
		<button class="btn btn-positive w-30" type="submit">등록</button>
	</div>
</div>
</form>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>



