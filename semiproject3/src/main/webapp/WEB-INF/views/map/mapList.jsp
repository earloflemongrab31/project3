<%@ page language="java" contentType="text/html; charset=UTF-8" 
		pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	
	<title>semi 지도 </title>
</head>
	<style>
		#map{
			width:100%;
			height:400px;
		}
	</style>
	<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a9e4cdf22059431141225e6f83cd8a0f"></script>
	<script type="text/javascript">
		$(function(){
			//지도생성
			var container = document.querySelector('#map');
			var options = {
				center: new kakao.maps.LatLng(33.450701, 126.570667),
				level: 3
			};

			var map = new kakao.maps.Map(container, options);
			
			//지도 이동 
			function setCenter(){
				// 이동할 위도 경도 위치를 생성합니다 
			    var moveLatLon = new kakao.maps.LatLng(33.450580, 126.574942);
			    
			    // 지도 중심을 부드럽게 이동시킵니다
			    // 만약 이동할 거리가 지도 화면보다 크면 부드러운 효과 없이 이동합니다
			    map.setConter(moveLatLon); 	
			}
		});
	</script>
<body>
	<div id="map" style="width:500px;height:400px;"></div>
	<div class="container-500">
		<div class="row center">
			<h1>semi지도</h1>
		</div>
		<div class="row">
			<button class="btn-move">이동</button>
		</div>
		<div class="row">
			<div id="map"></div>
		</div>
	</div>
</body>
