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
    </div>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>

