<%@ page language="java" contentType="text/html; charset=UTF-8" 
		pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
   
<jsp:include page="/WEB-INF/views/template/header.jsp">
    <jsp:param value="상품 목록" name="title"/>
</jsp:include>



<div class ="container-800 mt-40 mb-40">

	<div class = "row center">
		<h1>상품 리스트</h1>
	</div>
	<div class = "row">
	
		<c:forEach var="itemDto" items="${buylist}">
			<div class="row w-33">
				<a href="buydetail?itemNo=${itemDto.itemNo}">
					<img src="/image/download/${itemDto.imageNo}" width="200" height="200" >
				</a>
				${itemDto.itemNo}<br>
				${itemDto.itemName}<br>
				${itemDto.itemPrice}원<br>
				${itemDto.itemColor}<br><br>
			</div>
		</c:forEach>
	</div>
	
</div>
	
<!-- 검색창 -->
<form action = "list" method="get" >
	<div class="row center">
		
		<select class="input" name="type" required>
			<option value="itemName">상품명</option>
			<option value="cateCode">카테고리</option>
		</select>
			
		<input class="input" type="search" name="keyword" placeholder="검색어" required>
			<button class="btn btn-positive">검색</button>
	</div>
</form>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>