<%@ page language="java" contentType="text/html; charset=UTF-8" 
		pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
   
<jsp:include page="/WEB-INF/views/template/header.jsp">
    <jsp:param value="byOrder" name="title"/>
</jsp:include>




<div class ="container-600 mt-40 mb-40">

	<div class = "row center">
		<h1>기본배송지</h1>
			<hr>
	</div>
	
<div class ="row">
	
	<div class = "row">
		<h2>기본 배송지</h2>
	</div>
	
	 	<table class="table table-border">
	 		<tbody>
	 			
	 			<tr>
	 				<th>수령인</th>
	 				<td>${centerDto.centerNo}</td>
	 			</tr>
				
				<tr>
					<th>휴대전화</th>
					<td>${centerDto.centerTitle}</td>
				</tr>
				
				<tr>
					<th>배송지 주소</th>
					<td>${centerDto.customerId}</td>
				</tr>

		 	</tbody>
	 	</table>
	 </div>
	 
	 
	
			 
	 	

	 

	

	 
	 	<div class="row right">
		<a class="btn btn-positive" href="edit?centerNo=${centerDto.centerNo}">답변등록</a>
		<a class="btn btn-negative" href="delete?centerNo=${centerDto.centerNo}">삭제하기</a>
		<a class="btn btn-neutral" href="list">목록</a>
		</div>
		
	</div>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>