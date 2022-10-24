<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<jsp:include page="/WEB-INF/views/template/adminHeader.jsp">
    <jsp:param value="공지사항 등록 페이지" name="title"/>
</jsp:include>
 

<form action="insert" method="post" enctype="multipart/form-data">
<%-- <input name="adminId" type="hidden" value="${noticeDto.adminId}" > --%>
	<div class ="container-800 mt-50 mb-50">
	
	<div class="row center mb-30">
		<h1>공지 사항 작성</h1>
		<hr>
	</div>
	
	<div class = "row">
	<table class="table">
	<tbody>
		<tr>
			<td class="w-25">말머리</td>
			<td>
				<select name="noticeHead">
					<option value="">선택</option>
					<option disabled>------</option>
					<option>긴급</option>
		            <option>이벤트</option>
				</select>
			</td>
		</tr>
		<tr>
			<td>제목</td>
			<td>
				<input name="noticeTitle" type="text" required	class="input w-100" autocomplete="off">
			</td>
		</tr>
		<tr>
			<td colspan="2">내용</td>
		</tr>
		<tr>
			<td colspan="2">
				<textarea name="noticeContent"></textarea>
			</td>
		</tr>
	</tbody>
	<tfoot>
		<tr>
			<td class="right" colspan="2">
				<a class="btn btn-neutral" href="list">목록</a>
				<button class="btn btn-positive" type="submit">등록</button>
			</td>
		</tr>
	</tfoot>
	</table>

	</div>
	
	</div>
</form>
 


<jsp:include page="/WEB-INF/views/template/adminFooter.jsp"></jsp:include> 
    