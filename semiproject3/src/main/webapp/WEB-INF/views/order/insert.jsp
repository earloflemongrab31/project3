<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<jsp:include page="/WEB-INF/views/template/header.jsp">
    <jsp:param value="주문 등록 페이지" name="title"/>
</jsp:include>
 
<div class ="container-600">

<form action="insert" method="post" enctype="multipart/form-data">
<%-- <input name="adminId" type="hidden" value="${noticeDto.adminId}" > --%>
	
	
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
		<label> 상품 번호 <input name="itemNo" type="number"
			class="input mt-10 w-100" autocomplete="off">
		</label>
	</div>

	<div class="row">
		<label> 배송지 번호 <input name="addressNo" type="number"
		class="input mt-10 w-100" autocomplete="off">
		</label>
	</div>
	
	<div class="row">
		<label> 이름 <input name="itemName" type="text"
		class="input mt-10 w-100" autocomplete="off">
		</label>
	</div>

	<div class="row">
		<label> 가격 <input name="itemPrice" type="number"
		class="input mt-10 w-100" autocomplete="off">
		</label>
	</div>
	
	<div class="row">
		<label> 색상 <input name="itemColor" type="text"
		class="input mt-10 w-100" autocomplete="off">
		</label>
	</div>
	
	<div class="row">
		<label> 크기 <input name="itemSize" type="text"
		class="input mt-10 w-100" autocomplete="off">
		</label>
	</div>
	
	<div class="row">
		<label> 주문수량 <input name="orderCnt" type="number"
		class="input mt-10 w-100" autocomplete="off">
		</label>
	</div>
	
	<div class="row">
		<label> 주문날짜 <input name="orderDate" type="date"
		class="input mt-10 w-100" autocomplete="off">
		</label>
	</div>
	
	<div class="row">
		<label> 배송료 <input name="buyFee" type="number"
		class="input mt-10 w-100" autocomplete="off">
		</label>
	</div>
	
	<div class="row">
		<label> 휴대폰번호 <input name="customerPhone" type="text"
		class="input mt-10 w-100" autocomplete="off">
		</label>
	</div>
	
	<div class="row right">
		<a class="btn btn-neutral" href="list">목록</a>
		<button class="btn btn-positive" type="submit">등록</button>
	</div>

</form>
</div>

 


<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include> 
    