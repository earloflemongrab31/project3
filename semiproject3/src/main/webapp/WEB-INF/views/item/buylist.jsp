<%@ page language="java" contentType="text/html; charset=UTF-8" 
		pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
   
<jsp:include page="/WEB-INF/views/template/header.jsp">
    <jsp:param value="상품 목록" name="title"/>
</jsp:include>


<div class ="container-800 mt-40 mb-40">

	<div class = "row center">
		<h1>상품 리스트</h1>
	</div>
	<div class = "row">
	
		<c:forEach var="itemDto" items="${buylist}">
			<c:if test="${itemDto.imageMain == 1}">
				<div class="row w-33">
					<a href="buydetail?itemNo=${itemDto.itemNo}">
						<img src="/image/download/${itemDto.imageNo}" width="200" height="200" >
					</a>
					<br>
					${itemDto.itemNo}<br>
					${itemDto.itemName}<br>
					${itemDto.itemPrice}원<br>
					${itemDto.itemColor}<br><br>
				</div>
			</c:if>
		</c:forEach>
	</div>
	
</div>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>