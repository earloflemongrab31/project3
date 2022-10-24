<%@ page language="java" contentType="text/html; charset=UTF-8" 
		pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:include page="/WEB-INF/views/template/header.jsp">
    <jsp:param value="공지사항" name="title"/>
</jsp:include>


<div class ="container-600 mt-40 mb-40">

	<div class = "row center">
		<h1>공지사항 상세내용</h1>
			<hr>
	</div>
	
	<div class ="row">
	 	<table class="table table-border">
	 		<tbody>
	 		
	 			<tr>
	 				<th>공지번호</th>
	 				<td>${noticeDto.noticeNo}</td>
	 			</tr>
	 			
	 			<tr>
				<th>말머리</th>
				<td>${noticeDto.noticeHead}</td>
				</tr>
				
				<tr>
					<th>제목</th>
					<td>${noticeDto.noticeTitle}</td>
				</tr>
				
				<tr>
					<th>작성자</th>
					<td>${noticeDto.adminId}</td>
				</tr>
	 			
	 			<tr height="200" valign="top">
				<th>내용</th>
					<td>
						<!-- pre 태그는 엔터, 띄어쓰기, 탭키 등을 있는 그대로 표시하는 영역 -->
						<pre>${noticeDto.noticeContent}</pre>
					</td>
				</tr>
		 			
	 			<tr>
					<th>조회수</th>
					<td>${noticeDto.noticeRead}</td>
				</tr>
	 			
	 			<tr>
					<th>작성일</th>
					<td>
						<fmt:formatDate value="${noticeDto.noticeDate}" pattern="y년 M월 d일 E요일 a h시 m분 s초"/>
					</td>
				</tr>
				
				<c:if test="${noticeDto.noticeUpdate != null}">
				<tr>
					<th>수정일</th>
					<td>
						<fmt:formatDate value="${noticeDto.noticeUpdate}" pattern="y년 M월 d일 E요일 a h시 m분 s초"/>
					</td>
				</tr>
				</c:if>
	 		</tbody>
	 	</table>
	 	
	 	<div class="row right">
		<a class="btn btn-positive" href="edit?noticeNo=${noticeDto.noticeNo}">수정하기</a>
		<a class="btn btn-negative" href="delete?noticeNo=${noticeDto.noticeNo}">삭제하기</a>
		<a class="btn btn-neutral" href="list">목록</a>
		</div>
		
	</div>
</div>
	
	
	
	

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>