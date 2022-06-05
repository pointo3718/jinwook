package com.jinwook.home.web.store;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.jinwook.home.service.store.StoreService;

@Controller
public class StoreController {

	@Autowired
	private StoreService storeService;

	@GetMapping(value = "updateStore")
	public String updateStore(Model model) {
		return "store/updateStore";
	}

}