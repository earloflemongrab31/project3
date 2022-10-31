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
    });
        
		//리뷰 좋아요 ajax
      	$(function(){
      		$(".review-like-btn").click(function(e){
      			e.preventDefault();
      			var that=this;
      			
      			$.ajax({
      				url:"/rest/review/like",
            		method:"post",
            		data:{
            			reviewNo:$(this).data("review-no"),
            			itemNo:$(this).data("item-no")
            		},
            		success:function(resp){
            			
            				$(that).next(".like-span").text(resp.reviewCnt);
            				$(that).next("span").remove(".like-span-remove");
            		}
      			})
      		});
      	});
		
		//사진크게
		$(function(){
			$(".image-big").click(function(){
				
				var width=$(this).css("width");
				
				$(this).animate({
					width:"+=50"
				});
			if(parseInt(width) >=150){
				$(this).animate({
					width :100
				})	;
			}
			});
		});
		
      	
    
  	//리뷰 좋아요 ajax
  	$(function(){
  		$(".review-like-btn").click(function(e){
  			e.preventDefault();
  			var that=this;
  			
  			$.ajax({
  				url:"/rest/review/like",
        		method:"post",
        		data:{
        			reviewNo:$(this).data("review-no"),
        			itemNo:$(this).data("item-no")
        		},
        		success:function(resp){
        			
        				$(that).next(".like-span").text(resp.reviewCnt);
        				$(that).next("span").remove(".like-span-remove");
        		}
  			})
  		});
  	});
	
	//사진크게
	$(function(){
		$(".image-big").click(function(){
			
			var width=$(this).css("width");
			
			$(this).animate({
				width:"+=50"
			});
		if(parseInt(width) >=150){
			$(this).animate({
				width :100
			})	;
		}
		});
	});
    
   	$(function(){
		$(".cart-in").click(function(){
			$(".item-form").attr("action", "/cart/insert");
			$(".item-form").attr("method", "post");
		});
		$(".buy").click(function(){
			$(".item-form").attr("action", "/orders/detail");
			$(".item-form").attr("method", "get");
		});
   	});
</script>

<style>
	#box{
		padding: 5px;
		border-top: 1px solid #D5D5D5;
	}
</style>

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

<div class="container-1000 mt-50 mb-50">
<div class="float-container">
<!-- <form action="/orders/detail" method="get"> -->
<form class="item-form" action="/cart/insert" method="post">
<div class="float-left w-50">
	<table class="table">
		<tr>
            <th class="w-50" style="height:480px;">
               <c:forEach var="buylistView" items="${buyImageList}">
                  <c:if test="${buylistView.imageMain == 1}">
                     <img src="/image/download/${buylistView.imageNo}" width="200" >
                     <input type="hidden" name="imageNo" value="${buylistView.imageNo}">
                  </c:if>
               </c:forEach>
               <c:forEach var="buylistView" items="${buyImageList}">
                  <c:if test="${buylistView.imageMain == 0}">
                     <img src="/image/download/${buylistView.imageNo}" width="100" >
                  </c:if>
               </c:forEach>
            </th>
		</tr>
		<tr>
		   <td class="right">
		      ${itemDto.itemLikeCnt}

		      <c:if test="${isLike == null}">
		         <i class="fa-regular fa-heart"></i>
		      </c:if>
		      <c:if test="${isLike == true}">
		         <a href="like?itemNo=${itemDto.itemNo}"><i class="fa-regular fa-heart"></i></a>
		      </c:if>
		      <c:if test="${isLike == false}">
		         <a href="like?itemNo=${itemDto.itemNo}"><i class="fa-regular fa-heart"></i></a>
		      </c:if>
		   </td>
		</tr>
	</table>
</div>

<div class="float-left w-50">
	<div class="row">
		<input type="hidden" name="customerId" value="${loginId}">
		<input type="hidden" name="itemNo" value="${itemDto.itemNo}">
		<input type="text" name="itemName" value="${itemDto.itemName}" readonly class="input input-none">
	</div>
	<div class="row">
		${itemDto.itemMemo}
	</div>
	<hr>
<div class="row">
   <table class="table">
      <tbody>
         <tr>
            <th>Price</th>
            <td>
               <fmt:formatNumber value="${itemDto.itemPrice}" pattern="#,##0원"></fmt:formatNumber>
               <input type="hidden" name="itemPrice" value="${itemDto.itemPrice}">
            </td>
         <tr>
            <th>Option</th>
            <td>
				<select class="input w-100 input-option">
					<option value="">선택</option>
					<c:if test="${empty buylist}">
						<option disabled>상품준비중</option>
					</c:if>
					<c:forEach var="itemDto" items="${buylist}">
						<option data-color="${itemDto.itemColor}" data-size="${itemDto.itemSize}" data-cnt="${itemDto.itemTotalCnt}">
						${itemDto.itemColor}/${itemDto.itemSize}(잔여수량:${itemDto.itemTotalCnt})
						</option>
					</c:forEach>
				</select>
               	<input class="input w-100" type="hidden" name="itemTotalCnt" value="">
            </td>
<!-- 			<td> -->
<!-- 				<select class="input w-100" name="itemColor"> -->
<!-- 					<option value="">선택</option> -->
<%-- 					<c:if test="${empty buylist}"> --%>
<!-- 						<option>상품준비중</option> -->
<%-- 					</c:if> --%>
<%-- 					<c:forEach var="itemDto" items="${buylist}"> --%>
<%-- 						<option value="${itemDto.itemColor}" data-size="${itemDto.itemSize}" data-cnt="${itemDto.itemTotalCnt}"> --%>
<%-- 						${itemDto.itemColor}/${itemDto.itemSize}(잔여수량:${itemDto.itemTotalCnt}) --%>
<!-- 						</option> -->
<%-- 					</c:forEach> --%>
<!-- 				</select> -->
<!--                <input class="input w-100" type="hidden" name="itemSize" value="" > -->
<!--                <input class="input w-100" type="hidden" name="itemTotalCnt" value=""> -->
<!--             </td> -->
<!--          </tr> -->
<!--          <tr> -->
<!--             <th>Qnty</th> -->
<!--             <td> -->
<!--                <button class="minus-btn" type="button">-</button> -->

<!--                <input class="input w-100" type="number" name="itemCnt" min="0" max="" > -->

<!--                <button class="plus-btn" type="button">+</button> -->
<!--             </td> -->
<!--          </tr> -->
      </tbody>
   </table>
   
	<div class="row" style="min-height:280px;">
		<ul class="option-area" style="list-style: none;">
			
		</ul>
	</div>
   
   <table class="table">
		<tr>
			<td class="right">
				<!--리뷰는 한사람이 하나의 상품에만 달수 있다. -->				
				<a href="/review/insert?itemNo=${itemDto.itemNo}">리뷰달기</a>
				<button class="btn btn-positive buy" type="submit">구매하기</button>
				<button class="btn btn-positive cart-in" type="submit">장바구니</button>    
				<a href="buylist">목록으로</a>
			</td>
		</tr>
   </table>
</div>
</form>
</div>

</div>

<div class="flexbox">
   <div class=" w-50 center item item-detail">
      <span>상세보기</span>
   </div>
   <c:if test="${fn:length(reviewList)>0}">
      <div class="w-50 center item item-review unchecked">
         <span>리뷰${fn:length(reviewList)}</span>
      </div>
   </c:if>
   <c:if test="${fn:length(reviewList)==0}">
      <div class="w-50 center item item-review unchecked">
         <span>리뷰</span>
      </div>
   </c:if>
</div>
      
<div class = "row center mb-30 detail">
   <div class = "row center mb-30">
      <h4>${itemDto.itemContent}</h4>
   </div>
</div>

   <div class="row center mt-40 mb-40 review hide">
      <div class="row center mb-30">
         <h4>REVIEW</h4>
         <hr>
      </div>

      <div class="row">
         <c:choose>
            <c:when test="${reviewList.isEmpty()}">
               <h4 style="padding-left: 20px">
                  <span>해당 상품의 리뷰가 없습니다</span>
               </h4>
            </c:when>

            <c:otherwise>
               <h5>리뷰수${fn:length(reviewList)}</h5>
               <table class="table left table-review-list">
                  <tbody>
                     <c:forEach var="list" items="${reviewList}">
                        <tr rowspan="7" id="box">
                           <td>
                              <c:if test="${list.reviewStar==1}">★(${list.reviewStar})</c:if>
                              <c:if test="${list.reviewStar==2}">★★(${list.reviewStar})</c:if>
                              <c:if test="${list.reviewStar==3}">★★★(${list.reviewStar})</c:if>
                              <c:if test="${list.reviewStar==4}">★★★★(${list.reviewStar})</c:if>
                              <c:if test="${list.reviewStar==5}">★★★★★(${list.reviewStar})</c:if>
                              <c:set var="total" value="${total+list.reviewStar}" />
                         
                           </td>
                        </tr>

                        <tr rowspan="6">
                           <td>
                           <c:out value="${fn:substring(list.customerId, 0, fn:length(list.customerId) - 4)}" />**** / ${list.reviewDate} 
                              <c:choose>
                                 <c:when test="${loginId != list.customerId}">
                                    <a href="/review/report?reviewNo=${list.reviewNo}&itemNo=${itemDto.itemNo}">/ [신고]</a>
                                 </c:when>
                                 <c:otherwise>
                                    <a href="#" onclick="fail();"> / [신고]</a>
                                 </c:otherwise>
                              </c:choose>
                           </td>
                        </tr>

                        <tr rowspan="6">
                           <td>
                              제품명 : ${itemDto.itemName} / 포장상태 :
                              ${list.reviewPackaging} / 배송상태 : ${list.reviewShipping}
                           </td>
                        </tr>

                        <tr rowspan="6" height="160">
                           <!--블라인드여부에따라 다르게 표시 -->
                           <c:choose>
                              <c:when test="${list.reviewBlind}">
                                 <td width="770" style="vertical-align: middle;">블라인드처리된게시물입니다.</td>
                              </c:when>
                              <c:otherwise>
                                 <td width="770" style="vertical-align: middle;">${list.reviewContent}</td>
                              </c:otherwise>
                           </c:choose>
                              <td  style="text-align: center; vertical-align: middle;">
                                 <img class="image-big" src="/reviewImage/download/${list.imageNo}" width="100">
                              </td>
                             ${list.imageNo}

                           <!--좋아요  -->                
                           <%-- <c:if test="${list.reviewCnt==0}">
                              <td style="text-align: center; vertical-align: middle;">
                                 <a href="/review/like?reviewNo=${list.reviewNo}&itemNo=${itemDto.itemNo}">♡</a>
                              </td>
                           </c:if> --%>
                           
                           <c:if test="${list.reviewCnt>=0}">
                              <td style="text-align: center; vertical-align: middle;">
                             <%--  <a href="/review/like?reviewNo=${list.reviewNo}&itemNo=${itemDto.itemNo}">♥${list.reviewCnt}</a>  --%>
                                 <c:if test="${loginId==null && list.reviewCnt>0}">
                                 	<i class="fa-solid fa-heart"></i>${list.reviewCnt}
                                 </c:if>
                                 <c:if test="${loginId==null && list.reviewCnt==0}">
                                 	<i class="fa-regular fa-heart"></i>
                                 </c:if>
                                 <c:if test="${loginId!=null}">
                                 	<a class="review-like-btn"  data-review-no="${list.reviewNo}" data-item-no="${itemDto.itemNo}">♥</a>
                                 	<span class="like-span">${list.reviewCnt}</span>
                                 </c:if>
                              </td>
                           </c:if>
                          	<tr>
                          		<td>
                          		<c:if test="${loginId == list.customerId}">
                          			(
                          			<a href="/review/delete?reviewNo=${list.reviewNo}&itemNo=${itemDto.itemNo}">
                          				<i class="fa-solid fa-trash"></i>
                          			</a> <!--리뷰 삭제-->
                          			)
                          		</c:if>
                       	<!--관리자로 접근 했을 때만 블라인드 처리가능  -->
               	
                           <c:choose>
                                 <c:when test="${list.reviewBlind}">
                                       <a href="/review/blind?reviewNo=${list.reviewNo}&itemNo=${itemDto.itemNo}">
                                      		<i class="fa-sharp fa-solid fa-person-walking-with-cane"></i>[해제]
                                      	</a>
                                 </c:when>
                                 <c:otherwise>
                                    
                                       <a href="/review/blind?reviewNo=${list.reviewNo}&itemNo=${itemDto.itemNo}">
                                       <i class="fa-sharp fa-solid fa-person-walking-with-cane"></i>[설정]
                                       </a>
                                    
                                 </c:otherwise>
                              </c:choose>
                           		</td>
                          	</tr>
                        </tr>

                     </c:forEach>
                  </tbody>
            </c:otherwise>
         </c:choose>
         	   <h5>
                  	사용자 총 평점
                     <fmt:formatNumber value=" ${total/fn:length(reviewList)}"
                     pattern="#,##0.00"></fmt:formatNumber>
               </h5>
      </table>

      </div>
	</div>



</div>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>