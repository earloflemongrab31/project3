<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<jsp:include page="/WEB-INF/views/template/adminHeader.jsp">
    <jsp:param value="협력사 상세보기" name="title"/>
</jsp:include>

<style>
	td, th {
 	text-align : center;
  	vertical-align : middle;
	}
</style>
	
<div class ="container-600 mt-50 mb-50">

	<div class = "row center mb-30">
		<h1><${companyDto.companyName}></h1>
		<hr>
	</div>
	
	<div class = "row">
			<table class="table table-border">
				<tbody>
					<tr>
						<th width="40%">회사명</th>
						<td>
							${companyDto.companyName}
						</td>
					</tr>
					<tr>
						<th>회사전화번호</th>
						<td>
							${companyDto.companyNumber}
						</td>
					</tr>
					<tr>
						<th>회사주소</th>
						<td>
							${companyDto.companyAddress}
						</td>
					</tr>
					<tr>
						<th>관리자명</th>
						<td>
							${companyDto.customerName}
						</td>
					</tr>
					<tr>
						<th>관리자 직급</th>
						<td>
							${companyDto.customerRank}
						</td>
					</tr>
					<tr>
						<th>관리자 전화번호</th>
						<td>
							${companyDto.customerNumber}
						</td>
					</tr>
					<tr>
						<th>특이사항</th>
						<td>
							${companyDto.companyExplan}
						</td>
					</tr>
				</tbody>
			</table>
		</div>
		
		<div class="row right">
			<a href="delete?companyNo=${companyDto.companyNo}"><button class="btn btn-negative" type="submit">삭제</button></a>
			<a href="update?companyNo=${companyDto.companyNo}"><button class="btn btn-positive" type="submit">수정</button></a>
			<a href="list"><button  class="btn btn-positive" type="submit">목록</button></a>
		</div>
		
	</div>

<jsp:include page="/WEB-INF/views/template/adminFooter.jsp"></jsp:include> 