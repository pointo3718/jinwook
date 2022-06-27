package com.jinwook.home.common;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.jinwook.home.service.domain.Board;
import com.jinwook.home.service.domain.Orders;
import com.jinwook.home.service.domain.Product;
import com.jinwook.home.service.domain.Recipe;
import com.jinwook.home.service.domain.Request;
import com.jinwook.home.service.domain.Store;

@Component("fileUtils")
public class FileUtils {
   private static final String filePath = "C:\\Users\\ghdtj\\git\\jinwook\\jinwook\\src\\main\\webapp\\resources\\static\\"; // 파일이 저장될 위치
   
   //1:1문의, 공지사항 사진첨부정보
   public List<Map<String, Object>> parseInsertBoardFileInfo(Board board, 
         MultipartHttpServletRequest mpRequest) throws Exception{
      
      Iterator<String> iterator = mpRequest.getFileNames();
      
      MultipartFile multipartFile = null;
      String originalFileName = null;
      String originalFileExtension = null;
      String storedFileName = null;
      
      List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
      Map<String, Object> listMap = null;
      
      int boardNo = board.getBoardNo();
      
      File file = new File(filePath);
      if(file.exists() == false) {
         file.mkdirs();
      }
      
      while(iterator.hasNext()) {
         multipartFile = mpRequest.getFile(iterator.next());
         if(multipartFile.isEmpty() == false) {
            originalFileName = multipartFile.getOriginalFilename();
            originalFileExtension = originalFileName.substring(originalFileName.lastIndexOf("."));
            storedFileName = getRandomString() + originalFileExtension;
            
            file = new File(filePath + storedFileName);
            multipartFile.transferTo(file);
            listMap = new HashMap<String, Object>();
            listMap.put("boardNo", boardNo);
            listMap.put("orgFileName", originalFileName);
            listMap.put("storedFileName", storedFileName);
            listMap.put("fileSize", multipartFile.getSize());
            list.add(listMap);
         }
      }
      return list;
   }
   
   public List<Map<String, Object>> parseUpdateFileInfo(Board board, String[] files, String[] fileNames, MultipartHttpServletRequest mpRequest) throws Exception{ 
      Iterator<String> iterator = mpRequest.getFileNames();
      MultipartFile multipartFile = null; 
      String originalFileName = null; 
      String originalFileExtension = null; 
      String storedFileName = null; 
      List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
      Map<String, Object> listMap = null; 
      int boardNo = board.getBoardNo();
      while(iterator.hasNext()){ 
         multipartFile = mpRequest.getFile(iterator.next()); 
         if(multipartFile.isEmpty() == false){ 
            originalFileName = multipartFile.getOriginalFilename(); 
            originalFileExtension = originalFileName.substring(originalFileName.lastIndexOf(".")); 
            storedFileName = getRandomString() + originalFileExtension; 
            multipartFile.transferTo(new File(filePath + storedFileName)); 
            listMap = new HashMap<String,Object>();
            listMap.put("IS_NEW", "Y");
            listMap.put("boardNo", boardNo);
            listMap.put("orgFileName", originalFileName);
            listMap.put("storedFileName", storedFileName);
            listMap.put("fileSize", multipartFile.getSize());
            list.add(listMap); 
         } 
      }
      if(files != null && fileNames != null){ 
         for(int i = 0; i<fileNames.length; i++) {
               listMap = new HashMap<String,Object>();
                    listMap.put("IS_NEW", "N");
               listMap.put("attachNo", files[i]);//v 
               list.add(listMap); 
         }
      }
      return list; 
   }
   
   //레시피 사진첨부정보
   public List<Map<String, Object>> parseInsertRecipeFileInfo(Recipe recipe, 
         MultipartHttpServletRequest mpRequest) throws Exception{
      
      Iterator<String> iterator = mpRequest.getFileNames();
      
      MultipartFile multipartFile = null;
      String originalFileName = null;
      String originalFileExtension = null;
      String storedFileName = null;
      
      List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
      Map<String, Object> listMap = null;
      
      int rcpNo = recipe.getRcpNo();
      
      File file = new File(filePath);
      if(file.exists() == false) {
         file.mkdirs();
      }
      
      while(iterator.hasNext()) {
         multipartFile = mpRequest.getFile(iterator.next());
         if(multipartFile.isEmpty() == false) {
            originalFileName = multipartFile.getOriginalFilename();
            originalFileExtension = originalFileName.substring(originalFileName.lastIndexOf("."));
            storedFileName = getRandomString() + originalFileExtension;
            
            file = new File(filePath + storedFileName);
            multipartFile.transferTo(file);
            listMap = new HashMap<String, Object>();
            listMap.put("rcpNo", rcpNo);
            listMap.put("orgFileName", originalFileName);
            listMap.put("storedFileName", storedFileName);
            listMap.put("fileSize", multipartFile.getSize());
            list.add(listMap);
         }
      }
      return list;
   }
   
   //상점후기 사진첨부정보
   public List<Map<String, Object>> parseInsertReviewFileInfo(Orders orders, 
         MultipartHttpServletRequest mpRequest) throws Exception{
      
      Iterator<String> iterator = mpRequest.getFileNames();
      
      MultipartFile multipartFile = null;
      String originalFileName = null;
      String originalFileExtension = null;
      String storedFileName = null;
      
      List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
      Map<String, Object> listMap = null;
      
      int orderNo = orders.getOrderNo();
      
      File file = new File(filePath);
      if(file.exists() == false) {
         file.mkdirs();
      }
      
         while(iterator.hasNext()) {
         multipartFile = mpRequest.getFile(iterator.next());
         if(multipartFile.isEmpty() == false) {
            originalFileName = multipartFile.getOriginalFilename();
            originalFileExtension = originalFileName.substring(originalFileName.lastIndexOf("."));
            storedFileName = getRandomString() + originalFileExtension;
            
            file = new File(filePath + storedFileName);
            multipartFile.transferTo(file);
            listMap = new HashMap<String, Object>();
            listMap.put("orderNo", orderNo);
            listMap.put("orgFileName", originalFileName);
            listMap.put("storedFileName", storedFileName);
            listMap.put("fileSize", multipartFile.getSize());
            list.add(listMap);
         }
      }
      return list;
   }
   
   
   // 상점 등록시 사진첨부 정보
   public List<Map<String, Object>> parseInsertStoreFileInfo(Store store, 
         MultipartHttpServletRequest mpRequest) throws Exception{
      
      Iterator<String> iterator = mpRequest.getFileNames();
      
      MultipartFile multipartFile = null;
      String originalFileName = null;
      String originalFileExtension = null;
      String storedFileName = null;
      
      List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
      Map<String, Object> listMap = null;
      
      int storeNo = store.getStoreNo();
      
      File file = new File(filePath);
      if(file.exists() == false) {
         file.mkdirs();
      }
      
      while(iterator.hasNext()) {
         multipartFile = mpRequest.getFile(iterator.next());
         if(multipartFile.isEmpty() == false) {
            originalFileName = multipartFile.getOriginalFilename();
            originalFileExtension = originalFileName.substring(originalFileName.lastIndexOf("."));
            storedFileName = getRandomString() + originalFileExtension;
            
            file = new File(filePath + storedFileName);
            listMap = new HashMap<String, Object>();
            listMap.put("storeNo", storeNo);
            listMap.put("orgFileName", originalFileName);
            listMap.put("storedFileName", storedFileName);
            listMap.put("fileSize", multipartFile.getSize());
            list.add(listMap);
         }
      }
      return list;
   }
   
   // 상품 등록시 사진첨부 정보
   public List<Map<String, Object>> parseInsertProductFileInfo(Product product, 
         MultipartHttpServletRequest mpRequest) throws Exception{
      
      Iterator<String> iterator = mpRequest.getFileNames();
      
      MultipartFile multipartFile = null;
      String originalFileName = null;
      String originalFileExtension = null;
      String storedFileName = null;
      
      List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
      Map<String, Object> listMap = null;
      
      int prodNo = product.getProdNo();
      
      File file = new File(filePath);
      if(file.exists() == false) {
         file.mkdirs();
      }
      
      while(iterator.hasNext()) {
         multipartFile = mpRequest.getFile(iterator.next());
         if(multipartFile.isEmpty() == false) {
            originalFileName = multipartFile.getOriginalFilename();
            originalFileExtension = originalFileName.substring(originalFileName.lastIndexOf("."));
            storedFileName = getRandomString() + originalFileExtension;
            
            file = new File(filePath + storedFileName);
            listMap = new HashMap<String, Object>();
            listMap.put("prodNo", prodNo);
            listMap.put("orgFileName", originalFileName);
            listMap.put("storedFileName", storedFileName);
            listMap.put("fileSize", multipartFile.getSize());
            list.add(listMap);
         }
      }
      return list;
   }
   
   
   // 광고 등록시 사진첨부 정보
   public List<Map<String, Object>> parseInsertAdFileInfo(Request request, 
         MultipartHttpServletRequest mpRequest) throws Exception{
      
      Iterator<String> iterator = mpRequest.getFileNames();
      
      MultipartFile multipartFile = null;
      String originalFileName = null;
      String originalFileExtension = null;
      String storedFileName = null;
      
      List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
      Map<String, Object> listMap = null;
      
      int reqNo = request.getReqNo();
      
      File file = new File(filePath);
      if(file.exists() == false) {
         file.mkdirs();
      }
      
      while(iterator.hasNext()) {
         multipartFile = mpRequest.getFile(iterator.next());
         if(multipartFile.isEmpty() == false) {
            originalFileName = multipartFile.getOriginalFilename();
            originalFileExtension = originalFileName.substring(originalFileName.lastIndexOf("."));
            storedFileName = getRandomString() + originalFileExtension;
            
            file = new File(filePath + storedFileName);
            listMap = new HashMap<String, Object>();
            listMap.put("reqNo", reqNo);
            listMap.put("orgFileName", originalFileName);
            listMap.put("storedFileName", storedFileName);
            listMap.put("fileSize", multipartFile.getSize());
            list.add(listMap);
         }
      }
      return list;
   }
   
   
   public static String getRandomString() {
      return UUID.randomUUID().toString().replaceAll("-", "");
   }
   
}