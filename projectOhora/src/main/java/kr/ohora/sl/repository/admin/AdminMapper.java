package kr.ohora.sl.repository.admin;

import java.sql.SQLException;
import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import kr.ohora.sl.domain.AdminPageCriteria;
import kr.ohora.sl.domain.ProductDTO;
import kr.ohora.sl.domain.UserDTO;

public interface AdminMapper {
	ArrayList<ProductDTO> selectAllProductList(AdminPageCriteria criteria) throws SQLException;
	ProductDTO selectProductInfo(int pdtid) throws SQLException;
	Integer selectTotalRecords( AdminPageCriteria criteria );
	ArrayList<ProductDTO> selectProductsBySearch( AdminPageCriteria criteria );
	Integer selectTotalRecordsBySearch( AdminPageCriteria criteria , @Param("keyword") String keyword );
	ArrayList<UserDTO> selectAllCustomerList() throws SQLException;
	UserDTO selectCustomerDetailById(Integer userid);
}
