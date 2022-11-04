<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<jsp:include page="/WEB-INF/views/template/customerHeader.jsp">
    <jsp:param value="주소 수정 페이지" name="title"/>
</jsp:include>
 
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="daum-post-apl.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/lodash.js/4.17.21/lodash.min.js"></script>

<script>
    function findAddress() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.querySelector("[name=addressPost]").value=data.zonecode;
                document.querySelector("[name=addressHost]").value=addr;
             
                // 커서를 상세주소 필드로 이동한다.
                document.querySelector("[name=addressDetailHost]").focus();
            }
        }).open();
    }
</script>


 <script type = "text/javascript">

$(function(){
    $(".btn-find-address").click(findAddress);
});

$(function(){
	$(window).on("beforeunload", function(){
	    return false;
	});
	$(".btn-pass").click(function(){
	    $(window).off("beforeunload");
	    return true;
	});
});
  </script>
    
    
    
<form action="edit" method="post" >

<input name="addressNo" type="hidden" value="${addressDto.addressNo}">
	
<section>
	<div class="container-600">
 
	<div class="row center">
		<h1>ADDRESS</h1>
		<hr>
	</div>


 	<div class="row">
		<label>배송지명 <input name="addressName" type="text" required
			class="input mt-10 w-100" autocomplete="off" value="${addressDto.addressName}">
		</label>
		
	</div>
	
	<div class="row">
		<label>전화번호 <input name="addressTel" type="text" required value="${addressDto.addressTel}"
			class="input mt-10 w-100" autocomplete="off">
		</label>
	</div>
		


    <div class="row">
        <label>
 			<button class="btn btn-neutral btn-find-address">
          	  <i class="fa-solid fa-house"></i> 주소검색
        	</button>
        </label>
 	</div>

	<div class="row">
		<input type="text" class="input" name="addressPost" placeholder="우편번호" size="6" maxlength="6" required value="${addressDto.addressPost}">
	</div>
       
    <div class="row">
        <input type="text" class="input w-100" name="addressHost" placeholder="기본주소" required value="${addressDto.addressHost}">
    </div>

    <div class="row">
        <input type="text" class="input w-100" name="addressDetailHost" placeholder="상세주소" value="${addressDto.addressDetailHost}">
    </div>
    

    <div class="row right">
		<button class="btn btn-positive btn-pass" type="submit">수정</button>
	</div>

</div>
</section>
   </form>

<jsp:include page="/WEB-INF/views/template/customerFooter.jsp"></jsp:include>
    