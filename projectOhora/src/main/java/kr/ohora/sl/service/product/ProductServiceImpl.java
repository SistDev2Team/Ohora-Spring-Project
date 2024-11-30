package kr.ohora.sl.service.product;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ohora.sl.domain.Criteria;
import kr.ohora.sl.domain.ProductDTO;
import kr.ohora.sl.repository.product.ProductMapper;
import lombok.NoArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
@NoArgsConstructor
public class ProductServiceImpl implements ProductService{
	
	@Autowired
	ProductMapper productMapper;
	
	@Override
	public ArrayList<ProductDTO> getProducts( Criteria criteria) {
		log.info("> ProductServiceImpl getProducts()...");
		return this.productMapper.selectProductsByCateNo( criteria );
	}

	@Override
	public int getTotalRecords( Criteria criteria) {
		log.info("> ProductServiceImpl.getTotalRecords()...");
		return this.productMapper.selectTotalRecords( criteria );
	}

	@Override
	public ProductDTO getProductDetail(int pdtid) {
		log.info("> ProductServiceImpl.prdDetail()...");
		return this.productMapper.selectProductDetail( pdtid );
	}

	@Override
	public ArrayList<ProductDTO> getProductOptionCmb(ProductDTO productDTO) {
		log.info("> ProductServiceImpl.getProductOptionCmb()...");
		return this.productMapper.selectProductOptionCmb( productDTO );
	}

	@Override
	public ArrayList<ProductDTO> getProductOption(ProductDTO productDTO) {
		log.info("> ProductServiceImpl.getProductOption()...");
		int catid = productDTO.getCatid();
		return this.productMapper.selectProductOption(productDTO, catid);
	}

	@Override
	public ArrayList<ProductDTO> getProductsBySearch(Criteria criteria) {
		log.info("> ProductServiceImpl.getProductsBySearch()...");
		return this.productMapper.selectProductsBySearch( criteria );
	}

	@Override
	public int getTotalRecordsBySearch(Criteria criteria, String keyword) {
		log.info("> ProductServiceImpl.getTotalRecordsBySearch()...");
		return this.productMapper.selectTotalRecordsBySearch( criteria , keyword );
	}

	
}
