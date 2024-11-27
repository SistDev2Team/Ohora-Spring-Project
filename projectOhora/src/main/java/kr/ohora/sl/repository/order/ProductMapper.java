package kr.ohora.sl.repository.order;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.type.Alias;

import kr.ohora.sl.domain.ProductDTO;

@Alias("ProductMapper")
public interface ProductMapper {
    List<ProductDTO> selectProducts(@Param("currentPage") int currentPage
    								, @Param("numberPerPage") int numberPerPage
    								, @Param("categoryNumber") int categoryNumber);
}