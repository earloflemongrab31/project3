<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="회원정보 변경" name="title"/>
</jsp:include>

	<h1>회원 정보 변경</h1>
<div class="row">
<form action="information" method="post">
	
	닉네임 : <input type="text" name="customerNick" required value="${customer.customerNick}"><br><br> 
	핸드폰 번호 : <input type="text" name="customerPhone" required value="${customer.customerPhone}"><br><br>
	이메일 : <input type="email" name="customerEmail" value="${customer.customerEmail}"><br><br>
	
	비밀번호 확인 : <input type="password" name="customerPw" required><br><br>
	<button type="submit">변경하기</button>
</form>

<c:if test="${param.error != null}">
	<h2 style="color:red">비밀번호가 맞지 않습니다.</h2>
</c:if>

</div>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
	