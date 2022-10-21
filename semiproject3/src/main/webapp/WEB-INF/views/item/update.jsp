<%@ page language="java" contentType="text/html; charset=UTF-8" 
		pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
   
<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="상품 수정 페이지" name="title"/>
</jsp:include>


<form action = "update" method="post" enctype ="multipart/form-data">

<input type="hidden" name="itemNo" value="${itemDto.itemNo}">

<div class ="container-600 mt-40 mb-40">

	<div class = "row center">
		<h1>상품 수정</h1>
		<hr>
	</div>
	
<div class = "row">
	<label> 카테고리
		<select name="cateCode">
			<option value="">선택</option>
			<optgroup label="OUTER">
				<option value="101">자켓</option>
				<option value="102">코트</option>
				<option value="103">가디건</option>
				<option value="104">패딩</option>
			</optgroup>
			<optgroup label="TOP">
				<option value="201">민소매</option>
				<option value="202">티셔츠</option>
				<option value="203">맨투맨</option>
				<option value="204">니트</option>
				<option value="205">블라우스</option>
			</optgroup>
			<optgroup label="PANTS">
				<option value="301">청바지</option>
				<option value="302">면바지</option>
				<option value="303">슬랙스</option>
			</optgroup>
			<optgroup label="SKIRT">
				<option value="401">숏기장</option>
				<option value="402">롱기장</option>
			</optgroup>
			<optgroup label="DRESS">
				<option value="501">원피스</option>
			</optgroup>
			<optgroup label="ACC">
				<option value="601">쥬얼리</option>
				<option value="602">모자</option>
				<option value="603">가방</option>
				<option value="604">신발</option>
				<option value="605">양말</option>
			</optgroup>
		</select>
	</label>

	<label> 색상
		<select name="itemColor">
			<option value="">선택</option>
			<option>Black</option>
			<option>White</option>
			<option>Blue</option>
			<option>Red</option>
		</select>
	</label>

	<label> 사이즈
		<select name="itemSize">
			<option value="">선택</option>
			<option>S</option>
			<option>M</option>
			<option>L</option>
			<option>XL</option>
		</select>
	</label>
	</div>
	
	<div class = "row">
	<label> 상품명
		<input name="itemName" type="text" required class = "input mt-10 w-100"  value="${itemDto.itemName}" autocomplete="off">
	</label>
	</div>
	
	<div class = "row">
	<label> 상품메모
		<input name="itemMemo" type="text" required class = "input mt-10 w-100"  autocomplete="off">
	</label>
	</div>
	
	<div class = "row">
	<label> 가격
		<input name="itemPrice" type="number" required class = "input mt-10 w-100"  autocomplete="off">
	</label>
	</div>
	
	<div class = "row w-100">
	<label> 상품 설명
		 <textarea class = "input mt-10 w-100" name="itemContent" rows="10" cols="75" required ></textarea>
	</label>
	</div>
	
	<div class = "row">
	<label> 상품 이미지
		 <input class = "input mt-10 w-100 " name="itemImage" type="file" accept=".png, .jpg">
	</label>
	</div>
	
	<div class="row right">
		<a class="btn btn-neutral" href="list">목록</a>
		<button class="btn btn-positive" type="submit">등록</button>
	</div>

</div>
</form>
	
	
	
	
	

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>