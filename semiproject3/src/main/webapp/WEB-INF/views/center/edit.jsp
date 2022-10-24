<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<jsp:include page="/WEB-INF/views/template/adminHeader.jsp">
	<jsp:param value="Q&A게시판" name="title" />
</jsp:include>



<form action="edit" method="post" enctype="multipart/form-data">

 	
	<input name="centerNo" type="hidden" value="${centerDto.centerNo}">
	<input name="centerTitle" type="hidden" value="${centerDto.centerTitle}">
	<input name="customerContent" type="hidden" value="${centerDto.customerContent}">

	<div class="container-800 mt-50 mb-50">

		<div class="row mb-30">
			<h1>Q&A 답변</h1>
			<hr>
		</div>

		<div class="row">
			<table class="table table-border">
				<tbody>
					<tr>
						<th width="25%">문의제목</th>
						<td>${centerDto.centerTitle}</td>
					</tr>

					<tr>
						<th>문의내용</th>
						<td>${centerDto.customerContent}</td>
					</tr>
				</tbody>
			</table>
		</div>


		<div class="row w-100 mt-50">
			<table class="table">
				<tbody>
					<tr>
						<td>답변</td>
					</tr>
					<tr>
						<td>
							<textarea class="content" name="adminContent" required></textarea>
						</td>
					</tr>
				</tbody>
			</table>
			</label>
		</div>


		<div class="row right">
			<a class="btn btn-neutral" href="list">목록</a>
			<button class="btn btn-positive" type="submit">등록</button>
		</div>

	</div>
</form>



<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
