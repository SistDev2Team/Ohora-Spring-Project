package kr.ohora.sl.service.cart;

import kr.ohora.sl.domain.ProductDTO;

public interface NonMemberCartService {
	
	ProductDTO selectNonMemberCart(int pdtid); // 장바구니의 상품id 가져오기
     
}
