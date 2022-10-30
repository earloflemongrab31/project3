<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">
<title>
	<c:choose>
		<c:when test="${param.title != null}">
			${param.title}
		</c:when>
		<c:otherwise>
			semi3조
		</c:otherwise>
	</c:choose>
</title>

<!-- 글꼴 cdn -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Serif+KR:wght@300&display=swap" rel="stylesheet">

<!-- 디자인 틀 -->
<link rel="stylesheet" type="text/css" href="/css/reset.css">
<link rel="stylesheet" type="text/css" href="/css/commons.css">
<link rel="stylesheet" type="text/css" href="/css/layout.css">

<!-- 틀 선 디자인할 때 주석 풀기 -->
<!-- <link rel="stylesheet" type="text/css" href="/css/test.css"> -->

<!-- 아이콘 cdn -->
<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"/>

<!-- lightpick 사용을 위한 CDN 추가 -->
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/lightpick@1.6.2/css/lightpick.css">
<script src="https://cdn.jsdelivr.net/npm/moment@2.29.4/moment.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/lightpick@1.6.2/lightpick.min.js"></script>

<!-- swiper 의존성 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.css"/>
<script src="https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.js"></script>

<!-- jQuery -->
<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"/>
<script src="http://code.jquery.com/jquery-3.6.1.js"></script>
<!-- 배포 시 min 버전으로 -->
<!-- <script src="http://code.jquery.com/jquery-3.6.1.min.js"></script> -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/lodash.js/4.17.21/lodash.min.js"></script>

<!-- summernote 라이브러리 -->
<link rel="stylesheet" type="text/css" href="/summernote/summernote-lite.css">
<script src="/summernote/summernote-lite.js"></script>
<script src="/summernote/lang/summernote-ko-KR.min.js"></script>

<style>
	.input.find{
	    padding-left: 2em;
	    padding-top: 0.25em;
		background-image: url("/image/search.webp");
	    background-size: 1em;
	    background-repeat: no-repeat;
	    background-position-x: 0.5em;
	    background-position-y: center;
	    font-size: 14px;
	}
	
	li.cart{
		width: 50px;
		padding-right: 20px;
	}
	.ad{
		background-color: black;
		text-align: center;
		color: white;
		padding: 0.5em;
		margin: 0;
	}
	.delete{
		cursor: pointer;
	}
	.ad a img{
		vertical-align: middle;
		height: 1em;
	}
	.required{
		color: darkred;
	}
	
	/* 설문조사 */
	.fullscreen > .modal.survey{
		background-image: url("/image/survey.png");
	    background-size: 100%;
	    background-repeat: no-repeat;
	}
	
	/* 아이템 디테일 상세보기, 리뷰 토글 디자인*/
		.item{
		padding: 0.75em;
		border: 1px solid #D5D5D5;
		cursor: pointer;
	}
	.item.unchecked{
			color: white;
		background-color: lightgray;
	}
	
	/* 로그인 토글 디자인 */
	.user{
		padding: 0.75em;
		border: 1px solid #D5D5D5;
		border-bottom: none;
		cursor: pointer;
	}
	.user.unchecked{
		color: white;
		background-color: lightgray;
	}
	.input.NNNNN ~ .NNNNN-message,
    .input.NNNNY ~ .NNNNY-message,
    .input.fail ~ .fail-message,
    .input.admin ~ .admin-message{
        display: inline-block;
    }
    .NNNNN-message,
    .NNNNY-message,
    .fail-message,
    .admin-message{
        display: none;
    }
    
    /* 비밀번호 변경 */
    .input-pw{
        display: none;
    }
    .input-pw.NNNNY{
        display: block;
    }
    .check-pw.NNNNY{
        display: none;
    }

    .input.NNNNN{
        border: 1px solid black;
    }
    .input.NNNNN ~ .NNNNN-message{
        display:block;
    }
    .NNNNN-message{
        display:none;
    } 

    .input.NNNNN ~ .NNNNN-message,
    .input.NNNNY ~ .NNNNY-message,
    .input.fail ~ .fail-message,
    .input.admin ~ .admin-message{
        display: inline-block;
    }
    .NNNNN-message,
    .NNNNY-message,
    .fail-message,
    .admin-message{
        display: none;
    }

	/* swiper */
    .swiper{
        width: 100%;
        z-index: 0;
    }
    
    .mySwiper .swiper-slide {
      text-align: center;
      font-size: 18px;
      background: #fff;
      margin-right: 100px;

      /* Center slide text vertically */
      display: -webkit-box;
      display: -ms-flexbox;
      display: -webkit-flex;
      display: flex;
      -webkit-box-pack: center;
      -ms-flex-pack: center;
      -webkit-justify-content: center;
      justify-content: center;
      -webkit-box-align: center;
      -ms-flex-align: center;
      -webkit-align-items: center;
      align-items: center;
    }

    .swiper-slide img {
      display: block;
      width: 100%;
      height: 480px;
      object-fit: cover;
    }
    
    .footer{
    	padding: 0 3em;
    }
    
    .right-word{
    	 margin-right:10px;
    }
    
</style>
<script type="text/javascript">
	$(function(){
		$(".survey").find(".delete").click(function(){
			$(".fullscreen").removeClass("fullscreen");
			$(".survey").children().addClass("hide");
		});
		
		$(".ad").find(".delete").click(function(){
			$(this).parent().slideUp();
		});
		
		// datepicker 할 때 필요한 기능 - 안 바꿀거면 지워도 됨
		var picker1 = new Lightpick({
            // field : datepicker 적용 대상을 설정하는 공간
            field:document.querySelector(".single-date-picker"),
            // format : 선택한 날짜의 적용 형식 설정
            format: "YYYY-MM-DD",
            // (옵션) 미래/과거를 선택하지 못 하도록 설정(minDate, maxDate)
            maxDate: moment()
		});
	});
	
	/* 설문조사 버튼 & 프로그레스바 */
	$(function(){
        //1. 첫번째 이전버튼과 마지막 다음버튼을 삭제
        $(".prev").first().remove();
        $(".next").last().remove();

        //2. 1페이지만 남기고 다 숨김 처리
        $(".page").hide();
        $(".page").first().show();

        //3. 페이지당 늘어나야 할 % 계산
        var step = 100 / $(".page").length;
        var percent = step;
        $(".progressbar > .inner").css("width", percent+"%");

        //4. 남은 버튼에 클릭 이벤트를 설정
        //- 다음 버튼을 누르면 해당 페이지의 뒷 페이지 표시 및 나머지 숨김
        //- 이전 버튼을 누르면 해당 페이지의 앞 페이지 표시 및 나머지 숨김
        $(".next").click(function(){
            //this == 클릭한 다음 버튼
            //var target = $(this).parent().parent().parent().next();
            var target = $(this).parents(".page").next();

            //모든 페이지 숨기고 target만 표시
            $(".page").hide();
            target.show();

            //% 증가
            percent += step;
            $(".progressbar > .inner").css("width", percent+"%");
        });
        $(".prev").click(function(){
            var target = $(this).parents(".page").prev();
            $(".page").hide();
            target.show();

            //% 감소
            percent -= step;
            $(".progressbar > .inner").css("width", percent+"%");
        });
        
        //항목에 체크가 되어야 다음 버튼 활성화
        $("input").on("input", function(){
            // console.log($(this).parent().parent().next().find(".next"));
            if($(this).prop("checked")){
                $(this).parent().parent().next().find(".next").attr("disabled", false);
            }
        });
        
        $("textarea").on("input", function(){
            // console.log($(this).val().length);
            if($(this).val().length >= 10){
                $(this).parent().next().find(".next").attr("disabled", false);
            }
        });

        // 모든 항목 입려 시 제출 버튼 활성화
        $(".research-form").submit(function(){
            var successAnswer = $(".last-answer").val().length >= 10;
            if(successAnswer){
                return true;
            }
            return false;
        });
    });
        
	/* 로그인 페이지 토글 */
	$(function(){
		$(".user-admin").click(function(){
			$(this).removeClass("unchecked");
			$(this).prev("div").addClass("unchecked");
			$(".customer-join").addClass("hide");
			$(".login-form").attr("action", "/admin/login");
			$(".login-form").find(".id").attr("name", "adminId");
			$(".login-form").find(".pw").attr("name", "adminPw");
		});
		$(".user-customer").click(function(){
			$(this).removeClass("unchecked");
			$(this).next("div").addClass("unchecked");
			$(".customer-join").removeClass("hide");
			$(".login-form").attr("action", "login");
			$(".login-form").find(".id").attr("name", "customerId");
			$(".login-form").find(".pw").attr("name", "customerPw");
		});
	});
	
	/* 아이템 디테일 상세보기, 리뷰 토글 */
   $(function(){
      $(".item-review").click(function(){
         $(this).removeClass("unchecked");
         $(this).prev("div").addClass("unchecked");
         $(".review").removeClass("hide");
         $(".detail").addClass("hide");
      });
      $(".item-detail").click(function(){
         $(this).removeClass("unchecked");
         $(this).next("div").addClass("unchecked");
         $(".detail").removeClass("hide");
         $(".review").addClass("hide");
      });
   });
	
	
	/* 사이드메뉴 토글 */
	$(function(){
		$(".accordian").find("li").click(function(e){
			e.stopPropagation();
			
          	$(this).children("ul").slideToggle();			
		});
	});
	
	/* 회원가입 */
    $(function(){

        var inputStatus = {
            memberIdValid:false,
            memberNickValid:false,
            memberPwValid:false,
            memberPwcheckValid:false,
            memberPwsearchValid:false,
            memberNameValid:false,
            memberPhoneValid:false
        };

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
            var regex = /^[a-zA-Z0-9!@#$]{8,16}$/;//나중에 필수 추가 비밀번호 추가하기
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
            if(inputNick == '관리자'){
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
    });
	
    $(function(){
        $("textarea.content").summernote({
            height: 200,//높이
            minHeight: 300,
            maxHeight: 300,
            placeholder: "내용을 작성하세요.",//도움말
            lang: "ko-KR"//언어 설정
        });
    });
    
    /* 비밀번호 변경 */
    $(function(){
        $(".btn-check-pw").click(function(){
            var inputPw = $(".input[name=checkPw]").val();
            var loginId = $("input[name=loginId]").val();
            //console.log(inputPw);
            
            $.ajax({
                url: "http://localhost:8888/rest/customer/pw",
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
            var regex = /^[a-zA-Z0-9!@#$]{8,16}$/;//나중에 필수 추가 비밀번호 추가하기
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
    
    /* 메인이미지 스와이퍼 */
    $(function(){
        var swiper = new Swiper('.swiper.main', {
            // 화면 넘기기 옵션
            direction: 'horizontal',
            loop: true,

            // 페이징 옵션
            pagination: {
                el: '.swiper-pagination',// 페이징 적용 대상
                type: 'bullets',// 페이징 도구 모양
                clickable: true
            },

            // 자동재생 옵션
            autoplay: {
                delay: 5000
            }, 

            //페이지 전환 효과
            effect: "fade",//페이드 인-아웃 효과

        });
    });

    /* 새상품이미지 스와이퍼 */
    $(function(){
        var swiper = new Swiper('.swiper.mySwiper', {
            // 화면 넘기기 옵션
            direction: 'horizontal',
            loop: true,
			slidesPerView: 3,
			spaceBetween: 30,
			pagination: {
				el: ".mySwiper .swiper-pagination",
				clickable: true
			},

            // 좌우 버튼 옵션
            navigation: {
                nextEl: '.swiper-button-next',
                prevEl: '.swiper-button-prev',
            },
            
            // 자동재생 옵션
            autoplay: {
                delay: 5000
            }, 

            //페이지 전환 효과
            effect: "slide",//기본 방식

        });
    });
    
    //설문조사 완료창 타이머
    $(function(){
    	var time = $("#timer").text();
    	
    	var timer = setInterval(function(){
    		time--;
    		
    	if(time == 1){
    		clearInterval(timer);
    	}
    		$("#timer").html(time);
    	}, 1000);
    });
    
/* 	//구매 옵션 불러오기
	$(function(){
	    $(".input-option").on("input",function(){
	        var color = $(this).find("option:selected").data("color");//선택한 색
	        var size = $(this).find("option:selected").data("size");//선택한 사이즈
	        var totalcnt = $(this).find("option:selected").data("cnt");//선택한 옵션의 재고
	        console.log(color);
	        console.log(size);
	        console.log(totalcnt);
	        if(!color) return;//값 없으면 리턴
	        
	        var plusLine = $("<li>").addClass("flexbox option w-100");//option 클래스를 가지는 한칸 만들기
	            
	        var icon = $("<i>").addClass("w-25 right fa-solid fa-xmark");//i 태그 엑스 표시 추가
	        icon.click(function(){//누르면 가장 상위 option class를 가지는 tr 삭제
	            $(this).parent(".option").remove();
	        });
	        
	        var colorOption = $("<input>").addClass("w-25 input input-none").val(color).attr("type", "text").attr("name", "itemColor").prop("readonly", true);
	        var sizeOption = $("<input>").addClass("w-25 input input-none").val(size).attr("type", "text").attr("name", "itemSize").prop("readonly", true);
	        var cnt = $("<input>").addClass("w-25 input").attr("type", "number").attr("name", "itemCnt").attr("min", 1).attr("max", totalcnt).val(1);
	        
	        colorOption.appendTo(plusLine);
	        sizeOption.appendTo(plusLine);
	        cnt.appendTo(plusLine);
	        icon.appendTo(plusLine);
	
	        plusLine.appendTo($(".option-area"));
	
	        $(".input-option").val("");
	        $("input[name=itemTotalCnt]").attr("value", totalcnt);
	    });
// 	    $("select[name=itemColor]").change(function(){
        	
// 			var color = $(this).val();
// 			var size = $(this).find("option:selected").attr("data-size");//가능 //문자열로 읽어온다. //find - 내부에 있는걸 탐색하는 기능
// 			var totalcnt = $(this).find("option:selected").attr("data-cnt");
// 			console.log(color);		
// 			console.log(size);
// 			console.log(totalcnt);
// 			$("input[name=itemSize]").attr("value", size);
// 			$("input[name=itemTotalCnt]").attr("value", totalcnt);
// 			$("input[name=itemCnt]").attr("max", totalcnt);
// 			$("input[name=itemCnt]").val(0);
// 		});
	});
    
    //게시글 삭제 시 즉시 삭제 방지
	$(function(){
		$("a.delete").click(function(e){
            var choice = confirm("삭제하시겠습니까?");
            if(choice){
                return true;
            }
            else{
                return false;
            }
		});
	});

    //로그아웃 시 즉시 로그아웃 방지
	$(function(){
		$("a.logout").click(function(e){
            var choice = confirm("로그아웃 하시겠습니까?");
            if(choice){
                return true;
            }
            else{
                return false;
            }
		});
	});
    
</script>

</head>

<body>

<header>
<!-- 
	광고 구현 중
	1. 구글플레이 이미지 중간 맞춤
	2. 새로고침 할 때마다 나옴
	3. 관리자 페이지 들어가면 없애야 할 듯
 -->
<c:if test="${loginGrade != '관리자'}">
	<div class="float-container ad">
		"쇼핑몰명 앱" 설치 시 <span style="color:orange;">쿠폰팩 증정!</span> 지금 바로 앱스토어에서 다운 받기
		<a href="https://play.google.com/store/games?utm_source=apac_med&utm_medium=hasem&utm_content=Oct0121&utm_campaign=Evergreen&pcampaignid=MKT-EDR-apac-kr-1003227-med-hasem-py-Evergreen-Oct0121-Text_Search_BKWS-BKWS%7CONSEM_kwid_43700058439438694_creativeid_477136209358_device_c&gclid=Cj0KCQjwnbmaBhD-ARIsAGTPcfVKNmc0jEnLgOhSuzblsyh0eJfXILaAubbz457HBJSfKVSPzXMuzCYaAkcaEALw_wcB&gclsrc=aw.ds">
			<img src="/image/googleplay.png">
		</a>
		<span class="float-right delete" style="font-family:sans-serif;"><i class="fa-solid fa-xmark"></i></span>
	</div>
</c:if>

<div class="float-container">
	<div class="float-left">
		<h2 class="logo">
			<a href="/">Logo</a>
		</h2>
	</div>
	<c:if test="${loginGrade == '일반' || loginGrade == 'VIP'}">
		<div class="right-word row float-right">
			${loginId}님, 안녕하세요.
		</div>
	</c:if>
	<c:if test="${loginGrade == '관리자'}">
		<div class="right-word row float-right">
			<a href="/admin/">관리자페이지</a>
		</div>
	</c:if>
</div>
</header>

<!-- 드롭다운 메뉴 -->
<nav>
<div class="float-container">
<ul class="dropdown-menu">
	<!-- 좌측 드롭다운 메뉴 -->
	<li class="float-left">
		<a href="/item/buylist">BEST</a>
	</li>
	<li class="float-left">
		<a href="#">New</a>
	</li>
	<li class="float-left">
		<a href="/item/buylist?keyword=100">outer</a>
		<ul>
			<li>
				<a href="/item/buylist?type=cate_code&keyword=101">자켓</a>
			</li>
			<li>
				<a href="/item/buylist?type=cate_code&keyword=102">코트</a>
			</li>
			<li>
				<a href="/item/buylist?type=cate_code&keyword=103">가디건</a>
			</li>
			<li>
				<a href="/item/buylist?type=cate_code&keyword=104">패딩</a>
			</li>
		</ul>
	</li>
	<li class="float-left">
		<a href="/item/buylist?keyword=200">top</a>
		<ul>
			<li>
				<a href="/item/buylist?type=cate_code&keyword=201">민소매</a>
			</li>
			<li>
				<a href="/item/buylist?type=cate_code&keyword=202">티셔츠</a>
			</li>
			<li>
				<a href="/item/buylist?type=cate_code&keyword=203">맨투맨</a>
			</li>
			<li>
				<a href="/item/buylist?type=cate_code&keyword=204">니트</a>
			</li>
			<li>
				<a href="/item/buylist?type=cate_code&keyword=205">블라우스</a>
			</li>
		</ul>
	</li>
	<li class="float-left">
		<a href="/item/buylist?keyword=300">pants</a>
		<ul>
			<li>
				<a href="/item/buylist?type=cate_code&keyword=301">청바지</a>
			</li>
			<li>
				<a href="/item/buylist?type=cate_code&keyword=302">면바지</a>
			</li>
			<li>
				<a href="/item/buylist?type=cate_code&keyword=303">슬랙스</a>
			</li>
		</ul>
	</li>
	<li class="float-left">
		<a href="/item/buylist?type=cate_code&keyword=401">skirt</a>
	</li>
	<li class="float-left">
		<a href="/item/buylist?type=cate_code&keyword=501">dress</a>
	</li>
	<li class="float-left">
		<a href="/item/buylist?keyword=600">acc</a>
		<ul>
			<li>
				<a href="/item/buylist?type=cate_code&keyword=601">쥬얼리</a>
			</li>
			<li>
				<a href="/item/buylist?type=cate_code&keyword=602">모자</a>
			</li>
			<li>
				<a href="/item/buylist?type=cate_code&keyword=603">가방</a>
			</li>
			<li>
				<a href="/item/buylist?type=cate_code&keyword=604">신발</a>
			</li>
			<li>
				<a href="/item/buylist?type=cate_code&keyword=605">양말</a>
			</li>
		</ul>
	</li>
	<!-- 우측 드롭다운 메뉴 : 순서 반대로 구현 -->
	<li class="float-right cart">
		<a href="/cart/cartList"><span id="cart-count"></span>
			<i class="fa-solid fa-cart-shopping"><c:if test="${cartCount != 0}">${cartCount}</c:if></i>
		</a>
	</li>
	<form action="/item/buylist" method="get" autocomplete="off">
		<button class="float-right btn btn-neutral" type="submit">search</button>
		<input type="hidden" name="type" value="item_name">
		<input class="float-right input input-underline find" name="keyword" placeholder="가을 신상">
	</form>
		<li class="float-right"><a href="/customer/mypage?customerId=${loginId}">MYPAGE</a></li>
	<c:choose>
		<c:when test="${loginId == null}">
			<li class="float-right"><a href="/customer/login">LOGIN</a></li>
			<li class="float-right"><a href="/customer/insert">JOIN US</a></li>
		</c:when>
		<c:otherwise>
			<li class="float-right"><a class="logout" href="/customer/logout">LOGOUT</a></li>
		</c:otherwise>
	</c:choose>
</ul>
</div>
</nav>
<main>