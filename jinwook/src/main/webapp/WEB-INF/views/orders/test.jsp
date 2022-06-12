<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>









<!doctype html>
<!--[if lt IE 7 ]> <html lang="ko-KR" class="browser-ie6 browser-ie-regacy page-rocketpay-app-html"> <![endif]-->
<!--[if IE 7 ]>    <html lang="ko-KR" class="browser-ie7 browser-ie-regacy page-rocketpay-app-html"> <![endif]-->
<!--[if IE 8 ]>    <html lang="ko-KR" class="browser-ie8 browser-ie-regacy page-rocketpay-app-html"> <![endif]-->
<!--[if IE 9 ]>    <html lang="ko-KR" class="browser-ie9 browser-modern page-rocketpay-app-html"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="ko-KR" class="browser-modern page-rocketpay-app-html"> <!--<![endif]-->
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, user-scalable=no">
    <meta name="format-detection" content="telephone=no">
    <title>쿠팡! 비밀번호 입력</title>
    <meta property="og:title" content="COUPANG">
    <meta property="og:image" content="//img1a.coupangcdn.com/image/mobile/v3/img_fb_like.png">
    <meta property="og:url" content="//www.coupang.com">
    <meta property="og:description" content="쿠페이">
    <meta property="og:type" content="website">

    <link rel="shortcut icon" href="//img1a.coupangcdn.com/image/coupang/favicon/favicon.ico" type="image/x-icon">

    <noscript>
        <meta http-equiv="refresh" content="0; URL=/login/m/guide/requireJavascript.pang"/>
    </noscript>
    <link type="text/css" rel="stylesheet" href="/resources/20220608135347_ed2b57a0/rocketpay-dist/pc/controller/initialize.css"/>
<link type="text/css" rel="stylesheet" href="/resources/20220608135347_ed2b57a0/rocketpay-dist/pc/controller/mypage/verifyPasswordView.css"/>
    
    <style>
        body {
            background-color: #fff;
        }
    </style>

    <script
  id="coupang-web-log"
  data-platform="web"
  
  data-service="coupang"
  data-mode="production"
  src="//asset2.coupangcdn.com/customjs/coupang-web-log/1.4.3/web-log.umd.min.js"
></script>
</head>
<body id="rocketpay-service"
      class="page-mypage-verifyPasswordView"
      data-reference='{
        "profile":"production"
      }'>

    
    <form id=""
          class="rocketpay-container"
          name="encryptPassword"
          method="post"
          action="/rocketpay/myPage/verifyPassword">


    
  
  <input type="hidden" name="rpay-headerTitleInput" id="rpay-headerTitleInput" value="비밀번호 입력" />

  <div class="rocketpay-container-header">
    
    <h1 class="rocketpay-container-header-h1">
      <span class="rocketpay-container-header-h1__icons">Coupay</span>
    </h1>
    
    <h2  id="rpay-headerTitle"
         class="rocketpay-container-header-h2">
      비밀번호 입력
    </h2>
    <a class="rocketpay-container-header-close" href="#">닫기</a>
  </div>

  <script type="text/javascript">
    function setTitleName(title) {
      var headerTitleInput = document.getElementById("rpay-headerTitleInput");
      if(title){headerTitleInput.value = title;}
      document.getElementById("rpay-headerTitle").innerText = headerTitleInput.value;
    }
  </script>
  <script type="text/javascript">
    (function(window) {
      try {
        var hasPageshowEvent = 'onpageshow' in window;
        if(hasPageshowEvent){ window.addEventListener('pageshow',function(){ window.setTitleName();}); }
        else{ window.setTitleName(); }
      } catch (error) {
        window.rocketpayJsLog &&
        window.rocketpayJsLog.errorReport &&
        window.rocketpayJsLog.errorReport('[setTitleName]', error);
      }
    })(window);
  </script>



    <div class="rocketpay-container-content">
        

    <div class="encrypt-password-head">
        <h1 class="encrypt-password-head-title"></h1>
        <p class="encrypt-password-head-content">사용중인 결제 비밀번호를 입력해주세요.</p>
    </div>

    <div class="rocketpay-keypad-password-wrap">
    <span class="rocketpay-keypad-password"></span>
    <span class="rocketpay-keypad-password"></span>
    <span class="rocketpay-keypad-password"></span>
    <span class="rocketpay-keypad-password"></span>
    <span class="rocketpay-keypad-password"></span>
    <span class="rocketpay-keypad-password"></span>
</div>



    
  





    

  <style type="text/css">
    .rocketpay-keypad-key span {
      background-image: url("/rocketpay/keypad/number/optimize-image/ded3c11f4636450bb50f2cab5a0cd0a2");
    }
  </style>

  <div class="rocketpay-keypad" data-numberKeypadToken="ded3c11f4636450bb50f2cab5a0cd0a2">
    <table cellspacing="0" class="rocketpay-keypad-table">
      <thead>
      <tr>
        <td class="rocketpay-keypad-header">
          <a class="rocketpay-find-password"
             href="/rocketpay/myPage/resetPassword">
            비밀번호 재설정
          </a>
        </td>
      </tr>
      </thead>
      <tbody>
      <tr class="rocketpay-keypad-tr">
        <td class="rocketpay-keypad-td">
          <a href="#"
             class="rocketpay-keypad-key"
             data-key="VYyXQbUKBC">
            <span class="rocketpay-keypad-position-0"></span>
          </a>
        </td>
        <td class="rocketpay-keypad-td">
          <a href="#"
             class="rocketpay-keypad-key"
             data-key="D5drCCKB9S">
            <span class="rocketpay-keypad-position-1"></span>
          </a>
        </td>
        <td class="rocketpay-keypad-td">
          <a href="#"
             class="rocketpay-keypad-key"
             data-key="y20iO6tZ9J">
            <span class="rocketpay-keypad-position-2"></span>
          </a>
        </td>
      </tr>
      <tr class="rocketpay-keypad-tr">
        <td class="rocketpay-keypad-td">
          <a href="#"
             class="rocketpay-keypad-key"
             data-key="QgN6PZcVQz">
            <span class="rocketpay-keypad-position-3"></span>
          </a>
        </td>
        <td class="rocketpay-keypad-td">
          <a href="#"
             class="rocketpay-keypad-key"
             data-key="hsWFu6Q2Av">
            <span class="rocketpay-keypad-position-4"></span>
          </a>
        </td>
        <td class="rocketpay-keypad-td">
          <a href="#"
             class="rocketpay-keypad-key"
             data-key="UEjDDUN1is">
            <span class="rocketpay-keypad-position-5"></span>
          </a>
        </td>
      </tr>
      <tr class="rocketpay-keypad-tr">
        <td class="rocketpay-keypad-td">
          <a href="#"
             class="rocketpay-keypad-key"
             data-key="Yk5JxWHpBs">
            <span class="rocketpay-keypad-position-6"></span>
          </a>
        </td>
        <td class="rocketpay-keypad-td">
          <a href="#"
             class="rocketpay-keypad-key"
             data-key="hTZz4yLFZR">
            <span class="rocketpay-keypad-position-7"></span>
          </a>
        </td>
        <td class="rocketpay-keypad-td">
          <a href="#"
             class="rocketpay-keypad-key"
             data-key="BOjtSoAnmh">
            <span class="rocketpay-keypad-position-8"></span>
          </a>
        </td>
      </tr>
      <tr class="rocketpay-keypad-tr">
        <td class="rocketpay-keypad-td"></td>
        <td class="rocketpay-keypad-td">
          <a href="#"
             class="rocketpay-keypad-key"
             data-key="4OpHwm95Zr">
            <span class="rocketpay-keypad-position-9"></span>
          </a>
        </td>
        <td class="rocketpay-keypad-td">
          <a href="#"
             class="rocketpay-keypad-edit">
            <span></span>
          </a>
        </td>
      </tr>
      </tbody>
    </table>
  </div>





    </div>

    

    </form>

    <script type="text/javascript" charset="utf-8" src="//asset2.coupangcdn.com/cdnjs/core-js/3.19.1/minified.min.js"></script>
<script type="text/javascript">
  (function (root) {
    function log6811(message, errorTraceStack) {
      try {
        var errorTrace = errorTraceStack || "";
        window.CoupangWebLog.submit({
          meta: {
            schemaId: 6811,
            schemaVersion: 2
          },
          data: {
            domain: "coupay",
            logCategory: "system",
            logType: "error",
            role: "rocketpay_web",
            profile: "production", 
            device: "WEB", 
            memberSrl: "140517242",
            time: Date.now(),
            url: document.location.href,
            agent: navigator.userAgent,
            message: message,
            stack: errorTrace
          }
        });
      } catch (error) {
        console.log("[log6811]", error);
      }
    }
    
    root.onerror = function (message, url, lineno, colno, error) {
      var msgStr = [
        "[uncaught] " + message,
        "url: " + url,
        "line: " + lineno,
        "column: " + colno,
      ].join(", ");
      log6811(msgStr, error.stack);
    };
    var rocketpayJsLog = {
      errorReport: function (title, error) {
        try {
          if(error instanceof Error){
            log6811(title + error.message, error.stack);
          }else if(typeof error === "string" || error instanceof String){
            log6811(title + error);
          }else{
            log6811(title);
          }
          console.log("errorReport", title, error);
        } catch (error) {
          console.log("errorReport 전송실패", error);
        }
      }
    };
    root["rocketpayJsLog"] = rocketpayJsLog;
  })(window);
</script>

<style type="text/css">
  html.html-alert3,
  html.html-alert3 body{}
  .alert3{display:none;}
  .alert3__backdrop{position:fixed;top:0;bottom:0;left:0;right:0;background:black;opacity:0.6;z-index:10000;}
  .alert3__scroll{overflow:auto;position:fixed;top:0;left:0;right:0;bottom:0;text-align:center;z-index:10001;-webkit-overflow-scrolling:touch;white-space:nowrap;}
  .alert3__scroll:before{content:"";width:0;height:100%;margin-right:-4px;display:inline-block;vertical-align:middle;}
  .alert3__content{display:inline-block;box-sizing:border-box;width:300px;margin:10px 0;padding:20px;vertical-align:middle;background:white;border-radius: 4px;}
  .alert3__message{padding:0 0 20px;text-align:left;font-size:16px;line-height:22px;white-space:normal;word-break:break-all;}
  .alert3__btn{user-select:none;-webkit-user-select:none;display:block;width:100%;min-height:44px;padding:0;text-decoration:none;text-align:center;font-weight:700;font-size:16px;line-height:44px;border-radius:4px;border:0;background:#346aff;color:#fff;-webkit-tap-highlight-color:rgba(0,0,0,0);}
</style>
<div class="alert3">
  <div class="alert3__backdrop"></div>
  <div class="alert3__scroll">
    <div class="alert3__content">
      <div class="alert3__message"></div>
      <a class="alert3__btn" href="#non">확인</a>
    </div>
  </div>
</div>
<script type="text/javascript">
  (function() {
    function hasClass(el,className){if(el.classList){return el.classList.contains(className);}return !!el.className.match(new RegExp('(\\s|^)'+className+'(\\s|$)'));}
    function addClass(el,className){if(el.classList){el.classList.add(className)}else if(!hasClass(el,className)){el.className+=" "+className;}}
    function removeClass(el,className){if(el.classList){el.classList.remove(className)}else if(hasClass(el,className)){var reg=new RegExp('(\\s|^)'+className+'(\\s|$)');el.className=el.className.replace(reg,' ');}}
    var htmlEle=document.querySelector("html");
    var alertEle=document.querySelector(".alert3");
    var messageEle=document.querySelector(".alert3__message");
    var btnEle=document.querySelector(".alert3__btn");
    function alert3(text){
      return new Promise(function(resolve){
        addClass(htmlEle, "html-alert3");
        alertEle.style.display="block";
        messageEle.innerText=String(text);
        btnEle.removeEventListener("click", HandleClick);
        btnEle.addEventListener("click", HandleClick);
        function HandleClick(event){event.preventDefault();alert3Close();resolve();}
      });
    }
    function alert3Close(){
      removeClass(htmlEle, "html-alert3");
      alertEle.style.display="none";
      messageEle.innerText="";
    }
    window.alert3=alert3;
  })();
</script>
<style type="text/css">
  html.html-confirm3,
  html.html-confirm3 body{}
  .confirm3{display:none;}
  .confirm3__backdrop{position:fixed;top:0;bottom:0;left:0;right:0;background:black;opacity:0.6;z-index:10000;}
  .confirm3__scroll{overflow:auto;position:fixed;top:0;left:0;right:0;bottom:0;text-align:center;z-index:10001;-webkit-overflow-scrolling:touch;white-space:nowrap;}
  .confirm3__scroll:before{content:"";width:0;height:100%;margin-right:-4px;display:inline-block;vertical-align:middle;}
  .confirm3__content{display:inline-block;width:300px;margin:10px auto;padding:20px;vertical-align:middle;background:white;border-radius: 4px;}
  .confirm3__content:after{content:"";display:block;clear:both;}
  .confirm3__message{padding:0 0 20px;text-align:left;font-size:16px;line-height:22px;white-space:normal;word-break:break-all;}
  .confirm3__btn--ok,.confirm3__btn--cancel{float:left;user-select:none;-webkit-user-select:none;display:block;width:48%;min-height:44px;padding:0;text-decoration:none;text-align:center;font-weight:700;font-size:16px;line-height:44px;border-radius:4px;border:0;background:#346aff;color:#fff;-webkit-tap-highlight-color:rgba(0,0,0,0);}
  .confirm3__btn--ok{}
  .confirm3__btn--cancel{float:right;color:#454f5b;border:1px solid #919eab;background:white;}
</style>
<div class="confirm3">
  <div class="confirm3__backdrop"></div>
  <div class="confirm3__scroll">
    <div class="confirm3__content">
      <div class="confirm3__message"></div>
      <div class="confirm3__btn">
        <a class="confirm3__btn--ok" href="#non">확인</a>
        <a class="confirm3__btn--cancel" href="#non">취소</a>
      </div>
    </div>
  </div>
</div>
<script type="text/javascript">
  (function(){
    function hasClass(el,className){if(el.classList){return el.classList.contains(className);}return !!el.className.match(new RegExp('(\\s|^)'+className+'(\\s|$)'));}
    function addClass(el,className){if(el.classList){el.classList.add(className)}else if(!hasClass(el,className)){el.className+=" "+className;}}
    function removeClass(el,className){if(el.classList){el.classList.remove(className)}else if(hasClass(el,className)){var reg=new RegExp('(\\s|^)'+className+'(\\s|$)');el.className=el.className.replace(reg,' ');}}
    var htmlEle=document.querySelector("html");
    var confirmEle=document.querySelector(".confirm3");
    var messageEle=document.querySelector(".confirm3__message");
    var okBtnEle=document.querySelector(".confirm3__btn--ok");
    var cancelBtnEle=document.querySelector(".confirm3__btn--cancel");
    function confirm3(text){
      return new Promise(function(resolve){
        addClass(htmlEle, "html-confirm3");
        confirmEle.style.display="block";
        messageEle.innerText=String(text);
        okBtnEle.removeEventListener("click",handleOkClick);
        okBtnEle.addEventListener("click",handleOkClick);
        cancelBtnEle.removeEventListener("click",handleCancelClick);
        cancelBtnEle.addEventListener("click",handleCancelClick);
        function handleOkClick(event){event.preventDefault();confirm3Close();resolve(true);}
        function handleCancelClick(event){event.preventDefault();confirm3Close();resolve(false);}
      });
    }
    function confirm3Close() {
      removeClass(htmlEle, "html-confirm3");
      confirmEle.style.display="none";
      messageEle.innerText="";
    }
    window.confirm3=confirm3;
  })();
</script>


<script type="text/javascript">
  if (!window.location.origin) { window.location.origin = window.location.protocol + "//" + window.location.hostname + (window.location.port ? ':' + window.location.port : ''); }
  if (!window.console) { console = { log: function () {} }; }
  if (!window.CoupangWebLog) { window.CoupangWebLog = {submit: function () {window.console.log('CoupangWebLog not found');}} }

  window.__rpay_profile__ = "production";
  window.__rpay_device__ = "WEB";
  window.__rpay_memberSrl__ = "140517242";
  window.__rpay_isApp__ = false;
  window.__rpay_vAssetLibUrl__ = "//asset2.coupangcdn.com/";
  window.__rpay_assetUrl__ = "/resources/20220608135347_ed2b57a0/";
  window.__rpay_token__ = "";
  window.__rpay_logData__ = {"rpayFunnelId":"1405172421655006503970","sourceType":"","rocketpayMember":true,"checkoutId":null,"orderId":null,"serviceType":null,"familyType":"COUPANG","funnelStart":false,"hasBank":true,"hasCard":true,"hasPhone":false,"realNameVerification":true};
  window.__rpay_familyType__ = "COUPANG";
  window.__cp_serviceTypeCode__ = "";
  window.__cp_fik__ = "";
  window.serviceMode = "production";
  window.vCdnHttpsImage = "https://image6.coupangcdn.com/image/";
</script>
<script type="text/javascript">
try {
  var __CPAY_ABTEST_GROUP__ = {};
} catch (error) {
  window.console.log("abTestGroupInfoFromServer is undefined");
}
</script>


<script type="text/javascript">
  
</script>


  <script type="text/javascript" charset="utf-8" src="//asset2.coupangcdn.com/cdnjs/jquery/2.2.4/jquery.min.js"></script>
  <script type="text/javascript" charset="utf-8" src="/resources/20220608135347_ed2b57a0/vendor/react/17.0.2/react.production.min.js"></script>
  <script type="text/javascript" charset="utf-8" src="/resources/20220608135347_ed2b57a0/vendor/react-dom/17.0.2/react-dom.production.min.js"></script>

<script type="text/javascript" charset="utf-8" src="/resources/20220608135347_ed2b57a0/vendor/jqueryUi/jquery-ui-position.var.min.js"></script>
<script type="text/javascript">var rpayJquery = jQuery.noConflict();</script>

<script type="text/javascript" charset="utf-8" src="/resources/20220608135347_ed2b57a0/rocketpay-dist/pc/controller/initialize.js"></script>
<script type="text/javascript" charset="utf-8" src="/resources/20220608135347_ed2b57a0/rocketpay-dist/pc/controller/mypage/verifyPasswordView.js"></script>
<script type="text/javascript">
  if (typeof controller === 'function') {
    controller();
  } else if (typeof controller === 'object' && typeof controller.default === 'function') {
    controller.default();
  }
</script>
<script type="text/javascript">
  (function(w){
    var logData = w.__rpay_logData__ || {};

    try {
      if (!logData.funnelStart) return;

      CoupangWebLog.submit({
        meta: {
          schemaId: 2121,
          schemaVersion: 2
        },
        data: {
          domain: "coupay",
          logCategory: 'impression',
          logType: 'impression',
          pageName: 'cpay_impression',
          eventName: 'funnel_start',
          rpayFunnelId: logData.rpayFunnelId,
          realNameVerification: logData.realNameVerification,
          isRocketPayMember: logData.rocketpayMember,
          familyType: logData.familyType,
          sourceType: logData.sourceType,
          hasCard: logData.hasCard,
          hasBank: logData.hasBank
        }
      });

    } catch (error) {
      w.rocketpayJsLog &&
      w.rocketpayJsLog.errorReport &&
      w.rocketpayJsLog.errorReport('[CoupangWebLog funnelStartLog]', error);
    }
  }(window || {}));
</script>

    
</body>
</html>
