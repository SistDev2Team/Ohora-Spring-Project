package kr.ohora.sl.service.order;

import java.sql.SQLException;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ohora.sl.domain.AddrDTO;
import kr.ohora.sl.domain.CouponDTO;
import kr.ohora.sl.domain.ProductDTO;
import kr.ohora.sl.domain.UserDTO;
import kr.ohora.sl.repository.order.OrderMapper;

@Service
public class OrderPageServiceImpl implements OrderPageService{
	
	@Autowired
	private OrderMapper dao;
	
	@Override
	public UserDTO getUserInfo(int userPk) {
		UserDTO userDTO = null;
		try {
			userDTO = dao.selectUserInfo(userPk);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return userDTO;
	}
	
	@Override
	public ArrayList<AddrDTO> getAddrList(int userPk){
		ArrayList<AddrDTO> addrList = null;
		try {
			addrList = dao.selectAddrList(userPk);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return addrList;
	}
	
	@Override
	public ArrayList<CouponDTO> getCouponList(int userPk){
		ArrayList<CouponDTO> couponList = null;
		try {
			couponList = dao.selectCouponList(userPk);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return couponList;
	}
	
	@Override
	public ArrayList<ProductDTO> getProductList(String[] pdtidArr){
		ArrayList<ProductDTO> pdtList = null;
		try {
			pdtList = dao.selectProductList(pdtidArr);
			for (ProductDTO p : pdtList) {
				p.calcDiscountAmount();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return pdtList;
	}
}