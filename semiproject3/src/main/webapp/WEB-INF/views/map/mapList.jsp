<%@ page language="java" contentType="text/html; charset=UTF-8" 
		pageEncoding="UTF-8"%>
		
<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="회사위치" name="title"/>
</jsp:include>
	<style>
		#map{
			width:100%;
			height:400px;
		}
	</style>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a9e4cdf22059431141225e6f83cd8a0f"></script>
	<script type="text/javascript">
	 $(function(){
         //지도 생성
         var container = document.querySelector('#map');
         var options = {
             center: new kakao.maps.LatLng(37.5338, 126.897),
             level: 3,
         };
         var map = new kakao.maps.Map(container, options);

         // 마커가 표시될 위치입니다 
         var markerPosition  = new kakao.maps.LatLng(37.5338, 126.897); 

         // 마커를 생성합니다
         var marker = new kakao.maps.Marker({
             position: markerPosition
         });

         // 마커가 지도 위에 표시되도록 설정합니다
         marker.setMap(map);

         //이동 링크에 이벤트 설정
         $(".move-link").click(function(e){
             e.preventDefault();

             var lat = $(this).data("lat");
             var lng = $(this).data("lng");
             var text = $(this).text();
             $(".span-eatting").text(text);
             moveMapWithMarker(lat, lng);
             
             var location = $(this).data("location");
             $(".location").addClass("hide");
             $("."+location).removeClass("hide");
         });
         

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
         }
         
     });
	</script>

	<div class="container-1200 mt-50 mb-50">
	<div class="row center mb-30">
		<h1>SeSam 본사/물류창고 위치</h1>
		<hr>
	</div>
	<div class="row center">
		<table class="table table-border">
			<tr>
				<td class="w-70">
					<div class="center">
						<h2><span class="span-eatting">세삼본사</span></h2>
					</div>
					<div id="map"></div>
				</td>
			</tr>
		</table>
	</div>

	<div class="float-container">
		<div class="float-left w-50 mt-30">
			<button type="button" class="btn btn-border btn-neutral move-link" 
				data-lat="37.5338" data-lng="126.897" data-location="dangsan">세삼본사</button>
			<button type="button" class="btn btn-border btn-neutral move-link" 
				data-lat="37.2666222" data-lng="126.9996409" data-location="suwon">수원센터</button>
			<button type="button" class="btn btn-border btn-neutral move-link" 
				data-lat="35.1691262" data-lng="129.0574637" data-location="busan">부산센터</button>
			<button type="button" class="btn btn-border btn-neutral move-link" 
				data-lat="35.2215738" data-lng="128.6774283" data-location="changwon">창원센터</button>
			<button type="button" class="btn btn-border btn-neutral move-link" 
				data-lat="34.8109053" data-lng="127.6712255" data-location="yeosu">여수센터</button>
		</div>	
		
		<div class="row float-left w-50">
			<div class="row w-100 dangsan location">
				<h3>당산센터(본사)</h3>
				<div class="row">위치 : 서울특별시 영등포구 선유동2로 57 이레빌딩 19층</div>
				<div>대표번호 : 02)444-5555 / 010)6666-7777</div>
				<hr>
			</div>
			<div class="row w-100 suwon hide location">
				<h3>수원센터(물류창고)</h3>
				<div class="row">컨시어지 수원리브로점 경기도 수원시 팔달구 매산로1가</div>
				<div>대표번호 : 031)344-5255 / 010)6466-7577</div>
				<hr>
			</div>
			<div class="row w-100 busan hide location">
				<h3>부산센터(물류창고)</h3>
				<div class="row">부산광역시 부산진구 연지동 105</div>
				<div>대표번호 : 051)344-5255 / 010)2366-2377</div>
				<hr>
			</div>
			<div class="row w-100 changwon hide location">
				<h3>창원센터(물류창고)</h3>
				<div class="row">환타지아 경상남도 창원시 성산구 중앙동 97-4</div>
				<div>대표번호 : 061)674-655 / 010)9966-2377</div>
				<hr>
			</div>
			<div class="row w-100 yeosu hide location">
				<h3>여수센터(물류창고)</h3>
				<div class="row">평여119안전센터 전라남도 여수시 평여동 651-6</div>
				<div>대표번호 : 041)944-5255 / 010)9966-1234</div>
				<hr>
			</div>
		</div>
		
	</div>
	</div>
</body>


<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
