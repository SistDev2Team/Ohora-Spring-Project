package kr.ohora.sl.service.admin;

import java.sql.SQLException;
import java.util.ArrayList;

import kr.ohora.sl.domain.AdminPageCriteria;
import kr.ohora.sl.domain.ProductDTO;
import kr.ohora.sl.domain.UserDTO;

public interface AdminService {
	ArrayList<ProductDTO> getAllProductList(AdminPageCriteria criteria) throws SQLException; // 모든 상품정보 리스트
	
	ProductDTO getProductInfo(int pdtid) throws SQLException; // 상품 상세보기
	
	// 상품 레코드 값
	int getTotalRecords( AdminPageCriteria criteria );
	
	// 상품 리스트 출력 ( 검색 )
	public ArrayList<ProductDTO> getProductsBySearch( AdminPageCriteria criteria );
	
	// 상품 레코드 값 ( 검색 )
	int getTotalRecordsBySearch( AdminPageCriteria criteria , String keyword);
	
	ArrayList<UserDTO> getAllCustomerList() throws SQLException;

	UserDTO getCustomerDetailById(Integer userid) throws SQLException;
}
