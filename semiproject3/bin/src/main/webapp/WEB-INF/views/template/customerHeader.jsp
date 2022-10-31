<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="${param.title}" name="title"/>
</jsp:include>

<aside class="right">
	<ul class="accordian">
		<li>
			<span>MY 정보</span>
			<ul>
				<li><a href="/customer/mypage">개인정보 조회</a>
				<li><a href="/customer/information">개인정보 수정</a></li>
				<li><a href="/customer/changePw">비밀번호 변경</a></li>
				<li><a href="/address/list">배송지 관리</a></li>
				<li><a href="/customer/goodbye">회원 탈퇴</a></li>
			</ul>
		</li>
		<li>
			<span>쇼핑 정보</span>
			<ul>
				<li><a href="/buy/list">주문/배송 조회</a></li>
				<li><a href="/customerLike/list">찜하기 내역</a></li>
			</ul>
		</li>
	</ul>
</aside>
