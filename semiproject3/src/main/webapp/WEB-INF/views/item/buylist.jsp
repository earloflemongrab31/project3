<%@ page language="java" contentType="text/html; charset=UTF-8" 
		pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
   
<jsp:include page="/WEB-INF/views/template/header.jsp">
    <jsp:param value="상품 목록" name="title"/>
</jsp:include>

<div class ="container-1100 mt-50 mb-50">

	<div class = "row center mb-30">
		<h1>List</h1>
		<hr>
	</div>
	
	<c:choose>
		<c:when test="${empty buylist}">
			<div class="row center mb-50">
				<h1>상품 준비 중입니다.</h1>
			</div>
			<div class="row center">
				<a href="${pageContext.request.contextPath}/" class="btn btn-neutral">메인페이지 이동 <i class="fa-solid fa-arrow-right"></i></a>
			</div>
		</c:when>
		<c:otherwise>
		
		<div class = "row float-container center">
		
			<c:forEach var="itemDto" items="${buylist}">
				<c:if test="${itemDto.imageMain == 1}">
					<div class="row float-left w-33">
						<a href="buydetail?itemNo=${itemDto.itemNo}">
							<img src="${pageContext.request.contextPath}/image/download/${itemDto.imageNo}" style="width:320px; height: 430px;">
						</a>
						<c:choose>
							<c:when test="${itemDto.itemTotalCnt == 0}">
								<div class="row left float-container mb-20" style="font-size:14px; font-weight:bold; padding:0 22px;">
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
		
	<c:if test="${!empty buylist}">
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
					<li <c:if test="${i==param.p}">class="on"</c:if>><a href="buylist?p=${i}&${vo.parameter()}">${i}</a></li>
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
	</c:if>
	</c:otherwise>
	</c:choose>
</div>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>