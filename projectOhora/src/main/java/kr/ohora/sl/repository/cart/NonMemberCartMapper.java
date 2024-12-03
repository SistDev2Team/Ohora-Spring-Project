package kr.ohora.sl.repository.cart;

import kr.ohora.sl.domain.ProductDTO;

public interface NonMemberCartMapper {
	
	ProductDTO selectNonMemberCart(int pdtid);
	
}
