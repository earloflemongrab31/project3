<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="내 정보 변경" name="title"/>
</jsp:include>

<h1>내 정보 변경</h1>

<form action="information" method="post">
	
	닉네임 : <input type="text" name="customerNick" required value="${customerDto.customerNick}"><br><br>
	생년월일 : <input type="date" name="customerBirth" required value="${customerDto.customerBirth}"><br><br>
	전화번호 : <input type="tel" name="customerTel" required value="${customerDto.customerTel}"><br><br>
	이메일 : <input type="email" name="customerEmail" value="${customerDto.customerEmail}"><br><br>
	우편번호 : <input type="text" name="customerPost" value="${customerDto.customerPost}" size="6" maxlength="6"><br><br>
	기본주소 : <input type="text" name="customerBaseAddress" value="${customerDto.customerBaseAddress}"><br><br>
	상세주소 : <input type="text" name="customerDetailAddress" value="${customerDto.customerDetailAddress}"><br><br>
	
	비밀번호 확인 : <input type="password" name="customerPw" required><br><br>
	<button type="submit">변경하기</button>
</form>

<c:if test="${param.error != null}">
	<h2 style="color:red">비밀번호가 맞지 않습니다</h2>
</c:if>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>





