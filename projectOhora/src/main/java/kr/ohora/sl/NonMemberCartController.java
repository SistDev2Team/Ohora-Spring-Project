package kr.ohora.sl;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.ohora.sl.domain.ProductDTO;
import kr.ohora.sl.service.cart.NonMemberCartService;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/order/*")
public class NonMemberCartController {

	@Autowired
	private NonMemberCartService nonMemberCartService;
	
	@RequestMapping("iscart.htm")
	public String NonMemberCart(
			@CookieValue("cartItems") String cartItems,
			HttpServletRequest request, 
			Model model
			) throws UnsupportedEncodingException {
		log.info("NonMemberCart()...");
		
		String cartData =  cartItems;  
		System.out.println(">>>>> 쿠키 데이터: " + cartData );
		
		String[] cartEntries = cartData.split("\\|"); // 100:3|101:1|103:2 
		
		List<ProductDTO> cartItemsList = new ArrayList<>();
		
		
		for (String entry : cartEntries) {
			String[] cookiePart = entry.split(":");
			if (cookiePart.length == 2) {
				int pdtId = Integer.parseInt(cookiePart[0]);
				int quantity = Integer.parseInt(cookiePart[1]);
				
				ProductDTO productDTO = nonMemberCartService.selectNonMemberCart(pdtId);
				
				if(productDTO != null) {
					productDTO.setQuantity(quantity);
					cartItemsList.add(productDTO);
				}
			}
		}
		model.addAttribute("cartItems", cartItemsList);
		
		return "order.iscart";
		//http://localhost:8070/order/iscart.htm
		//http://localhost:8070/product/prd_view.htm?cate_no=44&currentPage=1
	}

}
















