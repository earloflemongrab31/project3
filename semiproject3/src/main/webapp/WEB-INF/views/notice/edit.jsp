<%@ page language="java" contentType="text/html; charset=UTF-8" 
		pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:include page="/WEB-INF/views/template/adminHeader.jsp">
	<jsp:param value="공지사항 수정 페이지" name="title"/>
</jsp:include>

<form action="edit" method="post">
	
<input name="noticeNo" type="hidden" value="${noticeDto.noticeNo}">
	
<div class ="container-800 mt-50 mb-50">
	
	<div class="row center">
		<h1>공지사항 수정</h1>
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
					<c:choose>
						<c:when test="${noticeDto.noticeHead == '긴급'}">
				            <option value="">공지</option>
							<option selected value="긴급">긴급</option>
				            <option value="이벤트">이벤트</option>
			            </c:when>
						<c:when test="${noticeDto.noticeHead == '이벤트'}">
				            <option value="">공지</option>
							<option value="긴급">긴급</option>
				            <option selected value="이벤트">이벤트</option>
			            </c:when>
			        	<c:otherwise>
				            <option selected value="">공지</option>
							<option value="긴급">긴급</option>
				            <option	value="이벤트">이벤트</option>
			        	</c:otherwise>
		            </c:choose>
				</select>
			</td>
		</tr>
		<tr>
			<td>제목</td>
			<td>
				<input name="noticeTitle" type="text" required	class="input w-100" 
							autocomplete="off" value="${noticeDto.noticeTitle}">
			</td>
		</tr>
		<tr>
			<td colspan="2">내용</td>
		</tr>
		<tr>
			<td colspan="2">
				<textarea name="noticeContent">${noticeDto.noticeContent}</textarea>
			</td>
		</tr>
	</tbody>
	<tfoot>
		<tr>
			<td class="right" colspan="2">
				<a class="btn btn-neutral" href="list">목록</a>
				<button class="btn btn-positive" type="submit">수정</button>
			</td>
		</tr>
	</tfoot>
	</table>

	</div>
</form>


<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>