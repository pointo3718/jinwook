package com.jinwook.home.web.store;

import java.sql.Date;
import java.sql.Time;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.dao.DataAccessException;
import org.springframework.util.CollectionUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.jinwook.home.service.domain.Attach;
import com.jinwook.home.service.domain.Product;
import com.jinwook.home.service.domain.Recipe;
import com.jinwook.home.service.domain.Store;
import com.jinwook.home.service.domain.User;
import com.jinwook.home.service.orders.OrdersService;
import com.jinwook.home.service.store.StoreService;

@RestController
@RequestMapping("/store/*")
public class StoreRestController {

   @Autowired
   @Qualifier("storeServiceImpl")
   private StoreService storeService;

   @Autowired
   @Qualifier("ordersServiceImpl")
   private OrdersService ordersService;

   public StoreRestController() {
      System.out.println(this.getClass());
   }

   
   @PostMapping(value = "addStoreProduct/{prodNo}/{storeNo}/{prodName}/{price}/{prodInfo}/{prodImg}/{prodOrign}/{soldout}")
   public JsonObject addStoreProduct(@PathVariable(value = "storeNo", required = false) int storeNo,
                              @PathVariable(value = "prodName", required = false) String prodName,
                              @PathVariable(value = "price", required = false) int price,
                              @PathVariable(value = "prodInfo", required = false) String prodInfo,
                              @PathVariable(value = "prodImg", required = false) String prodImg,
                              @PathVariable(value = "prodOrign", required = false) String prodOrign) {

       System.out.println("/store/addStoreProduct : Post ");

      JsonObject jsonObj = new JsonObject();
      
      Product product= new Product();
      product.setProdName(prodName);
      product.setPrice(price);
      product.setProdInfo(prodInfo);
      product.setProdImg(prodImg);
      product.setProdOrign(prodOrign);

      try {
         if (product != null) {
            System.out.println("product 객체에 값 넣어줌");
            product.setStoreNo(storeNo);

         }
         
         System.out.println("컨트롤러에서의 Product :: "+product);

          storeService.addStoreProduct(product);

      } catch (DataAccessException e) {
         jsonObj.addProperty("message", "데이터베이스 처리 과정에 문제가 발생하였습니다.");

      } catch (Exception e) {
         jsonObj.addProperty("message", "시스템에 문제가 발생하였습니다.");
      }
      
        System.out.println("상품 등록 컨트롤러 통과");
        
      return jsonObj;
      
  }
   

     
      @PostMapping(value = "updateStore/{storeNo}/{storeIntro}/{storePhone}/{storeImage}/{startTime}/{endTime}/{holiday}/{bank}/{accNo}")
      public JsonObject updateStore(@PathVariable(value = "storeNo", required = false) int storeNo,
                           @PathVariable(value = "storeIntro", required = false) String storeIntro,
                           @PathVariable(value = "storePhone", required = false) String storePhone,
                           @PathVariable(value = "storeImage", required = false) String storeImage,
                           @PathVariable(value = "startTime", required = false) Time startTime,
                           @PathVariable(value = "endTime", required = false) Time endTime,
                           @PathVariable(value = "holiday", required = false) String holiday,
                           @PathVariable(value = "bank", required = false) String bank,
                           @PathVariable(value = "accNo", required = false) String accNo) {
         
         JsonObject jsonObj = new JsonObject();
         
         Store store = new Store();

         try {
            if (store != null) {
               System.out.println("product 객체에 값 넣어줌");
               store.setStoreNo(storeNo);
               store.setStoreIntro(storeIntro);
               store.setStorePhone(storePhone);
               store.setStoreImage(storeImage);
               store.setStartTime(startTime);
               store.setEndTime(endTime);
               store.setHoliday(holiday);
               store.setBank(bank);
               store.setAccNo(accNo);
               
            }
            
            System.out.println("컨트롤러에서의 store :: "+store);

            boolean result = storeService.updateStore(store);
            jsonObj.addProperty("result", result);

         } catch (DataAccessException e) {
            jsonObj.addProperty("message", "데이터베이스 처리 과정에 문제가 발생하였습니다.");

         } catch (Exception e) {
            jsonObj.addProperty("message", "시스템에 문제가 발생하였습니다.");
         }
         
           System.out.println("상점 수정 컨트롤러 통과");
           
         return jsonObj;
         
      }

     @PostMapping(value = "updateStoreProduct/{prodNo}/{price}/{prodOrign}/{prodInfo}/{prodImg}")
      public JsonObject updateStoreProduct(@PathVariable(value = "prodNo", required = false) int prodNo, 
                                    @PathVariable(value = "price", required = false) int price,
                                    @PathVariable(value = "prodOrign", required = false) String prodOrign,
                                    @PathVariable(value = "prodInfo", required = false) String prodInfo,
                                    @PathVariable(value = "prodImg", required = false) String prodImg) {

          System.out.println("/store/updateStoreProduct : PATCH ");

         JsonObject jsonObj = new JsonObject();
         Product product= new Product();

         try {
            if (product != null) {
               System.out.println("product 객체에 값 넣어줌");
               product.setProdNo(prodNo);
               product.setPrice(price);
               product.setProdOrign(prodOrign);
               product.setProdInfo(prodInfo);
               product.setProdImg(prodImg);
            }
            
            System.out.println("컨트롤러에서의 Product :: "+product);

            boolean result = storeService.updateStoreProduct(product);
            jsonObj.addProperty("result", result);

         } catch (DataAccessException e) {
            jsonObj.addProperty("message", "데이터베이스 처리 과정에 문제가 발생하였습니다.");

         } catch (Exception e) {
            jsonObj.addProperty("message", "시스템에 문제가 발생하였습니다.");
         }
         
           System.out.println("상품 수정 컨트롤러 통과");
           
         return jsonObj;
         
     }

   @GetMapping(value = "deleteStoreProduct/{prodNo}")
   public JsonObject deleteStoreProduct(@PathVariable(value="prodNo",required = false) int prodNo){
      
      System.out.println("/orders/deleteStoreProduct : POST");
      
      JsonObject jsonObj = new JsonObject();
      
      try {
         boolean result = storeService.deleteStoreProduct(prodNo);
         jsonObj.addProperty("result", result);

      } catch (DataAccessException e) {
         jsonObj.addProperty("message", "데이터베이스 처리 과정에 문제가 발생하였습니다.");

      } catch (Exception e) {
         jsonObj.addProperty("message", "시스템에 문제가 발생하였습니다.");
      }

      return jsonObj;
   }
   
   

   @PostMapping(value = "isSoldout/{prodNo}")
   @ResponseBody
   public JsonObject isSoldout(@PathVariable(value="prodNo",required = false) int prodNo) {

       System.out.println("/store/isSoldout : Post ");

      JsonObject jsonObj = new JsonObject();
      
      Product product = new Product();

      try {
         if (product != null) {
            System.out.println("product 객체에 값 넣어줌");
            product.setProdNo(prodNo);
         }
         
         System.out.println("컨트롤러에서의 Store :: "+product);

         boolean result=storeService.isSoldout(product);
         jsonObj.addProperty("result", result);


      } catch (DataAccessException e) {
         jsonObj.addProperty("message", "데이터베이스 처리 과정에 문제가 발생하였습니다.");

      } catch (Exception e) {
         jsonObj.addProperty("message", "시스템에 문제가 발생하였습니다.");
      }
      
        System.out.println("상품 매진 컨트롤러 통과");
        
      return jsonObj;
      
  }
   
   @PostMapping(value = "isSell/{prodNo}")
   @ResponseBody
   public JsonObject isSell(@PathVariable(value="prodNo",required = false) int prodNo) {

       System.out.println("/store/isSoldout : Post ");

      JsonObject jsonObj = new JsonObject();
      
      Product product = new Product();

      try {
         if (product != null) {
            System.out.println("product 객체에 값 넣어줌");
            product.setProdNo(prodNo);
         }
         
         System.out.println("컨트롤러에서의 Store :: "+product);

         boolean result=storeService.isSell(product);
         jsonObj.addProperty("result", result);


      } catch (DataAccessException e) {
         jsonObj.addProperty("message", "데이터베이스 처리 과정에 문제가 발생하였습니다.");

      } catch (Exception e) {
         jsonObj.addProperty("message", "시스템에 문제가 발생하였습니다.");
      }
      
        System.out.println("상품 매진 컨트롤러 통과");
        
      return jsonObj;
      
  }

   @PostMapping(value = "isOpen/{storeNo}/{open}")
   @ResponseBody
   public JsonObject isOpen(@PathVariable(value="storeNo",required = false) int storeNo,
		   					@PathVariable(value="open",required = false) boolean open) {

       System.out.println("/store/isOpen : Post ");

      JsonObject jsonObj = new JsonObject();
      
      Store store = new Store();

      try {
         if (store != null) {
            System.out.println("product 객체에 값 넣어줌");
            store.setStoreNo(storeNo);
            store.setOpen(open);
         }
         
         System.out.println("컨트롤러에서의 Store :: "+store);

         boolean result=storeService.isOpen(store);
         jsonObj.addProperty("result", result);


      } catch (DataAccessException e) {
         jsonObj.addProperty("message", "데이터베이스 처리 과정에 문제가 발생하였습니다.");

      } catch (Exception e) {
         jsonObj.addProperty("message", "시스템에 문제가 발생하였습니다.");
      }
      
        System.out.println("상점 오픈/마감 컨트롤러 통과");
        
      return jsonObj;
      
  }

   @PostMapping(value = "addOrdersCoupon/{couponNo}")
   public JsonObject addOrdersCoupon(@PathVariable(value="couponNo",required = false) int couponNo){
      
      System.out.println("/orders/addOrdersCoupon : POST");
      
      JsonObject jsonObj = new JsonObject();
      
      try {
         boolean result = storeService.addOrdersCoupon(couponNo);
         jsonObj.addProperty("result", result);

      } catch (DataAccessException e) {
         jsonObj.addProperty("message", "데이터베이스 처리 과정에 문제가 발생하였습니다.");

      } catch (Exception e) {
         jsonObj.addProperty("message", "시스템에 문제가 발생하였습니다.");
      }

      return jsonObj;
   }
   
   
   ////////////////// 갖고 있는 쿠폰 개수 ///////////////////
	@GetMapping( value={"/getCouponCount"} )
	public JsonObject getCouponCount(HttpSession session)throws Exception{
  
	   System.out.println("/admin/getCouponCount : GET ");
	
	   JsonObject jsonObj = new JsonObject();
       User user = (User) session.getAttribute("user");
       String userId = user.getUserId();
	   
	   try { 	
			int getCouponCount = storeService.getCouponCount(userId);
			System.out.println("   ::  "+getCouponCount);
			jsonObj.addProperty("getCouponCount", getCouponCount);
	
		} catch (DataAccessException e) {
				jsonObj.addProperty("message", "데이터베이스 처리 과정에 문제가 발생하였습니다.");
	
		} catch (Exception e) {
				jsonObj.addProperty("message", "시스템에 문제가 발생하였습니다.");
		}
		
	   System.out.println("갖고있는 쿠폰 개수 컨트롤러 통과");
		return jsonObj;
	}
   
   
   
   
   
   
      @GetMapping( value="/getStoreWallet/{storeNo}/{orderDateStart}/{orderDateEnd}")
      public JsonObject getStoreWallet(@PathVariable(value="storeNo",required = false) int storeNo,
                                 @PathVariable(value="orderDateStart",required = false) String orderDateStart,
                                 @PathVariable(value="orderDateEnd",required = false) String orderDateEnd, HttpSession session) throws Exception{
         
           User user = (User) session.getAttribute("user");
           
           Store store= new Store();

              store.setStoreNo(storeNo);
              store.setOrderDateStart(orderDateStart);
              store.setOrderDateEnd(orderDateEnd);
              
         
            System.out.println("/store/getStoreWallet : GET ");
            
            JsonObject jsonObj = new JsonObject();
            
            List<Store> storeWallet = storeService.getStoreWallet(store);
            
            if (CollectionUtils.isEmpty(storeWallet) == false) {
               com.google.gson.JsonArray jsonArr = new Gson().toJsonTree(storeWallet).getAsJsonArray();
               jsonObj.add("storeWallet", jsonArr);
            
               System.out.println("지갑 조회 컨트롤러 통과");
            }

            return jsonObj;
         }
   
//   @RequestMapping( value="json/getStoreWallet/{storeNo}/{orderDateStart}/{orderDateEnd}/", method=RequestMethod.GET )
//   public Store getStoreWallet( @PathVariable int storeNo,  @PathVariable String ororderDateStart,  @PathVariable String orderDateEnd ) throws Exception{
//      
//      System.out.println("/store/json/getStoreWallet : GET");
//      
//      Store store= new Store();
//           store.setStoreNo(storeNo);
//           store.setOrderDateStart(Date.valueOf(orderDateStart));
//           store.setOrderDateEnd(Date.valueOf(orderDateEnd));
//      
//      //Business Logic
//      return storeService.getStoreWallet(storeNo);
//   }
      
      
//      @PostMapping(value = "addOrdersCart/{prodNo}")
//      public JsonObject getStore(@PathVariable(value = "prodNo", required = false) int prodNo, @RequestBody Cart cart) {
//
//         System.out.println("/store/addOrdersCart : Post ");
//
//         JsonObject jsonObj = new JsonObject();
//
//         try {
//            if (cart != null) {
//               System.out.println("product 객체에 값 넣어줌");
//            }
//            
//            System.out.println("컨트롤러에서의 Product :: "+cart);
//
//            ordersService.addOrdersCart(cart);
//
//
//         } catch (DataAccessException e) {
//            jsonObj.addProperty("message", "데이터베이스 처리 과정에 문제가 발생하였습니다.");
//
//         } catch (Exception e) {
//            jsonObj.addProperty("message", "시스템에 문제가 발생하였습니다.");
//         }
//         
//           System.out.println("상품 등록 컨트롤러 통과");
//           
//         return jsonObj;
//         
//     }
//
//             
//      @GetMapping(value = "json/getStoreWallet")
//      public List<Store> getStoreWallet(@PathVariable int storeNo) {
//
//         List<Store> storeList = storeService.getStoreWallet(storeNo);
//
//         return storeList;
//      }
      
      @GetMapping( value="getStoreListByOrderCount")
      public JsonObject getStoreListByOrderCount() throws Exception{
         
           
           Store store= new Store();

                     
            System.out.println("/store/getStoreListByOrderCount : GET ");
            
            JsonObject jsonObj = new JsonObject();
            
            List<Store> storeList = storeService.getStoreListByOrderCount();
            
            if (CollectionUtils.isEmpty(storeList) == false) {
               com.google.gson.JsonArray jsonArr = new Gson().toJsonTree(storeList).getAsJsonArray();
               jsonObj.add("storeList", jsonArr);
            
               System.out.println("상점조회 컨트롤러 통과");
            }

            return jsonObj;
         }
      
      @GetMapping( value="getStoreMap")
      public JsonObject getStoreMap() throws Exception{
    	  
    	  
    	  Store store= new Store();
    	  
    	  
    	  System.out.println("/store/getStoreMap : GET ");
    	  
    	  JsonObject jsonObj = new JsonObject();
    	  
    	  List<Store> storeMap = storeService.getStoreMap();
    	  
    	  if (CollectionUtils.isEmpty(storeMap) == false) {
    		  com.google.gson.JsonArray jsonArr = new Gson().toJsonTree(storeMap).getAsJsonArray();
    		  jsonObj.add("storeMap", jsonArr);
    		  
    		  System.out.println("상점지도조회 컨트롤러 통과");
    	  }
    	  
    	  return jsonObj;
      }
      
      
      @GetMapping( value="getStore/{storeNo}")
      public JsonObject getStoreWallet(@PathVariable(value="storeNo",required = false) int storeNo) throws Exception{
         
           
           Store store= new Store();

              store.setStoreNo(storeNo);

              
         
            System.out.println("/store/getStoreWallet : GET ");
            
            JsonObject jsonObj = new JsonObject();
            
            List<Store> getStore = storeService.getStore(storeNo);
            
            if (CollectionUtils.isEmpty(getStore) == false) {
               com.google.gson.JsonArray jsonArr = new Gson().toJsonTree(getStore).getAsJsonArray();
               jsonObj.add("getStore", jsonArr);
            
               System.out.println("상점 조회 컨트롤러 통과");
            }

            return jsonObj;
         }
      @GetMapping( value="getStoreOnly/{storeNo}")
      public JsonObject getStoreOnly(@PathVariable(value="storeNo",required = false) int storeNo) throws Exception{
    	  
          Store store= new Store();
          
          store.setStoreNo(storeNo);


    	  System.out.println("/store/getStoreOnly : GET ");
    	  
    	  JsonObject jsonObj = new JsonObject();
    	  
    	  List<Store> getStoreOnly = storeService.getStoreOnly(storeNo);
    	  
    	  Attach attach=new Attach();
		  attach = storeService.selectStoreAttachList(storeNo);
		  
    	  getStoreOnly.get(0).setAttach(attach);	// 리스트에 store객체 하나 들어있어서 괜찮음
    	  
    	  if (CollectionUtils.isEmpty(getStoreOnly) == false) {
    		  com.google.gson.JsonArray jsonArr = new Gson().toJsonTree(getStoreOnly).getAsJsonArray();
    		  jsonObj.add("getStoreOnly", jsonArr);
    		  
    		  System.out.println("상점 조회 컨트롤러 통과");
    	  }
    	  
    	  return jsonObj;
      }
      

      


}