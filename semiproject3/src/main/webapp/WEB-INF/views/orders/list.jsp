<%@ page language="java" contentType="text/html; charset=UTF-8" 
		pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="/WEB-INF/views/template/adminHeader.jsp">
	<jsp:param value="주문 목록" name="title"/>
</jsp:include>



<div class ="container-800 mt-40 mb-40">


	<div class = "row center">
		<h1>주문 목록</h1>
	</div>
	
	
	
	<div class = "row">
		<table class="table table-hover table-border">
			<thead>
				<tr>
					<th>주문번호</th>
					<th>회원아이디</th>
					<th>상품번호</th>
					<th>상품명</th>
					<th>상품금액</th>
					
				</tr>
			</thead>
				
			<tbody align="center">
			<c:forEach var="ordersDto" items="${orders}">
				
				

				
<%--			이미지   --%>
<!-- 				<tr><td>  -->
<%-- 					<c:forEach var="itemImageView" items="${itemImageList}"> --%>
<%-- 							<img src="/image/download/${itemImageView.imageNo}" width="200" > --%>
<%-- 						</c:forEach> --%>
<!-- 				</tr></td> -->
			
				<tr>
				<td>${ordersDto.ordersNo}</td>
					<td>${ordersDto.customerId}</td>
					<td>
						<a href="detail?itemNo=${ordersDto.itemNo}">
							${ordersDto.itemName}
						</a>
					</td>
						</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	
	<div class="row right">
		<a class="btn btn-positive" href="insert">상품등록</a>
	</div>
	
</div>
	
<!-- 페이지 네비게이터 -->
<div class="row center">

<h3> 

<c:choose>
	<c:when test="${not vo.isFirst()}">
		<a href="list?p=${vo.firstBlock()}&${vo.parameter()}">&laquo;</a>
	</c:when>
	<c:otherwise>
		<a href="#">&laquo;</a>
	</c:otherwise>
</c:choose>

<!-- 이전을 누르면 이전 구간의 마지막 페이지로 안내 -->
<c:choose>
	<c:when test="${vo.hasPrev()}">
		<a href="list?p=${vo.prevBlock()}&${vo.parameter()}">&lt;</a>
	</c:when>
	<c:otherwise>
		<a href="#">&lt;</a>
	</c:otherwise>
</c:choose>
 
<c:forEach var="i" begin="${vo.startBlock()}" end="${vo.endBlock()}" step="1">
	<a href="list?p=${i}&${vo.parameter()}">${i}</a>
</c:forEach>

<!-- 다음을 누르면 다음 구간의 첫 페이지로 안내 -->
<c:choose>
	<c:when test="${vo.hasNext()}">
		<a href="list?p=${vo.nextBlock()}&${vo.parameter()}">&gt;</a>
	</c:when>
	<c:otherwise>
		<a href="#">&gt;</a>
	</c:otherwise>
</c:choose>

<c:choose>
	<c:when test="${not vo.isLast()}">
		<a href="list?p=${vo.lastBlock()}&${vo.parameter()}">&raquo;</a>
	</c:when>
	<c:otherwise>
		<a href="#">&raquo;</a>
	</c:otherwise>
</c:choose>

</h3>

</div>	

	
	
	
<!-- 검색창 -->
<form action = "list" method="get" >
	<div class="row center">
		
		<select class="input" name="type" required>
		<option value="item_name" <c:if test="${type == 'item_name'}"></c:if>>상품명</option>
		<option value="cate_code" <c:if test="${type == 'cate_code'}"></c:if>>카테고리</option>
		</select>
			
		<input class="input" type="search" name="keyword" placeholder="검색어" required>
			<button class="btn btn-positive">검색</button><br><br>
			<button class="btn btn-postive">결제하기</button><br><br>	
			<button class="btn btn-positive">돌아가기</button><br><br>
	</div>
</form>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
