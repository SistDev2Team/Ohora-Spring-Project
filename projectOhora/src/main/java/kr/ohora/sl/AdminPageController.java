package kr.ohora.sl;

import java.sql.SQLException;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.ohora.sl.domain.AdminPageCriteria;
import kr.ohora.sl.domain.AdminPageDTO;
import kr.ohora.sl.domain.ProductDTO;
import kr.ohora.sl.domain.UserDTO;
import kr.ohora.sl.service.admin.AdminService;
import kr.ohora.sl.service.member.MemberService;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/admin/*")
public class AdminPageController {
	
	@Autowired
	AdminService adminService;
	
	@GetMapping("productDetail.htm")
	public String productDetail(@RequestParam("pdtid") int pdtid, Model model) throws SQLException {
		log.info("> AdminController.productDetail() ...");
		ProductDTO productDTO = this.adminService.getProductInfo(pdtid);
		model.addAttribute("productDTO", productDTO);
		return "/admin/productDetail";
	}
	
	// 페이징처리
	@GetMapping("productList.htm")
	public String productList(
	        @RequestParam(value = "currentPage", defaultValue = "1") int currentPage,
	        @RequestParam(value = "sort_method", required = false) Integer sortMethod,
	        @RequestParam(value = "keyword", required = false) String keyword,
	        Model model, AdminPageCriteria criteria) {
	    log.info("> AdminController.productList() ...");

	    criteria.setCurrentPage(currentPage);
	    criteria.setSortMethod(sortMethod);
	    criteria.setKeyword(keyword);
	    criteria.setNumberOfPageBlock(10);
	    criteria.setNumberPerPage(10); 

	    try {
	        ArrayList<ProductDTO> productDTO = this.adminService.getAllProductList(criteria);
	        if (productDTO == null || productDTO.isEmpty()) {
	            log.warn("error : ProductDTO list가 null 이거나 비어있음!!");
	            productDTO = new ArrayList<>();
	        }
	        model.addAttribute("productDTO", productDTO);
	    } catch (SQLException e) {
	        log.error("Error while fetching product list", e);
	    }

	    int total = this.adminService.getTotalRecords(criteria);
	    model.addAttribute("pdto", new AdminPageDTO(criteria, total));

	    return "/admin/productList";
	}

	
	// 검색
	//@PostMapping("productSearch.htm")
	@GetMapping("productSearch.htm")
	public String productSearch(@RequestParam("keyword") String keyword
			, @RequestParam("currentPage") int currentPage
			,Model model, AdminPageCriteria criteria) {
		log.info("> AdminController.productSearch() ...");
		System.out.println("> keyword : " + keyword);
		criteria.setKeyword(keyword);
		criteria.setCurrentPage(currentPage);
		criteria.setNumberOfPageBlock(10);
		criteria.setNumberPerPage(39);

		model.addAttribute("list", this.adminService.getProductsBySearch(criteria));

		int total = this.adminService.getTotalRecordsBySearch(criteria, keyword);
		model.addAttribute("pdto",new AdminPageDTO(criteria, total));

		return "/admin/productList";
	}

	@GetMapping("customerList.htm")
	public String customerList(Model model) throws SQLException {
		log.info("> AdminPageController customerList()...");
		ArrayList<UserDTO> userDTO = this.adminService.getAllCustomerList();
		model.addAttribute("userDTO", userDTO);
		return "/admin/customerList";
	}
	
	@ResponseBody
	@RequestMapping(
	    value = "/admin/customerDetail.ajax",
	    method = RequestMethod.GET,
	    produces = MediaType.APPLICATION_JSON_UTF8_VALUE
	)
	public ResponseEntity<UserDTO> customerDetail(@RequestParam("userid") Integer userid) {
	    log.info("> AdminPageController customerDetail()... userid: " + userid);

	    try {
	        // 서비스 호출을 통해 회원 정보를 조회
	        UserDTO userDetail = this.adminService.getCustomerDetailById(userid);

	        if (userDetail == null) {
	            // 회원 정보가 없을 경우 404 상태 반환
	            return ResponseEntity.status(HttpStatus.NOT_FOUND).body(null);
	        }

	        // 성공적으로 데이터를 반환
	        return ResponseEntity.status(HttpStatus.OK).body(userDetail);
	    } catch (Exception e) {
	        log.error("Error retrieving customer details", e);
	        // 예외 발생 시 500 상태 반환
	        return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
	    }
	}
	
	
	
	@Autowired
	MemberService memberService;
	
	@ResponseBody
	@RequestMapping(
	    value = "/admin/customerEnroll.ajax",
	    method = RequestMethod.GET,
	    produces = MediaType.APPLICATION_JSON_UTF8_VALUE
	)
    public ResponseEntity<UserDTO> joinPage() {
		log.info("> AdminPageController joinPage()... 회원등록 페이지 요청");
		
		return null;
    }
}
