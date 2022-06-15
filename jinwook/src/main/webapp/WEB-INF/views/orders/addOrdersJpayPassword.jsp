<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <!-- jQuery UI toolTip 사용 JS-->
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<meta charset="UTF-8">
<title>password input modal</title>
<style>
.swal-button {
	background-color: #7fad39;
	font-size: 12px;
	text-shadow: 0px -1px 0px rgba(0, 0, 0, 0.3);
}
#modal{
	display : none;
	z-index : 1;
	background-color: rgba(0,0,0,.3);
	position:fixed;
	left:0;
	top: 0;
	height:100%;
	width: 100%;
	
}
#modal>#content{
	width: 80%;
	max-width: 350px;
	margin:100px auto;
	padding:20px;
	position: relative;
	background-color:#fff;
}
#modal1{
	display : none;
	z-index : 1;
	background-color: rgba(0,0,0,.3);
	position:fixed;
	left:0;
	top: 0;
	height:100%;
	width: 100%;
	
}
#modal1>#content1{
	width: 80%;
	max-width: 350px;
	margin:100px auto;
	padding:20px;
	position: relative;
	background-color:#fff;
}
.close{
	position:absolute;
	top:4px;
	right:4px;	
	font-size:20px;
	border:0;
	background-color: #fff;
}

.title {
	text-align: center;
}

.pwWrap .pwSection{
  position: relative;
  display: flex;
  justify-content: center;
  align-items: center;
  width: 100%;
  height: 150px;
}

.pwWrap .pwSection .dot {
  display: block;
  width: 10px;
  height: 10px;
  background: darkgrey;
  border-radius: 100%;
  margin: 0 5px;
}

.pwWrap .pwSection .dot .active {
  background: rgba(0, 0, 0, 0.7);
}

.pwWrap .pwSection .message {
  position: absolute;
  bottom: 5px;
  left: 0;
  z-index: 1;
  min-width: 100%;
  text-align: center;
  font-size: 14px;
  font-weight: bold;
  letter-spacing: -0.03em;
  opacity: 0;
  transition: .2s ease-out;
}

.pwWrap .numberSection {
  overflow: hidden;
}

.pwWrap .numberSection .number {
  float: left;
  width: 33.33%;
  height: 60px;
  border: 1px solid rgba(0, 0, 0, 0.1);
  padding: 20px 0;
  cursor: pointer;
  background: #7fad39;
  color: #ffffff;
  font-size: medium;
}

.pwWrap .numberSection .number:last-child {
  margin-left: 0%;
  
}

.pwWrap .error .message {
  opacity: 1;
  color: red;
}

.pwWrap .confirm .message {
  opacity: 1;
  color: green;
}

.close:hover,
.close:focus {
  color : #000;
  text-decoration: none;
  cursor :pointer;
}
</style>
</head>
<body>
<label>암호를 입력하려면 버튼을 클릭해 주세요.</label>
<input type='button' value='addopen' id='btnOpen'>
<div id='modal'>
	<div id='content'>
		<input type='button' value='X' class="close" id='btnClose'/>
		<div class="title">
			<h2 class="h3">
	   		   <span style="color : #7fad39">진욱페이</span>
	    	</h2>
			<h3 class="h4"> 비밀번호 입력</h3><hr>
			<h3 class="h5"> 새로운 결제 비밀번호를 입력해주세요. </h3>
		</div>
		<div class="pwWrap">		
			<div class="pwSection">
		        <span class="dot"></span>
		        <span class="dot"></span>
		        <span class="dot"></span>
		        <span class="dot"></span>
		        <span class="dot"></span>
		        <span class="dot"></span>
		        <p class="message">&nbsp;</p>
	   		</div>
	   		<div class="numberSection">
		        <button class="number">1</button>
		        <button class="number">2</button>
		        <button class="number">3</button>
		        <button class="number">4</button>
		        <button class="number">5</button>
		        <button class="number">6</button>
		        <button class="number">7</button>		
		        <button class="number">8</button>
		        <button class="number">9</button>
		        <button class="number">리셋</button>
		        <button class="number">0</button>
		        <button class="number">X</button>
	    	</div>
	    	
	    </div>
	    
	</div>
</div>
<label>암호를 재확인 해주세요.</label>
<input type='button' value='checkopen' id='btnOpen1'>
<div id='modal1'>
	<div id='content1'>
		<input type='button' value='X' class="close" id='btnClose1'/>
		<div class="title">
			<h2 class="h3">
	   		   <span style="color : #7fad39">진욱페이</span>
	    	</h2>
			<h3 class="h4"> 비밀번호 입력</h3><hr>
			<h3 class="h5"> 결제 비밀번호를 디시한번 입력해주세요. </h3>
			
			
			
		</div>
		<div class="pwWrap">		
			<div class="pwSection">
		        <span class="dot"></span>
		        <span class="dot"></span>
		        <span class="dot"></span>
		        <span class="dot"></span>
		        <span class="dot"></span>
		        <span class="dot"></span>
		        <p class="message">&nbsp;</p>
	   		</div>
	   		<div class="numberSection">
		        <button class="number">1</button>
		        <button class="number">2</button>
		        <button class="number">3</button>
		        <button class="number">4</button>
		        <button class="number">5</button>
		        <button class="number">6</button>
		        <button class="number">7</button>		
		        <button class="number">8</button>
		        <button class="number">9</button>
		        <button class="number">확인</button>
		        <button class="number">0</button>
		        <button class="number">X</button>
	    	</div>
	    	
	    </div>
	</div>
</div>
 <script>
var btnOpen  = document.getElementById('btnOpen');
var btnClose = document.getElementById('btnClose');

//modal 창을 보여줌
btnOpen.onclick = function(){
	var modal = document.getElementById('modal');
	modal.style.display = 'block';
	
}
var closeRtn = function(){
	var modal = document.getElementById('modal');
	modal.style.display = 'none';
	passwordNumber = [];
}
btnClose.onclick = closeRtn;

function PwCheck(pw) {
    const _this = this; 
    _this.pwStr = pw.toString(); // 문자, 숫자열을 모두 허용하기 위해 무조건 한가지 타입으로 맞춤
    _this.passwordNumber = []; // 입력할 패스워드
    _this.cnt = 0; // 입력횟수 체크
    _this.compChk = false; // 입력완료 체크 

    _this.parent = document.querySelector('.pwWrap');
    _this.dots = document.querySelectorAll('.dot');
    _this.numbers = document.querySelectorAll('.number');
    _this.message = document.querySelector('.message');


    // 숫자버튼 click이벤트 연동
    _this.handleListener = function(){
        if(!_this.compChk) {
            _this.numbers.forEach(function(number){
                number.addEventListener('click', function(){_this.handleNumber(number)});
            })
        }
    }

    // 숫자키를 눌렀을때 이벤트 
    _this.handleNumber = function(number){
        if(!_this.compChk) {
            _this.passwordNumber[_this.cnt] = number.textContent;
            _this.handleDotActive(true);
            _this.cnt++;
            console.log(_this.cnt);
            if(_this.cnt === 6) {
                _this.handleResult();
            }
        }
        console.log(_this.passwordNumber);
    }
    
    // dot 활성화 
    _this.handleDotActive = function(type){
        if(type) {
        	console.log(type);
            _this.dots.forEach(function(dot, i){
                if(i === _this.cnt) dot.classList.add('active');
               
            })
        } else {
            _this.dots.forEach(function(dot){
               dot.classList.remove('active'); 
            })
        }
    }

    // 결과처리 
    _this.handleResult = function(){
	    _this.compChk = true;
	    closeRtn;
	    
    }
    
    _this.init = function(){
        _this.handleListener();
    }();
    let pwCheck = new PwCheck(000000);
}
</script>
<script>
var btnOpen1  = document.getElementById('btnOpen1');
var btnClose1 = document.getElementById('btnClose1');

//modal 창을 보여줌
btnOpen1.onclick = function(){
	var modal1 = document.getElementById('modal1');
	modal1.style.display = 'block';
}

var closeRtn1 = function(){
	var modal1 = document.getElementById('modal1');
	modal1.style.display = 'none';
	
}
btnClose1.onclick = closeRtn1;

function PwCheck1(pw) {
    const _this1 = this; 
    _this1.pwStr = pw.toString(); // 문자, 숫자열을 모두 허용하기 위해 무조건 한가지 타입으로 맞춤
    _this1.password = []; // 지정된 패스워드
    _this1.passwordNumber = []; // 입력할 패스워드
    _this1.cnt = 0; // 입력횟수 체크
    _this1.compChk = false; // 입력완료 체크 

    _this1.parent = document.querySelector('.pwWrap');
    _this1.dots = document.querySelectorAll('.dot');
    _this1.numbers = document.querySelectorAll('.number');
    _this1.message = document.querySelector('.message');


    // 비밀번호를 배열에 넣음 
    _this1.getPw = function(){
        for(let i=0; i<_this1.pwStr.length; i++) {
            _this1.password[i] = _this1.pwStr[i];
        }
    }

    // 숫자버튼 click이벤트 연동
    _this1.handleListener = function(){
        if(!_this1.compChk) {
            _this1.numbers.forEach(function(number){
                number.addEventListener('click', function(){_this1.handleNumber(number)});
            })
        }
    }

    // 숫자키를 눌렀을때 이벤트 
    _this1.handleNumber = function(number){
        if(!_this1.compChk) {
            _this1.passwordNumber[_this1.cnt] = number.textContent;
            _this1.handleDotActive(true);
            _this1.cnt++;
            if(_this1.cnt === 6) {
                _this1.handleResult();
            }
        }
        console.log(_this1.passwordNumber);
    }

    // dot 활성화 
    _this1.handleDotActive = function(type){
        if(type) {
            _this1.dots.forEach(function(dot, i){
                if(i === _this1.cnt) dot.classList.add('active'); 
            })
        } else {
            _this1.dots.forEach(function(dot){
               dot.classList.remove('active'); 
            })
        }
    }

    // 비밀번호 비교
    console.log(JSON.stringify(_this1.password));
    _this1.handleCheckPw = function(){
        let compare = JSON.stringify(_this1.password) === JSON.stringify(_this1.passwordNumber);
        return compare; 
    }

    // 결과처리 
    
    _this1.handleResult = function(){
        if(_this1.handleCheckPw()) {
        	console.log(_this1.handleCheckPw())
        	window.location.href = '/orders/addOrdersJpayCharge/';

            _this1.compChk = true;
        } else {
            _this1.parent.classList.add('error');
            // 입력상태 초기화 
            _this1.passwordNumber = [];
            _this1.cnt = 0; 
            _this1.compChk = true; // 일시적인 클릭 방지 

            setTimeout(function(){
            	swal("진욱이네","결제비밀번호가 잘못입력되었습니다.");
                _this1.compChk = false;	
                _this1.parent.classList.remove('error');
                _this1.handleDotActive();
            }, 200);
        }
    }
    
    _this1.init = function(){
        _this1.handleListener();
        _this1.getPw();
    }();
let pwCheck = new PwCheck(123456);
}
</script>


</body>
</html>	