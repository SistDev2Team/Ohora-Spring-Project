package kr.ohora.sl;

import java.io.UnsupportedEncodingException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.ohora.sl.domain.ProductDTO;
import kr.ohora.sl.domain.security.CustomUser;
import kr.ohora.sl.service.cart.CartService;
import kr.ohora.sl.service.cart.NonMemberCartService;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequiredArgsConstructor
@RequestMapping("/order/*")
public class NonMemberCartController {

	private final NonMemberCartService nonMemberCartService;
	private final CartService cartService;
	
	@RequestMapping("iscart.htm")
	public String NonMemberCart(
			@CookieValue(value="cartItems", required = false) String cartItems,
			HttpServletRequest request, 
			Model model, Authentication authentication
			) throws UnsupportedEncodingException, SQLException {
		log.info("NonMemberCart()...");
		
		int userPk = 0;
		try {
			CustomUser customUser = (CustomUser) authentication.getPrincipal();
			userPk = customUser.getUser().getUserid();
		} catch (Exception e) {
			userPk = 0;
		}
		
		List<ProductDTO> cartItemsList = new ArrayList<>();
		
		if (userPk == 0) {
			String cartData =  cartItems;  
			System.out.println(">>>>> 쿠키 데이터: " + cartData );
			
			String[] cartEntries = cartData.split("\\|"); // 100:3|101:1|103:2 

			for (String entry : cartEntries) {
				String[] cookiePart = entry.split(":");
				if (cookiePart.length == 2) {
					int pdtId = Integer.parseInt(cookiePart[0]);
					int quantity = Integer.parseInt(cookiePart[1]);
					
					ProductDTO productDTO = nonMemberCartService.selectNonMemberCart(pdtId);
					
					if(productDTO != null) {
						productDTO.setClistpdtcount(quantity);
						cartItemsList.add(productDTO);
					}
				}
			}

		} else {
			String auth = "auth";
			cartItemsList = cartService.getCartItems(userPk);
			model.addAttribute("auth", auth);
		}
		
		model.addAttribute("cartItems", cartItemsList);
		
		return "order.iscart";
		//http://localhost:8070/order/iscart.htm
		//http://localhost:8070/product/prd_view.htm?cate_no=44&currentPage=1
	}
	
	@GetMapping("deletecart.htm")
	public String deleteCart(@RequestParam("pdtId") int pdtId, Authentication authentication) throws SQLException {
		int userPk = 0;
		try {
			CustomUser customUser = (CustomUser) authentication.getPrincipal();
			userPk = customUser.getUser().getUserid();
		} catch (Exception e) {
			userPk = 0;
		}
		
		if (userPk != 0) {
			cartService.deleteCart(userPk, pdtId);
		}
		return "redirect:/order/iscart.htm";
	}

}
















