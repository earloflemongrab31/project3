<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="${param.title}" name="title"/>
</jsp:include>

<aside class="right">
	<ul class="accordian">
		<li>
			MY 정보
			<ul>
				<li><a href="${pageContext.request.contextPath}/customer/mypage">개인정보 조회</a>
				<li><a href="${pageContext.request.contextPath}/customer/information">개인정보 수정</a></li>
				<li><a href="${pageContext.request.contextPath}/customer/changePw">비밀번호 변경</a></li>
				<li><a href="${pageContext.request.contextPath}/address/list">배송지 관리</a></li>
				<li><a href="${pageContext.request.contextPath}/review/list?type=customer_id&keyword=${loginId}">리뷰 관리</a></li>
				<li><a href="${pageContext.request.contextPath}/customer/goodbye">회원 탈퇴</a></li>
			</ul>
		</li>
		<li>
			쇼핑 정보
			<ul>
				<li><a href="${pageContext.request.contextPath}/buy/list">주문/배송 조회</a></li>
				<li><a href="${pageContext.request.contextPath}/customerLike/list">찜하기 내역</a></li>
			</ul>
		</li>
	</ul>
</aside>
