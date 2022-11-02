<%@ page language="java" contentType="text/html; charset=UTF-8" 
		pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
   
<jsp:include page="/WEB-INF/views/template/adminHeader.jsp">
	<jsp:param value="관리자 상품목록" name="title"/>
</jsp:include>


<div class ="container-800 mt-50 mb-50">

	<div class = "row center mb-30">
		<h1>상품 목록</h1>
		<hr>
	</div>
	
	<div class = "row">
		<table class="table table-border">
			<thead>
				<tr>
					<th width="10%" >상품번호</th>
					<th width="10%">카테고리</th>
					<th width="20%">상품명</th>
					<th width="25%">상품메모</th>
					<th width="20%">상품금액</th>
					<th>비고</th>
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
					<td>${itemDto.itemCate}</td>
					<td>${itemDto.itemName}</td>
					<td>${itemDto.itemMemo}</td>
					<td>${itemDto.itemPrice}원</td>
					<td>
						<a class="btn btn-border w-100"  href="detail?itemNo=${itemDto.itemNo}">
						확인
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

<ul class="pagination">
<li>
	<c:choose>
		<c:when test="${not vo.isFirst()}">
			<a href="list?p=${vo.firstBlock()}&${vo.parameter()}">
				<i class="fa-solid fa-angles-left"></i>
			</a>
		</c:when>
		<c:otherwise>
			<a href="#"><i class="fa-solid fa-angles-left"></i></a>
		</c:otherwise>
	</c:choose>
</li>

<!-- 이전을 누르면 이전 구간의 마지막 페이지로 안내 -->
<li>
	<c:choose>
		<c:when test="${vo.hasPrev()}">
			<a href="list?p=${vo.prevBlock()}&${vo.parameter()}">
				<i class="fa-solid fa-chevron-left"></i>
			</a>
		</c:when>
		<c:otherwise>
			<a href="#"><i class="fa-solid fa-chevron-left"></i></a>
		</c:otherwise>
	</c:choose>
</li>
 
<c:forEach var="i" begin="${vo.startBlock()}" end="${vo.endBlock()}" step="1">
	<li <c:if test="${i==param.p}">class="on"</c:if>><a href="list?p=${i}&${vo.parameter()}">${i}</a></li>
</c:forEach>

<!-- 다음을 누르면 다음 구간의 첫 페이지로 안내 -->
<li>
	<c:choose>
		<c:when test="${vo.hasNext()}">
			<a href="list?p=${vo.nextBlock()}&${vo.parameter()}">
				<i class="fa-solid fa-chevron-right"></i>
			</a>
		</c:when>
		<c:otherwise>
			<a href="#"><i class="fa-solid fa-chevron-right"></i></a>
		</c:otherwise>
	</c:choose>
</li>

<li>
	<c:choose>
		<c:when test="${not vo.isLast()}">
			<a href="list?p=${vo.lastBlock()}&${vo.parameter()}">
				<i class="fa-solid fa-angles-right"></i>
			</a>
		</c:when>
		<c:otherwise>
			<a href="#"><i class="fa-solid fa-angles-right"></i></a>
		</c:otherwise>
	</c:choose>
</li>
</ul>

<!-- 검색창 -->
<form action = "list" method="get" >
	<div class="row center">
		
		<select class="input input-none" name="type" required>
			<option value="item_name" <c:if test="${type == 'item_name'}"></c:if>>상품명</option>
		</select>
			
		<input class="input" type="search" name="keyword" placeholder="검색어" required>
			<button class="btn btn-positive">검색</button>
	</div>
</form>

</div>	


<jsp:include page="/WEB-INF/views/template/adminFooter.jsp"></jsp:include>