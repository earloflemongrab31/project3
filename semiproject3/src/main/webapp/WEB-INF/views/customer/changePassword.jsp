<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="비밀번호 변경 페이지" name="title" />
</jsp:include>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<form action="changePassword" method="post" autocomplete="off">

	<div class="container-600 mt-50 mb-50"">

		<div class="row center mb-30">
			<h1>비밀번호 변경</h1>
			<hr>
		</div>

		<div class="row">
			<h3>비밀번호 입력</h3>
		</div>

		<div class="row">
			<label>변경할 비밀번호</label>
		</div>


		<div class="row">
			<input type="text" name="customerPw" class="input" required>
		</div>


		<div class="row right">
			<button class="btn btn-positive w-25 btn-join" type="submit">변경하기</button>
		</div>
		
		
		<c:if test="${param.error != null}">
			<h4 style="color:red;">영문 대소문자/숫자/특수[!@#$]를 포함한 8~16자로 설정해야 합니다.</h4>
		</c:if>
	</div>

</form>

<jsp:include page="/WEB-INF/views/template/customerFooter.jsp"></jsp:include>
