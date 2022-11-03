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
							<img src="/image/download/${itemDto.imageNo}" style="width:320px; height: 430px;">
						</a>
						<c:choose>
							<c:when test="${itemDto.itemTotalCnt == 0}">
								<div class="row center float-container mb-20"style="font-size:14px; font-weight:bold; padding:0 22px;">
									<div class="float-left">
					    				${itemDto.itemName}
				    				</div>
				    				<div class="float-right">
				    					[<span>품절</span>]
				    				</div>
								</div>
							</c:when>
							<c:otherwise>
								<c:choose>
									<c:when test="${itemDto.itemTotalCnt < 10}">
										<div class="row left float-container mb-20" style="font-size:14px; font-weight:bold; padding:0 22px;">
						    				<div class="float-left">
							    				${itemDto.itemName}
							    				[<span class="sold">품절 임박</span>]
						    				</div>
						    				<div class="float-right">
						    					<fmt:formatNumber value="${itemDto.itemPrice}" pattern="#,##0"/>원
						    				</div>
					    				</div>
									</c:when>
									<c:otherwise>
										<div class="row left float-container mb-20" style="font-size:14px; font-weight:bold; padding:0 22px;">
						    				<div class="float-left">
							    				${itemDto.itemName}
						    				</div>
						    				<div class="float-right">
						    					<fmt:formatNumber value="${itemDto.itemPrice}" pattern="#,##0"/>원
						    				</div>
					    				</div>
									</c:otherwise>
								</c:choose>
							</c:otherwise>
						</c:choose>
					</div>
				</c:if>
		</c:forEach>
	</div>
</div>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>