package com.jinwook.home.web.user;


import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.commons.validator.EmailValidator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.jinwook.home.service.board.BoardService;
import com.jinwook.home.service.domain.Board;
import com.jinwook.home.service.domain.Coupon;
import com.jinwook.home.service.domain.Recipe;
import com.jinwook.home.service.domain.Store;
import com.jinwook.home.service.domain.User;
import com.jinwook.home.service.store.StoreService;
import com.jinwook.home.service.user.KakaoService;
import com.jinwook.home.service.user.UserService;


//7a50e1995f458ef51a98c92f52419d00


//==> ȸ       Controller
@Controller
@RequestMapping("/user/*")
public class UserController {
   
   ///Field
   @Autowired
   @Qualifier("userServiceImpl")
   private UserService userService;
   
   @Autowired
   @Qualifier("storeServiceImpl")
   private StoreService storeService;
   
   @Autowired
   @Qualifier("boardServiceImpl")
   private BoardService boardService;
   
   @Autowired
   private KakaoService kakaoService;
   
   
   //setter Method          
      
   public UserController(){
      System.out.println(this.getClass());
   }
   
//   @Value("#{commonProperties['pageUnit']}")
//   int pageUnit;
//   @Value("#{commonProperties['pageSize']}")
//   int pageSize;
   
//   @GetMapping("index")
//   public String index1(HttpSession session) throws Exception{
//      System.out.println("==========index===========");
//      return "index";
//   }
   @GetMapping("addUser")
   public String addUserView(@RequestParam(value="role" ,required = false) String role, Model model) throws Exception{
   
      System.out.println("/user/addUserView : GET");
      User user = new User();
      user.setRole(role);
      System.out.println(user);
      System.out.println(user.getRole()+"lolololololololo");
      
      model.addAttribute("role", user.getRole());
      
      return "/user/addUserView";
   }
   
   @PostMapping("addUser" )
   public String addUser( @ModelAttribute("user") User user ) throws Exception {

      System.out.println("/user/addUser : POST");
      //Business Logic
      //사용자, 사장님, 관리자 구분 가입
      System.out.println("=====================12312312312312312312312");
      user.setGrade("일반");
      userService.addUser(user);
      
      
      return "/user/loginView";
   }
   
   @GetMapping("addUserSelec")
   public String addUserSelecView()throws Exception{
      System.out.println("zzzzzzzzzzz");
      
      return "/user/addUserSelec";
   }
   
   @PostMapping("addUserSelec")
   public String addUserSelec(@ModelAttribute("user") User user)throws Exception{
      System.out.println(user+"zzzzzzzzzzz");
      
      return "/user/addUserView";
   }

   
//   @PostMapping("addUserSelec")
//   public String addUserSelec() throws Exception{
//      
//      
//      return "/user/addUserView";      
//   }
   
   @RequestMapping( value="getUser", method=RequestMethod.GET )
   public String getUser( @RequestParam("userId") String userId , Model model ) throws Exception {
      
      System.out.println("/user/getUser : GET");
      //Business Logic
      User user = userService.getUser(userId);
      // Model    View     
      model.addAttribute("user", user);
      
      return "/user/getUser";
   }
   

   @GetMapping("updateUserView")
   public String updateUserView(@RequestParam("userId") String userId , Model model, HttpSession session ) throws Exception{

      System.out.println("/user/updateUser : GET");
      //Business Logic
      User dbUser = userService.getUser(userId);
      // Model    View     
      model.addAttribute("user", dbUser);
      
       String userid = ((User) session.getAttribute("user")).getUserId();
         
      List<Coupon> couponList = storeService.getCouponList(userid);
      model.addAttribute("couponList", couponList);
      session.setAttribute("user", dbUser);
      
      return "/user/updateUserView";
   }

   @PostMapping("updateUser")
   public String updateUser( @ModelAttribute("user") User user , Model model , HttpSession session) throws Exception{

      System.out.println("/user/updateUser : POST");
      //Business Logic
      userService.updateUser(user);
      
      System.out.println(user);
      String sessionId=((User)session.getAttribute("user")).getUserId();
      System.out.println("확인");
      if(sessionId.equals(user.getUserId())){
    	  System.out.println("확인2");
      }
      session.setAttribute("user", user);
      model.addAttribute("user", user);
      System.out.println("확인3");
      return "redirect:/user/updateUserView?userId="+sessionId;
   }
   
   @GetMapping("updateUserViewC")
   public String updateUserViewC(@RequestParam("userId") String userId , Model model, HttpSession session ) throws Exception{
	   
	   System.out.println("/user/updateUser : GET");
	   //Business Logic
	   User dbUser = userService.getUser(userId);
	   // Model    View     
	   model.addAttribute("user", dbUser);
	   
	   String userid = ((User) session.getAttribute("user")).getUserId();
	   
	   List<Coupon> couponList = storeService.getCouponList(userid);
	   model.addAttribute("couponList", couponList);
	   session.setAttribute("user", dbUser);
	   
	   return "/user/updateUserViewC";
   }
   
   @PostMapping("updateUserC")
   public String updateUserC( @ModelAttribute("user") User user , Model model , HttpSession session) throws Exception{
	   
	   System.out.println("/user/updateUser : POST");
	   //Business Logic
	   userService.updateUser(user);
	   
	   System.out.println(user);
	   String sessionId=((User)session.getAttribute("user")).getUserId();
	   System.out.println("확인");
	   if(sessionId.equals(user.getUserId())){
		   System.out.println("확인2");
	   }
	   session.setAttribute("user", user);
	   model.addAttribute("user", user);
	   System.out.println("확인3");
	   return "redirect:/user/updateUserViewC?userId="+sessionId;
   }
   
   
   @GetMapping("login")
   public String loginView(HttpSession session) throws Exception{
      
      System.out.println("/user/logon : GET");
      User user = (User)session.getAttribute("user");
      if(user != null) {
         return "redirect:/user/index";
      }

      return "/user/loginView";
   }
   
   @PostMapping("login" )
   public String login(@ModelAttribute("user") User user , HttpSession session, Model model ) throws Exception{
      
      System.out.println("/user/login : POST");
      System.out.println(user.getUserId()+"112312312321321312321312");
     
      //Business Logic
      try {
    	  userService.getUser(user.getUserId());
    	  
      }catch (Exception e) {
    	  return null;
      }
      
      User dbUser=userService.getUser(user.getUserId());
      

      if(dbUser == null) {
         model.addAttribute("msg", "아이디와 비밀번호를 확인해주세요.");
         return "/user/loginView";
      }
      
      System.out.println(dbUser.isUserByeStatus());

      if(dbUser.isUserByeStatus()==true) {
         model.addAttribute("msg", "탈퇴한 계정입니다.");
         return "/user/loginView";
      }
      
      if( !(user.getPassword().equals(dbUser.getPassword()))){
         model.addAttribute("msg", "비밀번호가 맞지 않습니다.");
         return "/user/loginView";
      }
      System.out.println(dbUser+"123123123123123123123123213123");
      user = dbUser;
      model.addAttribute("msg", "환영합니다.");
      session.setAttribute("user", user);
      System.out.println(user+"--------------------------------------------------------");
//      model.addAttribute("msg", "로그인 성공");
//      model.addAttribute("url", "login");
      
      return "index";
   }
      
   
   @GetMapping("logout")
   public String logout(HttpSession session ) throws Exception{
      
      System.out.println("/user/logout : POST");
      
      session.invalidate();
      
      return "index";
   }
   
   
   @PostMapping("deleteUser")
   public String deleteUser(@ModelAttribute("user") User user, HttpSession session) throws Exception {
      System.out.println("=============DELETE USER=============");
      
      System.out.println(user.getUserId());
//      System.out.println(user.getStore().getStoreStatus());
      
//      if(user.getStore().getStoreStatus() != "2") {
    	  
    	  user.setUserByeStatus(true);
    	  userService.updateUser(user);
//      }
      session.invalidate();
      System.out.println(user.getUserId());
      
      return "index";
   }
   
   
   @GetMapping("confirmPasswordView")
   public String comfirmPasswordView(@ModelAttribute("user") User user, HttpSession session, Model model) throws Exception {
      
      System.out.println(user);
      user = userService.getUser(user.getUserId());
      System.out.println(user);
      System.out.println("===========CONFIRM PASSWORD PAGE===========");
      
       String userId = ((User) session.getAttribute("user")).getUserId();
      
      List<Coupon> couponList = storeService.getCouponList(userId);
      model.addAttribute("couponList", couponList);
      
      return "/user/confirmPasswordView";
   }
   
   @GetMapping("confirmPasswordViewC")
   public String comfirmPasswordViewC(@ModelAttribute("user") User user, HttpSession session, Model model) throws Exception {
	   
	   System.out.println(user);
	   user = userService.getUser(user.getUserId());
	   System.out.println(user);
	   System.out.println("===========CONFIRM PASSWORD PAGE===========");
	   String userId = ((User) session.getAttribute("user")).getUserId();
	   
	   List<Coupon> couponList = storeService.getCouponList(userId);
	   model.addAttribute("couponList", couponList);
	   session.setAttribute("user", user);
	   model.addAttribute("user", user);
	   List<Store> storeInfo = storeService.getStoreInfo(userId);
	   model.addAttribute("storeInfo", storeInfo);
	   
	   return "/user/confirmPasswordViewC";
   }
   
   @PostMapping("confirmPassword")
   public String comfirmPassword(@ModelAttribute("user") User user ,  HttpSession session, Model model ) throws Exception {
      System.out.println("===========CONFIRM PASSWORD=========");
      System.out.println(user);
//      user.setUserId( ((User)session.getAttribute("user")).getUserId());
      int result = userService.confirmPassword(user);
      if(result==0) {
         return "/user/confirmPasswordView";
      }
      User dbUser = userService.getUser("userId");
      model.addAttribute("user", dbUser);
      
      String userId = ((User) session.getAttribute("user")).getUserId();
         
      List<Coupon> couponList = storeService.getCouponList(userId);
      model.addAttribute("couponList", couponList);
      
      System.out.println(user.getUserId());
      return "/user/updateUserView";
   }
   
   @PostMapping("confirmPasswordC")
   public String comfirmPasswordC(@ModelAttribute("user") User user ,  HttpSession session, Model model ) throws Exception {
	   System.out.println("===========CONFIRM PASSWORD=========");
	   System.out.println(user);
//      user.setUserId( ((User)session.getAttribute("user")).getUserId());
	   int result = userService.confirmPassword(user);
	   if(result==0) {
		   return "/user/confirmPasswordViewC";
	   }
	   User dbUser = userService.getUser("userId");
	   model.addAttribute("user", dbUser);
	   
	   String userId = ((User) session.getAttribute("user")).getUserId();
	   
	   List<Store> storeInfo = storeService.getStoreInfo(userId);
	   model.addAttribute("storeInfo", storeInfo);
	   
	   System.out.println(user.getUserId());
	   return "/user/updateUserViewC";
   }
   
   @GetMapping("findId")
   public String findId(@ModelAttribute("user") User user) {
      
      System.out.println(user);
      System.out.println("============FIND ID PAGE============");
      return "/user/findId";
   }
   
   //---------------------------------------
   // 5분동안 유저확인 세션생성 (인증완료 X)
//   @PostMapping("auth")
//   public ResponseEntity<Object> authenticateUser(String username, HttpSession session) {
//       Map<String, Object> authStatus = new HashMap<>();
//       authStatus.put("username", username);
//       authStatus.put("status", false);
//       
//       session.setMaxInactiveInterval(300);
//       session.setAttribute("authStatus", authStatus);
//       return new ResponseEntity<Object>(username, HttpStatus.OK);
//   }

    
   //---------------------------------------
      // 비밀번호 재설정 페이지로 이동
      @GetMapping("updatePasswordView")
      public String updatePasswordView( User user, HttpSession session, Model model) throws Exception{
//          Map<String, Object> authStatus = (Map<String, Object>) session.getAttribute("authStatus");
          
//          if(authStatus == null || !username.equals(authStatus.get("userId"))) {
//              return "/user/findPassword";
//          }
         session.setAttribute("user", user);
         System.out.println(session.getAttribute("user"));
         user = userService.getUser(user.getUserId());
//         // Model 과 View 연결
//         model.addAttribute("user", user);
         System.out.println(user);
         System.out.println(user);
         model.addAttribute("userId", user.getUserId());
         
         
         System.out.println("ksdjahflskdhfjksadhfkjlhsadkjfhkjdahfkjshdlkfhsdakjfhk");
          return "/user/updatePassword";
      }
      
      @PostMapping("updatePassword")
      public String updatePassword(@ModelAttribute("user") User user) throws Exception {
         System.out.println(user+"mmmmmmmmmmmmmm");
         
         
         int result = userService.updatePassword(user);
         
         if(result == 1) {
            System.out.println("패스워드 변경");
         }
         
         return "/user/loginView";
      }
      
      //비밀번호 찾기 페이지로 이동
      @GetMapping("findPassword")
      public String findPasswordPhone() {
//         user.setUserId("user");
         System.out.println("=============findPassword Page===========");
         
         return "/user/findPassword";
      }
      
      // kakao login
      @GetMapping("kakaoLogin")
      public String kakaoLogin(@RequestParam(value = "code", required = false) String code, HttpSession session) throws Exception {
         System.out.println("#########" + code);
         String randomNumber1 = String.valueOf((int)((Math.random()* (9999 - 1000 + 1)) + 1000));
         String randomNumber2 = String.valueOf((int)((Math.random()* (9999 - 1000 + 1)) + 1000));
         
         String phone ="010"+randomNumber1+randomNumber2; 
         // code를 보내 access_Token 얻기
         String access_Token = kakaoService.getAccessToken(code);
         System.out.println("123123123123123");
         HashMap<String, Object> userInfo = kakaoService.getUserInfo(access_Token);
         Date date = new Date();
         User user = new User();
         String idString = (String)userInfo.get("email");
         int idx = idString.indexOf("@");
         String email = idString.substring(0, idx);
         System.out.println("asdasdasdadasd"+email+"1111111111111111111111");
         if(userService.checkId("kakao_"+email)==1 || userService.checkEmail((String)userInfo.get("email"))==1
        		 				|| userService.checkPhone(phone)==1 || userService.checkNickName("kakao_"+(String)userInfo.get("nickname"))==1) {
        	 user =  userService.getUser("kakao_"+email);
        	 session.setAttribute("user", user);
        	 session.setAttribute("access_Token", access_Token);
         }else {
         user.setUserId("kakao_"+email);
         user.setPassword("1111");
         user.setUserName((String)userInfo.get("nickname"));
         user.setNickName("kakao_"+(String)userInfo.get("nickname"));
         user.setEmail((String)userInfo.get("email"));
         user.setBirth("20000000");
         user.setRole("사용자");
         user.setPhone(phone);
         user.setRegDate(date);
         user.setGender("없음");
         user.setGrade("일반");
         userService.addUser(user);
//         while(userService.checkPhone(phone)==0) {
//         }
//         if(userService.checkPhone(phone)==0) {
//        	 
//        	 user.setPhone(phone);
//         }
         
         System.out.println(userInfo);
         System.out.println("45645456456456456");
         System.out.println("###access_Token#### : " + access_Token);
         System.out.println("###nickname#### : " + userInfo.get("nickname"));
         System.out.println("###email#### : " + userInfo.get("email"));
         System.out.println("###email#### : " + userInfo.get("birthday"));
         System.out.println("###email#### : " + userInfo.get("gender"));
         System.out.println(user);
         
         session.setAttribute("user", user);
         
         session.setAttribute("access_Token", access_Token);
         }
         return "index";
       }
      //카카오 로그아웃
       @GetMapping("kakaoLogout")
       public String logout(ModelMap modelMap, HttpSession session)throws IOException {
           if(session.getAttribute("access_Token") != null) {
               kakaoService.getLogout((String)session.getAttribute("kakaoToken"));
           }
           session.setAttribute("user", null);
           session.invalidate();
           HashMap<String, String> message = new HashMap<>();
           message.put("title", "로그아웃");
           message.put("script", "location.href='/'");
           message.put("msg", "로그아웃 되었습니다");
           message.put("type","alert");
           modelMap.addAttribute("message",message);
           return "index";
       }
   
    //내가 작성한 글 목록 보기
    @GetMapping("myArticle")
   	public String listMyArticle(@RequestParam("userId") String userId, @ModelAttribute("recipe") Recipe recipe, @ModelAttribute("board") Board board, HttpSession session, Model model) throws Exception {
//   		userId = ((User) session.getAttribute("user")).getUserId();
   		System.out.println(recipe+"5555555555555555555555555555555555");
   		System.out.println(board+"66666666666666666666666666");
   		System.out.println(userId+"dkdkdkdkdldldlzlzlzlfdkdjsdkjfjslkfhkjsdhfkljjasdkfh;ksdjhfklad;jf");
   		List<Recipe> myRecipe = userService.getMyRecipe(recipe);
   		System.out.println(myRecipe+"dmldmldmldmldmldmaldasdasdmlamdqowdj");
   		List<Board> myInquiry = userService.getMyInquiry(board);
   	     session.setAttribute("userId", userId);
   	    model.addAttribute("myRecipe", myRecipe);
   		model.addAttribute("myInquiry", myInquiry);

   		return "/user/myArticle";
   	} 
       
}