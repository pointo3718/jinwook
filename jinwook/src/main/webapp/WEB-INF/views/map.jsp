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
         level : 4
      // 지도의 확대 레벨
      };

      var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
      
      var lat;
      var lon;
      
      
      if (navigator.geolocation) {
          
          // GeoLocation을 이용해서 접속 위치를 얻어옵니다
          navigator.geolocation.getCurrentPosition(function(position) {
              
                  lat = position.coords.latitude, // 위도
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
         latlng : new kakao.maps.LatLng(37.493989668463, 127.07981094747),
         storeNo : 10000,
         prodName : '청포도',
         price : 1000
      }, {
         title : '진욱이네',
         latlng : new kakao.maps.LatLng(37.493989668463, 127.07981094747),
         storeNo : 10000,
         prodName : '레몬',
         price : 40000
      }, {
         title : '인규네',
         latlng : new kakao.maps.LatLng(37.48022206234, 127.07175873858),
         storeNo : 10010
      }, {
         title : '선경이네',
         latlng : new kakao.maps.LatLng(37.491789564144, 127.07175873858),
         storeNo : 10011
      }, {
         title : '지호네',
         latlng : new kakao.maps.LatLng(37.473323136711, 127.053041346),
         storeNo : 10012
      }, {
         title : '수진이네',
         latlng : new kakao.maps.LatLng(37.5068817463, 127.02369960579),
         storeNo : 10013
      }, {
         title : '부들이네',
         latlng : new kakao.maps.LatLng(37.509349664472, 127.02550977627),
         storeNo : 10014
      }, {
         title : '몽자네',
         latlng : new kakao.maps.LatLng(37.508111240785, 127.03133687173),
         storeNo : 10015
      }, {
         title : '쌀쌀이네',
         latlng : new kakao.maps.LatLng(37.514365815803, 127.02861539074),
         storeNo : 10016
      }, {
         title : '쓸쓸이네',
         latlng : new kakao.maps.LatLng(37.516673439691, 127.02416007079),
         storeNo : 10018
      }, {
         title : '씩씩이네',
         latlng : new kakao.maps.LatLng(37.50743989439, 127.02830824115),
         storeNo : 10020
      }, {
         title : '몽몽이네',
         latlng : new kakao.maps.LatLng(37.523881067741, 127.03951297),
         storeNo : 10022
      }, {
         title : '해피채소',
         latlng : new kakao.maps.LatLng(37.521319764469, 127.03863147774),
         storeNo : 10027
      },

      {
         title : '여기가짱',
         latlng : new kakao.maps.LatLng(37.512596047338, 127.02689908153),
         storeNo : 10029
      }, {
         title : '해피수산',
         latlng : new kakao.maps.LatLng(37.515530095527, 127.02764173528),
         storeNo : 10030
      }, {
         title : '싱싱하네',
         latlng : new kakao.maps.LatLng(37.514110582916, 127.03631350766),
         storeNo : 10031
      }, {
         title : '철썩철썩',
         latlng : new kakao.maps.LatLng(37.513578891038, 127.02380395043),
         storeNo : 10033
      }, {
         title : '몽몽과일',
         latlng : new kakao.maps.LatLng(37.523055119826, 127.04685906179),
         storeNo : 10034
      }, {
         title : '상큼상킁',
         latlng : new kakao.maps.LatLng(37.503582924111, 127.05581186863),
         storeNo : 10035
      }, {
         title : '생생과일',
         latlng : new kakao.maps.LatLng(37.50177809289, 127.0525083841),
         storeNo : 10036
      }, {
         title : '커몬커몬',
         latlng : new kakao.maps.LatLng(37.502985735445, 127.05434772422),
         storeNo : 10037
      }, {
         title : '하늘하늘',
         latlng : new kakao.maps.LatLng(37.484944513743, 127.04191735596),
         storeNo : 10038
      }, {
         title : '김씨네',
         latlng : new kakao.maps.LatLng(37.485192378866, 127.04288158379),
         storeNo : 10039
      }, {
         title : '박씨네',
         latlng : new kakao.maps.LatLng(37.489361620873, 127.05489077402),
         storeNo : 10040
      }, {
         title : '이씨네',
         latlng : new kakao.maps.LatLng(37.513432194253, 127.0537346419),
         storeNo : 10041
      }, {
         title : '두근두근',
         latlng : new kakao.maps.LatLng(37.51101811014, 127.04808501236),
         storeNo : 10042
      }, {
         title : '몽몽정육',
         latlng : new kakao.maps.LatLng(37.509385585071, 127.05497846529),
         storeNo : 10043

      }, {
         title : '김씨네정육',
         latlng : new kakao.maps.LatLng(37.517449034166, 127.0529952703),
         storeNo : 10044
      }, {
         title : '돈돈',
         latlng : new kakao.maps.LatLng(37.514026572382, 127.06416809373),
         storeNo : 10045
      }, {
         title : '백씨네정육',
         latlng : new kakao.maps.LatLng(37.51797018551, 127.0517378591),
         storeNo : 10046
      }, {
         title : '한돈',
         latlng : new kakao.maps.LatLng(37.466977614433, 127.10943110145),
         storeNo : 10047
      }, {
         title : '음메음메',
         latlng : new kakao.maps.LatLng(37.467142046973, 127.10989448178),
         storeNo : 10048
      }, {
         title : '푸릇푸릇',
         latlng : new kakao.maps.LatLng(37.48544869124, 127.09838498178),
         storeNo : 10049
      }, {
         title : '싱싱수산',
         latlng : new kakao.maps.LatLng(37.517865229663, 127.02088112882),
         storeNo : 10050
      }, {
         title : '생생수산',
         latlng : new kakao.maps.LatLng(37.520095982565, 127.02698303995),
         storeNo : 10051
      }, {
         title : '선경수산',
         latlng : new kakao.maps.LatLng(37.523091299949, 127.02947894114),
         storeNo : 10052
      }, {
         title : '진욱수산',
         latlng : new kakao.maps.LatLng(37.520960045745, 127.02752337003),
         storeNo : 10053
      }, {
         title : '지호수산',
         latlng : new kakao.maps.LatLng(37.522447090995, 127.02178746313),
         storeNo : 10054
      }, {
         title : '수진수산',
         latlng : new kakao.maps.LatLng(37.523563606991, 127.0328666572),
         storeNo : 10055
      }, {
         title : '인규수산',
         latlng : new kakao.maps.LatLng(37.528465554751, 127.03523691605),
         storeNo : 10056
      }, {
         title : '초록초록',
         latlng : new kakao.maps.LatLng(37.526825204754, 127.02717035559),
         storeNo : 10057
      }, {
         title : '건강채소',
         latlng : new kakao.maps.LatLng(37.497435224444, 127.02831751315),
         storeNo : 10058
      }, {
         title : '듬뿍듬뿍',
         latlng : new kakao.maps.LatLng(37.495273129342, 127.0399198711),
         storeNo : 10059
      }, {
         title : '채',
         latlng : new kakao.maps.LatLng(37.493425205755, 127.03695152278),
         storeNo : 10060
      }, {
         title : '소',
         latlng : new kakao.maps.LatLng(37.503234579183, 127.03430146721),
         storeNo : 10061
      }, {
         title : '채채네',
         latlng : new kakao.maps.LatLng(37.49152497274, 127.03445074263),
         storeNo : 10062
      }, {
         title : '재재네수산',
         latlng : new kakao.maps.LatLng(37.506230588876, 127.03816740507),
         storeNo : 10063
      }, {
         title : '진욱청과',
         latlng : new kakao.maps.LatLng(37.497417361271, 127.04490564951),
         storeNo : 10064

      }, {
         title : '선경청과',
         latlng : new kakao.maps.LatLng(37.497209755387, 127.04391930279),
         storeNo : 10065
      }, {
         title : '인규청과',
         latlng : new kakao.maps.LatLng(37.494654697683, 127.03492123187),
         storeNo : 10066
      }, {
         title : '지호청과',
         latlng : new kakao.maps.LatLng(37.494666592279, 127.03223042866),
         storeNo : 10067
      }, {
         title : '수진청과',
         latlng : new kakao.maps.LatLng(37.500004736673, 127.0276000128),
         storeNo : 10068
      }, {
         title : '다있어마트',
         latlng : new kakao.maps.LatLng(37.504764176078, 127.04045869217),
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
                     
                     <div class="row store" style="justify-content: space-evenly;">

                     <div class="imgborder">
                        <img
                           src="https://cdn.pixabay.com/photo/2016/11/29/11/14/business-1869127_960_720.jpg"
                           alt="My Image" width="300" height="300">
                     </div>
                     
                     <table class="table table-borderless" style="width: 600px;margin-top: 15px;"
                        id="storeInf">
                     
                     <thead>

                     <tr>
                     <td></td>
                     <td></td>
                     <th scope="row" style="font-size: 20px; width: 120px; padding-bottom: 0px;"><span
                        style="font-size: 18px margin-right: 30px;">상점이름</span></th>
                     <td style="padding-bottom: 0px; width: 224px;"><span style="color: #2E2E2E; font-size: 15px "><a href="http://localhost:8082/store/getStore?storeNo=\${store.storeNo}" style="color:#7fad39;" title="상점 상세페이지로 이동"><strong>\${store.storeName}</strong></span></td>
                  </tr>
                  
                  </hr>

                     <tr>
                        <td></td>
                        <td></td>
                        <th scope="row" style="font-size: 20px; width: 120px; padding-bottom: 0px; padding-top: 0px;"><span
                           style="font-size: 18px margin-right: 30px;">상점번호</span></th>
                        <td style="padding-bottom: 0px; width: 224px; padding-top: 0px;"><span style="color: #2E2E2E; font-size: 15px"><strong>\${store.storePhone}</strong></span></td>
                     </tr>
                  </thead>
                  <tbody>
                     <tr>
                        <td></td>
                        <td></td>
                        <th scope="row" style="font-size: 20px; width: 120px; padding-bottom: 0px; padding-top: 0px;"><span
                           style="color: blsck; font-size: 30px margin-right: 25px;">상점주소</span></th>
                        <td style="padding-bottom: 0px; width: 324px; padding-top: 0px;"><span style="color: #2E2E2E; font-size: 15px"><strong>\${store.storeAddr}</strong></span></td>

                     </tr>

                     <tr>
                        <td></td>
                        <td></td>
                        <th scope="row" style="font-size: 20px; width: 120px; padding-bottom: 0px; padding-top: 0px;"><span
                           style="color: blsck; font-size: 30px margin-right: 25px;">업종</span></th>
                        <td style="padding-bottom: 0px; width: 224px; padding-top: 0px;"><span style="color: #2E2E2E; font-size: 15px"><strong>\${store.storeType}</strong></span></td>
                        <td></td>
                        <td></td>
                     </tr>

                     <tr>
                        <td></td>
                        <td></td>
                        <th scope="row" style="font-size: 20px; width: 120px; padding-bottom: 0px;"><span
                           style="color: blsck; font-size: 18px margin-right: 25px;">영업시간</span></th>
                        <td style="padding-bottom: 0px; width: 224px; padding-top: 0px;"><span style="color: #2E2E2E; font-size: 15px"><strong>\${store.startTime}~\${store.endTime}</strong></span></td>
                        <td></td>
                        <td></td>
                     </tr>

                     <tr>
                        <td></td>
                        <td></td>
                        <th scope="row" style="font-size: 20px; width: 120px; padding-bottom: 0px; padding-top: 0px;"><span
                           style="color: blsck; font-size: 18px margin-right: 25px;">휴무일</span></th>
                        <td style="padding-bottom: 0px; width: 224px; padding-top: 0px;"><span style="color: red; font-size: 15px"><strong>\${store.holiday}</strong></span></td>
                        <td></td>
                        <td></td>
                     </tr>

                     <tr>
                        <td></td>
                        <td></td>
                        <th scope="row" style="font-size: 20px; width: 120px; padding-bottom: 0px; padding-top: 0px;"><span
                           style="color: blsck; font-size: 18px margin-right: 25px;">상점소개</span></th>
                        <td colspan="2" style="padding-bottom: 0px; width: 224px; padding-top: 0px;"><span
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
                  
                  </table>

                  <tr>
                     <td></td>
                     <td></td>
                     <th scope="row" style="font-size: 20px"><span
                        style="color: blsck; font-size: 18px margin-right: 25px;"></span></th>
                     <td colspan="2"><span
                        style="color: #2E2E2E; font-size: 15px"><strong></strong></span></td>
                     <td></td>
                     <td><button type="button" style="margin-right: 140px;"
                           class="btn btn-light"
                           onClick="window.open('https://map.kakao.com/link/to/\${store.storeName},\${store.latitude},\${store.longitude}/from/현재위치,\${lat},\${lon}','new','scrollbars=yes,resizable=no width=1200 height=750, left=345,top=150')">길찾기&nbsp;<i class="fa fa-map-marker" aria-hidden="true"></i></button></td>
                  </tr>

               </div>


                     
                     
                     
                     `;
                  });
                  
                  
                  $(".getStore").html(getStoreHtmlBody);
                  //$(".userlisthead").html(blacklistHtmlBody);
               
            }, "json");

      }
      }
      
      
      

      //=============map 상점 정보 rest가져오기==================//

//      $.ajax({
//         url : "/store/getStoreMap",
//         dataType : "json"
//      }).done(function(data) {
//         console.log(data);
//         var storeList = data;
//         console.log(storeList);
//      });

      //============================================//
   </script>

   <!-- Modal -->
   <div class="modal fade" id="exampleModal" tabindex="-1"
      aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="modal-dialog">
         <div class="modal-content" style="width: 500px; height: 730px; top:100px;">
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
               <div class="getStore"></div>

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