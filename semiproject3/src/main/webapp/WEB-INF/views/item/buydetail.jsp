<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="상품 상세 페이지" name="title" />
</jsp:include>


<form action="insert" method="post" enctype="multipart/form-data">

	<div class="container-600 mt-40 mb-40">

		<div class="row center">
			<h1>상품 상세 정보</h1>
		</div>

		<div class="row">
			<table class="table table-border">
				<tbody>

					<tr>
						<td><img src="download?itemNo=${itemDto.itemNo}" width="200">
					</tr>
					</td>

					<tr>
						<th>상품번호</th>
						<td>${itemDto.itemNo}</td>
					</tr>

					<tr>
						<th>카테고리</th>
						<td>${itemDto.cateCode}</td>
					</tr>

					<tr>
						<th>상품메모</th>
						<td>${itemDto.itemMemo}</td>
					</tr>

					<tr>
						<th>상품번호</th>
						<td>${itemDto.itemNo}</td>
					</tr>

					<tr>
						<th>상품명</th>
						<td>${itemDto.itemName} <%-- 	 <!-- 좋아요 하트 -->
				         <c:if test="${isLike == null}">
				         ♥
				         </c:if>
				         
				         <c:if test="${isLike == true}">
				            <a href="like?itemNo=${itemDto.itemNo}">♥</a>
				         </c:if>
				         
				         <c:if test="${isLike == false}">
				            <a href="like?itemNo=${itemDto.itemNo}">♡</a>
				         </c:if>
				            
				         <!-- 좋아요 개수 출력 -->
				         <c:if test="${itemDto.itemLikeCnt > 0}">
				          ${itemDto.itemLikeCnt}개
				          
				         </c:if> --%>

						</td>
					</tr>

					<tr>
						<th>상품내용</th>
						<td><pre>${itemDto.itemContent}</pre></td>
					</tr>

				</tbody>
				<tfoot>
					<tr>
						<td colspan="2" align="right"><a href="#">구매하기</a> <a
							href="#">장바구니담기</a> <a href="list">목록으로</a></td>
					</tr>
				</tfoot>
			</table>
		</div>






		<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>