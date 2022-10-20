<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="${param.title}" name="title"/>
</jsp:include>

<aside class="right">
	<ul class="side-menu">
		<li>
			<span class="toggle">MY 정보</span>
			<ul>
				<li><a href="/customer/detail">개인정보 조회/수정</a></li>
				<li><a href="#">배송지 관리</a></li>
				<li><a href="/customer/delete">회원 탈퇴</a></li>
			</ul>
		</li>
		<li>
			<span class="toggle">쇼핑 정보</span>
			<ul>
				<li><a href="#">주문/배송 조회</a></li>
				<li><a href="#">찜하기 내역</a></li>
			</ul>
		</li>
	</ul>
</aside>
