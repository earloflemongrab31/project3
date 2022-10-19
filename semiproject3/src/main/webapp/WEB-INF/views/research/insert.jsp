<%@ page language="java" contentType="text/html; charset=UTF-8" 
		pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
   
<jsp:include page="/WEB-INF/views/template/header.jsp">
    <jsp:param value="설문조사 페이지" name="title"/>
</jsp:include>

  <style>
        .progressbar {
            height:15px;
            position: fixed;
            top:0;
            left:0;
            right:0;
            overflow: hidden;/* 넘어갈 경우에 대한 처리*/
        }
        .progressbar > .inner {
            position: absolute;
            top:0;
            left:0;
            bottom:0;
            width:0%;
            background: rgb(131,58,180);
            background: linear-gradient(90deg, rgba(131,58,180,1) 0%, rgba(253,29,29,1) 50%, rgba(252,176,69,1) 100%);
            transition: width 0.2s linear;
        }
    </style>


    <script src="https://code.jquery.com/jquery-3.6.1.js"></script>
    <script type="text/javascript">
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
        });
    </script>



<form class="insert" action="insert" method="post" enctype="multipart/form-data" autocomplete="off">

<div class="container-600">
	<div class="row">
		                <h1>설문조사 첫번째 페이지</h1>
                <input name="ResearchCustomerId" placeholder="hello1234">\
                <label>1. 고객님의 성별에 체크해주세요</label>
    <br>
    <input type="radio" name="researchSex" value="남자">남자
    <input type="radio" name="researchSex" value="여자">여자
    <br>
    <label>2. 나이를 선택해주세요</label>
    <br>
    <input type="radio" name="researchAge" value="10대">10대
    <input type="radio" name="researchAge" value="20대">20대
    <input type="radio" name="researchAge" value="30대">30대
    <input type="radio" name="researchAge" value="40대">40대
    <input type="radio" name="researchAge" value="50대">50대
    <br>
    <label>3. 고객님이 사이트를 알게된 경로를 선택해주세요</label>
    <br>
    <input type="radio" name="researchPath" value="인터넷광고">인터넷광고
    <input type="radio" name="researchPath" value="지인소개">지인소개
    <input type="radio" name="researchPath" value="신문광고">신문광고
    <input type="radio" name="researchPath" value="포털사이트검색">포털사이트검색
    <input type="radio" name="researchPath" value="페이스북,인스타그램광고">페이스북,인스타그램광고
    <br>

            </div>
            <div class="row">
                <button type="button" class="prev">이전</button>
                <button type="button" class="next">다음</button>
            </div>
        </div>
    </div>
    <div class="page">
        <div class="container-600">
            <div class="row">
                <h1>2페이지</h1>
                <label>4. 고객님의 최근 관심있는 물건은 무엇입니까? </label>
    <br>
    <input type="radio" name="researchInterest" value="자켓">자켓  
    <input type="radio" name="researchInterest" value="바지">바지
    <input type="radio" name="researchInterest" value="아웃터">아웃터
    <input type="radio" name="researchInterest" value="악세사리">악세서리
    <input type="radio" name="researchInterest" value="원피스">원피스 
    <br>
    <label>5. 고객님의 생각하는 이 쇼핑몰에 장점은 무엇입니까?</label>
    <br>
    <input type="radio" name="researchBest" value="가격">가격
    <input type="radio" name="researchBest" value="패션">패션
    <input type="radio" name="researchBest" value="빠른배송">빠른배송
    <input type="radio" name="researchBest" value="친절한응답">친절한응답
    <input type="radio" name="researchBest" value="편의성">편의성
    <br>
    <label>6. 쇼핑몰에 만족도를 선택해주세요</label>
    <br>
    <input type="radio" name="researchSatisfaction" value="매우 만족스럽다.">매우 만족스럽다.
    <input type="radio" name="researchSatisfaction" value="만족스럽다.">만족스럽다.
    <input type="radio" name="researchSatisfaction" value="보통">보통
    <input type="radio" name="researchSatisfaction" value="불만족">불만족
    <input type="radio" name="researchSatisfaction" value="매우 불만족">매우 불만족
    <br>
    <label>7. 고객님의 지불방식을 선택해주세요</label>
    <br>
    <input type="radio" name="researchPayment"value="온라인뱅킹">온라인 뱅킹
    <input type="radio" name="researchPayment" value="우체국송금">우체국 송금
    <input type="radio" name="researchPayment" value="계좌이체">계좌이체
    <input type="radio" name="researchPayment" value="모바일결제 ">모바일 결제
    <input type="radio" name="researchPayment" value="기타">기타 
    <br>
            </div>
            <div class="row">
                <button type="button" class="prev">이전</button>
                <button type="button" class="next">다음</button>
            </div>
        </div>
    </div>
    <div class="page">
        <div class="container-600">
            <div class="row">
                <h1>3페이지</h1>
                <label>8. 고객님의 구매목적은 무엇입니까?</label>
    <br>
    <textarea name="researchPurpose"></textarea>
    <br>
    <label>9. 쇼핑몰 이용시 불편사항을 적어주세요</label>
    <br>
    <textarea name="researchComplain"></textarea>
    <br>
    
    <label>10. 온라인몰 관련 개선사항 등 여러 아이디어를 기술해주세요</label>
    <br>
    <textarea name="researchIdea"></textarea>
            </div>
            <div class="row">
                <button type="button" class="prev">이전</button>
                <button type="button" class="next">다음</button>
                <button type="submit">설문조사참여완료</button>
            </div>
        </div>
    </div>
    
  </form>


<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>