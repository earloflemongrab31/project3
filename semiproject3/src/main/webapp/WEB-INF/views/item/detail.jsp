<%@ page language="java" contentType="text/html; charset=UTF-8" 
		pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:include page="/WEB-INF/views/template/adminHeader.jsp">
    <jsp:param value="상품 상세 페이지" name="title"/>
</jsp:include>

<form action = "detail" method="post" enctype ="multipart/form-data">

<div class ="container-600 mt-50 mb-50">

	<div class = "row center mb-30">
		<h1>상품 상세 정보</h1>
			<hr>
	</div>
	
	<div class ="row">
	 	<table class="table table-border">
	 		<tbody>
	 		
	 			<tr>
	 				<td class="center" colspan="2">
						<c:forEach var="itemImageView" items="${itemImageList}">
							<c:if test="${itemImageView.imageMain == 1}">
								<img src="${pageContext.request.contextPath}/image/download/${itemImageView.imageNo}" style="width:224px; height: 301px;" >
							</c:if>
						</c:forEach>
					</td>
				</tr>
				<tr>
					<td class="center" colspan="2">
						<c:forEach var="itemImageView" items="${itemImageList}">
							<c:if test="${itemImageView.imageMain == 0}">
								<img src="${pageContext.request.contextPath}/image/download/${itemImageView.imageNo}" style="width:160px; height: 215px;">
							</c:if>
						</c:forEach>
					</td>
				</tr>
							
			
	 			<tr>
	 				<th>상품번호</th>
	 				<td>${itemDto.itemNo}</td>
	 			</tr>
	 			
	 			<tr>
	 				<th>카테고리</th>
	 				<td>${itemDto.itemCate}</td>
	 			</tr>
	 			
	 			<tr>
	 				<th>상품메모</th>
	 				<td>${itemDto.itemMemo}</td>
	 			</tr>
	 			
	 			<tr>
	 				<th>상품가격</th>
	 				<td>${itemDto.itemPrice}원</td>
	 			</tr>
	 			
	 			<tr>
	 				 <th>상품명</th>
	 				 <td>
	 				 	${itemDto.itemName}       
					</td>
	 			</tr>
	 			
	 			<tr>
	 				<th>상품내용</th>
	 				<td>
	 					<pre>${itemDto.itemContent}</pre>
	 				</td>
	 			</tr>
	 			<tr>
	 				<th>등록일</th>
	 				<td>
	 					<fmt:formatDate value="${itemDto.itemDate}" pattern="y년 M월 d일 E요일 a h시 m분 s초"/>
	 				</td>
	 			</tr>
	 			
	
	 		</tbody>
	 	</table>
	 	
	 	<div class="row right">
		<a class="btn btn-neutral" href="list">목록</a>
	 	<a class="btn btn-nuetral btn-border" href="../warehouse/detail?itemNo=${itemDto.itemNo}">재고관리</a>
		<a class="btn btn-positive" href="update?itemNo=${itemDto.itemNo}">수정하기</a>
		<a class="btn btn-negative" href="delete?itemNo=${itemDto.itemNo}">삭제하기</a>
		</div>
		
	</div>
</div>
	
	
	
	

<jsp:include page="/WEB-INF/views/template/adminFooter.jsp"></jsp:include>