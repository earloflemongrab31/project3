<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="상품 상세 페이지" name="title" />
</jsp:include>
<h5>${itemDto}</h5>
<h5>${buylist}</h5>
<form action="/orders/insert" method="post">
	<div class="container-600 mt-40 mb-40">

		<div class="row center">
			<h1>${itemDto.itemName}</h1>
		</div>

		<div class="row">
			<table class="table table-border">
				<tbody>
				<tr>
						<th colspan="2">
							<img src="/image/download/${itemDto.imageNo}" width="200" >
						</th>
				</tr>
				<tr>
					<c:forEach var="itemDto" items="${buylist}">
						<c:if test="${itemDto.imageMain == 0}">
							<th colspan="2">
								<img src="/image/download/${itemDto.imageNo}" width="100" >
							</th>
						</c:if>
					</c:forEach>
				</tr>
				<tr>
					<th colspan="2">${itemDto.itemMemo}</th>
				</tr>
				<tr>
					<th colspan="2">${itemDto.itemContent}</th>
				</tr>
				<tr>
					<th>Price</th>
					<td>
						<fmt:formatNumber value="${itemDto.itemPrice}" pattern="#,##0 원"></fmt:formatNumber>
					</td>
				</tr>
				<tr>
					<th>Color</th>
					<td>
						<select class="input w-100" name="itemColor">
							<option value="">선택</option>
							<c:forEach var="itemDto" items="${buylist}">
								<option>${itemDto.itemColor}</option>
							</c:forEach>
						</select>
					</td>
				</tr>
				<tr>
					<th>Size</th>
					<td>
						<select class="input w-100" name="itemSize">
							<option value="">선택</option>
							<c:forEach var="itemDto" items="${buylist}">
								<option>${itemDto.itemSize}</option>
							</c:forEach>
						</select>
					</td>
				</tr>
				<tr>
					<th>Qnty</th>
					<td>
						<input class="input w-100" type="number" name="itemCnt" min="0" max="${itemDto.itemTotalCnt}">
					</td>
				</tr>
				<tr>
					<th>찜하기</th>
					<td>
					${itemDto.itemLikeCnt}
					
						<c:if test="${isLike == null}">
							♥
						</c:if>
						<c:if test="${isLike == true}">
							<a href="like?itemNo=${itemDto.itemNo}">♥</a>
						</c:if>
						<c:if test="${isLike == false}">
							<a href="like?itemNo=${itemDto.itemNo}">♡</a>
						</c:if>
					</td>
				</tr>
			</tbody>
				<tfoot>
					<tr>
						<td colspan="2" align="right">

						<a href="/review/insert?itemNo=${itemDto.itemNo}">리뷰달기</a>

						<button class="btn btn-positive" type="submit">구매하기</button>

						<a href="cart?itemNo=${itemDto.itemNo}">장바구니${isCart}</a>	 
						<a href="buylist">목록으로</a>
					</td>
					</tr>
				</tfoot>
			</table>
			
			<!--리뷰테이블 구현중 -->
			<table width="1000">
			<thead>
				<tr>
					<th>회원아이디</th>
					<th>작성시간</th>
					<th>주문한상품명</th>
					<th>별점</th>
					<th>포장상태</th>
					<th>배송상태</th>
					<th>내용</th>
					<th>사진</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="list" items="${reviewList}">
					<tr>
						<td>
						${list.customerId}/
						<a href="/review/report?reviewNo=${list.reviewNo}">신고</a>
						</td>
						<td>${list.reviewDate}</td>
						<td>주문상품(구매테이블구현시)</td>
						<td>${list.reviewStar}/5</td>
						<td>${list.reviewPackaging}</td>
						<td>${list.reviewShipping}</td>
						<td>${list.reviewContent}</td>
						<td><img src="/reviewImage/download/${list.imageNo}" width="100" ></td>
						
					</tr>
				</c:forEach>
				
			</tbody>
		</table>
		</div>


</div>
</form>


		<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>