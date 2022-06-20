<!DOCTYPE html>
<html lang="zxx">

<head>
<!-- 

			모달 클래스이름		모달 아이디이름				화면 숨기는듯					텍스트영역과 현재요소를 연결?    		텝하면 넘어가는거
<div class="modal fade" id="exampleModalToggle" aria-hidden="true" aria-labelledby="exampleModalToggleLabel" tabindex="-1">
  			클래스이름	모달 기본모델   모달기본모델가운데
  <div class="modal-dialog modal-dialog-centered">
  			클레스이름	모달 콘텐츠
    <div class="modal-content">
    		클래스이름 모달 머리글
      <div class="modal-header">
      		클래스이름 모달 타이틀				모달아이디이름 			화면타이틀이름
        <h5 class="modal-title" id="exampleModalToggleLabel">Modal 1</h5>
					타입= 버튼		클래스이름 버튼			 	모달을 닫는 속성			아이콘과 텍스트를 결합		
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      		클래스이름 모달의 내용
      <div class="modal-body">
        Show a second modal and hide this one with the button below.
      </div>
      		클래스이름 모달 꼬리말
      <div class="modal-footer">
      				클래스이름						데이타대상? 								모달을 열음
        <button class="btn btn-primary" data-bs-target="#exampleModalToggle2" data-bs-toggle="modal">Open second modal</button>
      </div>
    </div>
  </div>
</div>		클래스이름					얘가 대상인가봄			화면숨기고					텍스트영역과 현재요소 연결?					탭		
<div class="modal fade" id="exampleModalToggle2" aria-hidden="true" aria-labelledby="exampleModalToggleLabel2" tabindex="-1">
			클래스이름
  <div class="modal-dialog modal-dialog-centered">
  			클래스이름 콘텐츠
    <div class="modal-content">
    		클래스이름 모달머리
      <div class="modal-header">
      		클래스이름 타이틀					타이틀이름				화면타이틀이름
        <h5 class="modal-title" id="exampleModalToggleLabel2">Modal 2</h5>
        		타입 버튼				클래스이름 버튼 닫기			모달을 닫음			닫기버튼에 텍스트 요소 추가
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      		클래스이름 모달내용
      <div class="modal-body">
        Hide this modal and show the first with the button below.
      </div>
      		클래스이름 모달 꼬리말
      <div class="modal-footer">
      				클래스이름 버튼의색은 파란색				타겟 대상							대상은 모달	
        <button class="btn btn-primary" data-bs-target="#exampleModalToggle" data-bs-toggle="modal">Back to first</button>
      </div>
    </div>
  </div>
</div>		버튼은 파란색				모달						링크						버튼			
<a class="btn btn-primary" data-bs-toggle="modal" href="#exampleModalToggle" role="button">Open first modal</a>

//============================================================================================================
			버튼타입				파란색버튼					모달열어				이아이디를가진 모달을				이번튼을 누르면 @mdo 가 실행됨
<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal" data-bs-whatever="@mdo">Open modal for @mdo</button>
			버튼타입				파란색버튼					모달열어				이아이디를가진 모달을				이번튼을 누르면 @fat 가 실행됨
<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal" data-bs-whatever="@fat">Open modal for @fat</button>
			버튼타입				파란색버튼					모달열어				이아이디를가진 모달을				이번튼을 누르면 @getbootstrap 가 실행됨
<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal" data-bs-whatever="@getbootstrap">Open modal for @getbootstrap</button>

<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">New message</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <form>
          <div class="mb-3">
            <label for="recipient-name" class="col-form-label">Recipient:</label>
            <input type="text" class="form-control" id="recipient-name">
          </div>
          <div class="mb-3">
            <label for="message-text" class="col-form-label">Message:</label>
            <textarea class="form-control" id="message-text"></textarea>
          </div>
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Send message</button>
      </div>
    </div>
  </div>
</div>

var exampleModal = document.getElementById('exampleModal')
exampleModal.addEventListener('show.bs.modal', function (event) {
  // 모달을 트리거 한 버튼
  var button = event.relatedTarget
  // data-bs- * 속성에서 정보 추출
  var recipient = button.getAttribute('data-bs-whatever')
  // 필요한 경우 여기에서 AJAX 요청을 시작할 수 있습니다.
  // 그런 다음 콜백에서 업데이트를 수행합니다.
  //
  // 모달의 내용을 업데이트합니다.
  var modalTitle = exampleModal.querySelector('.modal-title')
  var modalBodyInput = exampleModal.querySelector('.modal-body input')

  modalTitle.textContent = 'New message to ' + recipient
  modalBodyInput.value = recipient
}) -->