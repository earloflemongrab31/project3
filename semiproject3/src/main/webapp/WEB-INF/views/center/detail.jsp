<%@ page language="java" contentType="text/html; charset=UTF-8" 
		pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
   
<jsp:include page="/WEB-INF/views/template/header.jsp">
    <jsp:param value="Q&A 페이지" name="title"/>
</jsp:include>




<div class ="container-600 mt-50 mb-50">

	<div class = "row center mb-30">
		<h1>Q&A</h1>
		<hr>
	</div>
	
<div class ="row">
	
	<div class = "row">
		<h2>문의사항</h2>
	</div>
	
	 	<table class="table table-border">
	 		<tbody>
	 			
	 			<tr>
	 				<th>글번호</th>
	 				<td>${centerDto.centerNo}</td>
	 			</tr>
				
				<tr>
					<th>제목</th>
					<td>${centerDto.centerTitle}</td>
				</tr>
				
				<tr>
					<th>작성자</th>
					<td>${centerDto.customerId}</td>
				</tr>
	 			
	 			<tr height="200" valign="top">
				<th>문의내용</th>
					<td>
						<!-- pre 태그는 엔터, 띄어쓰기, 탭키 등을 있는 그대로 표시하는 영역 -->
						<pre>${centerDto.customerContent}</pre>
					</td>
				</tr>
				
		 		<tr>
					<th>작성일</th>
					<td>
						<fmt:formatDate value="${centerDto.customerDate}" pattern="y년 M월 d일 E요일 hh:mm:ss"/>
					</td>
				</tr>
		 	</tbody>
	 	</table>
	 </div>
	 
	 
	<c:if test="${centerDto.adminContent != null}">
	<div class ="row">
	
		<div class = "row">
			<h2>답변내용</h2>
		</div>
		
	 	<table class="table table-border">
	 		<tbody>
	 		
				
		 		<tr>
					<th>답변자</th>
					<td>${centerDto.adminId}</td>
				</tr>

		 		<tr height="200" valign="top">
				<th>답변내용</th>
					<td>
						<pre>${centerDto.adminContent}</pre>
					</td>
				</tr>
				
				<c:if test="${centerDto.adminDate != null}">
				<tr>
					<th>등록일</th>
					<td>
						<fmt:formatDate value="${centerDto.adminDate}" pattern="y년 M월 d일 E요일 hh:mm:ss"/>
					</td>
				</tr>
			 </c:if>
			 
	 		</tbody>
	 	</table>
	 </div>
	 </c:if>
	 
	 	<div class="row right">
		<a class="btn btn-neutral" href="list">목록</a>
		<c:if test="${loginGrade == '관리자'}">
			<a class="btn btn-positive" href="edit?centerNo=${centerDto.centerNo}">답변등록</a>
			<a class="btn btn-negative" href="delete?centerNo=${centerDto.centerNo}">삭제하기</a>
		</c:if>
		</div>
		
	</div>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>