package kr.ohora.sl.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ohora.sl.domain.ProductDTO;
import kr.ohora.sl.repository.order.ProductMapper;

@Service
public class ProductService {
    private final ProductMapper productMapper;

    @Autowired
    public ProductService(ProductMapper productMapper) {
        this.productMapper = productMapper;
    }

    public List<ProductDTO> getProducts(int currentPage, int numberPerPage, int categoryNumber) {
        return productMapper.selectProducts(currentPage, numberPerPage,categoryNumber);
    }
}