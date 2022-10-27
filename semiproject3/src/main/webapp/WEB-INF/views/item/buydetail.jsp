<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="상품 상세 페이지" name="title" />
</jsp:include>
<h5>상품정보 ${itemDto}</h5>
<h5>상품이미지 ${buyImageList}</h5>
<h4>상품옵션 ${buylist}</h4>

<style>
td, th {
  text-align : center;
  vertical-align : middle;
}
</style>

<script type="text/javascript"> 
        $(function(){
            $("select[name=itemColor]").change(function(){
            	
                var color = $(this).val();
                var size = $(this).find("option:selected").attr("data-size");//가능 //문자열로 읽어온다. //find - 내부에 있는걸 탐색하는 기능
                var totalcnt = $(this).find("option:selected").attr("data-cnt");
// 				console.log(color);
//              console.log(size);
//              console.log(totalcnt);
				
                $("input[name=itemSize]").attr("value", size);
                $("input[name=itemTotalCnt]").attr("max", totalcnt);
                $("input[name=itemTotalCnt]").val(0);
                
	            var cnt = 0;
	            $("input[name=itemTotalCnt]").text(cnt);
	
	            $(".minus-btn").click(function(){
	                if(cnt <= 0) return;
	
	                size--;
	
	                if(cnt == 0){
	                //- 버튼 잠금
	                $(".minus-btn").attr("disabled", true);
	            }
	            else{
	                //- , + 버튼 해제
	                $(".minus-btn").attr("disabled", false);
	
	                $(".plus-btn").attr("disabled", false);
	            }
	                $("input[name=itemTotalCnt]").text(totalcnt);
	            });
	
	           
	            $(".plus-btn").click(function(){
	                if(cnt >= totalcnt) return;
	                
	                size++;
	
	                if(cnt == totalcnt){
	                //+ 버튼 잠금
	                $(".plus-btn").attr("disabled", true);
	            }
	            else{
	                //- , + 버튼 해제
	                $(".minus-btn").attr("disabled", false);
	
	                $(".plus-btn").attr("disabled", false);
	            }
	                $("input[name=itemTotalCnt]").text(totalcnt);
	            });
            });
        });
</script>

<form action="/orders/insert" method="post">

	<div class="container-1000 mt-40 mb-40">

		<div class="row center">
			<h1>${itemDto.itemName}</h1>
		</div>

		<div class="row">
			<table class="table table-border">
				<tbody>
				<tr>
	 				<td class="center" colspan="2">
						<c:forEach var="buylistView" items="${buyImageList}">
							<c:if test="${buylistView.imageMain == 1}">
								<img src="/image/download/${buylistView.imageNo}" width="200" >
							</c:if>
						</c:forEach>
					</td>
				</tr>
				<tr>
					<td class="center" colspan="2">
						<c:forEach var="buylistView" items="${buyImageList}">
							<c:if test="${buylistView.imageMain == 0}">
								<img src="/image/download/${buylistView.imageNo}" width="100" >
							</c:if>
						</c:forEach>
					</td>
				</tr>
				<tr>
					<th colspan="2">${itemDto.itemMemo}</th>
				</tr>
				<tr>
					<th colspan="2">${itemDto.itemContent}</th>
				</tr>
				<tr>
					<th>Price</th>
					<td>
						<fmt:formatNumber value="${itemDto.itemPrice}" pattern="#,##0 원"></fmt:formatNumber>
					</td>
				</tr>
				<tr>
<!-- 					<th>Color</th> -->
					<th>option</th>
					<td>
						<select class="input w-100" name="itemColor">
							<option value="">선택</option>
							<c:forEach var="itemDto" items="${buylist}">
								<option value="${itemDto.itemColor}" data-size="${itemDto.itemSize}" data-cnt="${itemDto.itemTotalCnt}">
									${itemDto.itemColor}/${itemDto.itemSize}(잔여수량:${itemDto.itemTotalCnt})
								</option>
							</c:forEach>
						</select>
						<input class="input w-100" type="hidden" name="itemSize" value="" >
					</td>
				</tr>
<!-- 				<tr> -->
<!-- 					<th>Size</th> -->
<!-- 					<td> -->
<!-- 						<select class="input w-100" name="itemSize"> -->
<!-- 							<option value="">선택</option> -->
<%-- 								<c:forEach var="itemDto" items="${buylist}"> --%>
<%-- 									<option>${itemDto.itemSize}</option> --%>
<%-- 								</c:forEach> --%>
<!-- 						</select> -->
<!-- 					</td> -->
<!-- 				</tr> -->
				<tr>
					<th>Qnty</th>
					<td>
						<button class="minus-btn" type="button">-</button>
						<input class="input" type="text" name="itemTotalCnt" min="0" max="" >
						<button class="plus-btn" type="button">+</button>
					</td>
				</tr>
				<tr>
					<th>찜하기</th>
					<td>
					${itemDto.itemLikeCnt}
					
						<c:if test="${isLike == null}">
							♥
						</c:if>
						<c:if test="${isLike == true}">
							<a href="like?itemNo=${itemDto.itemNo}">♥</a>
						</c:if>
						<c:if test="${isLike == false}">
							<a href="like?itemNo=${itemDto.itemNo}">♡</a>
						</c:if>
					</td>
				</tr>
			</tbody>
				<tfoot>
					<tr>
						<td colspan="2" align="right">

						<a href="/review/insert?itemNo=${itemDto.itemNo}">리뷰달기</a>

						<button class="btn btn-positive" type="submit">구매하기</button>
						<form>
						<a href="cart?itemNo=${itemDto.itemNo}">장바구니${isCart}</a>
						</form>	 
						<a href="buylist">목록으로</a>
					</td>
					</tr>
				</tfoot>
			</table>
		

			<div class="flexbox">
				<div class=" w-50 center item item-detail">
					<span>상세보기</span>
				</div>
				<div class="w-50 center item item-review unchecked">
					<span>리뷰보기</span>
				</div>
		</div>
		
		
		<div class = "row center mb-30 detail"	>
			<div class = "row center mb-30">
				<h4>아이템 상세보기 테스트</h4>
				<hr>
			</div>
		</div>
	
		<div class = "row center mb-30 review hide">
			<div class = "row center mb-30">
				<h4>리뷰</h4>
				<hr>
			</div>
			
			<div class="row center">
				<c:choose>
				<c:when test="${reviewList.isEmpty()}">
					<h4 style="padding-left:20px">
				  		<span>해당 상품의 리뷰가 없습니다</span>
					</h4>
				</c:when>
				<c:otherwise>
				<table class="table">
					<thead>
						<tr>
							<th>별점</th>
							<th>포장상태</th>
							<th>배송상태</th>
							<th>회원아이디</th>
							<th>작성시간</th>
							<th>주문한상품명</th>
							<th>내용</th>
							<th>사진</th>
							<th>신고</th>
						</tr>
					</thead>
				<tbody align="center" >	
					<c:forEach var="list" items="${reviewList}">
						<tr>
							<td>
								<c:if test="${list.reviewStar==1}">★</c:if>
								<c:if test="${list.reviewStar==2}">★★</c:if>
								<c:if test="${list.reviewStar==3}">★★★</c:if>
								<c:if test="${list.reviewStar==4}">★★★★</c:if>
								<c:if test="${list.reviewStar==5}">★★★★★</c:if>
					
								<c:set var="total" value="${total+list.reviewStar}"/>
							</td>
							<td>${list.reviewPackaging}</td>
							<td>${list.reviewShipping}</td>
							<td>
								<c:out value="${fn:substring(list.customerId, 0, fn:length(list.customerId) - 4)}" /> ****
							</td>
							<td>${list.reviewDate}</td>
							<td>주문상품(구매테이블구현시)</td>
							<td>${list.reviewContent}</td>
							<td>
								<img src="/reviewImage/download/${list.imageNo}" width="100" ></td>
							<td>
							<button type="submit">
								<a href="/review/report?reviewNo=${list.reviewNo}">신고</a>
							</button>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<h5>리뷰수${fn:length(reviewList)}</h5>
			<h5>
			사용자 총 평점
			<fmt:formatNumber value=" ${total/fn:length(reviewList)}" pattern="#,##0.00"></fmt:formatNumber>
			</h5>
		</c:otherwise>
	</c:choose>
</div>
</div>

</form>


		<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>