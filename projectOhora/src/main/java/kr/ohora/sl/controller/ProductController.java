package kr.ohora.sl.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.ohora.sl.domain.Criteria;
import kr.ohora.sl.domain.PageDTO;
import kr.ohora.sl.domain.ProductDTO;
import kr.ohora.sl.service.ProductService;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
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


	@GetMapping("/prd_detail_view")
	public String prdDetailView(Model model,@RequestParam("cate_no") int categoryNumber, @RequestParam("product_no") int pdtId) {
		log.info("> ProductController prdDetailView() ...");
		ProductDTO productDTO = new ProductDTO();
		// ProductDTO 상세 정보 가져오기
		productDTO = this.productService.getProductDetail(pdtId);
		model.addAttribute("pdtDetail", productDTO);

		// 옵션 조합 정보 가져오기
		List<ProductDTO> productOptionCmb = this.productService.getProductOptionCmb(productDTO);
		model.addAttribute("prdOptCmb", productOptionCmb);

		// 추가 구성 상품 정보 가져오기
		List<ProductDTO> optionProducts = this.productService.getProductOption(productDTO);
		model.addAttribute("optionProducts", optionProducts);

		return "product.prd_detail_view";
	}

	@GetMapping("/prd_search")
	public String productSearch(@RequestParam("keyword") String keyword
			, @RequestParam("currentPage") int currentPage
			,Model model, Criteria criteria) {
		log.info("> ProductController productSearch() ...");
		System.out.println("> keyword : " + keyword);
		criteria.setKeyword(keyword);
		criteria.setCurrentPage(currentPage);
		criteria.setNumberOfPageBlock(10);
		criteria.setNumberPerPage(39);

		model.addAttribute("list", this.productService.getProductsBySearch(criteria));

		int total = this.productService.getTotalRecordsBySearch(criteria, keyword);
		model.addAttribute("pdto",new PageDTO(criteria, total));

		return "product.prd_search";
	}
}
