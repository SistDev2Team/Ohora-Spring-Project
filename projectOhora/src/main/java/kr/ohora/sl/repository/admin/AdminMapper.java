package kr.ohora.sl.repository.admin;

import java.sql.SQLException;
import java.util.ArrayList;

import kr.ohora.sl.domain.ProductDTO;

public interface AdminMapper {

	ArrayList<ProductDTO> selectAllProductList() throws SQLException;
	ProductDTO selectProductInfo(int pdtid) throws SQLException;
}
