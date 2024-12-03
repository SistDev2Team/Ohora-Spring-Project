package kr.ohora.sl.repository.cart;

import java.sql.SQLException;
import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import kr.ohora.sl.domain.ProductDTO;
import kr.ohora.sl.domain.UserDTO;

@Repository
public interface CartMapper {
	
    Integer selectCartCount(@Param("userPk") Integer userPk, @Param("pdtId") Integer pdtId) throws SQLException;
    
    int addToCart(@Param("userPk") Integer userPk, @Param("pdtId") Integer pdtId) throws SQLException;
	
	Integer getCartListCount(@Param("userPk") Integer userPk) throws SQLException;
	
	int updateCart(@Param("userPk") Integer userPk, @Param("pdtId") Integer pdtId) throws SQLException;
	
	ArrayList<ProductDTO> getCartItems(@Param("userPk") int userPk) throws SQLException;
    
	void deleteCart(@Param("userPk") int userPk, @Param("pdtId") int pdtId) throws SQLException;
}


