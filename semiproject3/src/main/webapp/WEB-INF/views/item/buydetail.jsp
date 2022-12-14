<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<jsp:include page="/WEB-INF/views/template/header.jsp">
<jsp:param value="상품 상세 페이지" name="title" />
</jsp:include>

<!-- 회원정보에 없는 이메일을 입력할 시에 출력되는 경고창 -->
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
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
         url:"${pageContext.request.contextPath}/rest/review/like",
         method:"post",
         data:{
            reviewNo:$(this).data("review-no"),
            itemNo:$(this).data("item-no")
         },
         success:function(resp){
        	 if(resp.reviewCnt>0){
        	 	$(that).next(".like-span").text("♥"+resp.reviewCnt);
        	 }else{
        		 $(that).next(".like-span").text("♡");
        	 }
        	 
        
         }
         })
      });
   });
   
   		//리뷰 사진
	   $(function(){
	       $(".image-big").click(function(){
	          var width=$(this).attr("width");
	          if(width=="100"){
	             var width= $(this).attr("width","200");
	          }else{
	             var width= $(this).attr("width","100");
	          }
	       })
	    });
      
    
      $(function(){
         $(".cart-in").click(function(){
            $(".item-form").attr("action", "${pageContext.request.contextPath}/cart/insert");
            $(".item-form").attr("method", "post");
         });
         $(".buy").click(function(){
            $(".item-form").attr("action", "${pageContext.request.contextPath}/orders/detail");
            $(".item-form").attr("method", "post");
         });
      });
      
       //작은 이미지 클릭하면 큰 이미지 변경
      $(function(){
        $(".item-mini-image").click(function(){
           var selectedImage = $(this).data("image-no");
           $("img[data-image=main]").attr("src", "${pageContext.request.contextPath}/image/download/"+selectedImage);
        });
     });
</script>

<style>
   #box{
      padding: 5px;
      border-top: 1px solid #D5D5D5;
   }
   
   /*    사진 밑에 작게 만드는 옵션 */
      .image.item-mini-image{
      object-fit: cover;
      width: 50px;
      max-height: 50px;
      cursor: pointer;
   }
</style>


<script type="text/javascript">
   function fail(){
      if(confirm("내가 작성한 글은 신고 할 수 없습니다")){
         return false;
      }
   }
   
   function fail2(){
	   var result=confirm('로그인후 사용할 수 있습니다. 로그인하시겠습니까?');
	   
	   if(result){
			location.replace("/customer/login");   
	   }else{
		   
	   }
	      }
	   
</script>

<div class="container-1000 mt-50 mb-50">

<div class="float-container">

<form class="item-form" action="${pageContext.request.contextPath}/cart/insert" method="post">
<div class="float-left w-50">
   <table class="table">
      <tbody>
          <tr>
            <th class="center">
               <c:forEach var="buylistView" items="${buyImageList}">
               <c:if test="${buylistView.imageMain == 1}">
                  <img src="${pageContext.request.contextPath}/image/download/${buylistView.imageNo}" style="width:320px; height: 430px;" data-image="main">
                  <input type="hidden" name="imageNo" value="${buylistView.imageNo}">
               </c:if>
               </c:forEach>
            </th>
         </tr>
         <tr>
            <td class="center">
                <c:forEach var="buylistView" items="${buyImageList}">
                    <c:if test="${buylistView.imageMain == 1}">
                        <img src="${pageContext.request.contextPath}/image/download/${buylistView.imageNo}" class="image image-blur item-mini-image" 
                           data-image-no="${buylistView.imageNo}"> 
                    </c:if>
                </c:forEach>
                <c:forEach var="buylistView" items="${buyImageList}">
                    <c:if test="${buylistView.imageMain == 0}">
                       <img src="${pageContext.request.contextPath}/image/download/${buylistView.imageNo}" class="image image-blur item-mini-image" 
                          data-image-no="${buylistView.imageNo}">
                    </c:if>
                </c:forEach>
            </td>
        </tr>
         <tr>
            <td class="right">
            ${itemDto.itemLikeCnt}
            
            <c:if test="${isLike == null}">
               <i class="fa-regular fa-heart"></i>
            </c:if>
            <c:if test="${isLike == true}">
               <a href="like?itemNo=${itemDto.itemNo}"><i class="fa-solid fa-heart"></i></a>
            </c:if>
            <c:if test="${isLike == false}">
               <a href="like?itemNo=${itemDto.itemNo}"><i class="fa-regular fa-heart"></i></a>
            </c:if>
            </td>
         </tr>
      </tbody>
   </table>
</div>

<div class="float-left w-50">
<div class="row">
   <input type="hidden" name="customerId" value="${loginId}">
   <input type="hidden" name="itemNo" value="${itemDto.itemNo}">
   <input type="text" name="itemName" value="${itemDto.itemName}" readonly class="input input-none" style="font-weight:bold;">
</div>
<div class="row">
   ${itemDto.itemMemo}
</div>
<hr>

<div class="row">
<table class="table">
   <tbody>
      <tr>
         <th class="w-33">Price</th>
         <td>
            <fmt:formatNumber value="${itemDto.itemPrice}" pattern="#,##0원"></fmt:formatNumber>
            <input type="hidden" name="itemPrice" value="${itemDto.itemPrice}">
         </td>
      <tr>
         <th>Option</th>
         <td>
            <select class="input w-100 input-option">
               <option value="">선택</option>
               <c:if test="${empty buylist || itemDto.itemTotalCnt == 0}">
                  <option disabled>상품준비중</option>
               </c:if>
               <c:forEach var="itemDto" items="${buylist}">
	           		<c:if test="${itemDto.itemTotalCnt !=0}">
	               		<c:choose>
	               			<c:when test="${itemDto.itemTotalCnt < 10}">
	               				<option data-total-cnt="${itemDto.itemTotalCnt}" data-color="${itemDto.itemColor}" 
				               		data-size="${itemDto.itemSize}">
			           				${itemDto.itemColor}/${itemDto.itemSize}(잔여수량:${itemDto.itemTotalCnt})[품절 임박]
			           			</option>
	               			</c:when>
	               			<c:otherwise>
				       			<option data-total-cnt="${itemDto.itemTotalCnt}" data-color="${itemDto.itemColor}" 
				               		data-size="${itemDto.itemSize}">
			           				${itemDto.itemColor}/${itemDto.itemSize}(잔여수량:${itemDto.itemTotalCnt})
			           			</option>
	               			</c:otherwise>
	               		</c:choose>
	           		</c:if>
               </c:forEach>
            </select>
         </td>
      </tr>
   </tbody>
</table>
</div>

<div class="row" style="min-height:280px;">
   <ul class="option-area middle" style="list-style: none;">
         
   </ul>
</div>
<div class="row">
<table class="table">
   <tbody>
      <tr>
         <td class="right">
            <button class="btn btn-positive buy" type="submit">구매하기</button>
            <button class="btn btn-positive cart-in" type="submit">장바구니</button>    
         </td>
      </tr>
   </tbody>
</table>
</div>
</div>

</form>
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
                        <tr id="box">
                           <td>
                              <c:if test="${list.reviewStar==1}">★(${list.reviewStar})</c:if>
                              <c:if test="${list.reviewStar==2}">★★(${list.reviewStar})</c:if>
                              <c:if test="${list.reviewStar==3}">★★★(${list.reviewStar})</c:if>
                              <c:if test="${list.reviewStar==4}">★★★★(${list.reviewStar})</c:if>
                              <c:if test="${list.reviewStar==5}">★★★★★(${list.reviewStar})</c:if>
                              <c:set var="total" value="${total+list.reviewStar}" />
                         
                           </td>
                        </tr>

                  <!-- 신고 -->
                        <tr>
                           <td>
                           <c:out value="${fn:substring(list.customerId, 0, fn:length(list.customerId) - 4)}" />**** / ${list.reviewDate} 
                              <c:choose>
                                 <c:when test="${loginId != list.customerId}">
                                    <a href="${pageContext.request.contextPath}/review/report?reviewNo=${list.reviewNo}&itemNo=${itemDto.itemNo}">/ [신고]</a>
                                 </c:when>
                                 <c:otherwise>
                                    <a href="#" onclick="fail();"> / [신고]</a>
                                 </c:otherwise>
                              </c:choose>
                           </td>
                        </tr>
                        
                  <!--제품/포장상태/배송상태  -->
                        <tr>
                           <td>
                              제품명 : ${itemDto.itemName} / 포장상태 :
                              ${list.reviewPackaging} / 배송상태 : ${list.reviewShipping}
                           </td>
                        </tr>
                  
                        <tr height="160">
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
                                 <img class="image-big" src="${pageContext.request.contextPath}/reviewImage/download/${list.imageNo}" width="100">
                              </td>
                              
                           <!--좋아요  -->                
                              <td width="100" style="text-align: center; vertical-align: middle;">
                             <c:choose>
                             
                                <c:when test="${loginId==null && list.reviewCnt ==0}">
                                   <a href="#" onclick="fail2()"><i class="fa-regular fa-heart"></i></a>
                                </c:when>
                                <c:when test="${loginId==null && list.reviewCnt >0}">
                                   <a href="#" onclick="fail2()"><i class="fa-solid fa-heart"></i>${list.reviewCnt}</a>
                                </c:when>
                                <c:when test="${loginId!=null && list.reviewCnt == 0}">
                                	<a class="review-like-btn"  data-review-no="${list.reviewNo}" data-item-no="${itemDto.itemNo}">
                                		좋아요
                                	</a>
                                	<span class="like-span"><i class="fa-regular fa-heart"></i></span>
                                </c:when>
                                <c:otherwise>
                                   <a class="review-like-btn"  data-review-no="${list.reviewNo}" data-item-no="${itemDto.itemNo}">
                                   		좋아요
                                   </a>
                                    <span class="like-span"><i class="fa-solid fa-heart"></i>${list.reviewCnt}</span>
                                </c:otherwise>
                             </c:choose>
                              </td>
                          
                          <!--리뷰 삭제-->
                             <tr>
                                <td>
                                <c:if test="${loginId == list.customerId}">
                                   (
                                   <a href="${pageContext.request.contextPath}/review/delete?reviewNo=${list.reviewNo}&itemNo=${itemDto.itemNo}">
                                      <i class="fa-solid fa-trash"></i>
                                   </a> 
                                   )
                                </c:if>
                                
                          <!--관리자로 접근 했을 때만 블라인드 처리가능  -->
                          <c:if test="${admin != null}">
                           <c:choose>
                                 <c:when test="${list.reviewBlind}">
                                       <a href="${pageContext.request.contextPath}/review/blind?reviewNo=${list.reviewNo}&itemNo=${itemDto.itemNo}">
                                            <i class="fa-sharp fa-solid fa-person-walking-with-cane"></i>[해제]
                                         </a>
                                 </c:when>
                                 <c:otherwise>
                                    
                                       <a href="${pageContext.request.contextPath}/review/blind?reviewNo=${list.reviewNo}&itemNo=${itemDto.itemNo}">
                                       <i class="fa-sharp fa-solid fa-person-walking-with-cane"></i>[설정]
                                       </a>
                                    
                                 </c:otherwise>
                              </c:choose>
                              </c:if>
                                 </td>
                             </tr>
                     </c:forEach>
                        <h5>
                           사용자 총 평점
                           <fmt:formatNumber value=" ${total/fn:length(reviewList)}"
                           pattern="#,##0.00"></fmt:formatNumber>
                        </h5>
               </tbody>
            </table>
         </c:otherwise>
      </c:choose>
   </div>
</div>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>