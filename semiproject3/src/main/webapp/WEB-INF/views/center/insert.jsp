<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<jsp:include page="/WEB-INF/views/template/header.jsp">
    <jsp:param value="Q&A게시판" name="title"/>
</jsp:include>
 

<form action="insert" method="post">
<input name="customerId" type="hidden" value="${loginId}" >

	<div class ="container-800 mt-50 mb-50">
	
	<div class="row center mb-30">
		<h1>Q&A 등록</h1>
		<hr>
	</div>
	
	<div class="row">
	<table class="table">
		<tbody>
			<tr>
				<td>말머리</td>
				<td>
				<select class="input input-none" name="centerHead">
					<option value="">선택</option>
					<option disabled>------</option>
					<option value="소지금">소지금</option>
					<option value="기타">기타</option>
				</select>
			</td>
			<tr>
				<td>제목</td>
				<td>
					<input name="centerTitle" type="text" required
						class="input mt-10 w-100" autocomplete="off">
				</td>
			</tr>
			<tr>
				<td>내용</td>
			</tr>
			<tr>
				<td colspan="2">
					<textarea class="content" name="customerContent" required></textarea>
				</td>
			</tr>
		</tbody>
	</table>
	</div>
	
	<div class="row right">
		<a class="btn btn-neutral btn-border" href="list">목록</a>
		<button class="btn btn-positive" type="submit">등록</button>
	</div>
	
</div>
</form>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include> 
    