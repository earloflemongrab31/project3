<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!-- 회원정보에 없는 이메일을 입력할 시에 출력되는 경고창 -->
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script>
    $(function(){
        var responseMessage = "<c:out value="${message}" />";
        if (responseMessage != ""){
            alert(responseMessage)
        }
    })
</script>

<jsp:include page="/WEB-INF/views/template/header.jsp">
   <jsp:param value="상품 상세 페이지" name="title" />
</jsp:include>

<script type="text/javascript">

function fail(){
    if(confirm("내가 작성한 글은 신고 할 수 없습니다")){
        return false;
    }
}

</script>

<div class="container-1000 mt-40 mb-40">

<!-- <div class="row"> -->
<%-- ${itemDto} --%>
<!-- </div> -->
<!-- <div class="row"> -->
<%-- ${loginId} --%>
<!-- </div> -->

<!-- <form action="/orders/insert" method="post"> -->
<form action="/cart/insert" method="post">
<div class="row">
   <table class="table">
      <tbody>
         <tr>
            <th class="w-50" style="height:480px;" rowspan="4">
               <c:forEach var="buylistView" items="${buyImageList}">
                  <c:if test="${buylistView.imageMain == 1}">
                     <img src="/image/download/${buylistView.imageNo}" width="200" >
                  </c:if>
               </c:forEach>
               <c:forEach var="buylistView" items="${buyImageList}">
                  <c:if test="${buylistView.imageMain == 0}">
                     <img src="/image/download/${buylistView.imageNo}" width="100" >
                  </c:if>
               </c:forEach>
            </th>
            <th colspan="2">
               <input type="hidden" name="customerId" value="${loginId}">
               <input type="hidden" name="itemNo" value="${itemDto.itemNo}">
               <input type="text" name="itemName" value="${itemDto.itemName}" readonly class="input input-none">
            </th>
         </tr>
         <tr>
            <th>Price</th>
            <td>
               <fmt:formatNumber value="${itemDto.itemPrice}" pattern="#,##0원"></fmt:formatNumber>
               <input type="hidden" name="itemPrice" value="${itemDto.itemPrice}">
            </td>
         <tr>
            <th>Option</th>
            <td>
				<select class="input w-100" name="itemColor">
					<option value="">선택</option>
					<c:if test="${empty buylist}">
						<option>상품준비중</option>
					</c:if>
					<c:forEach var="itemDto" items="${buylist}">
						<option value="${itemDto.itemColor}" data-size="${itemDto.itemSize}" data-cnt="${itemDto.itemTotalCnt}">
						${itemDto.itemColor}/${itemDto.itemSize}(잔여수량:${itemDto.itemTotalCnt})
						</option>
					</c:forEach>
				</select>
               <input class="input w-100" type="hidden" name="itemSize" value="" >
            </td>
         </tr>
         <tr>
            <th>Qnty</th>
            <td>
<!--                <button class="minus-btn" type="button">-</button> -->

               <input class="input w-100" type="number" name="itemCnt" min="0" max="" >

<!--                <button class="plus-btn" type="button">+</button> -->
            </td>
         </tr>
         <tr>
            <td class="right">
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
            <td colspan="2" align="right">
               <a href="/review/insert?itemNo=${itemDto.itemNo}">리뷰달기</a>
               <button class="btn btn-positive" type="submit">구매하기</button>
</form>
               <button class="btn btn-positive" type="submit">장바구니</button>    
               <a href="buylist">목록으로</a>
            </td>
         </tr>
         <tr>
            <th colspan="3">${itemDto.itemMemo}</th>
         </tr>
      </tbody>
   </table>
</div>


<div class="flexbox">
   <div class=" w-50 center item item-detail">
      <span>상세보기</span>
   </div>
   <div class="w-50 center item item-review unchecked">
      <span>리뷰보기</span>
   </div>
</div>
      
<div class = "row center mb-30 detail">
   <div class = "row center mb-30">
      <h4>${itemDto.itemContent}</h4>
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
                     <td>${itemDto.itemName}</td>
                     
                     <!--블라인드여부에따라 다르게 표시 -->
                     <c:choose>
                     	<c:when test="${list.reviewBlind}">
                     		블라인드처리된 게시물입니다. 
                     	</c:when>
                     	<c:otherwise>
                     		<td>${list.reviewContent}</td>
                     	</c:otherwise>
                     </c:choose>            
                     <td>
                        <img src="/reviewImage/download/${list.imageNo}" width="100" ></td>
                        
                         <!-- 내글은 신고버튼 다르게 -->
                     <td>
                    
                     <c:choose>
                     <c:when test="${loginId != list.customerId}"> 
							<a href="/review/report?reviewNo=${list.reviewNo}&itemNo=${itemDto.itemNo}">신고</a>
						</c:when>
						<c:otherwise>
								<a href="#" onclick="fail();">신고</a>
						</c:otherwise>
                     </c:choose>
                     </td>
                     
                     <c:choose>
                     	<c:when test="${list.reviewBlind}">
                     		<td><a href="/review/blind?reviewNo=${list.reviewNo}&itemNo=${itemDto.itemNo}">블라인드<br>해제</a></td>
                     	</c:when>
                     	<c:otherwise>
                     		<td><a href="/review/blind?reviewNo=${list.reviewNo}&itemNo=${itemDto.itemNo}">블라인드<br>설정</a></td>
                     	</c:otherwise>
                     </c:choose>
                     
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

</div>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>