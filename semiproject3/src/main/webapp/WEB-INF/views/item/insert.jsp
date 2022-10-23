<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<jsp:include page="/WEB-INF/views/template/adminHeader.jsp">
	<jsp:param value="관리자 상품 등록" name="title"/>
</jsp:include>


<form action="insert" method="post" enctype="multipart/form-data">

	<div class ="container-600 mt-50 mb-50">
	
	<div class="row center mb-30">
		<h1>상품 등록</h1>
		<hr>
	</div>
	
	<div class="row">
		<table class="table">
			<tbody>
				<tr>
					<td>카테고리</td>
					<td>
				        <select name="main">
				            <option>대분류</option>
				            <option>------</option>

				            <option data-main="outer">OUTER</option>
				            <option data-main="top">TOP</option>
				            <option data-main="pants">PANTS</option>
				            <option data-main="skirt">SKIRT</option>
				            <option data-main="dress">DRESS</option>
				            <option data-main="acc">ACC</option>
				        </select>
				        <select name="cateCode">
				            <option>소분류</option>
				            <option>------</option>
				
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
				
				            <option class="option-hide skirt" value="401">숏기장</option>
				            <option class="option-hide skirt" value="402">롱기장</option>
				
				            <option class="option-hide dress" value="501">원피스</option>
				
				            <option class="option-hide acc" value="601">쥬얼리</option>
				            <option class="option-hide acc" value="602">모자</option>
				            <option class="option-hide acc" value="603">가방</option>
				            <option class="option-hide acc" value="604">신발</option>
				            <option class="option-hide acc" value="605">양말</option>
				        </select>
					</td>
				</tr>
			</tbody>
		</table>
	</div>
	<div class="row">
		<label> 색상 <select name="itemColor">
				<option value="">선택</option>
				<option>Black</option>
				<option>White</option>
				<option>Blue</option>
				<option>Red</option>
		</select>
		</label>
	</div>
	<div class="row">
		<label> 사이즈 <select name="itemSize">
				<option value="">선택</option>
				<option>S</option>
				<option>M</option>
				<option>L</option>
				<option>XL</option>
		</select>
		</label>
	</div>	

	<div class="row">
		<label> 상품명 <input name="itemName" type="text" required
			class="input mt-10 w-100" autocomplete="off">
		</label>
	</div>

	<div class="row">
		<label> 상품메모 <input name="itemMemo" type="text" required
			class="input mt-10 w-100" autocomplete="off">
		</label>
	</div>

	<div class="row">
		<label> 가격 <input name="itemPrice" type="number" required
			class="input mt-10 w-100" autocomplete="off">
		</label>
	</div>

	<div class="row w-100">
		<label> 상품 설명 <textarea class="input mt-10 w-100"
				name="itemContent" rows="10" cols="75" required></textarea>
		</label>
	</div>
	
	<!-- 이미지 첨부파일 -->
	<div class="row">
		<label> 상품 이미지 <input class="input mt-10 w-100 "
			name="itemImage" type="file" accept=".png, .jpg" multiple>
		</label>
	</div>

	<div class="row right">
		<a class="btn btn-neutral" href="list">목록</a>
		<button class="btn btn-positive" type="submit">등록</button>
	</div>

	</div>
</form>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>