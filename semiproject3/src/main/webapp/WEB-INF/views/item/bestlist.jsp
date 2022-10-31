<%@ page language="java" contentType="text/html; charset=UTF-8" 
		pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
   
<jsp:include page="/WEB-INF/views/template/header.jsp">
    <jsp:param value="상품 목록" name="title"/>
</jsp:include>

<div class ="container-1100 mt-50 mb-50">

	<div class = "row center mb-30">
		<h1>Best 6</h1>
		<hr>
	</div>
	<div class = "row float-container center">
	
		<c:forEach var="itemDto" items="${buylist}">
			<c:if test="${itemDto.imageMain == 1}">
				<div class="row float-left w-33">
					<a href="buydetail?itemNo=${itemDto.itemNo}">
						<img src="/image/download/${itemDto.imageNo}" class="w-75">
					</a>
					<br><br>
<%-- 					${itemDto.itemNo}<br> --%>
					${itemDto.itemName}<br>
					${itemDto.itemPrice}원<br>
					<c:if test="${itemDto.itemTotalCnt == 0}">
						<h4 style="margin-block-start: 0.5em;" >품절</h4><br><br>
					</c:if>
				</div>
			</c:if>
		</c:forEach>
	</div>
</div>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>