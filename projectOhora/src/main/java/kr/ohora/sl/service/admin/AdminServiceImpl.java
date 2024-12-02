package kr.ohora.sl.service.admin;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ohora.sl.domain.AdminPageCriteria;
import kr.ohora.sl.domain.ProductDTO;
import kr.ohora.sl.domain.UserDTO;
import kr.ohora.sl.repository.admin.AdminMapper;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class AdminServiceImpl implements AdminService{
	
	@Autowired
	private AdminMapper adminMapper;

	@Override
	public ArrayList<ProductDTO> getAllProductList(AdminPageCriteria criteria) throws SQLException {
		log.info("> AdminServiceImpl.getAllProductList()...");		
		ArrayList<ProductDTO> productDTO = adminMapper.selectAllProductList(criteria);
		for (ProductDTO product : productDTO) {
			product.calcDiscountAmount();
		};
		return productDTO;
	}

	@Override
	public ProductDTO getProductInfo(int pdtid) throws SQLException {
		log.info("> AdminServiceImpl.getProductInfo()...");		
		ProductDTO productDTO = adminMapper.selectProductInfo(pdtid);
		productDTO.calcDiscountAmount();
		return productDTO;
	}

	@Override
	public int getTotalRecords(AdminPageCriteria criteria) {
		log.info("> AdminServiceImpl.getTotalRecords()...");
		return this.adminMapper.selectTotalRecords( criteria );
	}

	@Override
	public ArrayList<ProductDTO> getProductsBySearch(AdminPageCriteria criteria) {
		log.info("AdminServiceImpl.getProductsBySearch()...");
		ArrayList<ProductDTO> productDTO = adminMapper.selectProductsBySearch(criteria);
		for (ProductDTO product : productDTO) {
			product.calcDiscountAmount();
		};
		return productDTO;
	}

	@Override
	public int getTotalRecordsBySearch(AdminPageCriteria criteria, String keyword) {
		log.info("AdminServiceImpl.getTotalRecordsBySearch()...");
		return this.adminMapper.selectTotalRecordsBySearch(criteria, keyword);
	}
	@Override
	public ArrayList<UserDTO> getAllCustomerList() throws SQLException {
		return adminMapper.selectAllCustomerList();
	}

	@Override
	public UserDTO getCustomerDetailById(Integer userid) throws SQLException {
		return adminMapper.selectCustomerDetailById(userid);
	}

	@Override
	public int deleteProducts(List<Integer> productIds) {
		return adminMapper.deleteProducts(productIds);
	}

	@Override
	public void productInsert(ProductDTO productDTO) throws Exception {
		log.info("AdminServiceImpl.productInsert()... 상품 등록 서비스 호출");
		
		try {
			productDTO.calcDiscountAmount(); // 할인가계산
			adminMapper.productInsert(productDTO);
		} catch (Exception e) {
			log.error("상품 등록 실패 ..." + e.getMessage());
			throw new Exception("상품 등록 실패 ...", e);
		}
		
		
	}

	@Override
    public boolean modifyUserStatus(int userid, boolean enabled) {
        try {
            adminMapper.updateUserStatus(userid, enabled);
            return true;
        } catch (Exception e) {
            log.error("Error updating user status", e);
            return false;
        }
    }
}
