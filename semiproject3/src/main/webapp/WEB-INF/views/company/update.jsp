<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<jsp:include page="/WEB-INF/views/template/adminHeader.jsp">
    <jsp:param value="협력사 리스트" name="title"/>
</jsp:include>

<script type="text/javascript">
	$(function(){
		$(window).on("beforeunload", function(){
		    return false;
		});
		$(".btn-pass").click(function(){
		    $(window).off("beforeunload");
		    return true;
		});
	});
</script>

<form action="update" method="post">

	<div class ="container-900 mt-50 mb-50">

		<div class = "row center mb-30">
			<h1>COMPANY</h1>
			<hr>
		</div>
	
		<input name="companyNo" type="hidden" value="${companyDto.companyNo}">
		
		<div class = "row">
			<table class="table table-border">
				<tbody>
					<tr>
						<td>회사명 : </td>
						<td>
							<input type="text" required class="input w-100" name="companyName" value="${companyDto.companyName}" autocomplete="off">
						</td>
					</tr>
					<tr>
						<td>회사전화번호 : </td>
						<td>
							<input type="text" required class="input w-100" name="companyNumber" value="${companyDto.companyNumber}" autocomplete="off">
						</td>
					</tr>
					<tr>
						<td>회사주소 : </td>
						<td>
							<input type="text" required class="input w-100" name="companyAddress" value="${companyDto.companyAddress}" autocomplete="off">
						</td>
					</tr>
					<tr>
						<td>관리자명 : </td>
						<td>
							<input type="text" required class="input w-100" name="customerName" value="${companyDto.customerName}" autocomplete="off">
						</td>
					</tr>
					<tr>
						<td>관리자 직급 : </td>
						<td>
							<input type="text" required class="input w-100" name="customerRank" value="${companyDto.customerRank}" autocomplete="off">
						</td>
					</tr>
					<tr>
						<td>관리자 전화번호 : </td>
						<td>
							<input type="text" required class="input w-100" name="customerNumber" value="${companyDto.customerNumber}" autocomplete="off">
						</td>
					</tr>
					<tr>
						<td>특이사항 : </td>
						<td>
							<input type="text" required class="input w-100" name="companyExplan" value="${companyDto.companyExplan}" autocomplete="off">
						</td>
					</tr>
				</tbody>
				<tfoot>
					<tr>
						<td class="right" colspan="2">
							<a class="btn btn-neutral" href="list">목록</a>
							<button class="btn btn-positive bnt-pass" type="submit">수정</button>
						</td>
					</tr>
				</tfoot>
			</table>
		</div>
	</div>
</form>
<jsp:include page="/WEB-INF/views/template/adminFooter.jsp"></jsp:include> 