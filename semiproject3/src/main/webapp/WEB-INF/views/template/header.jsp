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

<!-- 부트스트랩 cdn -->
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<!-- 글꼴 cdn -->
<link rel="preconnect" href="//fonts.googleapis.com">
<link rel="preconnect" href="//fonts.gstatic.com" crossorigin>
<link href="//fonts.googleapis.com/css2?family=Noto+Serif+KR:wght@300&display=swap" rel="stylesheet">

<!-- 디자인 틀 -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/reset.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/commons.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/layout.css">

<!-- 틀 선 디자인할 때 주석 풀기 -->
<%-- <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/test.css"> --%>

<!-- 아이콘 cdn -->
<link rel="stylesheet" type="text/css" href="//cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"/>

<!-- lightpick 사용을 위한 CDN 추가 -->
<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/lightpick@1.6.2/css/lightpick.css">
<script src="//cdn.jsdelivr.net/npm/moment@2.29.4/moment.min.js"></script>
<script src="//cdn.jsdelivr.net/npm/lightpick@1.6.2/lightpick.min.js"></script>

<!-- swiper 의존성 -->
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.css"/>
<script src="//cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.js"></script>

<!-- jQuery -->
<link rel="stylesheet" type="text/css" href="//cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"/>
<!-- <script src="//code.jquery.com/jquery-3.6.1.js"></script> -->
<!-- 배포 시 min 버전으로 -->
<script src="//code.jquery.com/jquery-3.6.1.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/lodash.js/4.17.21/lodash.min.js"></script>

<!-- summernote 라이브러리 -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/summernote/summernote-lite.css">
<script src="${pageContext.request.contextPath}/summernote/summernote-lite.js"></script>
<script src="${pageContext.request.contextPath}/summernote/lang/summernote-ko-KR.min.js"></script>

<style>
	.input.find{
	    padding-left: 2em;
	    padding-top: 0.25em;
		background-image: url("${pageContext.request.contextPath}/image/search.webp");
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
		background-image: url("${pageContext.request.contextPath}/image/survey.png");
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
      height: 100%;
      object-fit: cover;
    }
    
    .right-word{
    	 margin-right:10px;
    }
    .footer{
    	padding: 1em 3em;
    }
    
  	a.footer-underline:hover{
		text-decoration: underline;
	}
	
	/*품절 임박*/
	@keyframes almostSoldOut{
           from{
               color: darkred;
           }

           to{
               color: red;
           }
       }

	.sold{
	    animation: almostSoldOut 0.5s linear 0s infinite alternate;
	}
	
	/*리뷰 비활성화 호버끄기*/
	.table a.review-disable{
	pointer-events: none;
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
			$.ajax({
				url: "${pageContext.request.contextPath}/rest/customer/block-ad",
				method: "get"
			});
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
            if($(this).prop("checked")){
                $(this).parent().parent().next().find(".next").attr("disabled", false);
            }
        });
        
        $("textarea").on("input", function(){
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
			$(".login-form").attr("action", "${pageContext.request.contextPath}/admin/login");
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
	
    $(function(){
        $("textarea.content").summernote({
            height: 200,//높이
            minHeight: 300,
            maxHeight: 300,
            placeholder: "내용을 작성하세요.",//도움말
//             lang: "ko-KR"//언어 설정
			toolbar: [
			   // [groupName, [list of button]]
			   ['style', ['bold', 'italic', 'underline', 'clear']],
			   ['font', ['strikethrough', 'superscript', 'subscript']],
			   ['fontsize', ['fontsize']],
			   ['color', ['color']],
			   ['para', ['ul', 'ol', 'paragraph']],
			   ['height', ['height']]
			 ]
        });
    });
    
    /* 메인이미지 이미지 슬라이더 */
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
    /* 새상품이미지 이미지 슬라이더 */
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
    
 	//구매 옵션 불러오기
	$(function(){

        var selectedOption = [];
        $(".input-option").on("input",function(){
	        var color = $(this).find("option:selected").data("color");//선택한 색
	        var size = $(this).find("option:selected").data("size");//선택한 사이즈
	        var totalcnt = $(this).find("option:selected").data("total-cnt");//선택한 옵션의 재고
	        
	        if(!color) return;//값 없으면 리턴
	        
 	        for(var i=0; i<selectedOption.length; i++){
 	        	if(selectedOption[i] === color + "-" + size){
 	 				alert("이미 선택된 옵션입니다.");
 	 		        	$(".input-option").val("");
 	 				return;
 	        	} 
 	        }
	        
	        
	        var plusLine = $("<li>").addClass("flexbox option w-100");//option 클래스를 가지는 한칸 만들기
	            
	        var icon = $("<i>").addClass("w-25 right fa-solid fa-xmark middle");//i 태그 엑스 표시 추가
	        icon.click(function(){//누르면 가장 상위 option class를 가지는 tr 삭제
	        	var deleteColor = $(this).parent(".option").find("input[name=itemColor]").val();
	        	var deleteSize = $(this).parent(".option").find("input[name=itemSize]").val();
	        	var deleteOption = deleteColor+"-"+deleteSize;
	        	
	 	        for(var i=0; i<selectedOption.length; i++){
	 	        	if(selectedOption[i] === deleteOption){
	 	        		selectedOption.splice(i, 1);
						return;
	 	        	} 
	 	        }
	            $(this).parent(".option").remove();
	        });
	        
	        var colorOption = $("<input>").addClass("w-25 input input-none").val(color).attr("type", "text").attr("name", "itemColor").prop("readonly", true);
	        var sizeOption = $("<input>").addClass("w-25 input input-none").val(size).attr("type", "text").attr("name", "itemSize").prop("readonly", true);
	        var cnt = $("<input>").addClass("w-25 input").attr("type", "number").attr("name", "itemCnt").attr("min", 1).attr("max", totalcnt).val(1);
	        var totalCnt = $("<input>").attr("type", "hidden").attr("name", "itemTotalCnt").val(totalcnt);
	        
	        colorOption.appendTo(plusLine);
	        sizeOption.appendTo(plusLine);
	        cnt.appendTo(plusLine);
	        icon.appendTo(plusLine);
	        totalCnt.appendTo(plusLine);
	
	        plusLine.appendTo($(".option-area"));
	
	        $(".input-option").val("");
	        selectedOption.push(color+"-"+size);
        });
	});
    
    //게시글 삭제 시 즉시 삭제 방지
	$(function(){
		$("a.delete").click(function(e){
            var choice = confirm("삭제하시겠습니까?");
            if(choice){
            	alert("삭제되었습니다.");
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
	$(function(){
		$("a.buy-delete").click(function(e){
            var choice = confirm("주문 취소하시겠습니까?");
            if(choice){
                alert("주문이 취소되었습니다.");
                return true;
            }
            else{
                return false;
            }
		});
	});
	
	$(function(){
		$("input[name=usePoint]").on("blur",function(){
			var usePoint = parseInt($(this).val());//회원이 입력한 포인트
			var customerPoint = parseInt($(this).attr("max"));//회원이 가지고 있는 포인트
			var totalPay = parseInt($("#except-delivery").text());//상품 전체 총 금액
			var payMoney = totalPay + 3000;//배송비 포함 결제 금액
			console.log(usePoint);
			console.log(customerPoint);
			console.log(totalPay);
			console.log(payMoney);
			var overPoint1 = customerPoint > payMoney && usePoint > payMoney//총 금액보다 포인트를 더 작성했을 때
			var overPoint2 = customerPoint < payMoney && usePoint > customerPoint//회원이 가지고있는 포인트보다 더 작성했을 때

			if(usePoint < 0 || !usePoint){
				$(this).val(0);
				$("#use-point").text("0");
				$("#total-price").text(totalPay+3000);
				return;
			}
			if(overPoint1 || overPoint2){
				alert("보유하신 포인트 또는 총 결제 금액보다 많은 수를 입력할 수 없습니다.");
				$(this).val("0");
				$("#use-point").text("0");
				$("#total-price").text(payMoney);
				return;
			}
			$("#use-point").text(usePoint);
			$("#total-price").text(payMoney-usePoint);
		});
	});
	
	//리뷰 활성화 , 비활성화
	$(function(){
		$(".review-disable").click("disable", false);
		$(".review-able").click("disable", true);
	});
	
</script>

</head>

<body>

<header>
<c:if test="${loginGrade != '일반관리자' && loginGrade != '메인관리자' && blockAd != 'Y'}">
	<div class="float-container ad">
		&emsp;&emsp;"SeSam 앱" 설치 시 <span style="color:orange;">5,000point 지급!</span> 지금 바로 앱스토어에서 다운 받기
		<a href="//play.google.com/store/games?utm_source=apac_med&utm_medium=hasem&utm_content=Oct0121&utm_campaign=Evergreen&pcampaignid=MKT-EDR-apac-kr-1003227-med-hasem-py-Evergreen-Oct0121-Text_Search_BKWS-BKWS%7CONSEM_kwid_43700058439438694_creativeid_477136209358_device_c&gclid=Cj0KCQjwnbmaBhD-ARIsAGTPcfVKNmc0jEnLgOhSuzblsyh0eJfXILaAubbz457HBJSfKVSPzXMuzCYaAkcaEALw_wcB&gclsrc=aw.ds">
			<img src="${pageContext.request.contextPath}/image/googleplay.png">
		</a>
		<span class="float-right delete" style="margin-left:5px;">
			한동안 보지 않기 <i class="fa-solid fa-xmark"></i></span>
	</div>
</c:if>

<div class="float-container">
	<div class="logo float-left">
		<a class="w-100" href="${pageContext.request.contextPath}/">
			<img class="w-100" src="${pageContext.request.contextPath}/image/logo.png">
		</a>
	</div>
	<c:if test="${loginGrade == '일반' || loginGrade == 'VIP'}">
		<div class="right-word row float-right">
			[${loginGrade}] ${loginId}님, 안녕하세요.
		</div>
	</c:if>
	<c:if test="${loginGrade == '일반관리자' || loginGrade == '메인관리자'}">
		<div class="right-word row float-right">
			<a href="${pageContext.request.contextPath}/admin/">관리자페이지</a>
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
		<a href="${pageContext.request.contextPath}/item/bestlist">BEST</a>
	</li>
	<li class="float-left">
		<a href="${pageContext.request.contextPath}/item/buylist">New</a>
	</li>
	<li class="float-left">
		<a href="${pageContext.request.contextPath}/item/buylist?keyword=100">outer</a>
		<ul>
			<li>
				<a href="${pageContext.request.contextPath}/item/buylist?type=cate_code&keyword=101">자켓</a>
			</li>
			<li>
				<a href="${pageContext.request.contextPath}/item/buylist?type=cate_code&keyword=102">코트</a>
			</li>
			<li>
				<a href="${pageContext.request.contextPath}/item/buylist?type=cate_code&keyword=103">가디건</a>
			</li>
			<li>
				<a href="${pageContext.request.contextPath}/item/buylist?type=cate_code&keyword=104">패딩</a>
			</li>
		</ul>
	</li>
	<li class="float-left">
		<a href="${pageContext.request.contextPath}/item/buylist?keyword=200">top</a>
		<ul>
			<li>
				<a href="${pageContext.request.contextPath}/item/buylist?type=cate_code&keyword=201">민소매</a>
			</li>
			<li>
				<a href="${pageContext.request.contextPath}/item/buylist?type=cate_code&keyword=202">티셔츠</a>
			</li>
			<li>
				<a href="${pageContext.request.contextPath}/item/buylist?type=cate_code&keyword=203">맨투맨</a>
			</li>
			<li>
				<a href="${pageContext.request.contextPath}/item/buylist?type=cate_code&keyword=204">니트</a>
			</li>
			<li>
				<a href="${pageContext.request.contextPath}/item/buylist?type=cate_code&keyword=205">블라우스</a>
			</li>
		</ul>
	</li>
	<li class="float-left">
		<a href="${pageContext.request.contextPath}/item/buylist?keyword=300">pants</a>
		<ul>
			<li>
				<a href="${pageContext.request.contextPath}/item/buylist?type=cate_code&keyword=301">청바지</a>
			</li>
			<li>
				<a href="${pageContext.request.contextPath}/item/buylist?type=cate_code&keyword=302">면바지</a>
			</li>
			<li>
				<a href="${pageContext.request.contextPath}/item/buylist?type=cate_code&keyword=303">슬랙스</a>
			</li>
		</ul>
	</li>
	<li class="float-left">
		<a href="${pageContext.request.contextPath}/item/buylist?type=cate_code&keyword=401">skirt</a>
	</li>
	<li class="float-left">
		<a href="${pageContext.request.contextPath}/item/buylist?type=cate_code&keyword=501">dress</a>
	</li>
	<li class="float-left">
		<a href="${pageContext.request.contextPath}/item/buylist?keyword=600">acc</a>
		<ul>
			<li>
				<a href="${pageContext.request.contextPath}/item/buylist?type=cate_code&keyword=601">쥬얼리</a>
			</li>
			<li>
				<a href="${pageContext.request.contextPath}/item/buylist?type=cate_code&keyword=602">모자</a>
			</li>
			<li>
				<a href="${pageContext.request.contextPath}/item/buylist?type=cate_code&keyword=603">가방</a>
			</li>
			<li>
				<a href="${pageContext.request.contextPath}/item/buylist?type=cate_code&keyword=604">신발</a>
			</li>
			<li>
				<a href="${pageContext.request.contextPath}/item/buylist?type=cate_code&keyword=605">양말</a>
			</li>
		</ul>
	</li>
	<!-- 우측 드롭다운 메뉴 : 순서 반대로 구현 -->
	<li class="float-right cart">
		<a href="${pageContext.request.contextPath}/cart/cartList"><span id="cart-count"></span>
			<i class="fa-solid fa-cart-shopping"><c:if test="${cartCount != 0}">${cartCount}</c:if></i>
		</a>
	</li>
	<form action="${pageContext.request.contextPath}/item/buylist" method="get" autocomplete="off">
		<button class="float-right btn btn-neutral" style="padding-top:5px;" type="submit">search</button>
		<input type="hidden" name="type" value="item_name">
		<input class="float-right input input-underline find" name="keyword" value="${param.keyword}">
	</form>
		<c:if test="${loginGrade != '일반관리자' && loginGrade != '메인관리자'}">
			<li class="float-right"><a href="${pageContext.request.contextPath}/customer/mypage?customerId=${loginId}">MYPAGE</a></li>
		</c:if>
	<c:choose>
		<c:when test="${loginId == null}">
			<li class="float-right"><a href="${pageContext.request.contextPath}/customer/login">LOGIN</a></li>
			<li class="float-right"><a href="${pageContext.request.contextPath}/customer/insert">JOIN US</a></li>
		</c:when>
		<c:otherwise>
			<li class="float-right"><a class="logout" href="${pageContext.request.contextPath}/customer/logout">LOGOUT</a></li>
		</c:otherwise>
	</c:choose>
</ul>
</div>
</nav>
<main class="float-container">