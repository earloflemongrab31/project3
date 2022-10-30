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
<div class="container-900 mt-50 mb-50">
	<div class="row center mb-30">
		<h1>REVIEW</h1>
		<hr>
	</div>


	<div class="row center">
		<c:choose>
			<c:when test="${list.isEmpty()}">
				<h4 style="padding-left: 20px">작성한 리뷰가 없습니다.</h4>
			</c:when>
			<c:otherwise>
				<table class="table table-hover table-slit ">
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

</div>

<jsp:include page="/WEB-INF/views/template/customerFooter.jsp"></jsp:include>

