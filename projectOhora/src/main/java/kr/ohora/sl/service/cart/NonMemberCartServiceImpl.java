package kr.ohora.sl.service.cart;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ohora.sl.domain.ProductDTO;
import kr.ohora.sl.repository.cart.NonMemberCartMapper;

@Service
public class NonMemberCartServiceImpl implements NonMemberCartService{

	@Autowired
	private NonMemberCartMapper nonMemberCartMapper;

	@Override
	public ProductDTO selectNonMemberCart(int pdtid) {
		
		ProductDTO productDTO = nonMemberCartMapper.selectNonMemberCart(pdtid);
		productDTO.calcDiscountAmount();
		return productDTO;
		
	}
}
