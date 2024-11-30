package kr.ohora.sl.service.admin;

import java.sql.SQLException;
import java.util.ArrayList;

import kr.ohora.sl.domain.ProductDTO;

public interface AdminService {
	ArrayList<ProductDTO> getAllProductList() throws SQLException;
	
	ProductDTO getProductInfo(int pdtid) throws SQLException;
}
