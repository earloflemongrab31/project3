<%@ page language="java" contentType="text/html; charset=UTF-8" 
		pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
   
<jsp:include page="/WEB-INF/views/template/header.jsp">
    <jsp:param value="주소목록" name="title"/>
</jsp:include>

<script src="/confirm-link.js"></script> 
<script src="/checkbox.js"></script> 
<script>




</script>

<form action="list" method="post" >
<div class ="container-800 mt-40 mb-40">

	<div class = "row center">
		<h1>주소목록</h1>
		<hr>
	</div>



	<div class = "row">
		<table class="table table-hover table-border">
			<thead>
				<tr>
					<th>
						<input type="checkbox" class="check-all">
					</th>
					
					<th>번호</th>
					<th width="20%">배송지명</th>
					<th width="10%">우편번호</th>
					<th width="35%">기본주소</th>
					<th width="25%">상세주소</th>
				</tr>
			</thead>
				
			<tbody align="center">
				<c:forEach var="addressDto" items="${list}">
					<tr>
						<td>
							<input type="checkbox" class="check-item" name="addressNo" value="${addressDto.addressNo}">
						</td>
						<td>	${addressDto.addressNo}</td>
						<td>	${addressDto.addressName}</td>
						<td>	${addressDto.addressPost}</td>
						<td>${addressDto.addressHost}</td>
						<td>${addressDto.addressDetailHost}</td>
				
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>




	<div class="row right">
		<a class="btn btn-positive" href="insert">새주소 등록</a>
		<a class="btn btn-positive" href="edit?addressNo=${addressDto.addressNo}">수정하기</a>
		<a class="btn btn-negative" href="delete?addressNo=${addressDto.addressNo}">삭제하기</a>
	</div>

</div>
</form>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>