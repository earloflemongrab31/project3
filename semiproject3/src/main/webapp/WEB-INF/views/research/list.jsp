<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<jsp:include page="/WEB-INF/views/template/adminHeader.jsp">
    <jsp:param value="설문조사 결과" name="title"/>
</jsp:include>

<style>
td, th {
  text-align : center;
  vertical-align : middle;
}
</style>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class ="container-1200 mt-50 mb-50">

	<div class = "row center mb-30">
		<h1>RESEARCH</h1>
		<hr>
	</div>
	
	<div class="row">
		<table class="table table-border">
			<thead>
				<tr>
					<th width="5%">번호</th>
					<th width="8%">아이디</th>
					<th width="5%">성별</th>
					<th width="5%">나이</th>
					<th width="10%">사이트경로</th>
					<th width="9%">관심물건</th>
					<th width="9%">장점</th>
					<th width="15%">만족도</th>
					<th width="10%">지불방식</th>
					<th width="12%">구매목적</th>
					<th width="12%">불편사항</th>
					<th width="12%">기타</th>
				</tr>
			</thead>
			<tbody align="center">	
				<c:forEach var="researchDto"  items="${researchList}">
					<tr>
						<td>${researchDto.researchNumber}</td>
						<td>${researchDto.researchCustomerId}</td>
						<td>${researchDto.researchSex}</td>
						<td>${researchDto.researchAge}</td>
						<td>${researchDto.researchPath}</td>
						<td>${researchDto.researchInterest}</td>
						<td>${researchDto.researchBest}</td>
						<td>${researchDto.researchSatisfaction}</td>
						<td>${researchDto.researchPayment}</td>
						<td>${researchDto.researchPurpose}</td>
						<td>${researchDto.researchComplain}</td>
						<td>${researchDto.researchIdea}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>

</div>

</div>
<jsp:include page="/WEB-INF/views/template/adminFooter.jsp"></jsp:include> 