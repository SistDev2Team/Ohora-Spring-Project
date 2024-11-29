package kr.ohora.sl.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.ohora.sl.domain.Criteria;
import kr.ohora.sl.domain.PageDTO;
import kr.ohora.sl.service.ProductService;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/product/*")
@AllArgsConstructor
@Log4j
public class ProductController {

	private ProductService productService;

	@GetMapping("/prd_view")
	public String productView(@RequestParam("cate_no") int categoryNumber
							, @RequestParam("currentPage") int currentPage
							,Model model, Criteria criteria) {
		log.info("> ProductController productView() ...");
		
	    criteria.setCategoryNumber(categoryNumber);
	    criteria.setCurrentPage(currentPage);
	    criteria.setNumberOfPageBlock(10);
		
		model.addAttribute("list", this.productService.getProducts(criteria));
		
		int total = this.productService.getTotalRecords(criteria);
		model.addAttribute("pdto",new PageDTO(criteria, total));
		
		return "product.prd_view";
	}

}
