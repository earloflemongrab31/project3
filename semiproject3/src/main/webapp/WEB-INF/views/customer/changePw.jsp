<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/customerHeader.jsp">
	<jsp:param value="비밀번호변경" name="title"/>
</jsp:include>
<script>
/* 비밀번호 변경 */
	$(function(){
	    $(".btn-check-pw").click(function(){
	        var inputPw = $(".input[name=checkPw]").val();
	        var loginId = $("input[name=loginId]").val();
	        //console.log(inputPw);
	        
	        $.ajax({
	            url: "//localhost:8888/rest/customer/pw",
	            method:"post",
	            data:{
	                inputPw: inputPw,
	                loginId: loginId
	            },
	            success: function(resp){
	                if(resp == "NNNNY"){
	                    $(".check-pw").addClass("NNNNY");
	                    $(".input-pw").addClass("NNNNY");
	                }
	                else{
	                	$(".input[name=checkPw]").addClass("NNNNN");
	                }
	            }
	        });
	    });
	    
	    $(".input[name=customerPw").blur(function(){
	        var inputPw = $(this).val();
	        if(!inputPw){
	            $("#customer-pwcheck").removeClass("fail NNNNY");
	        }
	        var regex = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[!@#$])[a-zA-Z0-9!@#$]{8,16}$/;//나중에 필수 추가 비밀번호 추가하기
	        var judge = regex.test(inputPw);
	        $(this).removeClass("fail NNNNY");
	        if(judge){
	            $(this).addClass("NNNNY");
	        }
	        else{
	            $(this).addClass("fail");
	        }
	        $("#customer-pwcheck").blur();
	    });
	    $("#customer-pwcheck").blur(function(){
	        var pwCheck = $(this).val();
	        if(!pwCheck){
	            $(this).removeClass("fail NNNNY");
	            return;
	        };
	        if(!$(".input[name=customerPw]").hasClass("NNNNY")) return;
	        var pw = $(".input[name=customerPw").val();
	        var judge = pw == pwCheck;
	        
	        $(this).removeClass("fail NNNNY");
	        if(judge){
	            $(this).addClass("NNNNY");
	        }
	        else{
	            $(this).addClass("fail");
	        }
	    });
		
	    $(".change-pw").submit(function(){
	        $(".input[name=customerPw]").blur();
	        $("#customer-pwcheck").blur();
	
	        if($(".input.NNNNY").length == 2){
	            return true;
	        }
	        return false;
	    });
	    
	});
</script>
<section>
    <div class="container-300 mt-50 mb-50">
    
    <div class="row center">
        <h1>비밀번호 변경</h1>
        <hr>
    </div>
    
    <input type="hidden" name="loginId" value="${loginId}">

    <div class="row check-pw">
        <div class="row">
            <label>기존 비밀번호 입력
            <input class="input w-100" type="password" name="checkPw">
            <span class="NNNNN-message">입력하신 정보를 확인해주세요.</span>
            </label>
        </div>
        
        <div class="row mt-30">
            <button class="btn btn-negative w-100 btn-check-pw" type="button">비밀번호 확인</button>
        </div>
    </div>

<form action="changePw" method="post" class="change-pw">
	<div class="row input-pw">
		<div class="row">
		    <label>변경 비밀번호 입력
		    <input class="input w-100" type="password" name="customerPw">
		    <span class="NNNNY-message"><i class="fa-solid fa-check"></i></span>
		    <span class="fail-message">영문 대소문자/숫자/특수[!@#$]를 포함한 8~16자로 설정해야 합니다.</span>
	    	</label>
		</div>
		
		<div class="row">
		    <label>변경 비밀번호 확인
		    <input class="input w-100" type="password" id="customer-pwcheck">
		    <span class="NNNNY-message"><i class="fa-solid fa-check"></i></span>
		    <span class="fail-message">비밀번호가 일치하지 않습니다.</span>
		    </label>
		</div>
            
        <div class="row mt-30">
            <button class="btn btn-positive w-100" type="submit">변경하기</button>
        </div>
    </div>
</form>
       
    </div>
</section>
<jsp:include page="/WEB-INF/views/template/customerFooter.jsp"></jsp:include>