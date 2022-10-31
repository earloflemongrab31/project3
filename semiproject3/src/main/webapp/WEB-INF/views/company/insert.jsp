<%@ page language="java" contentType="text/html; charset=UTF-8" 
		pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:include page="/WEB-INF/views/template/adminHeader.jsp">
    <jsp:param value="고객사 입력" name="title"/>
</jsp:include> 

<style>
	td, th {
 	text-align : center;
  	vertical-align : middle;
	}
</style>
	
<form action="insert" method="post" enctype="multipart/form-data">
<div class ="container-900 mt-50 mb-50">

	<div class = "row center mb-30">
		<h1>COMPANY</h1>
		<hr>
	</div>
	
	<div class = "row">
			<table class="table table-border">
				<tbody>
					<tr>
						<td>회사명</td>
						<td>
							<input type="text" required class="input w-100" name="companyName" placeholder="회사이름" autocomplete="off">
						</td>
					</tr>
					<tr>
						<td>회사전화번호</td>
						<td>
							<input type="text" required class="input w-100" name="companyNumber" placeholder="회사 전화번호" autocomplete="off">
						</td>
					</tr>
					<tr>
						<td>회사주소</td>
						<td>
							<input type="text" required class="input w-100" name="companyAddress" placeholder="회사 주소" autocomplete="off">
						</td>
					</tr>
					<tr>
						<td>관리자명</td>
						<td>
							<input type="text" required class="input w-100" name="customerName" placeholder="직원 이름"autocomplete="off">
						</td>
					</tr>
					<tr>
						<td>관리자 직급</td>
						<td>
							<input type="text" required class="input w-100" name="customerRank" placeholder="직원 직책" autocomplete="off">
						</td>
					</tr>
					<tr>
						<td>관리자 전화번호</td>
						<td>
							<input type="text" required class="input w-100" name="customerNumber" placeholder="직원 전화번호"  autocomplete="off">
						</td>
					</tr>
					<tr>
						<td>특이사항</td>
						<td>
							<input type="text" required class="input w-100" name="companyExplan" placeholder="특이사항"  autocomplete="off">
						</td>
					</tr>
					<tr>
						<td>명함사진</td>
						<td>
							<input type="file" required class="input w-100" name="attachment" placeholder="명함사진" autocomplete="off">
						</td>
					</tr>
				</tbody>
			</table>
		</div>
		<div class="row right">
			<button class="btn btn-positive" type="submit">저장</button>
		</div>
	</div>
</form>

<jsp:include page="/WEB-INF/views/template/adminFooter.jsp"></jsp:include> 