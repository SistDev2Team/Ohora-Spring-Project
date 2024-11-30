package kr.ohora.sl.domain;

import org.springframework.web.util.UriComponentsBuilder;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

//페이징 기준, 척도
@Getter
@Setter
@ToString
public class Criteria {

	private Integer categoryNumber;		// 구분하는 카테고리 번호
	private int currentPage;		// 현재 페이지 번호
	private int numberOfPageBlock;	// 한 페이지에 출력할 게시글 수

	private int numberPerPage = 12;  // 한 페이지에 출력할 상품 수 (12개)
	private String keyword;			// 검색어
	private Integer sortMethod;

	public Criteria() {
		this(44,1,10,null);
	}

	public Criteria(int categoryNumber, int currentPage, int numberOfPageBlock, Integer sortMethod) {
		super();
		this.categoryNumber = categoryNumber;
		this.currentPage = currentPage;
		this.numberOfPageBlock = numberOfPageBlock;
		this.sortMethod = sortMethod;
	}

	public Criteria(String keyword, int currentPage, int numberOfPageBlock) {
		super();
		this.keyword = keyword;
		this.currentPage = currentPage;
		this.numberOfPageBlock = numberOfPageBlock;
	}

	// ?pageNum=2&amount=10&type=T&keyword=홍길동&..
	// org.springframework.web.util
	// 	ㄴ UriComponentsBuilder
	public String getListLink() {
		UriComponentsBuilder builder = UriComponentsBuilder.fromPath("");
	    
	    if (this.keyword != null) {
	        builder.queryParam("keyword", this.keyword);
	    }
	    if (this.sortMethod != null) {
	        builder.queryParam("sort_method", this.sortMethod);
	    }
	    if (this.categoryNumber != null) {
	        builder.queryParam("cate_no", this.categoryNumber);
	    }
	    builder.queryParam("currentPage", this.currentPage);
	    
	    return builder.toUriString();
	
	}
} // class