<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<jsp:include page="/WEB-INF/views/template/adminHeader.jsp">
	<jsp:param value="관리자페이지" name="title"/>
</jsp:include>
<script type="text/javascript">
	$(function(){
		$(window).on("beforeunload", function(){
		    return false;
		});
		$(".btn-pass").click(function(){
		    $(window).off("beforeunload");
		    return true;
		});
	});
</script>

<form action="insert" method="post" enctype="multipart/form-data">

	<div class ="container-800 mt-50 mb-50">
	
	<div class="row center mb-30">
		<h1>상품 등록</h1>
		<hr>
	</div>
	
	<div class="row">
		<table class="table">
			<tbody>
				<tr>
					<td class="w-25">카테고리</td>
					<td>
				        <select class="input input-border" name="main">
				            <option>대분류</option>
				            <option disabled>------</option>

				            <option data-main="outer">OUTER</option>
				            <option data-main="top">TOP</option>
				            <option data-main="pants">PANTS</option>
				            <option data-main="skirt">SKIRT</option>
				            <option data-main="dress">DRESS</option>
				            <option data-main="acc">ACC</option>
				        </select>
				        <select class="input input-border" name="itemCate">
				            <option>소분류</option>
				            <option disabled>------</option>
				
				            <option class="option-hide outer" value="101">자켓</option>
				            <option class="option-hide outer" value="102">코트</option>
				            <option class="option-hide outer" value="103">가디건</option>
				            <option class="option-hide outer" value="104">패딩</option>
				
				            <option class="option-hide top" value="201">민소매</option>
				            <option class="option-hide top" value="202">티셔츠</option>
				            <option class="option-hide top" value="203">맨투맨</option>
				            <option class="option-hide top" value="204">니트</option>
				            <option class="option-hide top" value="205">블라우스</option>
				
				            <option class="option-hide pants" value="301">청바지</option>
				            <option class="option-hide pants" value="302">면바지</option>
				            <option class="option-hide pants" value="303">슬랙스</option>
				
				            <option class="option-hide skirt" value="401">치마</option>
				
				            <option class="option-hide dress" value="501">원피스</option>
				
				            <option class="option-hide acc" value="601">쥬얼리</option>
				            <option class="option-hide acc" value="602">모자</option>
				            <option class="option-hide acc" value="603">가방</option>
				            <option class="option-hide acc" value="604">신발</option>
				            <option class="option-hide acc" value="605">양말</option>
				        </select>
					</td>
				</tr>
<!-- 				<tr> -->
<!-- 					<td>색상</td> -->
<!-- 					<td> -->
<!-- 						<select name="itemColor"> -->
<!-- 							<option value="">선택</option> -->
<!-- 				            <option disabled>------</option> -->
<!-- 							<option>Black</option> -->
<!-- 							<option>White</option> -->
<!-- 							<option>Blue</option> -->
<!-- 							<option>Red</option> -->
<!-- 						</select> -->
<!-- 					</td> -->
<!-- 				</tr> -->
<!-- 				<tr> -->
<!-- 					<td>사이즈</td> -->
<!-- 					<td> -->
<!-- 						<select name="itemSize"> -->
<!-- 							<option value="">선택</option> -->
<!-- 				            <option disabled>------</option> -->
<!-- 							<option>S</option> -->
<!-- 							<option>M</option> -->
<!-- 							<option>L</option> -->
<!-- 							<option>XL</option> -->
<!-- 						</select> -->
<!-- 					</td> -->
<!-- 				</tr> -->
				<tr>
					<td>상품명</td>
					<td>
						<input name="itemName" type="text" required
							class="input w-100" autocomplete="off">
					</td>
				</tr>
				<tr>
					<td>상품 요약설명</td>
					<td>
						<input name="itemMemo" type="text" required
							class="input w-100" autocomplete="off">
					</td>
				</tr>
				<tr>
					<td>가격</td>
					<td>
						<input name="itemPrice" type="number" required
							class="input w-100" autocomplete="off">
					</td>
				</tr>
				<tr valign="middle">
					<td colspan="2">상품 상세설명</td>
				</tr>
				<tr>
					<td colspan="2">
						<textarea class="input w-100 content"
							name="itemContent" rows="10" cols="75" required></textarea>
					</td>
				</tr>
				<tr>
					<!-- 이미지 첨부파일 -->
					<td>대표 이미지</td>
					<td>
						<input class="input w-100"
							name="mainImage" type="file" accept=".png, .jpg" required>
					</td>
				</tr>
				<tr>
					<td>상품 이미지</td>
					<td>
						<input class="input w-100 "
							name="itemImage" type="file" accept=".png, .jpg" multiple>
					</td>
				</tr>
			</tbody>
			<tfoot>
				<tr class="right">
					<td colspan="2">
						<a class="btn btn-neutral btn-border" href="list">목록</a>
						<button class="btn btn-positive btn-pass" type="submit">등록</button>
					</td>
				</tr>
			</tfoot>
		</table>
	</div>
	
	</div>
	

</form>

<jsp:include page="/WEB-INF/views/template/adminFooter.jsp"></jsp:include>