<%@ page language="java" contentType="text/html; charset=UTF-8" 
		pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
   
<jsp:include page="/WEB-INF/views/template/adminHeader.jsp">
	<jsp:param value="상품 수정 페이지" name="title"/>
</jsp:include>


<form action = "update" method="post" enctype ="multipart/form-data">

<input type="hidden" name="itemNo" value="${itemDto.itemNo}">

<div class ="container-600 mt-50 mb-50">

	<div class = "row center mb-30">
		<h1>상품 수정</h1>
		<hr>
	</div>
	<input type="hidden" name="itemCate" value="${itemDto.itemCate}">
	
	<div class = "row">
		<table class="table">
			<tbody>
<!-- 				<tr> -->
<!-- 					<td class="w-25">카테고리</td> -->
<!-- 					<td> -->
<!-- 				        <select name="main"> -->
<!-- 				            <option>대분류</option> -->
<!-- 				            <option disabled>------</option> -->
				            
<!-- 				            <option data-main="outer">OUTER</option> -->
<!-- 				            <option data-main="top">TOP</option> -->
<!-- 				            <option data-main="pants">PANTS</option> -->
<!-- 				            <option data-main="skirt">SKIRT</option> -->
<!-- 				            <option data-main="dress">DRESS</option> -->
<!-- 				            <option data-main="acc">ACC</option> -->
<!-- 				        </select> -->
				        
<!-- 				        <select name="itemCate"> -->
<!-- 				            <option>소분류</option> -->
<!-- 				            <option disabled>------</option> -->
				
<!-- 				            <option class="option-hide outer" value="101">자켓</option> -->
<!-- 				            <option class="option-hide outer" value="102">코트</option> -->
<!-- 				            <option class="option-hide outer" value="103">가디건</option> -->
<!-- 				            <option class="option-hide outer" value="104">패딩</option> -->
				
<!-- 				            <option class="option-hide top" value="201">민소매</option> -->
<!-- 				            <option class="option-hide top" value="202">티셔츠</option> -->
<!-- 				            <option class="option-hide top" value="203">맨투맨</option> -->
<!-- 				            <option class="option-hide top" value="204">니트</option> -->
<!-- 				            <option class="option-hide top" value="205">블라우스</option> -->
				
<!-- 				            <option class="option-hide pants" value="301">청바지</option> -->
<!-- 				            <option class="option-hide pants" value="302">면바지</option> -->
<!-- 				            <option class="option-hide pants" value="303">슬랙스</option> -->
				
<!-- 				            <option class="option-hide skirt" value="401">숏기장</option> -->
<!-- 				            <option class="option-hide skirt" value="402">롱기장</option> -->
				
<!-- 				            <option class="option-hide dress" value="501">원피스</option> -->
				
<!-- 				            <option class="option-hide acc" value="601">쥬얼리</option> -->
<!-- 				            <option class="option-hide acc" value="602">모자</option> -->
<!-- 				            <option class="option-hide acc" value="603">가방</option> -->
<!-- 				            <option class="option-hide acc" value="604">신발</option> -->
<!-- 				            <option class="option-hide acc" value="605">양말</option> -->
<!-- 				        </select> -->
<!-- 					</td> -->
<!-- 				</tr> -->
<!-- 				<tr> -->
<!-- 					<td>색상</td> -->
<!-- 					<td> -->
<!-- 						<select name="itemColor"> -->
<!-- 						<option value="">선택</option> -->
<!-- 			            <option disabled>------</option> -->
<%-- 							<c:choose> --%>
<%-- 							<c:when test="${itemDto.itemColor == 'Black'}"> --%>
<!-- 								<option selected>Black</option> -->
<!-- 								<option>White</option> -->
<!-- 								<option>Blue</option> -->
<!-- 								<option>Red</option> -->
<%-- 							</c:when> --%>
<%-- 							<c:when test="${itemDto.itemColor == 'White'}"> --%>
<!-- 								<option>Black</option> -->
<!-- 								<option selected>White</option> -->
<!-- 								<option>Blue</option> -->
<!-- 								<option>Red</option> -->
<%-- 							</c:when> --%>
<%-- 							<c:when test="${itemDto.itemColor == 'Blue'}"> --%>
<!-- 								<option>Black</option> -->
<!-- 								<option>White</option> -->
<!-- 								<option selected>Blue</option> -->
<!-- 								<option>Red</option> -->
<%-- 							</c:when> --%>
<%-- 							<c:otherwise> --%>
<!-- 								<option>Black</option> -->
<!-- 								<option>White</option> -->
<!-- 								<option>Blue</option> -->
<!-- 								<option selected>Red</option> -->
<%-- 							</c:otherwise> --%>
<%-- 						</c:choose> --%>
<!-- 						</select> -->
<!-- 					</td> -->
<!-- 				</tr> -->
<!-- 				<tr> -->
<!-- 					<td>사이즈</td> -->
<!-- 					<td> -->
<!-- 						<select name="itemSize"> -->
<!-- 						<option value="">선택</option> -->
<!-- 			            <option disabled>------</option> -->
<%-- 						<c:choose> --%>
<%-- 							<c:when test="${itemDto.itemSize == 'S'}"> --%>
<!-- 								<option selected>S</option> -->
<!-- 								<option>M</option> -->
<!-- 								<option>L</option> -->
<!-- 								<option>XL</option> -->
<%-- 							</c:when> --%>
<%-- 							<c:when test="${itemDto.itemSize == 'M'}"> --%>
<!-- 								<option>S</option> -->
<!-- 								<option selected>M</option> -->
<!-- 								<option>L</option> -->
<!-- 								<option>XL</option> -->
<%-- 							</c:when> --%>
<%-- 							<c:when test="${itemDto.itemSize == 'L'}"> --%>
<!-- 								<option>S</option> -->
<!-- 								<option>M</option> -->
<!-- 								<option selected>L</option> -->
<!-- 								<option>XL</option> -->
<%-- 							</c:when> --%>
<%-- 							<c:otherwise> --%>
<!-- 								<option>S</option> -->
<!-- 								<option>M</option> -->
<!-- 								<option>L</option> -->
<!-- 								<option selected>XL</option> -->
<%-- 							</c:otherwise> --%>
<%-- 						</c:choose> --%>
<!-- 						</select> -->
<!-- 					</td> -->
<!-- 				</tr> -->
				<tr>
					<td>상품명</td>
					<td>
						<input name="itemName" type="text" required value="${itemDto.itemName}"
							class="input w-100" autocomplete="off">
					</td>
				</tr>
				<tr>
					<td>상품 요약설명</td>
					<td>
						<input name="itemMemo" type="text" required value="${itemDto.itemMemo}"
							class="input w-100" autocomplete="off">
					</td>
				</tr>
				<tr>
					<td>가격</td>
					<td>
						<input name="itemPrice" type="number" required value="${itemDto.itemPrice}"
							class="input w-100" autocomplete="off">
					</td>
				</tr>
				<tr valign="middle">
					<td>상품 상세설명</td>
					<td>
						<textarea class="input w-100 fix-size"
							name="itemContent" rows="10" cols="75" required>${itemDto.itemContent}</textarea>
					</td>
				</tr>
				<tr>
					<!-- 이미지 첨부파일 -->
					<td>상품 이미지</td>
					<td>
						<input class="input w-100"
							name="itemImage" type="file" accept=".png, .jpg" multiple>
					</td>
				</tr>
			</tbody>
			<tfoot>
				<tr class="right">
					<td colspan="2">
						<a class="btn btn-neutral" href="list">목록</a>
						<button class="btn btn-positive" type="submit">수정</button>
					</td>
				</tr>
			</tfoot>
		</table>
	</div>
</div>
</form>
	
	
	
	
	

<jsp:include page="/WEB-INF/views/template/adminFooter.jsp"></jsp:include>