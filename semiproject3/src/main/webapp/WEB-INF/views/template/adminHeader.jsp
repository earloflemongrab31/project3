<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">
<title>
	관리자페이지
</title>

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
    /* 카테고리 대분류-소분류 */
  	option.option-hide{
        display: none;
    }
    option.option-view{
        display: block;
    }
    
    /* 협업사 리스트 */
    .corp-list{
        display: none;
    }
    
    .admin-header,
    .admin-header .dropdown-menu,
    .admin-header .logo,
    .admin-header a{
    	background-color: #ede8e4;
    	color: #25201d;
    }
    .right-word{
    	 margin-right:10px;
    }
    
    .footer{
    	padding: 0 3em;
    	background: #35363A;
    	color: #E6E8EB;
    }
    .footer a{
    	color: #E6E8EB;
    }
    
 	a.footer-underline:hover{
		text-decoration: underline;
	}
</style>
<script type="text/javascript">

	//카테고리 대분류 선택 시 해당 소분류 출력
	$(function(){
	    $("select[name=main]").on("input", function(){
	        var main = $(this).find("option:selected").data("main");
	
	        //소분류 option-view 클래스 우선 지우기
	        $(".option-hide").removeClass("option-view");
	
	        //대분류에 속한 소분류 option-view 클래스 추가
	        $(".option-hide."+main).addClass("option-view");
	        
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
    
    //협력사 리스트
    $(function(){
        $(".btn-corp").click(function(){
            $(".corp-list").slideToggle();
        });
    });
    
    //추가 버튼 클릭 -> 이미지 추가 가능
    $(function(){
        $(".add-image").last().remove();
        
        $(".image-box").hide();
        $(".image-box").first().show();

        $(".add-image").click(function(){
            $(this).parents(".image-box").next().show();
        });
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

<div class="admin-header">
<header>

<div class="float-container">
	<div class="logo float-left">
		<a class="w-100" href="${pageContext.request.contextPath}/admin/">
			<img class="w-100" src="${pageContext.request.contextPath}/image/logo.png">
		</a>
	</div>
	<div class="right-word row float-right">
		<a href="${pageContext.request.contextPath}/">회원페이지</a>
	</div>
</div>

</header>

<!-- 드롭다운 메뉴 -->
<nav>
<div class="float-container">
<ul class="dropdown-menu">
	<!-- 좌측 드롭다운 메뉴 -->
	<li class="float-left">
		<a href="#">메인관리</a>
		<ul>
			<li><a href="${pageContext.request.contextPath}/admin/main">메인이미지</a></li>
			<li><a href="${pageContext.request.contextPath}/admin/survey">팝업이미지</a></li>
		</ul>
	</li>
	<li class="float-left">
		<a href="#">상품관리</a>
		<ul>
			<li><a href="${pageContext.request.contextPath}/item/list">상품목록</a></li>
			<li><a href="${pageContext.request.contextPath}/item/insert">상품등록</a></li>
			<li><a href="${pageContext.request.contextPath}/warehouse/invenList">재고관리</a></li>
			<li><a href="${pageContext.request.contextPath}/company/list">협력사관리</a></li>
		</ul>
	</li>
	<li class="float-left">
		<a href="#">주문관리</a>
		<ul>
			<li><a href="${pageContext.request.contextPath}/buy/admin-buylist">주문목록</a></li>
		</ul>
	</li>
	<li class="float-left">
		<a href="#">회원관리</a>
		<ul>
			<li><a href="${pageContext.request.contextPath}/customer/list">회원목록</a></li>
			<li><a href="${pageContext.request.contextPath}/research/list">설문조사결과</a></li>
			<li><a href="${pageContext.request.contextPath}/review/reportList">리뷰신고목록</a></li>
		</ul>
	</li>
	<li class="float-left">
		<a href="#">관리자관리</a>
		<ul>
			<li><a href="${pageContext.request.contextPath}/admin/list">관리자목록</a></li>
		</ul>
		</li>
	<li class="float-left">
		<a href="#">고객센터</a>
		<ul>
			<li><a href="${pageContext.request.contextPath}/notice/list">공지사항</a></li>
			<li><a href="${pageContext.request.contextPath}/center/list">Q&A</a></li>
		</ul>
	</li>
	<!-- 우측 드롭다운 메뉴 : 순서 반대로 구현 -->
	<li class="float-right"><a class="logout" href="${pageContext.request.contextPath}/customer/logout">LOGOUT</a></li>
</ul>
</div>
</nav>
</div>

<main class="float-container">
