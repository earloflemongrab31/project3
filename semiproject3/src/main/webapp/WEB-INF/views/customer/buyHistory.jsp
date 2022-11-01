<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="/WEB-INF/views/template/customerHeader.jsp">
	<jsp:param value="주문/배송조회" name="title"/>
</jsp:include>

<section>	
	<div class="container-800 mt-50 mb-50">
	<div class="row center">
		<h1>주문/배송 조회</h1>
	</div>
	<div class="row">
		<table class="table table-border">
			<tbody>
				<c:forEach var="buyItem" items="${buyList}">
				<tr>
					<td class="left" colspan="2">주문번호 [${buyItem.buyNo}]</td>
					<td class="center">상품현황</td>
				</tr>
				<tr>
					<td class="w-25" rowspan="3" style="vertical-align: bottom;">
						<a href="/item/buydetail?itemNo=${buyItem.itemNo}">
							<img class="w-100" src="/image/download/${buyItem.imageNo}">
						</a>
					</td>
					<td>${buyItem.itemName}</td>
					<td class="w-25 center" rowspan="3">${buyItem.deliveryStatus}</td> 
				</tr>
				<tr>
					<td> 옵션 : ${buyItem.itemSize} / ${buyItem.itemColor}</td>
				</tr>
				<tr>
					<td> 
						<fmt:formatNumber value="${buyItem.itemTotalPrice}" pattern="#,##0원"/>
						 / ${buyItem.itemCnt}개
					</td>
				</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>

<div class="row center">
<!-- 페이징 처리 -->
<ul class="pagination">
<li>
	<c:choose>
		<c:when test="${not vo.isFirst()}">
			<a href="/buy/list?p=${vo.firstBlock()}&${vo.parameter()}">
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
			<a href="/buy/list?p=${vo.prevBlock()}&${vo.parameter()}">
				<i class="fa-solid fa-chevron-left"></i>
			</a>
		</c:when>
		<c:otherwise>
			<a href="#"><i class="fa-solid fa-chevron-left"></i></a>
		</c:otherwise>
	</c:choose>
</li>
 
<c:forEach var="i" begin="${vo.startBlock()}" end="${vo.endBlock()}" step="1">
	<li <c:if test="${i==param.p}">class="on"</c:if>><a href="/buy/list?p=${i}&${vo.parameter()}">${i}</a></li>
</c:forEach>

<!-- 다음을 누르면 다음 구간의 첫 페이지로 안내 -->
<li>
	<c:choose>
		<c:when test="${vo.hasNext()}">
			<a href="/buy/list?p=${vo.nextBlock()}&${vo.parameter()}">
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
			<a href="/buy/list?p=${vo.lastBlock()}&${vo.parameter()}">
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
</section>

<jsp:include page="/WEB-INF/views/template/customerFooter.jsp"></jsp:include>