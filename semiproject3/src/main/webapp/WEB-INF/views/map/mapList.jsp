<%@ page language="java" contentType="text/html; charset=UTF-8" 
		pageEncoding="UTF-8"%>
		
<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="${param.title}" name="title"/>
</jsp:include>

<!DOCTYPE html>
<html>
<head>
	
	<title>SeSam 본사위치/물류창고</title>
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
         //지도 생성
         var container = document.querySelector('#map');
         var options = {
             center: new kakao.maps.LatLng(33.450701, 126.570667),
             level: 3
         };

         //var map = new kakao.maps.Map(container, options);
         window.map = new kakao.maps.Map(container, options);

         //이동 링크에 이벤트 설정
         $(".move-link").click(function(e){
             e.preventDefault();

             var lat = $(this).data("lat");
             var lng = $(this).data("lng");
             //moveMap(lat, lng);
             //moveMapWithMarker(lat, lng);

             var text = $(this).text();
             $(".span-eatting").text(text);
             moveMapWithMarkerAndText(lat, lng, text);
         });
         

         //지도 이동
         function moveMap(lat, lng) {            
             // 이동할 위도 경도 위치를 생성합니다 
             var moveLatLon = new kakao.maps.LatLng(lat, lng);
             
             // 지도 중심을 이동 시킵니다
             map.setCenter(moveLatLon);
         }
         //지도 이동 + 마커
         function moveMapWithMarker(lat, lng) {            
             // 이동할 위도 경도 위치를 생성합니다 
             var moveLatLon = new kakao.maps.LatLng(lat, lng);
             
             // 지도 중심을 이동 시킵니다
             map.setCenter(moveLatLon);

             // 마커가 표시될 위치입니다 
             var markerPosition  = new kakao.maps.LatLng(lat, lng); 

             // 마커를 생성합니다
             var marker = new kakao.maps.Marker({
                 position: markerPosition
             });

             // 마커가 지도 위에 표시되도록 설정합니다
             marker.setMap(map);

             // 아래 코드는 지도 위의 마커를 제거하는 코드입니다
             // marker.setMap(null);
         }
         //지도 이동 + 마커
         function moveMapWithMarkerAndText(lat, lng, text) {            
             // 이동할 위도 경도 위치를 생성합니다 
             var moveLatLon = new kakao.maps.LatLng(lat, lng);
             
             // 지도 중심을 이동 시킵니다
             map.setCenter(moveLatLon);

             // 마커가 표시될 위치입니다 
             var markerPosition  = new kakao.maps.LatLng(lat, lng); 

             // 마커를 생성합니다
             var marker = new kakao.maps.Marker({
                 position: markerPosition
             });

             // 마커가 지도 위에 표시되도록 설정합니다
             marker.setMap(map);

             // 아래 코드는 지도 위의 마커를 제거하는 코드입니다
             // marker.setMap(null);

             var tag = $("#info-window-template").text();
             tag = tag.replace("{{제목}}", text);
             tag = tag.replace("{{내용}}", "lorem ipsum");

             var iwContent = tag; // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
             var iwPosition = new kakao.maps.LatLng(lat, lng); //인포윈도우 표시 위치입니다
             var iwRemoveable = false; // removeable 속성을 ture 로 설정하면 인포윈도우를 닫을 수 있는 x버튼이 표시됩니다

             // 인포윈도우를 생성하고 지도에 표시합니다
             var infowindow = new kakao.maps.InfoWindow({
                 position : iwPosition, 
                 content : iwContent,
                 removable : iwRemoveable
             });
                 
             // 마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다
             infowindow.open(map, marker);  
         }
     });
	</script>
	
	 <script type="text/template" id="info-window-template">
        <div class="info-window">
			<center>
            	<h3>{{제목}}</h3>
			</center>
        </div>
    </script>
<body>
	
	<div class="container-1200">
		<div class="row center">
			<h1>SeSam 본사위치/물류창고</h1>
			<hr>
		</div>
		<div class="row float-container">
			<table class="float-left w-50">
				<tr>
					<td>
						<h3>
							<a class="move-link" href="#" data-lat="37.5339767" data-lng="126.8969462">당산센터(본사)</a>
						</h3>
							<br>
							<div>위치 : 서울특별시 영등포구 선유동2로 57 이레빌딩 19층</div>
							<br>
							<div class="mt-5">대표번호 : 02)444-5555 / 010)6666-7777</div>
							<hr>
							
					</td>
				</tr>
				<tr>
					<td>
						<h3>
							<a class="move-link" href="#" data-lat="37.2666222" data-lng="126.9996409">수원센터(물류창고)</a>
						</h3>
						<br>
							<div>컨시어지 수원리브로점 경기도 수원시 팔달구 매산로1가</div>
							<br>
							<div class="mt-5">대표번호 : 031)344-5255 / 010)6466-7577</div>
						<hr>
					</td>
				</tr>
				<tr>
					<td>
						<h3>
							<a class="move-link" href="#" data-lat="35.1691262" data-lng="129.0574637">부산센터(물류창고)</a>
						</h3>
						<br>
							<div>부산광역시 부산진구 연지동 105</div>
							<br>
							<div class="mt-5">대표번호 : 051)344-5255 / 010)2366-2377</div>
						<hr>
					</td>
				</tr>
				<tr>
					<td>
						<h3>
							<a class="move-link" href="#" data-lat="35.2215738" data-lng="128.6774283">창원센터(물류창고)</a>
						</h3>
						<br>
						<div>환타지아 경상남도 창원시 성산구 중앙동 97-4</div>
						<br>
							<div class="mt-5">대표번호 : 061)674-655 / 010)9966-2377</div>
						<hr>
					</td>
				</tr>
				<tr>
					<td>
						<h3>
							<a class="move-link" href="#" data-lat="34.8109053" data-lng="127.6712255">여수센터(물류창고)</a>
						</h3>
						<br>
						평여119안전센터 전라남도 여수시 평여동 651-6
						<br>
							<div class="mt-5">대표번호 : 041)944-5255 / 010)9966-1234</div>
						<hr>
					</td>
				</tr>
			</table>
		
			<table class="float-left w-50">
			
				<tr>
					<td width="70%">
						<div class="center">
							<h2><span class="span-eatting"></span></h2>
						</div>
						<div id="map"></div>
					</td>
				</tr>
	
			</table>
		</div>
		 
	</div>
</body>


<jsp:include page="/WEB-INF/views/template/adminFooter.jsp"></jsp:include>
