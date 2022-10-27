<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="상품 상세 페이지" name="title" />
</jsp:include>

<form action="/orders/insert" method="post">
<!-- <form action="/cart/insert" method="post"> -->

<div class="container-1000 mt-40 mb-40">

<!-- <div class="row"> -->
<%-- ${itemDto} --%>
<!-- </div> -->
<!-- <div class="row"> -->
<%-- ${loginId} --%>
<!-- </div> -->

<div class="row">
	<table class="table">
		<tbody>
			<tr>
				<th class="w-50" style="height:480px;" rowspan="4">
					<img src="/image/download/${itemDto.imageNo}" width="200" >
					<c:forEach var="itemDto" items="${buylist}">
					<c:if test="${itemDto.imageMain == 0}">
						<img src="/image/download/${itemDto.imageNo}" width="100" >
					</c:if>
					</c:forEach>
				</th>
				<th colspan="2">
					<input type="hidden" name="customerId" value="${loginId}">
					<input type="hidden" name="itemNo" value="${itemDto.itemNo}">
					<input type="text" name="itemName" value="${itemDto.itemName}" readonly class="input input-none">
				</th>
			</tr>
			<tr>
				<th>Price</th>
				<td>
					<fmt:formatNumber value="${itemDto.itemPrice}" pattern="#,##0원"></fmt:formatNumber>
					<input type="hidden" name="itemPrice" value="${itemDto.itemPrice}" readonly>
				</td>
			<tr>
				<th>Color / Size</th>
				<td>
					<select class="input w-100" name="itemColor">
						<option value="">선택</option>
						<option>Black</option>
						<option>White</option>
						<option>Blue</option>
						<option>Red</option>
					</select>
					<select class="input w-100" name="itemSize">
						<option value="">선택</option>
						<option>S</option>
						<option>M</option>
						<option>L</option>
						<option>XL</option>
					</select>
				</td>
			</tr>
			<tr>
				<th>Qnty</th>
				<td>
					<input class="input w-100" type="number" name="itemCnt">
				</td>
			</tr>
			<tr>
				<td class="right">
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
				<td colspan="2" align="right">
					<a href="/review/insert?itemNo=${itemDto.itemNo}">리뷰달기</a>
					<button class="btn btn-positive" type="submit">구매하기</button>
					<button class="btn btn-positive" type="submit">장바구니${isCart}</button>	 
					<a href="buylist">목록으로</a>
				</td>
			</tr>
			<tr>
				<th colspan="3">${itemDto.itemMemo}</th>
			</tr>
			<tr>
				<th colspan="3">${itemDto.itemContent}</th>
			</tr>
		</tbody>
	</table>
</div>
			
		<div class="flexbox">
			<div class=" w-50 center item item-detail">
				<span>상세보기</span>
			</div>
			<div class="w-50 center item item-review">
				<span>리뷰보기</span>
			</div>
		</div>
		
		<div class = "row center mb-30 review">
			<div class = "row center mb-30">
				<h4>리뷰</h4>
				<hr>
			</div>
			
			<div class="row center">
				<c:choose>
					<c:when test="${reviewList.isEmpty()}">
					<h4 style="padding-left:20px">
					 		<span>해당 상품의 리뷰가 없습니다</span>
					</h4>
					</c:when>
					<c:otherwise>
					<table class="table">
						<thead>
							<tr>
								<th>별점</th>
								<th>포장상태</th>
								<th>배송상태</th>
								<th>회원아이디</th>
								<th>작성시간</th>
								<th>주문한상품명</th>
								<th>내용</th>
								<th>사진</th>
								<th>신고</th>
							</tr>
						</thead>
					<tbody align="center" >	
						<c:forEach var="list" items="${reviewList}">
					<tr>
						<td>${list.reviewStar}/5</td>
					<td>${list.reviewPackaging}</td>
					<td>${list.reviewShipping}</td>
					<td>${list.customerId}</td>
					<td>${list.reviewDate}</td>
					<td>주문상품(구매테이블구현시)</td>
					<td>${list.reviewContent}</td>
					<td>
						<img src="/reviewImage/download/${list.imageNo}" width="100" ></td>
					<td>
					<button type="submit">
						<a href="/review/report?reviewNo=${list.reviewNo}">신고</a>
						</button>
						</td>
					</tr>
					</c:forEach>
				</tbody>
			</table>
			</c:otherwise>
			</c:choose>
		</div>
	</div>
</div>
</form>


<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>