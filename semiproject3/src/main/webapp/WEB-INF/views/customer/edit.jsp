<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="회원정보수정" name="title"/>
</jsp:include>


<!-- 
	변경이 불가능한 항목에 대한 처리 방법
	[1] 읽기 전용 처리(readonly) - 전송은 됨
	[2] 비활성화 처리(disabled) - 전송도 안됨
	[3] 숨김 처리(type=hidden)
 -->

<form action="edit" method="post">

<div class="container-300 mt-40">
	<div class="row center">
		<h1>회원 정보 수정</h1>
	</div>
	
	<div class="row left">
		<label>회원 아이디</label>
		<input class="input w-100" name="customerId" value="${dto.customerId}">
	</div>
		
	<div class="row left">
		<label>이름</label>
		<input class="input w-100" name="customerName" value="${dto.customerName}">
	</div>
	
	<div class="row left">
		<label>핸드폰번호</label>
		<input class="input w-100" name="customerPhone" value="${dto.customerPhone}">
	</div>
	
	<div class="row left">
		<label>이메일</label>
		<input class="input w-100" name="customerEmail" value="${dto.customerEmail}">
	</div>
	
	
	<div class="row right">
		<a href="list" class="btn btn-neutral">목록</a>
		<button type="submit" class="btn btn-positive">수정</button>	
	</div>
</div>
</form>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>


