<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="/WEB-INF/views/template/customerHeader.jsp">
	<jsp:param value="회원정보변경" name="title"/>
</jsp:include>
<script type="text/javascript">
	$(function(){
		$(window).on("beforeunload", function(){
		    return false;
		});
		$(".btn-pass").click(function(){
		    $(window).off("beforeunload");
		    return true;
		});
	});
</script>
<form action="information" method="post" autocomplete="off">

<section>
	<div class="container-400 mt-50 mb-50">
	
		<div class="row center">
			<h1>회원 정보 변경</h1>
			<hr>
		</div>
	
		<div class="row">
			<label>닉네임
				<input class="input w-100" type="text" name="customerNick" required value="${customerDto.customerNick}">
			</label>
		</div>
		<div class="row">
			<label>핸드폰 번호
				<input class="input w-100" type="text" name="customerPhone" required value="${customerDto.customerPhone}">
			</label>
		</div>
		<div class="row">
			<label>이메일
				<input class="input w-100" type="email" name="customerEmail" value="${customerDto.customerEmail}">
			</label>
		</div>
		<div class="row mt-30">
			<label>비밀번호 확인
				<input class="input w-100" type="password" name="customerPw" required>
			</label>
		</div>
		<div class="row">
			<button class="btn btn-positive w-100 btn-pass" type="submit">변경하기</button>
		</div>
	
	
		<c:if test="${param.error != null}">
			<h4 style="color:red">비밀번호가 맞지 않습니다.</h4>
		</c:if>
	</div>
</section>
</form>
<jsp:include page="/WEB-INF/views/template/customerFooter.jsp"></jsp:include>
	