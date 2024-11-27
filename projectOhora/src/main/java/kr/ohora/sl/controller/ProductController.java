package kr.ohora.sl.controller;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.ohora.sl.domain.ProductDTO;
import kr.ohora.sl.service.ProductService;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/product/*")
@Log4j
public class ProductController {
	
    private ProductService productService;

	@Autowired
    public ProductController(ProductService productService) {
        this.productService = productService;
    }
	
	@RequestMapping("prd_view.htm/*")
	public String productView() {
		log.info("> ProductController TEST ......................");
		return "product.prd_view";
	}
	
    @GetMapping
    public List<ProductDTO> getProducts(@Param("currentPage") int currentPage
									, @Param("numberPerPage") int numberPerPage
									, @Param("categoryNumber") int categoryNumber) {
        return productService.getProducts(currentPage, numberPerPage, categoryNumber);
    }
	
}
