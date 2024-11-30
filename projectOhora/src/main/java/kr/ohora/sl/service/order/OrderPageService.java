package kr.ohora.sl.service.order;

import java.sql.SQLException;
import java.util.ArrayList;

import kr.ohora.sl.domain.AddrDTO;
import kr.ohora.sl.domain.CouponDTO;
import kr.ohora.sl.domain.ProductDTO;
import kr.ohora.sl.domain.UserDTO;

public interface OrderPageService {
	
	UserDTO getUserInfo(int userPk) throws SQLException;
	
	ArrayList<AddrDTO> getAddrList(int userPk) throws SQLException;
	
	ArrayList<CouponDTO> getCouponList(int userPk) throws SQLException;
	
	ArrayList<ProductDTO> getProductList(String[] pdtidArr) throws SQLException;
}
