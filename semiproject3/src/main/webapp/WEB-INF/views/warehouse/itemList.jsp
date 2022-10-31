<%@ page language="java" contentType="text/html; charset=UTF-8" 
		pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="/WEB-INF/views/template/adminHeader.jsp">
	<jsp:param value="상품 입/출고 목록" name="title"/>
</jsp:include>

<div class ="container-900 mt-50 mb-50">
        

<div class="row center mb-30">
	<h1>전체 상품 현황</h1>
	<hr>
</div>
          
<div class="row center">
	<form action="itemList" method="get">
	<select class="input" name="type" required>
		<option value="cate_code">카테고리</option>
		<option value="inven_name">상품명</option>
	</select>
	<input class="input"  name="keyword" required>
	<button class="btn btn-positive">검색</button>
	</form>
</div>

<div class ="row center">
	<table class="table table-border table-hover" >
	<thead>
		<tr>
			<th>상품번호</th>
			<th>카테고리</th>
			<th>상품이름</th>
			<th>상품사이즈</th>
			<th>상품컬러</th>
	 		<th>상품수량</th>
	 		<th>상품찜수</th>
	 		<th>입/출고</th>
		</tr>	
	</thead>
	<tbody>
		<c:forEach var="inven" items="${invenList}">
		<tr>
			<td>${inven.itemNo}</td>
			<td>${inven.itemCate}</td>
			<td>${inven.itemName}</td>
			<td>${inven.itemSize}</td>
			<td>${inven.itemColor}</td>
			<td>${inven.itemTotalCnt}</td>
			<td>${inven.itemLikeCnt}</td>
			<td>
				<a class="btn btn-nuetral btn-border" href="insert?itemNo=${inven.itemNo}&itemSize=${inven.itemSize}&itemColor=${inven.itemColor}">입고/출고</a>
			</td>
		</tr> 	
		</c:forEach>
	</tbody>
</table>

</div>

<div class="row right">
 	<a class="btn btn-positive" href="invenList">상품 입출고 기록</a>
</div>
   
<!-- 페이지 네비게이터 -->
<div class="row center">
	
	<ul class="pagination">
		<li>
			<c:choose>
			<c:when test="${not vo.isFirst()}">
				<a href="itemList?p=${vo.firstBlock()}&${vo.parameter()}">
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
				<a href="itemList?p=${vo.prevBlock()}&${vo.parameter()}">
					<i class="fa-solid fa-chevron-left"></i>
				</a>
			</c:when>
			<c:otherwise>
				<a href="#"><i class="fa-solid fa-chevron-left"></i></a>
			</c:otherwise>
			</c:choose>
		</li>
		 
		<c:forEach var="i" begin="${vo.startBlock()}" end="${vo.endBlock()}" step="1">
			<li><a href="itemList?p=${i}&${vo.parameter()}">${i}</a></li>
		</c:forEach>
		
		<!-- 다음을 누르면 다음 구간의 첫 페이지로 안내 -->
		<li>
			<c:choose>
			<c:when test="${vo.hasNext()}">
				<a href="itemList?p=${vo.nextBlock()}&${vo.parameter()}">
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
				<a href="itemList?p=${vo.lastBlock()}&${vo.parameter()}">
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

