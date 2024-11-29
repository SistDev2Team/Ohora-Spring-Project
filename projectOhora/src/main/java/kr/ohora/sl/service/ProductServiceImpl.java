package kr.ohora.sl.service;

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

	
}
