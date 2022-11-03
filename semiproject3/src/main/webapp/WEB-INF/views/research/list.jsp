<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<jsp:include page="/WEB-INF/views/template/adminHeader.jsp">
    <jsp:param value="설문조사 결과" name="title"/>
</jsp:include>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script type="text/javascript">
	$(function() {
		$.ajax({
			url : "//localhost:8888/rest/research/count",
			method : "get",
			dataType : "json", // 서버에서 돌아오리라 믿고 있는 타입
			success : function(resp) {
				// console.log(resp);
				// 비어있는 배열 2개를 만들고 resp 의 데이터를 분산 저장
				var labels = [];
				var values = [];

				for (var i = 0; i < resp.length; i++) {
					labels.push(resp[i].researchSex);
					values.push(resp[i].cnt);
				}
				const ctx = document.querySelector('#myChart');
				const myChart = new Chart(ctx, {
					type : 'doughnut', 
					data : { // 차트에 들어갈 내용 
						labels : labels, // 우측 labels 은 배열을 임의로 지정한 이름
						datasets : [ {
							label : '성별현황',
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
	
		$.ajax({
			url : "//localhost:8888/rest/research/count1",
			method : "get",
			dataType : "json", // 서버에서 돌아오리라 믿고 있는 타입
			success : function(resp) {
				// console.log(resp);
				// 비어있는 배열 2개를 만들고 resp 의 데이터를 분산 저장
				var labels = [];
				var values = [];

				for (var i = 0; i < resp.length; i++) {
					labels.push(resp[i].researchAge);
					values.push(resp[i].cnt);
				}
				const ctx = document.querySelector('#myChart2');
				const myChart = new Chart(ctx, {
					type : 'doughnut', 
					data : { // 차트에 들어갈 내용 
						labels : labels, // 우측 labels 은 배열을 임의로 지정한 이름
						datasets : [ {
							label : '나이현황',
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
		
		$.ajax({
			url : "//localhost:8888/rest/research/count2",
			method : "get",
			dataType : "json", // 서버에서 돌아오리라 믿고 있는 타입
			success : function(resp) {
				// console.log(resp);
				// 비어있는 배열 2개를 만들고 resp 의 데이터를 분산 저장
				var labels = [];
				var values = [];

				for (var i = 0; i < resp.length; i++) {
					labels.push(resp[i].researchPath);
					values.push(resp[i].cnt);
				}
				const ctx = document.querySelector('#myChart3');
				const myChart = new Chart(ctx, {
					type : 'doughnut', 
					data : { // 차트에 들어갈 내용 
						labels : labels, // 우측 labels 은 배열을 임의로 지정한 이름
						datasets : [ {
							label : '유입경로',
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
		$.ajax({
			url : "//localhost:8888/rest/research/count3",
			method : "get",
			dataType : "json", // 서버에서 돌아오리라 믿고 있는 타입
			success : function(resp) {
				// console.log(resp);
				// 비어있는 배열 2개를 만들고 resp 의 데이터를 분산 저장
				var labels = [];
				var values = [];

				for (var i = 0; i < resp.length; i++) {
					labels.push(resp[i].researchInterest);
					values.push(resp[i].cnt);
				}
				const ctx = document.querySelector('#myChart4');
				const myChart = new Chart(ctx, {
					type : 'doughnut', 
					data : { // 차트에 들어갈 내용 
						labels : labels, // 우측 labels 은 배열을 임의로 지정한 이름
						datasets : [ {
							label : '유입경로',
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
		$.ajax({
			url : "//localhost:8888/rest/research/count4",
			method : "get",
			dataType : "json", // 서버에서 돌아오리라 믿고 있는 타입
			success : function(resp) {
				// console.log(resp);
				// 비어있는 배열 2개를 만들고 resp 의 데이터를 분산 저장
				var labels = [];
				var values = [];

				for (var i = 0; i < resp.length; i++) {
					labels.push(resp[i].researchBest);
					values.push(resp[i].cnt);
				}
				const ctx = document.querySelector('#myChart5');
				const myChart = new Chart(ctx, {
					type : 'doughnut', 
					data : { // 차트에 들어갈 내용 
						labels : labels, // 우측 labels 은 배열을 임의로 지정한 이름
						datasets : [ {
							label : '유입경로',
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
		$.ajax({
			url : "//localhost:8888/rest/research/count5",
			method : "get",
			dataType : "json", // 서버에서 돌아오리라 믿고 있는 타입
			success : function(resp) {
				// console.log(resp);
				// 비어있는 배열 2개를 만들고 resp 의 데이터를 분산 저장
				var labels = [];
				var values = [];

				for (var i = 0; i < resp.length; i++) {
					labels.push(resp[i].researchSatisfaction);
					values.push(resp[i].cnt);
				}
				const ctx = document.querySelector('#myChart6');
				const myChart = new Chart(ctx, {
					type : 'doughnut', 
					data : { // 차트에 들어갈 내용 
						labels : labels, // 우측 labels 은 배열을 임의로 지정한 이름
						datasets : [ {
							label : '유입경로',
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
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<section>
	<div class="row center mb-30">
		<h1>설문 조사 결과</h1>
		<hr>
	</div>

	<div class="row float-container">
		<div class="float-left w-33">
			<div class="row center">
				<h3>성별현황</h3>
				<canvas id="myChart"></canvas>
			</div>
		</div>
		
		<div class="float-left w-33">
			<div class="row center">
				<h3>나이현황</h3>
				<canvas id="myChart2"></canvas>
			</div>
		</div>
		
		<div class="float-left w-33">
			<div class="row center">
				<h3>유입경로</h3>
				<canvas id="myChart3"></canvas>
			</div>
		</div>
		
		<div class="float-left w-33">
			<div class="row center">
				<h3>관심있는물품</h3>
				<canvas id="myChart4"></canvas>
			</div>
		</div>
		
		<div class="float-left w-33">
			<div class="row center">
				<h3>장점</h3>
				<canvas id="myChart5"></canvas>
			</div>
		</div>
		
		<div class="float-left w-33">
			<div class="row center">
				<h3>만족도</h3>
				<canvas id="myChart6"></canvas>
			</div>
		</div>
	</div>
</section>
<aside>
	<div class="row">
		<table class="table">
			<tbody>
				<tr>
					<th class="w-34 center" style="vertical-align:middle;" rowspan="2"><i class="fa-solid fa-user fa-3x"></i></th>
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