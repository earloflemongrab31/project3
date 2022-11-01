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
			var container = document.querySelector('#map');
			var options = {
				center: new kakao.maps.LatLng(33.450701, 126.570667),
				level: 3
			};

			var map = new kakao.maps.Map(container, options);
		});
	</script>
<body>
	<div id="map" style="width:500px;height:400px;"></div>
	<div class="container-500">
		<div class="row center">
			<h1>카</h1>
		</div>
		<div class="row">
			<div id="map"></div>
		</div>
	</div>
</body>
