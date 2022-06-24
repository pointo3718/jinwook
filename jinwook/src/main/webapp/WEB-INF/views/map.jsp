<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>지도</title>

<style>
.map_wrap, .map_wrap * {
	margin: 0;
	padding: 0;
	font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;
	font-size: 12px;
}

.map_wrap a, .map_wrap a:hover, .map_wrap a:active {
	color: #000;
	text-decoration: none;
}

.map_wrap {
	position: relative;
	width: 100%;
	height: 500px;
}

#menu_wrap {
	position: absolute;
	top: 0;
	left: 0;
	bottom: 0;
	width: 250px;
	margin: 10px 0 30px 10px;
	padding: 5px;
	overflow-y: auto;
	background: rgba(255, 255, 255, 0.7);
	z-index: 1;
	font-size: 12px;
	border-radius: 10px;
}

.bg_white {
	background: #fff;
}

#menu_wrap hr {
	display: block;
	height: 1px;
	border: 0;
	border-top: 2px solid #5F5F5F;
	margin: 3px 0;
}

#menu_wrap .option {
	text-align: center;
}

#menu_wrap .option p {
	margin: 10px 0;
}

#menu_wrap .option button {
	margin-left: 5px;
}

#placesList li {
	list-style: none;
}

#placesList .item {
	position: relative;
	border-bottom: 1px solid #888;
	overflow: hidden;
	cursor: pointer;
	min-height: 65px;
}

#placesList .item span {
	display: block;
	margin-top: 4px;
}

#placesList .item h5, #placesList .item .info {
	text-overflow: ellipsis;
	overflow: hidden;
	white-space: nowrap;
}

#placesList .item .info {
	padding: 10px 0 10px 55px;
}

#placesList .info .gray {
	color: #8a8a8a;
}

#placesList .info .jibun {
	padding-left: 26px;
	background:
		url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_jibun.png)
		no-repeat;
}

#placesList .info .tel {
	color: #009900;
}

#placesList .item .markerbg {
	float: left;
	position: absolute;
	width: 36px;
	height: 37px;
	margin: 10px 0 0 10px;
	background:
		url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png)
		no-repeat;
}

#placesList .item .marker_1 {
	background-position: 0 -10px;
}

#placesList .item .marker_2 {
	background-position: 0 -56px;
}

#placesList .item .marker_3 {
	background-position: 0 -102px
}

#placesList .item .marker_4 {
	background-position: 0 -148px;
}

#placesList .item .marker_5 {
	background-position: 0 -194px;
}

#placesList .item .marker_6 {
	background-position: 0 -240px;
}

#placesList .item .marker_7 {
	background-position: 0 -286px;
}

#placesList .item .marker_8 {
	background-position: 0 -332px;
}

#placesList .item .marker_9 {
	background-position: 0 -378px;
}

#placesList .item .marker_10 {
	background-position: 0 -423px;
}

#placesList .item .marker_11 {
	background-position: 0 -470px;
}

#placesList .item .marker_12 {
	background-position: 0 -516px;
}

#placesList .item .marker_13 {
	background-position: 0 -562px;
}

#placesList .item .marker_14 {
	background-position: 0 -608px;
}

#placesList .item .marker_15 {
	background-position: 0 -654px;
}

#pagination {
	margin: 10px auto;
	text-align: center;
}

#pagination a {
	display: inline-block;
	margin-right: 10px;
}

#pagination .on {
	font-weight: bold;
	cursor: default;
	color: #777;
}
</style>

</head>
<body>

	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e53eaf4dd896374cd449da869e2ddcdc"></script>
	<script>
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
		mapOption = {
			center : new kakao.maps.LatLng(37.634513508582, 127.02570882672), // 지도의 중심좌표
			level : 2
		// 지도의 확대 레벨
		};

		var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
		
		if (navigator.geolocation) {
		    
		    // GeoLocation을 이용해서 접속 위치를 얻어옵니다
		    navigator.geolocation.getCurrentPosition(function(position) {
		        
		        var lat = position.coords.latitude, // 위도
		            lon = position.coords.longitude; // 경도
		        
		        var locPosition = new kakao.maps.LatLng(lat, lon), // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다
		            message = '<div style="padding:5px;"><strong>&nbsp;&nbsp;&nbsp;현재위치입니다.</strong></div>'; // 인포윈도우에 표시될 내용입니다
		        
		        // 마커와 인포윈도우를 표시합니다
		        displayMarker(locPosition, message);
		            
		      });
		    
		} else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다
		    
		    var locPosition = new kakao.maps.LatLng(33.450701, 126.570667),    
		        message = 'geolocation을 사용할수 없어요..'
		        
		    displayMarker(locPosition, message);
		}

		// 지도에 마커와 인포윈도우를 표시하는 함수입니다
		function displayMarker(locPosition, message) {

		    // 마커를 생성합니다
		    var marker = new kakao.maps.Marker({  
		        map: map, 
		        position: locPosition
		    }); 
		    
		    var iwContent = message, // 인포윈도우에 표시할 내용
		        iwRemoveable = true;

		    // 인포윈도우를 생성합니다
		    var infowindow = new kakao.maps.InfoWindow({
		        content : iwContent,
		        removable : iwRemoveable
		    });
		    
		    // 인포윈도우를 마커위에 표시합니다 
		    infowindow.open(map, marker);
		    
		    // 지도 중심좌표를 접속위치로 변경합니다
		    map.setCenter(locPosition);      
		}    		
		
		
		
		
		

		// 마커를 표시할 위치와 title 객체 배열입니다 
		var positions = [ {
			title : '진욱이네',
			latlng : new kakao.maps.LatLng(37.634534714452, 127.02496559104),
			storeNo : 10000,
			prodName : '청포도',
			price : 1000
		}, {
			title : '진욱이네',
			latlng : new kakao.maps.LatLng(37.634534714452, 127.02496559104),
			storeNo : 10000,
			prodName : '레몬',
			price : 40000
		}, {
			title : '인규네',
			latlng : new kakao.maps.LatLng(37.634698301219, 127.02565484609),
			storeNo : 10010
		}, {
			title : '선경이네',
			latlng : new kakao.maps.LatLng(37.634513508582, 127.02570882672),
			storeNo : 10011
		}, {
			title : '지호네',
			latlng : new kakao.maps.LatLng(37.634618626043, 127.02439692358),
			storeNo : 10012
		}, {
			title : '수진이네',
			latlng : new kakao.maps.LatLng(37.634486824724, 127.02604296205),
			storeNo : 10013
		}, {
			title : '부들이네',
			latlng : new kakao.maps.LatLng(37.634324460407, 127.02564498209),
			storeNo : 10014
		}, {
			title : '몽자네',
			latlng : new kakao.maps.LatLng(37.620929452451, 127.02848485756),
			storeNo : 10015
		}, {
			title : '쌀쌀이네',
			latlng : new kakao.maps.LatLng(37.610796432248, 127.0306797412),
			storeNo : 10016
		}, {
			title : '쓸쓸이네',
			latlng : new kakao.maps.LatLng(37.61037678561, 127.03062855571),
			storeNo : 10018
		}, {
			title : '씩씩이네',
			latlng : new kakao.maps.LatLng(37.615570786531, 127.03075197597),
			storeNo : 10020
		}, {
			title : '몽몽이네',
			latlng : new kakao.maps.LatLng(37.613977946963, 127.03190967345),
			storeNo : 10022
		}, {
			title : '해피채소',
			latlng : new kakao.maps.LatLng(37.615149418904, 127.03110086447),
			storeNo : 10027
		},

		{
			title : '여기가짱',
			latlng : new kakao.maps.LatLng(37.616086467507, 127.02695924064),
			storeNo : 10029
		}, {
			title : '해피수산',
			latlng : new kakao.maps.LatLng(37.623323377578, 127.02949915123),
			storeNo : 10030
		}, {
			title : '싱싱하네',
			latlng : new kakao.maps.LatLng(37.636307347399, 127.03454975672),
			storeNo : 10031
		}, {
			title : '철썩철썩',
			latlng : new kakao.maps.LatLng(37.63598057872, 127.0347496108),
			storeNo : 10033
		}, {
			title : '몽몽과일',
			latlng : new kakao.maps.LatLng(37.633633201944, 127.03071411828),
			storeNo : 10034
		}, {
			title : '상큼상킁',
			latlng : new kakao.maps.LatLng(37.634678460265, 127.03149589941),
			storeNo : 10035
		}, {
			title : '생생과일',
			latlng : new kakao.maps.LatLng(37.637750024281, 127.02815309476),
			storeNo : 10036
		}, {
			title : '커몬커몬',
			latlng : new kakao.maps.LatLng(37.634838501485, 127.03262578138),
			storeNo : 10037
		}, {
			title : '하늘하늘',
			latlng : new kakao.maps.LatLng(37.637557828734, 127.03430419549),
			storeNo : 10038
		}, {
			title : '김씨네',
			latlng : new kakao.maps.LatLng(37.640961438469, 127.03132408952),
			storeNo : 10039
		}, {
			title : '박씨네',
			latlng : new kakao.maps.LatLng(37.636074847754, 127.02846061288),
			storeNo : 10040
		}, {
			title : '이씨네',
			latlng : new kakao.maps.LatLng(37.625899394089, 127.03670776345),
			storeNo : 10041
		}, {
			title : '두근두근',
			latlng : new kakao.maps.LatLng(37.627125435326, 127.03573530278),
			storeNo : 10042
		}, {
			title : '몽몽정육',
			latlng : new kakao.maps.LatLng(37.634420274893, 127.03675254044),
			storeNo : 10043

		}, {
			title : '김씨네정육',
			latlng : new kakao.maps.LatLng(37.636636243254, 127.02917780583),
			storeNo : 10044
		}, {
			title : '돈돈',
			latlng : new kakao.maps.LatLng(37.639193002155, 127.03019308848),
			storeNo : 10045
		}, {
			title : '백씨네정육',
			latlng : new kakao.maps.LatLng(37.640297972577, 127.03155753266),
			storeNo : 10046
		}, {
			title : '한돈',
			latlng : new kakao.maps.LatLng(33.451393, 127.03675254044),
			storeNo : 10047
		}, {
			title : '음메음메',
			latlng : new kakao.maps.LatLng(37.642817511812, 127.00447225437),
			storeNo : 10048
		}, {
			title : '푸릇푸릇',
			latlng : new kakao.maps.LatLng(37.63992628403, 127.02137032965),
			storeNo : 10049
		}, {
			title : '싱싱수산',
			latlng : new kakao.maps.LatLng(37.645305903504, 127.02063429793),
			storeNo : 10050
		}, {
			title : '생생수산',
			latlng : new kakao.maps.LatLng(37.646941652199, 127.02269682052),
			storeNo : 10051
		}, {
			title : '선경수산',
			latlng : new kakao.maps.LatLng(37.637706785144, 127.02130676402),
			storeNo : 10052
		}, {
			title : '진욱수산',
			latlng : new kakao.maps.LatLng(37.634757500979, 127.01627089566),
			storeNo : 10053
		}, {
			title : '지호수산',
			latlng : new kakao.maps.LatLng(37.643236644772, 127.02818929486),
			storeNo : 10054
		}, {
			title : '수진수산',
			latlng : new kakao.maps.LatLng(37.635159773656, 127.02203267145),
			storeNo : 10055
		}, {
			title : '인규수산',
			latlng : new kakao.maps.LatLng(37.642656747516, 127.02721163083),
			storeNo : 10056
		}, {
			title : '초록초록',
			latlng : new kakao.maps.LatLng(37.640951375364, 127.01960189614),
			storeNo : 10057
		}, {
			title : '건강채소',
			latlng : new kakao.maps.LatLng(37.642794297184, 127.02040375899),
			storeNo : 10058
		}, {
			title : '듬뿍듬뿍',
			latlng : new kakao.maps.LatLng(37.633390325302, 127.01094982253),
			storeNo : 10059
		}, {
			title : '채',
			latlng : new kakao.maps.LatLng(37.655961788596, 127.013060642),
			storeNo : 10060
		}, {
			title : '소',
			latlng : new kakao.maps.LatLng(37.650889720309, 127.01251118711),
			storeNo : 10061
		}, {
			title : '채채네',
			latlng : new kakao.maps.LatLng(37.657267171124, 127.0128188573),
			storeNo : 10062
		}, {
			title : '재재네수산',
			latlng : new kakao.maps.LatLng(37.657334138931, 127.01311435601),
			storeNo : 10063
		}, {
			title : '진욱청과',
			latlng : new kakao.maps.LatLng(37.661449849973, 127.01267142133),
			storeNo : 10064

		}, {
			title : '선경청과',
			latlng : new kakao.maps.LatLng(37.661309429509, 127.01118083418),
			storeNo : 10065
		}, {
			title : '인규청과',
			latlng : new kakao.maps.LatLng(37.660902600373, 127.00651758337),
			storeNo : 10066
		}, {
			title : '지호청과',
			latlng : new kakao.maps.LatLng(37.662504335797, 127.01104387807),
			storeNo : 10067
		}, {
			title : '수진청과',
			latlng : new kakao.maps.LatLng(37.667024733234, 127.00941374004),
			storeNo : 10068
		}, {
			title : '다있어마트',
			latlng : new kakao.maps.LatLng(37.659205341544, 127.01160640689),
			storeNo : 10069
		} ];

		// 마커 이미지의 이미지 주소입니다
		var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png";

		for (var i = 0; i < positions.length; i++) {

			// 마커 이미지의 이미지 크기 입니다
			var imageSize = new kakao.maps.Size(40, 60);

			// 마커 이미지를 생성합니다    
			var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize);

			// 마커를 생성합니다
			var marker = new kakao.maps.Marker({
				map : map, // 마커를 표시할 지도
				position : positions[i].latlng, // 마커를 표시할 위치
				title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
				image : markerImage
				
			// 마커 이미지 
			});
		}
		
		

		for (var i = 0; i < positions.length; i++) {

			//커스텀 오버레이에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
			var content = '<div class="customoverlay">'
					+ '  <a href="#exampleModal" target="_blank" data-toggle="modal" data-value="'+positions[i].storeNo+'" onClick="fncGetStoreOnly(this)">'
					+ '    <span class="title">' + positions[i].title
					+ '</span>' + '  </a>' + '</div>';
					

			// 커스텀 오버레이가 표시될 위치입니다 
			var position = positions[i].latlng;

			// 커스텀 오버레이를 생성합니다
			var customOverlay = new kakao.maps.CustomOverlay({
				map : map,
				position : position,
				content : content,
				yAnchor : 1
			});

		}
		
		for (var i = 0; i < positions.length; i++) {
		
		//======간단 상점 조회=========//

		function fncGetStoreOnly(e) {
			
			
			var storeNo =  $(e).data("value");
			
		      var uri = "/store/getStoreOnly/"+storeNo

		      $.get(uri, function(response) { 
		         
		            var getStoreHtmlBody = "";
		            
		            $(response.getStoreOnly).each(function(idx,store) {
		            	          
		               
		            	getStoreHtmlBody += `
		            	
							<thead>

							<tr>
							<td></td>
							<td></td>
							<th scope="row" style="font-size: 20px"><span
								style="font-size: 18px margin-right: 30px;">상점이름&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></th>
							<td><span style="color: #2E2E2E; font-size: 15px "><strong>\${store.storeName}</strong></span></td>
						</tr>
						
						</hr>

							<tr>
								<td></td>
								<td></td>
								<th scope="row" style="font-size: 20px"><span
									style="font-size: 18px margin-right: 30px;">상점번호</span></th>
								<td><span style="color: #2E2E2E; font-size: 15px"><strong>\${store.storePhone}</strong></span></td>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td></td>
								<td></td>
								<th scope="row" style="font-size: 20px"><span
									style="color: blsck; font-size: 30px margin-right: 25px;">상점주소</span></th>
								<td><span style="color: #2E2E2E; font-size: 15px"><strong>\${store.storeAddr}</strong></span></td>

							</tr>

							<tr>
								<td></td>
								<td></td>
								<th scope="row" style="font-size: 20px"><span
									style="color: blsck; font-size: 30px margin-right: 25px;">업종</span></th>
								<td><span style="color: #2E2E2E; font-size: 15px"><strong>\${store.storeType}</strong></span></td>
								<td></td>
								<td></td>
							</tr>

							<tr>
								<td></td>
								<td></td>
								<th scope="row" style="font-size: 20px"><span
									style="color: blsck; font-size: 18px margin-right: 25px;">영업시간</span></th>
								<td><span style="color: #2E2E2E; font-size: 15px"><strong>\${store.startTime}~\${store.endTime}</strong></span></td>
								<td></td>
								<td></td>
							</tr>

							<tr>
								<td></td>
								<td></td>
								<th scope="row" style="font-size: 20px"><span
									style="color: blsck; font-size: 18px margin-right: 25px;">휴무일</span></th>
								<td><span style="color: red; font-size: 15px"><strong>\${store.holiday}</strong></span></td>
								<td></td>
								<td></td>
							</tr>

							<tr>
								<td></td>
								<td></td>
								<th scope="row" style="font-size: 20px"><span
									style="color: blsck; font-size: 18px margin-right: 25px;">상점소개</span></th>
								<td colspan="2"><span
									style="color: #2E2E2E; font-size: 15px"><strong>\${store.storeIntro}</strong></span></td>
							</tr>

							<tr>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
							
							</hr>
							
						</tbody>


		            	
		            	
		            	
		               `;
		            });
		            
		            
		            $(".getStore").html(getStoreHtmlBody);
		            //$(".userlisthead").html(blacklistHtmlBody);
		         
		      }, "json");

		}
		}
		
		
		
		  // 마커 클러스터러를 생성합니다 
	    var clusterer = new kakao.maps.MarkerClusterer({
	        map: map, // 마커들을 클러스터로 관리하고 표시할 지도 객체 
	        averageCenter: true, // 클러스터에 포함된 마커들의 평균 위치를 클러스터 마커 위치로 설정 
	        minLevel: 10 // 클러스터 할 최소 지도 레벨 
	    });
		  
		  
	 // 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
	    var zoomControl = new kakao.maps.ZoomControl();
	    map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);

	    // 지도가 확대 또는 축소되면 마지막 파라미터로 넘어온 함수를 호출하도록 이벤트를 등록합니다
	    kakao.maps.event.addListener(map, 'zoom_changed', function() {        
	        
	        // 지도의 현재 레벨을 얻어옵니다
	        var level = map.getLevel();
	        
	        var message = '현재 지도 레벨은 ' + level + ' 입니다';
	        var resultDiv = document.getElementById('result');  
	        resultDiv.innerHTML = message;
	        
	    });

		//=============map 상점 정보 rest가져오기==================//

		$.ajax({
			url : "/store/getStoreMap",
			dataType : "json"
		}).done(function(data) {
			console.log(data);
			var storeList = data;
			console.log(storeList);
		});

		//============================================//
	</script>

	<!-- Modal -->
	<div class="modal fade" id="exampleModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content" style="width: 800px; height: 450px; right: 150px;">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">
						<strong>상점 간단 정보</strong>
					</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">


					<div class="row store" style="justify-content: space-evenly;">

						<div class="imgborder">
							<img
								src="https://cdn.pixabay.com/photo/2016/11/29/11/14/business-1869127_960_720.jpg"
								alt="My Image" width="300" height="300" style=margin-right: 80px;>
						</div>


						<table class="table table-borderless" style="width: 600px;"
							id="storeInf">
							<div class="getStore">
							
							</div>
						</table>
						
													<tr>
							<td></td>
							<td></td>
							<th scope="row" style="font-size: 20px"><span
								style="color: blsck; font-size: 18px margin-right: 25px;"></span></th>
							<td colspan="2"><span
								style="color: #2E2E2E; font-size: 15px"><strong></strong></span></td>
								<td></td>
								<td><button type="button" class="btn btn-outline-dark btn-sm" onClick="location.href='http://localhost:8082/store/getStore?storeNo=10000'">상점상세</button></td>
								<td><button type="button" class="btn btn-outline-dark btn-sm" onClick="location.href='PAGENAME.html'">길찾기</button></td>
						</tr>
						
					</div>
				</div>


			</div>
		</div>
	</div>
	</div>

	<!-- Modal -->

	<script type="text/javascript">
   

</script>








</body>
</html>