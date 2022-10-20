<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:include page="/WEB-INF/views/template/header.jsp">
		<jsp:param value="${customerDto.customerId} 회원 정보" name="title"/>
</jsp:include>

<div class="container-600 mt-50 mb-50">
	<div class="row center mb-50">
		<h1>${customerDto.customerId} 회원 정보</h1>
	</div>
	
	<div class="row mb-30">
		
		<table class="table table-border">
			<tr>
				<th width="25%">아이디</th>
				<td>${customerDto.customerId}</td>
			</tr>
			<tr>
				<th>닉네임</th>
				<td>${customerDto.customerNick}</td>
			</tr>
			<tr>
				<th>생년월일</th>
				<td>${customerDto.customerBirth}</td>
			</tr>
			<tr>
				<th>전화번호</th>
				<td>${customerDto.customerTel}</td>
			</tr>
			<tr>
				<th>이메일</th>
				<td>${customerDto.customerEmail}</td>
			</tr>
			<tr>
				<th>포인트</th>
				<td>
					<fmt:formatNumber value="${customerDto.customerPoint}" pattern="#,##0"/> point
				</td>
			</tr>
			<tr>
				<th>권한</th>
				<td>
					${customerDto.customerGrade}
				</td>
			</tr>
			<tr>
				<th>가입일시</th>
				<td>
					<fmt:formatDate value="${customerDto.customerJoin}" pattern="y년 M월 d일 E a h시 m분 s초"/>
				</td>
			</tr>
			<tr>
				<th>로그인일시</th>
				<td>
					<fmt:formatDate value="${customerDto.customerLogin}" pattern="y년 M월 d일 E a h시 m분 s초"/>
				</td>
			</tr>
		</table>
	</div>
	
	<div class="flexbox">
		<div class="flex-left w-33 center">
			<a class="btn btn-neutral" href="password">비밀번호 변경</a>
		</div>
		<div class="flex-left w-34 center">
			<a class="btn btn-neutral" href="information">개인정보 변경</a>
		</div>
		<div class="flex-left w-33 center">
			<a class="btn btn-neutral" href="goodbye">회원 탈퇴</a>
		</div>
	</div>
</div>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>

