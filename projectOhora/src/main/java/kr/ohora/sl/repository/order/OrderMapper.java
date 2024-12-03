package kr.ohora.sl.repository.order;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.ohora.sl.domain.AddrDTO;
import kr.ohora.sl.domain.CouponDTO;
import kr.ohora.sl.domain.OrderPageDTO;
import kr.ohora.sl.domain.ProductDTO;
import kr.ohora.sl.domain.UserDTO;

public interface OrderMapper {

	UserDTO selectUserInfo(@Param("userPk") int userPk) throws SQLException;

	ArrayList<AddrDTO> selectAddrList(@Param("userPk") int userPk) throws SQLException;

	ArrayList<CouponDTO> selectCouponList(@Param("userPk") int userPk) throws SQLException;

	ArrayList<ProductDTO> selectProductList(@Param("pdtidArr") String[] pdtidArr) throws SQLException;

	void insertOrder(OrderPageDTO orderDTO) throws SQLException;

	void updateUsePoint(@Param("userPk") int userPk, @Param("point") int point) throws SQLException;

	int checkPoint(@Param("userPk") int userPk) throws SQLException;

	void updateCoupon(@Param("userPk") int userPk, @Param("icpnId") int icpnId) throws SQLException;
	
	void insertOrdDetail(@Param("ordPk") Long ordPk, @Param("pdtName") String pdtName
			, @Param("pdtAmount") Integer pdtAmount, @Param("pdtDcAmount") Integer pdtDcAmount, @Param("pdtCount") Integer pdtCount) throws SQLException;
	
	String selectOrdId(@Param("ordPk") Long ordPk) throws SQLException;
	
	void updatePdtCount(@Param("pdtId") String pdtId, @Param("pdtCount") Integer pdtCount) throws SQLException;
	
	int deleteCart(@Param("userPk") int userPk, @Param("list") List<String> pdtIdArr ) throws SQLException;
	
}
