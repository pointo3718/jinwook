<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<meta name="description" content="Ogani Template">
<meta name="keywords" content="Ogani, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>유저/사장/관리자 페이지 </title>

<!-- Google Font -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">	

<!-- Css Styles -->
<link rel="stylesheet"
   href="${path}/resources/static/css/bootstrap.min.css" type="text/css">
<link rel="stylesheet"
   href="${path}/resources/static/css/font-awesome.min.css"
   type="text/css">
<link rel="stylesheet"
   href="${path}/resources/static/css/elegant-icons.css" type="text/css">
<link rel="stylesheet"
   href="${path}/resources/static/css/nice-select.css" type="text/css">
<link rel="stylesheet"
   href="${path}/resources/static/css/jquery-ui.min.css" type="text/css">
<link rel="stylesheet"
   href="${path}/resources/static/css/owl.carousel.min.css"
   type="text/css">
<link rel="stylesheet"
   href="${path}/resources/static/css/slicknav.min.css" type="text/css">
<link rel="stylesheet" href="${path}/resources/static/css/style.css"
   type="text/css">
<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.min.js"></script>
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
</head>
<body>

   <!-- Header Begin -->
   <jsp:include page="../layout/top.jsp" />
   <!-- Header End -->

   <!-- adminTop Begin -->
   <jsp:include page="../layout/adminTop.jsp" />
   <!-- adminTop End -->


<canvas id="join-chart"style="height:50vh; width:45vw"></canvas>
<canvas id="user-chart"style="height:30vh; width:45vw"></canvas>
<canvas id="userType-chart"style="height:30vh; width:45vw"></canvas>
<canvas id="order-chart"style="height:30vh; width:45vw"></canvas>


      </div>
   </div>
</section>
   
   
   <!--  Footer Begin -->
   <jsp:include page="../layout/footer.jsp" />
   <!-- Footer End -->
   

<script type="text/javascript">

// ======= 월별 회원가입 수 통계 ====== //
$(document).ready(function(){ 
	getGraphJoinForMonth();
});

function getGraphJoinForMonth(){
	
  let timeList = [];
  let posList = [];
  
  var uri="/admin/getJoinForMonthChart"

  $.get(uri, function(response){
	  
		  console.log(response.joinlist[0].ym);
		  // 그래프로 나타낼 자료 리스트에 담기
		  for (let i = 0; i<response.joinlist.length;i++){    				  
				timeList.push(response.joinlist[i].ym);    				  
				posList.push(response.joinlist[i].count);    				  
		  }
		   console.log(timeList);
		   console.log(posList);  	
		  // 그래프
		  new Chart(document.getElementById("join-chart"), {
	    	  type: 'bar',
	    	  data: {
	    	    labels: timeList, // X축 
	    	    datasets: [{ 
	    	        data: posList, // 값
	    	        label: "회원가입 수",
	    	        backgroundColor : "#7fad39",
	    	        fill: false
	    	      }
	    	    ]
	    	  },
	    	  options: {
	    		  responsive: false,
	    	    title: {
	    	      display: true,
	    	      text: '월별 회원가입 수'
	    	    }
	    	  }
	    	}); //그래프
	  }, "json");
	 
}  


//======= 역할별 사용자 수 통계 ====== //
$(document).ready(function(){ 
	getGraphUserByRole();
});

function getGraphUserByRole(){	
  
  var uri="/admin/getUserByRole"

  $.get(uri, function(response){
	  
		 console.log(response.userlist[0].adminCount);
		 
		 // 그래프로 나타낼 자료 리스트에 담기
		 var user = response.userlist[0].userCount;
		 var ceo = response.userlist[0].ceoCount;
		 var admin = response.userlist[0].adminCount;
		 
	     console.log(user);
	     console.log(ceo);  	
	     console.log(admin);  	
	    
		  // 그래프
		  new Chart(document.getElementById("user-chart"), {
	    	  type: 'doughnut',
	    	  data: {
	    	    labels: ["사용자", "사장님", "관리자"], // X축 
	    	    datasets: [{ 
	    	        data: [user, ceo, admin], // 값
	    	        label: "역할",
	    	        backgroundColor : ["#7fad39","#fadb5e", "ff9e5e"],
	    	        fill: false
	    	      }
	    	    ]
	    	  },
	    	  options: {
	    		  responsive: false,
	    	    title: {
	    	      display: true,
	    	      text: '역할'
	    	    }
	    	  }
	    	}); //그래프
	  }, "json");
	 
}  


//======= 사용자 유형 (일반/블랙/탈퇴) 통계 ====== //
$(document).ready(function(){ 
	getUserType();
});

function getUserType(){	
  
  var uri="/admin/getUserType"

  $.get(uri, function(response){
	  
		 console.log(response.usertypelist[0].userCount);
		 
		 // 그래프로 나타낼 자료 리스트에 담기
		 var user = response.usertypelist[0].userCount;
		 var blacklist = response.usertypelist[0].blacklistCount;
		 var byeuser = response.usertypelist[0].byeUserCount;
		 
	     console.log(user);
	     console.log(blacklist);  	
	     console.log(byeuser);  	
	    
		  // 그래프
		  new Chart(document.getElementById("userType-chart"), {
	    	  type: 'doughnut',
	    	  data: {
	    	    labels: ["일반", "블랙", "탈퇴"], // X축 
	    	    datasets: [{ 
	    	        data: [user, blacklist, byeuser], // 값
	    	        label: "역할",
	    	        backgroundColor : ["#7fad39","#435b1e", "d1fa91"],
	    	        fill: false
	    	      }
	    	    ]
	    	  },
	    	  options: {
	    		  responsive: false,
	    	    title: {
	    	      display: true,
	    	      text: '역할'
	    	    }
	    	  }
	    	}); //그래프
	  }, "json");
	 
}  


//======= 월별 주문량/주문금액 통계 ====== //
$(document).ready(function(){ 
	getGraphOrderCountAndPrice();
});

function getGraphOrderCountAndPrice(){
	
  let timeList = [];
  let countList = [];  
  let priceList = [];  
  
  var uri="/admin/getOrderCountAndPrice"

  $.get(uri, function(response){
	  
	  console.log(response.orderlist[0].ym);
	  // 그래프로 나타낼 자료 리스트에 담기
	  for (let i = 0; i<response.orderlist.length;i++){    				  
			timeList.push(response.orderlist[i].ym);    				  
			countList.push(response.orderlist[i].count);    				  
			priceList.push(response.orderlist[i].sumPrice);    				  
	  }
	   console.log(timeList);
	   console.log(countList);  	
	   console.log(priceList);  	
	    
		  // 그래프
		  new Chart(document.getElementById("order-chart"), {
	    	  
			  type:'bar',
			  
			  data: {
	    	    labels: timeList, // X축 
	    	    datasets: [{ 
	    	        data: countList, // 값
	    	        label: "전체 주문횟수",
					type: 'bar',	    	       
	    	        backgroundColor : "#7fad39",
	    	        fill: false,
	    	        order: 1
	    	      },
	    	    
	    	  
	    	  
	    	  	{	data: priceList, 
	    	    	type: 'line',
	    	    	label: "주문금액(기준:만원)",
		    		borderColor : 'rgb(255,153,0)',
		    		backgroundColor: 'rgb(255,153,0)',
		    		fill: false,
		    		order: 0
		    	}]
	    	  },
		    	
	    	  options: {
	    		  responsive: false,
		    	  title: {
		    	      display: true,
		    	      text: '역할'
		    	    },
		    	  scales: {
	    	        // y축
                    yAxes: [{
                        stacked: true,
                        ticks: {
                            fontColor:'black' // y축 폰트 color
                        }
                     }],
                     // x축
                     xAxes: [{
                         stacked: true,
                        ticks: {
                            fontColor:'black' // x축 폰트 color
                        }
                     }]
		    	  }
		    		  
		    	 } // option 끝
	    	 
	    	}); //그래프
	  }, "json");
	 
} 

</script>


</body>
</html>