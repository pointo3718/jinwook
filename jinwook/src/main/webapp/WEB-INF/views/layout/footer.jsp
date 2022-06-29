<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<script>
$(function(){
	$("#addInquiryButton").on("click", function() {
		self.location = "/board/addBoardInquiryView"
	});
});
$(function(){
	$("#announcementListButton").on("click", function() {
		self.location = "/board/getBoardAnnouncementList"
	});
});

</script>    
    
<!-- Footer Section Begin -->
    <footer class="footer spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-3 col-md-6 col-sm-6">
                    <div class="footer__about">
                        <div class="footer__about__logo">
                            <a href="./index.jsp"><img src="${path}/resources/static/img/footerlogo.png" alt="" style="height:120px;"></a>
                        </div>
                    </div>
                </div>
                <div><button type="submit" class="site-btn" id="addInquiryButton" style="margin-top:20px; margin-left:35px; float:left; display: inline-block; text-align:center;">1&nbsp;:&nbsp;1 문의 </button></div>
            <div><button type="submit" class="site-btn" id="announcementListButton" style="margin-top:20px; margin-left:35px; float:left; display: inline-block;">공지사항</button></div>
            </div>
            
            <div class="row">
                <div class="col-lg-12">
                    <div class="footer__copyright ">
                        <div class="footer__copyright__text" ><p style="margin-left:330px;"><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
  Copyright &copy;<script>document.write(new Date().getFullYear());</script> 진심을 담아 더욱더... [진욱이네] <i class="fa fa-heart" aria-hidden="true"></i>
  <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --></p></div>
                        <div class="footer__copyright__payment"><img src="${path}/resources/static/static/img/payment-item.png" alt=""></div>
                    </div>
                </div>
            </div>
        </div>
    </footer>
</div>
    <!-- Footer Section End -->

    <!-- Js Plugins -->
    <script src="${path}/resources/static/js/jquery-3.3.1.min.js"></script>
    <script src="${path}/resources/static/js/bootstrap.min.js"></script>
    <script src="${path}/resources/static/js/jquery.nice-select.min.js"></script>
    <script src="${path}/resources/static/js/jquery-ui.min.js"></script>
    <script src="${path}/resources/static/js/jquery.slicknav.js"></script>
    <script src="${path}/resources/static/js/mixitup.min.js"></script>
    <script src="${path}/resources/static/js/owl.carousel.min.js"></script>
    <script src="${path}/resources/static/js/main.js"></script>
    <script src="${path}/resources/static/js/common.js"></script>


