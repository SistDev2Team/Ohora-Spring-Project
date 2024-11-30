package kr.ohora.sl.service.admin;

import java.sql.SQLException;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ohora.sl.domain.ProductDTO;
import kr.ohora.sl.repository.admin.AdminMapper;

@Service
public class AdminServiceImpl implements AdminService{
	
	@Autowired
	AdminMapper adminMapper;

	@Override
	public ArrayList<ProductDTO> getAllProductList() throws SQLException {
		return adminMapper.selectAllProductList();
	}

	@Override
	public ProductDTO getProductInfo(int pdtid) throws SQLException {
		return adminMapper.selectProductInfo(pdtid);
	}

}
