<%@ page language="java" contentType="text/html; charset=UTF-8" 
      pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:include page="/WEB-INF/views/template/adminHeader.jsp">
   <jsp:param value="입출고 상태 페이지" name="title"/>
</jsp:include>

<div class ="container-900 mt-50 mb-50">
        
<div class="row center">
	<h1>상품 입/출고 기록</h1>
	<hr>
</div>

<div class="row center">
<form action="invenList" method="get">
	<select class="input" name="type" required>
		<option value="item_cate">카테고리</option>
		<option value="item_name">상품명</option>
		<option value="inven_inout">입고/출고</option>
		<option value="inven_name">회사명</option>
	</select>
	<input class="input"  name="keyword" required>
	<button class="btn btn-positive">검색</button>
</form>
</div>
<div class ="row center">
        <table class="table table-border" >
          <thead>
      <tr>
      	<th>입/출고번호</th>
         <th>카테고리</th>
         <th>상품명</th>
         <th>상품사이즈</th>
         <th>상품색상</th>
         <th>입고/출고</th>
         <th>날짜</th>
         <th>회사명</th>
         <th>전화번호</th>
         <th>상품상태</th>
         <th>수량</th>
      </tr>
   </thead>
   <tbody>
      <c:forEach var="invenList" items="${invenList}">
         <tr>
         	<td>${invenList.invenNo}</td>
            <td>${invenList.itemCate}</td>
            <td>${invenList.itemName}</td>
            <td>${invenList.itemSize}</td>
            <td>${invenList.itemColor}</td>
            <td>${invenList.invenInout}</td>
            <td>${invenList.invenDate}</td>
            <td>${invenList.invenName}</td>
            <td>${invenList.invenPhone}</td>
            <td>${invenList.invenStatus}</td>
            <td>${invenList.invenQuantity}</td>
         </tr>
      </c:forEach>
   </tbody>
</table>
</div>
 

<div class="row right">
 	<a class="btn btn-positive" href="itemList">전체 상품 현황</a>
</div>

<div class="row center">

<!-- 페이지 네비게이터 -->
<div class="row center">

<ul class="pagination">
<li>
	<c:choose>
		<c:when test="${not vo.isFirst()}">
			<a href="invenList?p=${vo.firstBlock()}&${vo.parameter()}">
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
			<a href="invenList?p=${vo.prevBlock()}&${vo.parameter()}">
				<i class="fa-solid fa-chevron-left"></i>
			</a>
		</c:when>
		<c:otherwise>
			<a href="#"><i class="fa-solid fa-chevron-left"></i></a>
		</c:otherwise>
	</c:choose>
</li>
 
<c:forEach var="i" begin="${vo.startBlock()}" end="${vo.endBlock()}" step="1">
	<li><a href="invenList?p=${i}&${vo.parameter()}">${i}</a></li>
</c:forEach>

<!-- 다음을 누르면 다음 구간의 첫 페이지로 안내 -->
<li>
	<c:choose>
		<c:when test="${vo.hasNext()}">
			<a href="invenList?p=${vo.nextBlock()}&${vo.parameter()}">
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
			<a href="invenList?p=${vo.lastBlock()}&${vo.parameter()}">
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

</div>
  
</body>
</html>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>