package kr.ohora.sl.service.product;

import java.util.ArrayList;

import kr.ohora.sl.domain.Criteria;
import kr.ohora.sl.domain.ProductDTO;

public interface ProductService {

	// 상품 리스트 출력 ( new , best , all , outlet )
	public ArrayList<ProductDTO> getProducts( Criteria criteria );

	// 상품 레코드 값
	int getTotalRecords( Criteria criteria );

	// 상품 상세 정보
	ProductDTO getProductDetail( int pdtid );
	
	// 추가구성상품 존재여부 구분하기
	ArrayList<ProductDTO> getProductOptionCmb(ProductDTO productDTO);
	
	//	롱, 숏 존재하는 상품 구분
	ArrayList<ProductDTO> getProductOption(ProductDTO productDTO);

	// 상품 리스트 출력 ( 검색 )
	public ArrayList<ProductDTO> getProductsBySearch( Criteria criteria );
	
	// 상품 레코드 값 ( 검색 )
	int getTotalRecordsBySearch( Criteria criteria , String keyword);

}