<%@ page language="java" contentType="text/html; charset=UTF-8" 
		pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:include page="/WEB-INF/views/template/header.jsp">
    <jsp:param value="공지사항" name="title"/>
</jsp:include>

<style>
	.table-border tr > th{
		background-color: #f6f3f1;
	}
</style>


<script>
	$(function(){
		$(".delete").click(function(e){
            var choice = confirm("정말 삭제하시겠습니까?");
            if(choice){
                return true;
            }
            else{
                return false;
            }
		});
	});
</script>


<div class ="container-800 mt-50 mb-50">

	<div class = "row center mb-30">
		<h1>NOTICE</h1>
		<hr>
	</div>
	
	<div class ="row">
	 	<table class="table table-border">
	 		<tbody>
	 		
	 			<tr>
	 				<th class="subject">공지번호</th>
	 				<td>${noticeDto.noticeNo}</td>
	 			</tr>
				
				<tr>
					<th class="subject">제목</th>
					<td>
						<c:if test="${noticeDto.noticeHead != null}">
							[${noticeDto.noticeHead}]
						</c:if>	
						${noticeDto.noticeTitle}
					</td>
				</tr>
				
				<tr>
					<th class="subject">작성자</th>
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
	</div>
	<div class="row right">
		<a class="btn btn-neutral btn-border" href="list">목록</a>
		<c:if test="${loginGrade == '일반관리자' || loginGrade == '메인관리자'}">
			<a class="btn btn-positive" href="edit?noticeNo=${noticeDto.noticeNo}">수정하기</a>
			<a class="btn btn-negative delete" href="delete?noticeNo=${noticeDto.noticeNo}">삭제하기</a>
		</c:if>
	</div>
</div>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>