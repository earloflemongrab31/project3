<%@ page language="java" contentType="text/html; charset=UTF-8" 
		pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
   
<jsp:include page="/WEB-INF/views/template/header.jsp">
    <jsp:param value="상품 목록" name="title"/>
</jsp:include>

<div class ="container-1100 mt-50 mb-50">

	<div class = "row center mb-50">
		<h1>상품 리스트</h1>
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
	
	<!-- 페이지 네비게이터 -->
<div class="row center">
	
	<ul class="pagination">
		<li>
			<c:choose>
			<c:when test="${not vo.isFirst()}">
				<a href="buylist?p=${vo.firstBlock()}&${vo.parameter()}">
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
				<a href="buylist?p=${vo.prevBlock()}&${vo.parameter()}">
					<i class="fa-solid fa-chevron-left"></i>
				</a>
			</c:when>
			<c:otherwise>
				<a href="#"><i class="fa-solid fa-chevron-left"></i></a>
			</c:otherwise>
			</c:choose>
		</li>
		 
		<c:forEach var="i" begin="${vo.startBlock()}" end="${vo.endBlock()}" step="1">
			<li><a href="buylist?p=${i}&${vo.parameter()}">${i}</a></li>
		</c:forEach>
		
		<!-- 다음을 누르면 다음 구간의 첫 페이지로 안내 -->
		<li>
			<c:choose>
			<c:when test="${vo.hasNext()}">
				<a href="buylist?p=${vo.nextBlock()}&${vo.parameter()}">
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
				<a href="buylist?p=${vo.lastBlock()}&${vo.parameter()}">
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
</div>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>