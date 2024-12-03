package kr.ohora.sl.domain;

import org.springframework.web.util.UriComponentsBuilder;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

//페이징 기준, 척도
@Getter
@Setter
@ToString
public class AdminPageCriteria {

	private int currentPage = 1;		// 현재 페이지 번호
	private int numberOfPageBlock = 10;	// 한 페이지에 출력할 게시글 수
	private int numberPerPage = 10;  // 한 페이지에 출력할 상품 수 (10개)
	private String keyword;			// 검색어
	private Integer sortMethod;

	public AdminPageCriteria() {
		this(1,10);
	}

	public AdminPageCriteria(int currentPage, int numberOfPageBlock) {
		this.currentPage = currentPage;
		this.numberOfPageBlock = numberOfPageBlock;
	}
	
	public String getListLink() {
        UriComponentsBuilder builder = UriComponentsBuilder.fromPath("")
                .queryParam("currentPage", this.currentPage)
                .queryParam("numberPerPage", this.numberPerPage);
        if (this.keyword != null) builder.queryParam("keyword", this.keyword);
        if (this.sortMethod != null) builder.queryParam("sort_method", this.sortMethod);

        return builder.toUriString();
    }
	
	public int getOffset() {
	    return (currentPage - 1) * numberPerPage;
	}
} 