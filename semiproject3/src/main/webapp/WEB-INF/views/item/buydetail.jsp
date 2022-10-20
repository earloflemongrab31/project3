<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="상품 상세 페이지" name="title" />
</jsp:include>

	<div class="container-600 mt-40 mb-40">

		<div class="row center">
			<h1>${itemDto.itemName}</h1>
		</div>

		<div class="row">
			<table class="table">
				<tbody>
				<tr>
					<th colspan="2">
						<img src="/image/download/${itemDto.imageNo}" width="200" >
					</th>
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
						<select name="itemColor">
							<option value="">선택</option>
							<option>Black</option>
							<option>White</option>
							<option>Blue</option>
							<option>Red</option>
						</select>
					</td>
				</tr>
				<tr>
					<th>Size</th>
					<td>
						<select name="itemSize">
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
						<input class="w-20" type="number" name="itemTotalCnt" min="0">
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
						<td colspan="2" align="right"><a href="#">구매하기</a> <a
							href="#">장바구니담기</a> <a href="buylist">목록으로</a></td>
					</tr>
				</tfoot>
			</table>
		</div>






		<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>