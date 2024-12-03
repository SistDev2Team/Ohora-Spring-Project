package kr.ohora.sl.service.cart;

import java.sql.SQLException;
import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import kr.ohora.sl.domain.ProductDTO;


public interface CartService {
	
	Integer checkCart(Integer userPk, Integer pdtId) throws SQLException;
	
	Integer addToCart(Integer userPk, Integer pdtId) throws SQLException;
	
	int updateCart(Integer userPk, Integer pdtId) throws SQLException;
	
	Integer getCartListCount(Integer userPk) throws SQLException;
	
	ArrayList<ProductDTO> getCartItems(int userPk) throws SQLException;
	
	void deleteCart(int userPk, int pdtId) throws SQLException;
}
