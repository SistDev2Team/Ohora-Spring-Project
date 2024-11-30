package kr.ohora.sl.controller;

import java.security.Principal;
import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.ohora.sl.domain.Criteria;
import kr.ohora.sl.domain.ProductDTO;
import kr.ohora.sl.domain.security.CustomUser;
import kr.ohora.sl.service.ProductService;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@AllArgsConstructor
@Log4j
public class MainPageController {
	
	private ProductService productService;

	@RequestMapping("/oho_main")
	public String main(Model model, Criteria criteria, Principal principal) {
		
		
		log.info("> MainPageController main()...");
		
		
		
  	  if (principal != null) {
	        CustomUser customUser = (CustomUser) ((Authentication) principal).getPrincipal();
	        System.out.println(" 로그인한 사용자: " + customUser.getUsername()); // id
	        System.out.println(" 로그인사용자이름 " + customUser.getUser().getUsername());
	        System.out.println("권한목록: " + customUser.getAuthorities());
	    }
		
		criteria.setCategoryNumber(121);
		criteria.setCurrentPage(1);
		criteria.setNumberPerPage(10);
		model.addAttribute("newProducts", this.productService.getProducts(criteria));

		criteria.setCategoryNumber(120);
		criteria.setCurrentPage(1);
		criteria.setNumberPerPage(10);
		model.addAttribute("bestProducts", this.productService.getProducts(criteria));
		
		return "oho_main";
	}
	

	@ResponseBody
	@RequestMapping(
	    value = "/oho_main.ajax",
	    method = RequestMethod.GET,
	    produces = {MediaType.APPLICATION_JSON_UTF8_VALUE, MediaType.APPLICATION_XML_VALUE}
	)
	public ResponseEntity<List<ProductDTO>> productAjax(@RequestParam("category") int category, Criteria criteria) {
	    log.info("> MainPageController productAjax()... category: " + category);

	    criteria.setCategoryNumber(category);
	    criteria.setCurrentPage(1);
	    criteria.setNumberPerPage(10);

	    List<ProductDTO> pList = this.productService.getProducts(criteria);

	    if (pList == null || pList.isEmpty()) {
	        // 데이터가 없으면 502 상태 반환
	        return ResponseEntity.status(HttpStatus.BAD_GATEWAY).body(null);
	    } else {
	        // 성공적으로 데이터를 반환
	        return ResponseEntity.status(HttpStatus.OK).body(pList);
	    }
	}

}
