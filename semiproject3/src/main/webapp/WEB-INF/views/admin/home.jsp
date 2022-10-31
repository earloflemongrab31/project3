<%@ page language="java" contentType="text/html; charset=UTF-8" 
      pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
   
<jsp:include page="/WEB-INF/views/template/adminHeader.jsp">
   <jsp:param value="관리자 페이지" name="title" />
</jsp:include>


<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script type="text/javascript">
   $(function() {
      $.ajax({
         url : "http://localhost:8888/rest/buy/count",
         method : "get",
         dataType : "json", // 서버에서 돌아오리라 믿고 있는 타입
         success : function(resp) {
            // console.log(resp);
            // 비어있는 배열 2개를 만들고 resp 의 데이터를 분산 저장
            var labels = [];
            var values = [];

            for (var i = 0; i < resp.length; i++) {
               labels.push(resp[i].itemName);
               values.push(resp[i].cnt);

            }
            //             console.log(labels);
            //             console.log(values);
            // labels 와 values 를 사용해서 차트를 생성
            const ctx = document.querySelector('#myChart');
            const myChart = new Chart(ctx, {
               type : 'bar', 
               //            'doughnut'(도넛모양) 차트 모양
               data : { // 차트에 들어갈 내용 
                  labels : labels, // 우측 labels 은 배열을 임의로 지정한 이름
                  datasets : [ {
                     label : '상품별 판매현황',
                     data : values,
                     backgroundColor : [ 'rgba(255, 99, 132, 0.2)',
                           'rgba(54, 162, 235, 0.2)',
                           'rgba(255, 206, 86, 0.2)',
                           'rgba(75, 192, 192, 0.2)',
                           'rgba(153, 102, 255, 0.2)',
                           'rgba(255, 159, 64, 0.2)' ],
                     borderColor : [ 'rgba(255, 99, 132, 1)',
                           'rgba(54, 162, 235, 1)',
                           'rgba(255, 206, 86, 1)',
                           'rgba(75, 192, 192, 1)',
                           'rgba(153, 102, 255, 1)',
                           'rgba(255, 159, 64, 1)' ],
                     borderWidth : 1
                  } ]
               },
               options : {
                  scales : {
                     y : {
                        beginAtZero : true
                     }
                  }
               }
            });
         },
      })
   })
</script>

<section>
   <div class="row center mb-30">
      <h1>관리자 메인페이지</h1>
      <hr>
   </div>

   <div class="row float-container">
      <div class="float-left w-50 p-20">
         <div class="row center">
            <h3>상품 별 판매 현황</h3>
            <canvas id="myChart"></canvas>
         </div>
      </div>
      
      <div class="float-right w-50 p-20">
         <div class="row center">
         <h3>NOTICE</h3>
            <small><a href="http://localhost:8888/notice/list">더보기</a></small>
         </div>
         <div class="row">
            <table class="table table-border">
               <thead>
                  <tr>
                     <th>공지번호</th>
                     <th>말머리</th>
                     <th class="w-50">제목</th>
                     <th>작성자</th>
                  </tr>
               </thead>
               <tbody align="center">
                  <c:forEach var="noticeDto" items="${list}">
                  <tr>
                     <td align="left">
                        <td>${noticeDto.noticeNo}</td>
                        <td>
                           <c:if test="${noticeDto.noticeHead != null}">
                              ${noticeDto.noticeHead}
                           </c:if>
                        </td>
                        <td>
                           <a href="detail?noticeNo=${noticeDto.noticeNo}">
                              ${noticeDto.noticeTitle}
                           </a>
                        </td>
                        <td>${noticeDto.adminId}</td>                     
                  </tr>
                  </c:forEach>
               </tbody>
            </table>
         </div>
      </div>
   </div>
</section>

<aside>
	<div class="row">
		<table class="table">
			<tbody>
				<tr>
					<th class="w-25 center" style="vertical-align:middle;" rowspan="2"><i class="fa-solid fa-user fa-2x"></i></th>
					<td>${loginId}[${loginGrade}]</td>
				</tr>
				<tr>
					<td>안녕하세요, ${adminDto.adminName}님</td>
				</tr>
			</tbody>
		</table>
	</div>
</aside>
<jsp:include page="/WEB-INF/views/template/adminFooter.jsp"></jsp:include>