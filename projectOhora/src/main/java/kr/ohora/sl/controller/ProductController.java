package kr.ohora.sl.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/product/*")
@Log4j
public class ProductController {
	
	@RequestMapping("prd_view.htm")
	public String productView() {
		log.info("> ProductController TEST ......................");
		return "product.prd_view";
	}
	
}
