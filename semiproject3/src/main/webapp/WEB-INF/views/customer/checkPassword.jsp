<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="비밀번호 찾기 페이지" name="title" />
</jsp:include>

<form action="checkPassword" method="post" autocomplete="off">

	<div class="container-600 mt-50 mb-50">

		<div class="row center mb-30">
			<h1>비밀번호 찾기</h1>
		</div>

		<div class="row">
			<h3>아이디 입력</h3>
			<hr>
		</div>

		<div class="row">
			<label>아이디</label>
		</div>

		<div class="row">
			<input name="customerId" type="text" required class="input">
		</div>

		<div class="row">
			<h3>비밀번호 확인 질문</h3>
			<hr>
		</div>

		<div class="row">
			<label>나의 보물 1호는?</label>
		</div>

		<div class="row">
			<input name="customerPwsearch" type="text" required class="input">
		</div>

		<div class="row center">
			<button class="btn btn-positive w-25 btn-join" type="submit">확인</button>
		</div>

		<c:if test="${param.error != null}">
			<div class="row center mt-20">
				<span style="color: darkred;">아이디 또는 질문의 답변을 다시 확인해주세요.</span>
			</div>
		</c:if>
	</div>
</form>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>