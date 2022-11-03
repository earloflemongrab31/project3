<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="회원가입" name="title"/>
</jsp:include>

<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
<script language="JavaScript" src="http://www.webmadang.net/javascript/js/calendarDateInput.js"></script>
<script type="text/javascript">
/* 회원가입 */
	$(function(){
	    var inputStatus = {
	            memberIdValid:false,
	            memberNickValid:false,
	            memberPwValid:false,
	            memberPwcheckValid:false,
	            memberPwsearchValid:false,
	            memberNameValid:false,
	            memberPhoneValid:false,
	            valid:function(){
	                return this.memberIdValid && this.memberNameValid && this.memberNickValid && this.memberPhoneValid 
	                        && this.memberPwValid && this.memberPwcheckValid && this.memberPwsearchValid;
	            }
	        };
	    $(".join-form").submit(function(){
	        if(!inputStatus.valid()){
	            return false;
	        }
	        return true;
	    });
	    $(".input[name=customerId]").blur(function(){
	        var inputId = $(this).val();
	        var regex = /^[a-z][a-z0-9_-]{4,19}$/;
	        var judge = regex.test(inputId);
	        $(this).removeClass("fail NNNNN NNNNY");
	        if(judge){
	            var that = this;
	            $.ajax({
	                url: "http://localhost:8888/rest/customer/id",
	                method: "post",
	                data: {
	                    inputId: inputId
	                },
	                success:function(resp){
	                    if(resp == "NNNNY"){
	                        $(that).addClass("NNNNY");
	                        inputStatus.memberIdValid = true;
	                    }
	                    else{
	                        $(that).addClass("NNNNN");
	                        inputStatus.memberIdValid = false;
	                    }
	                }
	            });
	        }
	        else{
	            $(this).addClass("fail");
	            inputStatus.memberIdValid = false;
	        }
	    });
	    $(".input[name=customerPw").blur(function(){
	        var inputPw = $(this).val();
	        var regex = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[!@#$])[a-zA-Z0-9!@#$]{8,16}$/;//나중에 필수 추가 비밀번호 추가하기
	        var judge = regex.test(inputPw);
	        $(this).removeClass("fail NNNNY");
	        if(judge){
	            $(this).addClass("NNNNY");
	            inputStatus.memberPwValid = true;
	        }
	        else{
	            $(this).addClass("fail");
	            inputStatus.memberPwValid = false;
	        }
	        $("#customer-pwcheck").blur();
	    });
	    $("#customer-pwcheck").blur(function(){
	        var pwCheck = $(this).val();
	        if(!pwCheck){
	            $(this).removeClass("fail NNNNY");
	            inputStatus.memberPwcheckValid = false;
	            return;
	        };
	        if(!$(".input[name=customerPw]").hasClass("NNNNY")) return;
	        var pw = $(".input[name=customerPw").val();
	        var judge = pw == pwCheck;
	        
	        $(this).removeClass("fail NNNNY");
	        if(judge){
	            $(this).addClass("NNNNY");
	            inputStatus.memberPwcheckValid = true;
	        }
	        else{
	            $(this).addClass("fail");
	            inputStatus.memberPwcheckValid = false;
	        }
	    });
	    $(".input[name=customerNick]").blur(function(){
	        var inputNick = $(this).val();
	        var regex = /^[가-힣][가-힣0-9]{0,9}$/;
	        var judge = regex.test(inputNick);
	        $(this).removeClass("fail NNNNN NNNNY admin");
	        if(inputNick.search("관리자") >= 0){
	            $(this).addClass("admin");
	            inputStatus.memberNickValid = false;
	            return;
	        }
	        if(judge){
	            var that = this;
	            $.ajax({
	                url: "http://localhost:8888/rest/customer/nick",
	                method: "post",
	                data: {
	                    inputNick: inputNick
	                },
	                success: function(resp){
	                    if(resp == "NNNNY"){
	                        $(that).addClass("NNNNY");
	                        inputStatus.memberNickValid = true;
	                    }
	                    else{
	                        $(that).addClass("NNNNN");
	                        inputStatus.memberNickValid = false;
	                    }
	                }
	            });
	        }
	        else{
	            $(this).addClass("fail");
	            inputStatus.memberNickValid = false;
	        }
	    });
	    $(".input[name=customerPwsearch").blur(function(){
	        var pwsearch = $(this).val();
	        $(this).removeClass("fail");
	        if(pwsearch == ""){
	            $(this).addClass("fail");
	            inputStatus.memberPwsearchValid = false;
	        }
	        else{
	            $(this).removeClass("fail");
	            inputStatus.memberPwsearchValid = true;
	        }
	    });
	    
	    $(".input[name=customerName").blur(function(){
	        var name = $(this).val();
	        var regex = /^[가-힣]{2,7}$/;
	        var judge = regex.test(name);
	        
	        $(this).removeClass("fail NNNNN");
	        if(name == ""){
	            $(this).addClass("fail");
	            inputStatus.memberNameValid = false;
	        }
	        else{
	            if(!judge){
	                $(this).addClass("NNNNN");
	                inputStatus.memberNameValid = false;
	                return;
	            }
	            $(this).removeClass("fail");
	            inputStatus.memberNameValid = true;
	        }
	    });
	    $(".input[name=customerPhone").blur(function(){
	        var phone = $(this).val();
	        var regex = /^01[016789][1-9]\d{6,7}$/;
	        var judge = regex.test(phone);
	        
	        $(this).removeClass("fail NNNNN");
	        if(phone == ""){
	            $(this).addClass("fail");
	            inputStatus.memberPhoneValid = false;
	        }
	        else{
	            if(!judge){
	                $(this).addClass("NNNNN");
	                inputStatus.memberPhoneValid = false;
	                return;
	            }
	            $(this).removeClass("fail");
	            inputStatus.memberPhoneValid = true;
	        }
	    });
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
<form class="join-form" action="insert" method="post" autocomplete="off">

    <div class="container-1000 mt-50 mb-50">
        <div class="row center mb-50">
            <h1>JOIN US</h1>
        </div>

        <div class="row">
        <table class="table table-slit mb-30">
            <thead>
                <tr>
                    <th class="left w-15">기본정보</th>
                    <td class="right"><span class="required">*</span>필수입력 사항</td>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <th>아이디<span class="required">*</span></th>
                    <td>
                        <input class="input w-40" type="text" name="customerId">
                        <span class="NNNNY-message"><i class="fa-solid fa-check"></i></span>
                        <span class="NNNNN-message">이미 사용 중인 아이디입니다.</span>
                        <span class="fail-message">영문 소문자/숫자, 5~20자로 설정해야 합니다.</span>
                    </td>
                </tr>
                <tr>
                    <th>비밀번호<span class="required">*</span></th>
                    <td>
                        <input class="input w-40" type="password" name="customerPw">
                        <span class="NNNNY-message"><i class="fa-solid fa-check"></i></span>
                        <span class="fail-message">영문 대소문자/숫자/특수[!@#$]를 포함한 8~16자로 설정해야 합니다.</span>
                    </td>
                </tr>
                <!-- 비밀번호 확인 질문 말고도 다른 방법 있는지 생각해보기 -->	
                <tr>
                    <th>비밀번호 확인<span class="required">*</span></th>
                    <td>
                        <input class="input w-40" type="password" id="customer-pwcheck">
                        <span class="NNNNY-message"><i class="fa-solid fa-check"></i></span>
                        <span class="fail-message">비밀번호가 일치하지 않습니다.</span>
                    </td>
                </tr>	
                <tr>
                    <th rowspan="2" style="vertical-align:middle">비밀번호 확인 질문<span class="required">*</span></th>
                    <td style="font-size:16px; padding:1em;">
                        나의 보물 1호는?
                    </td>
                </tr>
                <tr>
                    <td>
                        <input class="input w-40" type="text" name="customerPwsearch" placeholder="질문답변">
                        <span class="fail-message">필수 입력 항목입니다.</span>
                    </td>
                </tr>
                <tr>
                    <th>닉네임<span class="required">*</span></th>
                    <td>
                        <input class="input w-40" type="text" name="customerNick">
                        <span class="NNNNY-message"><i class="fa-solid fa-check"></i></span>
                        <span class="NNNNN-message">이미 사용 중인 닉네임입니다.</span>
                        <span class="fail-message">한글/숫자, 1~10자로 설정해야 합니다.</span>
                        <span class="admin-message">사용할 수 없는 닉네임입니다.</span>
                    </td>
                </tr>
                <tr>
                    <th>이름<span class="required">*</span></th>
                    <td>
                        <input class="input w-40" type="text" name="customerName">
                        <span class="fail-message">필수 입력 사항입니다.</span>
                        <span class="NNNNN-message">한글만 입력 가능합니다.</span>
                    </td>
                </tr>
                <tr>
                    <th>생년월일<span class="required">*</span></td>
                    <td>					
                    <input class="input w-40" type="date" name="customerBirth">
 
                    </td>
                </tr>
                <tr>
                    <th>휴대전화<span class="required">*</span></th>
                    <td>
                        <input class="input w-40" type="tel" name="customerPhone" maxlength="11" placeholder="010XXXXXXXXX">
                        <span class="fail-message">필수 입력 사항입니다.</span>
                        <span class="NNNNN-message">형식에 맞게 입력 가능합니다.</span>
                    </td>
                </tr>
            </tbody>
        </table>


        <table class="table table-slit mb-50">
            <thead>
                <tr>
                    <th class="left" colspan="2">추가정보</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <th class="w-15">일반전화</td>
                    <td>
                        <input class="input w-40" type="tel" name="customerTel" maxlength="11" placeholder="하이픈(-)제외">
                    </td>
                </tr>
                <tr>
                    <th>이메일</td>
                    <td>
                        <input class="input w-40" type="email" name="customerEmail">
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
    <div class="row center">
        <button class="btn btn-positive w-25 btn-join btn-pass" type="submit">가입하기</button>
    </div>	
    </div>	
</form>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>


