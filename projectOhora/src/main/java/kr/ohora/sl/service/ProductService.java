package kr.ohora.sl.service;

import java.util.ArrayList;

import kr.ohora.sl.domain.Criteria;
import kr.ohora.sl.domain.ProductDTO;

public interface ProductService {

	public ArrayList<ProductDTO> getProducts( Criteria criteria);
    
    int getTotalRecords( Criteria criteria );
    
}