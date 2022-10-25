<%@ page language="java" contentType="text/html; charset=UTF-8" 
		pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="/WEB-INF/views/template/adminHeader.jsp">
	<jsp:param value="상품 입/출고 목록" name="title"/>
</jsp:include>

<div class ="container-900 mt-40 mb-40">
        
        <div class="row">
            <h1>상품 입/출고 목록</h1>
            <div class="row center">
			<form action="itemList" method="get">
				<select class="input" name="type" required>
					<option value="cate_code">카테고리</option>
					<option value="item_name">상품명</option>
				</select>
			<input class="input"  name="keyword" required>
		<button class="btn btn-positive">검색</button>
	</form>
	</div>
            <hr>
        </div>
        <div class ="row center">
         	<table class="table table-border table-hover"  >
          		<thead>
 					<tr>
 						<th>상품카테고리</th>
 						<th>상품이름</th>
				 		<th>상품사이즈</th>
				 		<th>상품컬러</th>
				 		<th>총입고</th>
				 		<th>총출고</th>
				 		<th>현재재고</th>
				 		<th>등록</th>
 					</tr>
 				</thead>
        
           		<tbody>
				 	<c:forEach var="item" items="${itemList}">
				 		<tr>
							<td>${item.cateCode}</td>
							<td>${item.itemName }</td>
							<td>${item.itemSize}</td>
							<td>${item.itemColor}</td>
							<td>${item.invenIn}</td>
							<td>${item.invenOut}</td>
							<td>${item.itemTotalCnt}</td>
							<td>
								<a href="insert?itemNo=${item.itemNo}">
								<button class="btn btn-positive">입고/출고</button></a>
							</td>
						</tr> 	
 					</c:forEach>
 				</tbody>
       		</table>
       	
        </div>
        
        <div class="row center">

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
	<li><a href="list?p=${i}&${vo.parameter()}">${i}</a></li>
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

</div>	

</div>	
        
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>

