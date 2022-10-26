<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<jsp:include page="/WEB-INF/views/template/adminHeader.jsp">
    <jsp:param value="명함 목록" name="title"/>
</jsp:include>

<style>
td, th {
  text-align : center;
  vertical-align : middle;
}
</style>


<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class ="container-900 mt-40">

	<div class = "row center mb-30">
		<h1>협력사 명함 목록</h1>
		<hr>
	</div>
	
	<div class="row">
		<table class="table table-hover table-border">
			<thead>
				<tr>
					<th>협력사</th>
					<th width="70%">이미지</th>
				</tr>
			</thead>
			<tbody align="center" >	
				<c:forEach var="cardDto" items="${list}">
					<tr>
						<td>${cardDto.cardName}</td>
						<td>
							<a href="download?cardNo=${cardDto.cardNo}">
							<img src="download?cardNo=${cardDto.cardNo}" width="100" height="100">
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		
		<div class="row right">
		<a href="list"><button  class="btn btn-positive" type="submit">협력사목록</button></a>
		</div>
		
	</div>



<jsp:include page="/WEB-INF/views/template/adminFooter.jsp"></jsp:include> 
    