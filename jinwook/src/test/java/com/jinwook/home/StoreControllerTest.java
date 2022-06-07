package com.jinwook.home;

//@SpringBootTest
//@AutoConfigureMockMvc
//class StoreControllerTest {
//
////    @Autowired
////    private MockMvc mockMvc;
////
////    @Autowired
////    private ObjectMapper objectMapper;
////
//////    @Autowired
//////    private Store store;
//////    
//////    @Autowired
//////    private Product product;
////
////
//////    @DisplayName("상품 삭제")
//////    @Test
//////    public void deleteStoreProductTest() throws Exception {
//////
//////    	Product product = new Product();
//////    	product.setProdNo(10024);
//////
//////    	product.save(product);
//////
//////    	mockMvc.perform(delete("/store/"))
//////    			.andExpect(status().isOk())
//////    			.andDo(print());
//////
//////    	Assertions.assertThat(product.deleteStoreProduct(10024).isEmpty());
//////    }
