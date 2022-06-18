<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
<meta charset="UTF-8">
<title>password input modal</title>
<style>
#modal{
	display : none;
	z-index : 1;
	background-color: rgba(0,0,0,.3);
	position:fixed;
	left:0;
	top: 0;
	height:100%;
	width: 100%;ㄴ
	
}
#modal>#content{
	width: 80%;
	max-width: 350px;
	margin:100px auto;
	padding:20px;
	position: relative;
	background-color:#fff;
}

#modal .close{
	position:absolute;
	top:4px;
	right:4px;	
	font-size:20px;
	border:0;
	background-color: #fff;
}

#modal>#content .title {
	text-align: center;
}

#modal>#content .pwWrap .pwSection{
  position: relative;
  display: flex;
  justify-content: center;
  align-items: center;
  width: 100%;
  height: 150px;
}

#modal>#content .pwWrap .pwSection .dot {
  display: block;
  width: 10px;
  height: 10px;
  background: darkgrey;
  border-radius: 100%;
  margin: 0 5px;
}

#modal>#content .pwWrap .pwSection .dot.active {
  background: rgba(0, 0, 0, 0.7);
}

#modal>#content .pwWrap .pwSection .message {
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

#modal>#content .pwWrap .numberSection {
  overflow: hidden;
}

#modal>#content .pwWrap .numberSection .number {
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

#modal>#content .pwWrap .numberSection .number:last-child {
  margin-left: 0%;
  
}

#modal>#content .pwWrap .error .message {
  opacity: 1;
  color: red;
}

#modal>#content .pwWrap .confirm .message {
  opacity: 1;
  color: green;
}

#modal .close:hover,
#modal .close:focus {
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

// modal 창을 보여줌
btnOpen.onclick = function(){
	var modal = document.getElementById('modal');
	modal.style.display = 'block';
	
}
//modal 창을 감춤
var closeRtn = function(){
	var modal = document.getElementById('modal');
	modal.style.display = 'none';
	
}
btnClose.onclick = closeRtn;

function PwCheck(pw) {
    const _this = this; 
    _this.pwStr = pw.toString(); // 문자, 숫자열을 모두 허용하기 위해 무조건 한가지 타입으로 맞춤
    _this.password = []; // 지정된 패스워드
    _this.passwordNumber = []; // 입력할 패스워드
    _this.cnt = 0; // 입력횟수 체크
    _this.compChk = false; // 입력완료 체크 
    _this.msg = [	
        'Wrong Password! Try Again! 👿',
        'Success! 😍'
    ]; 

    _this.parent = document.querySelector('.pwWrap');
    _this.dots = document.querySelectorAll('.dot');
    _this.numbers = document.querySelectorAll('.number');
    _this.message = document.querySelector('.message');


    // 비밀번호를 배열에 넣음 
    _this.getPw = function(){
        for(let i=0; i<_this.pwStr.length; i++) {
            _this.password[i] = _this.pwStr[i];
        }
    }

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
            if(_this.cnt === 6) {
                _this.handleResult();
            }
        }
        console.log(_this.passwordNumber);
    }

    // dot 활성화 
    _this.handleDotActive = function(type){
        if(type) {
            _this.dots.forEach(function(dot, i){
                if(i === _this.cnt) dot.classList.add('active'); 
            })
        } else {
            _this.dots.forEach(function(dot){
               dot.classList.remove('active'); 
            })
        }
        console.log(type);
    }

    // 비밀번호 비교
    _this.handleCheckPw = function(){
        let compare = JSON.stringify(_this.password) === JSON.stringify(_this.passwordNumber);
        return compare; 
    }

    // 결과처리 
    _this.handleResult = function(){
        if(_this.handleCheckPw()) {
            _this.parent.classList.add('confirm');
            _this.message.textContent = _this.msg[1];
            _this.compChk = true;
        } else {
            _this.parent.classList.add('error');
            _this.message.textContent = _this.msg[0];
            // 입력상태 초기화 
            _this.passwordNumber = [];
            _this.cnt = 0; 
            _this.compChk = true; // 일시적인 클릭 방지 
            
            setTimeout(function(){
                _this.compChk = false;	
                _this.parent.classList.remove('error');
                _this.handleDotActive();
            }, 1000);
        }
    }

    _this.init = function(){
        _this.handleListener();
        _this.getPw();
    }();
}

let pwCheck = new PwCheck(123456);



</script>
</body>
</html>	