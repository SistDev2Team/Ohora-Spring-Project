package kr.ohora.sl.service.cart;

import java.sql.SQLException;
import java.util.ArrayList;

import org.springframework.stereotype.Service;

import kr.ohora.sl.domain.ProductDTO;
import kr.ohora.sl.repository.cart.CartMapper;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class CartServiceImpl implements CartService{

	private final CartMapper cartMapper;
	
	@Override
	public Integer checkCart(Integer userPk, Integer pdtId) throws SQLException {
		return cartMapper.selectCartCount(userPk, pdtId);
	}

	@Override
	public Integer addToCart(Integer userPk, Integer pdtId) throws SQLException {
		if (cartMapper.addToCart(userPk, pdtId) > 0) {
			System.out.println("카트 추가 성공");			
		}
		return cartMapper.getCartListCount(userPk);
	}

	@Override
	public int updateCart(Integer userPk, Integer pdtId) throws SQLException {
		return cartMapper.updateCart(userPk, pdtId);
	}

	@Override
	public Integer getCartListCount(Integer userPk) throws SQLException {
		return cartMapper.getCartListCount(userPk);
	}

	@Override
	public ArrayList<ProductDTO> getCartItems(int userPk) throws SQLException {
		ArrayList<ProductDTO> pdtList = cartMapper.getCartItems(userPk);
		for (ProductDTO p : pdtList) {
			p.calcDiscountAmount();
		}
		return pdtList;
	}

	@Override
	public void deleteCart(int userPk, int pdtId) throws SQLException {
		cartMapper.deleteCart(userPk, pdtId);
	}


}
