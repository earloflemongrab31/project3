<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/WEB-INF/views/template/adminHeader.jsp">
	<jsp:param value="재고관리" name="title"/>
</jsp:include>

<div class="container-800 mt-50 mb-50">

<div class="row center mb-30">
	<h1>No.${param.itemNo} 상품 옵션별 재고</h1>
</div>
<div class="row right">
 	<a class="btn btn-positive" href="itemList">전체 상품 현황</a>
</div>
<div class="row center mb-30">
<table class="table table-border">
	<thead>
		<tr>
			<th>카테고리번호</th>
			<td>${itemDto.itemCate}</td>
			<th>상품명</th>
			<td>${itemDto.itemName}</td>
		</tr>
	</thead>
</table>
</div>

<div class="row center">
<table class="table table-border">
	<thead>
		<tr>
			<th>사이즈 / 컬러</th>
			<th>재고</th>
			<th>입/출고</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach var="itemCntDto" items="${itemCntList}">
			<c:if test="${itemCntDto.itemTotalCnt > 0}">
			<tr>
				<td>${itemCntDto.itemSize} / ${itemCntDto.itemColor}</td>
				<td>${itemCntDto.itemTotalCnt}</td>
				<td>
					<a class="btn btn-nuetral btn-border" 
						href="insert?itemNo=${itemCntDto.itemNo}&itemSize=${itemCntDto.itemSize}&itemColor=${itemCntDto.itemColor}">입고/출고</a>
				</td>
			</tr>
			</c:if>
		</c:forEach>
	</tbody>
	<tfoot>
		<tr>
			<td colspan="3" class="right">
				<a class="btn btn-nuetral btn-border" href="insert?itemNo=${param.itemNo}">
					새 옵션 입고 등록
				</a>		
			</td>
		</tr>
	</tfoot>
</table>
</div>

</div>

<jsp:include page="/WEB-INF/views/template/adminFooter.jsp"></jsp:include>