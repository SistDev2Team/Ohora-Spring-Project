package kr.ohora.sl.repository.product;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.type.Alias;
import org.springframework.stereotype.Repository;

import kr.ohora.sl.domain.Criteria;
import kr.ohora.sl.domain.ProductDTO;

@Repository
@Alias("ProductMapper")
public interface ProductMapper {
	
	public ArrayList<ProductDTO> selectProductsByCateNo( Criteria criteria );	// cate_no 에 따른 상품 ( new , best , all , outlet )
    // public ArrayList<ProductDTO> selectProductsByCateNo(int currentPage, int numberPerPage, int categoryNumber, int sort_method);	// 신상품, 인기상품, 조회수 별 정렬
    // public ArrayList<ProductDTO> selectProductsBySearch(String searchWord,	int currentPage, int numberPerPage);	// 상품 검색
    
    public Integer selectTotalRecords( Criteria criteria );
    
    public void productViewUpdate();	// 상품 클릭시 조회수 +1
    	
}