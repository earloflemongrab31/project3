<%@ page language="java" contentType="text/html; charset=UTF-8" 
		pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
   
<jsp:include page="/WEB-INF/views/template/header.jsp">
    <jsp:param value="상품 목록" name="title"/>
</jsp:include>

<div class = "container-800">

	<div class = "row conter">
		<h1>상품 목록</h1>
	</div>
	
	<div class ="row">
		<table class = "table tabel-border table-hover">
			<thead>
				<tr>
					<th>상품번호</th>
					<th>상품명</th>
					<th>가격</th>
					<th>상품메모</th>
					<th>좋아요개수</th>
				</tr>
			</thead>
			
			<tbody align = "center">
				<c:forEach var="itemDto" items="${list}">
					<tr>
						<td>
							<td>${itemDto.itemNo}</td>
							<td>
								<a href = "detail?itemNo=${itemDto.itemNo}">
									${itemDto.itemName}
								</a>
							</td>
							<td>${itemDto.itemPrice}</td>
							<td>${itemDto.itemMemo}</td>
							<td>${itemDto.itemLikeCnt}</td>
							<td>${itemDto.itemFile}</td>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>


</div>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>