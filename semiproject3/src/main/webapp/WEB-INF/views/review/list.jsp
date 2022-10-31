<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<jsp:include page="/WEB-INF/views/template/customerHeader.jsp">
	<jsp:param value="내 리뷰 목록" name="title" />
</jsp:include>

<style>
td, th {
  text-align : center;
  vertical-align : middle;
}
</style>

<section>
<div class="container-900">
	<div class="row center">
		<h1>REVIEW</h1>
		<hr>
	</div>


	<div class="row center">
		<c:choose>
			<c:when test="${list.isEmpty()}">
				<h4 style="padding-left: 20px">작성한 리뷰가 없습니다.</h4>
			</c:when>
			<c:otherwise>
				<table class="table table-hover table-border ">
					<thead>
						<tr>
							<th width="5%">번호</th>
							<th width="5%">평점</th>
							<th width="12%">배송상태</th>
							<th width="12%">포장상태</th>
							<th width="25%">내용</th>
							<th width="15%">등록일</th>
							<th width="6%">추천수</th>
							<th width="10%">리뷰확인</th>
						</tr>
					</thead>

					<tbody align="center">
						<c:forEach var="reviewDto" items="${list}">
							<tr>
								<td>${reviewDto.reviewNo}</td>
								<td>${reviewDto.reviewStar}점</td>
								<td>${reviewDto.reviewShipping}</td>
								<td>${reviewDto.reviewPackaging}</td>
								<td>${reviewDto.reviewContent}</td>
								<td>${reviewDto.reviewDate}</td>
								<td>${reviewDto.reviewCnt}개</td>
								<td>
									<a class="btn btn-border" href="http://localhost:8888/item/buydetail?itemNo=${reviewDto.itemNo}">
										확인
									</a>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</c:otherwise>
		</c:choose>
	</div>
<!-- 페이지 네비게이터 -->
<div class="row center">

<ul class="pagination">
<li>
	<c:choose>
		<c:when test="${not vo.isFirst()}">
			<a href="list?p=${vo.firstBlock()}&${vo.parameter()}">
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
			<a href="list?p=${vo.prevBlock()}&${vo.parameter()}">
				<i class="fa-solid fa-chevron-left"></i>
			</a>
		</c:when>
		<c:otherwise>
			<a href="#"><i class="fa-solid fa-chevron-left"></i></a>
		</c:otherwise>
	</c:choose>
</li>
 
<c:forEach var="i" begin="${vo.startBlock()}" end="${vo.endBlock()}" step="1">
	<li <c:if test="${i==param.p}">class="on"</c:if>><a href="list?p=${i}&${vo.parameter()}">${i}</a></li>
</c:forEach>

<!-- 다음을 누르면 다음 구간의 첫 페이지로 안내 -->
<li>
	<c:choose>
		<c:when test="${vo.hasNext()}">
			<a href="list?p=${vo.nextBlock()}&${vo.parameter()}">
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
			<a href="list?p=${vo.lastBlock()}&${vo.parameter()}">
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





</section>
<jsp:include page="/WEB-INF/views/template/customerFooter.jsp"></jsp:include>



