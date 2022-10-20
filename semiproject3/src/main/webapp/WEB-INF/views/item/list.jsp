<%@ page language="java" contentType="text/html; charset=UTF-8" 
		pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
   
<jsp:include page="/WEB-INF/views/template/header.jsp">
    <jsp:param value="상품 목록" name="title"/>
</jsp:include>


<div class ="container-800 mt-40 mb-40">

	<div class = "row center">
		<h1>상품 목록</h1>
	</div>
	
	<div class = "row">
		<table class="table table-hover table-border">
			<thead>
				<tr>
					<th>상품번호</th>
					<th>상품메모</th>
					<th>상품명</th>
					<th>상품금액</th>
					
				</tr>
			</thead>
				
			<tbody align="center">
			<c:forEach var="itemDto" items="${list}">
				
<%--			이미지   --%>
<!-- 				<tr><td>  -->
<%-- 					<c:forEach var="itemImageView" items="${itemImageList}"> --%>
<%-- 							<img src="/image/download/${itemImageView.imageNo}" width="200" > --%>
<%-- 						</c:forEach> --%>
<!-- 				</tr></td> -->
			
				<tr>
				<td>${itemDto.itemNo}</td>
					<td>${itemDto.itemMemo}</td>
					<td>
						<a href="detail?itemNo=${itemDto.itemNo}">
							${itemDto.itemName}
						</a>
					</td>
					<td>${itemDto.itemPrice}원</td>
				</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	
	<div class="row right">
		<a class="btn btn-positive" href="insert">상품등록</a>
	</div>
	
</div>
	
<!-- 검색창 -->
<form action = "list" method="get" >
	<div class="row center">
		
		<select class="input" name="type" required>
		<option value="item_name" <c:if test="${type == 'item_name'}"></c:if>>상품명</option>
		<option value="cate_code" <c:if test="${type == 'cate_code'}"></c:if>>카테고리</option>
		</select>
			
		<input class="input" type="search" name="keyword" placeholder="검색어" required>
			<button class="btn btn-positive">검색</button>
	</div>
</form>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>