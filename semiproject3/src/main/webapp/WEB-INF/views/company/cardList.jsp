<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<jsp:include page="/WEB-INF/views/template/adminHeader.jsp">
    <jsp:param value="협력사 명함 목록" name="title"/>
</jsp:include>

<style>
td, th {
  text-align : center;
  vertical-align : middle;
}
</style>

<div class ="container-900 mt-50 mb-50">

	<div class = "row center mb-30">
		<h1>COMPANY</h1>
		<hr>
	</div>
	
	<div class="row">
		<table class="table table-border">
			<thead>
				<tr>
					<th>협력사</th>
					<th width="70%">이미지</th>
				</tr>
			</thead>
			<tbody align="center" >	
				<c:forEach var="cardDto" items="${cardList}">
					<tr>
						<td>${cardDto.companyName}</td>
						<td>
							<img src="${pageContext.request.contextPath}/companyImage/download/${cardDto.imageNo}" width="100" >
						</td>
					</tr>
			</c:forEach>
			</tbody>
		</table>
		
		<div class="row right">
		<a href="list"><button  class="btn btn-positive" type="submit">협력사목록</button></a>
		</div>
		
	</div>
	
	
<ul class="pagination">
<li>
	<c:choose>
		<c:when test="${not vo.isFirst()}">
			<a href="cardList?p=${vo.firstBlock()}&${vo.parameter()}">
				<i class="fa-solid fa-angles-left"></i>
			</a>
		</c:when>
		<c:otherwise>
			<a href="#"><i class="fa-solid fa-angles-left"></i></a>
		</c:otherwise>
	</c:choose>
</li>

<!-- 이전을 누르면 이전 구간의 마지막 페이지로 안내 -->
<li>
	<c:choose>
		<c:when test="${vo.hasPrev()}">
			<a href="cardList?p=${vo.prevBlock()}&${vo.parameter()}">
				<i class="fa-solid fa-chevron-left"></i>
			</a>
		</c:when>
		<c:otherwise>
			<a href="#"><i class="fa-solid fa-chevron-left"></i></a>
		</c:otherwise>
	</c:choose>
</li>
 
<c:forEach var="i" begin="${vo.startBlock()}" end="${vo.endBlock()}" step="1">
	<li<c:if test="${i==param.p}">class="on"</c:if>><a href="cardList?p=${i}&${vo.parameter()}">${i}</a></li>
</c:forEach>

<!-- 다음을 누르면 다음 구간의 첫 페이지로 안내 -->
<li>
	<c:choose>
		<c:when test="${vo.hasNext()}">
			<a href="cardList?p=${vo.nextBlock()}&${vo.parameter()}">
				<i class="fa-solid fa-chevron-right"></i>
			</a>
		</c:when>
		<c:otherwise>
			<a href="#"><i class="fa-solid fa-chevron-right"></i></a>
		</c:otherwise>
	</c:choose>
</li>

<li>
	<c:choose>
		<c:when test="${not vo.isLast()}">
			<a href="cardList?p=${vo.lastBlock()}&${vo.parameter()}">
				<i class="fa-solid fa-angles-right"></i>
			</a>
		</c:when>
		<c:otherwise>
			<a href="#"><i class="fa-solid fa-angles-right"></i></a>
		</c:otherwise>
	</c:choose>
</li>
</ul>	
	
</div>

<jsp:include page="/WEB-INF/views/template/adminFooter.jsp"></jsp:include> 
    