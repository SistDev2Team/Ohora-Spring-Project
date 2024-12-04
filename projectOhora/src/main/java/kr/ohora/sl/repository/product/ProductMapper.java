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
    
    public Integer selectTotalRecords( Criteria criteria );
    
    public void productViewUpdate(@Param("pdtid") int pdtid);	// 상품 클릭시 조회수 +1

	public ProductDTO selectProductDetail(@Param("pdtid") int pdtid);

	public ArrayList<ProductDTO> selectProductOptionCmb( ProductDTO productDTO );

	public ArrayList<ProductDTO> selectProductOption( ProductDTO productDTO, @Param("catid") int catid );
	
	public ArrayList<ProductDTO> selectProductsBySearch( Criteria criteria );
	
	public Integer selectTotalRecordsBySearch( Criteria criteria , @Param("keyword") String keyword );
}
