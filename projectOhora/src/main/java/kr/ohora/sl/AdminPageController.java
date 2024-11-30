package kr.ohora.sl;

import java.sql.SQLException;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.ohora.sl.domain.ProductDTO;
import kr.ohora.sl.service.admin.AdminService;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/admin/*")
public class AdminPageController {
	
	@Autowired
	AdminService adminService;
	
	@GetMapping("productList.htm")
	public String adminPage(Model model) throws SQLException {
		ArrayList<ProductDTO> productDTO = this.adminService.getAllProductList();
		model.addAttribute("productDTO", productDTO);
		return "/admin/productList";
	}
	
	@GetMapping("productDetail.htm")
	public String productDetail(@RequestParam("pdtid") int pdtid, Model model) throws SQLException {
		ProductDTO productDTO = this.adminService.getProductInfo(pdtid);
		model.addAttribute("productDTO", productDTO);
		return "/admin/productDetail";
	}
}
