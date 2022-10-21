<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<jsp:include page="/WEB-INF/views/template/header.jsp">
    <jsp:param value="주문 등록 페이지" name="title"/>
</jsp:include>
 


<form action="insert" method="post" enctype="multipart/form-data">
<%-- <input name="adminId" type="hidden" value="${noticeDto.adminId}" > --%>
	<div class ="container-600">
	
	<div class="row">
		<h1>주문 등록</h1>
		<hr>
	</div>
	
	<div class="row">
		<label>주문번호  <input name="orderNo" type="number" required
		class="input mt-10 w-100" autocomplete="off">
		</label>
	</div>
	
	<div class="row">
		<label>회원아이디 <input name="customerId" type="text" required
			class="input mt-10 w-100" autocomplete="off">
		</label>
	</div>


	<div class="row">
		<label> 장바구니 번호 <input name="cartNo" type="number" 
			class="input mt-10 w-100" autocomplete="off"> 
		</label>
	</div>

	<div class="row">
		<label> 배송지 번호 <input name="addressNo" type="number"
		class="input mt-10 w-100" autocomplete="off">
		</label>
	</div>


	<div class="row right">
		<a class="btn btn-neutral" href="list">목록</a>
		<button class="btn btn-positive" type="submit">등록</button>
	</div>

	</div>
</form>
 


<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include> 
    