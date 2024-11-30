package kr.ohora.sl;

import java.security.Principal;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.ohora.sl.domain.AddrDTO;
import kr.ohora.sl.domain.CouponDTO;
import kr.ohora.sl.domain.OrderDTO;
import kr.ohora.sl.domain.ProductDTO;
import kr.ohora.sl.domain.UserDTO;
import kr.ohora.sl.service.order.OrderPageService;
import kr.ohora.sl.service.order.OrderService;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/order/*")
public class OrderPageController {
	
	@Autowired
	private OrderPageService orderPageService;
	@Autowired
	private OrderService orderService;
	
	@GetMapping("orderPage.htm")
	public String orderPage(@RequestParam("pdtId") String[] pdtidArr, @RequestParam("pdtCount") int[] pdtCountArray
			, Model model, Principal principal) throws SQLException { // 
		int userPk = 0;
		
		UserDTO userDTO = null;
		ArrayList<AddrDTO> addrList = null;
		ArrayList<CouponDTO> couponList = null;
		ArrayList<ProductDTO> pdtList = null;
		String[] emailArr = null;
		String[] telArr = null;
		
		pdtList = this.orderPageService.getProductList(pdtidArr);
		
		if (userPk != 0) {
			userDTO = orderPageService.getUserInfo(userPk);
			if (userDTO != null) {
				emailArr = userDTO.getUseremail() != null ? userDTO.getUseremail().split("@") : new String[]{"", ""};
				telArr = userDTO.getUsertel() != null ? userDTO.getUsertel().split("-") : new String[]{"", "", ""};
			}
			addrList = orderPageService.getAddrList(userPk);
			couponList = orderPageService.getCouponList(userPk);
		}
		
		model.addAttribute("userDTO", userDTO);
		model.addAttribute("pdtList", pdtList);
		model.addAttribute("pdtCountArray", pdtCountArray);
		model.addAttribute("addrList", addrList);
		model.addAttribute("couponList", couponList);
		model.addAttribute("emailArr", emailArr);
		model.addAttribute("telArr", telArr);
		
		return "/order/orderPage";
	}
	
	@GetMapping("order.htm")
	public String order(OrderDTO oderDTO) throws SQLException {
		int userPk = 0;
		oderDTO.setUserPk(userPk);
		String orderId = this.orderService.orderProcess(oderDTO);
		LocalDateTime currentTime = LocalDateTime.now();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
        String orderTime = currentTime.format(formatter);
		
		return String.format("redirect:/order/orderComplete.htm?orderId=%s&orderTime=%s", orderId, orderTime);
	}
	
	@GetMapping("orderComplete.htm")
	public String orderComplete(@RequestParam("orderId") String orderId, @RequestParam("orderTime") String orderTime, RedirectAttributes rttr) {
		
		rttr.addFlashAttribute("orderId", orderId);
		rttr.addFlashAttribute("orderTime", orderTime);
		return "/order/endorder_log";
	}

	
}
