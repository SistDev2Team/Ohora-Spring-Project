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

	private int categoryNumber;	// 구분하는 카테고리 번호
	private int currentPage;	// 현재 페이지 번호
	private int numberOfPageBlock;	// 한 페이지에 출력할 게시글 수

	public int numberPerPage = 12;  // 한 페이지에 출력할 상품 수 (12개)
	
	public Criteria() {
		this(44,1,10);
	}
	
	public Criteria(int categoryNumber, int currentPage, int numberOfPageBlock) {
		super();
		this.categoryNumber = categoryNumber;
		this.currentPage = currentPage;
		this.numberOfPageBlock = numberOfPageBlock;
	}

	// ?pageNum=2&amount=10&type=T&keyword=홍길동&..............
	// org.springframework.web.util
	// 	ㄴ UriComponentsBuilder
	public String getListLink() {
		UriComponentsBuilder builder = UriComponentsBuilder.fromPath("")
										.queryParam("cate_no", this.categoryNumber)
										.queryParam("currentPage", this.currentPage);
		return builder.toUriString();
	}
	
} // class