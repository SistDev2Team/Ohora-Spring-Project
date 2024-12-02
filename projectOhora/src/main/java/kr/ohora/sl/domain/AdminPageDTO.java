package kr.ohora.sl.domain;

import lombok.Getter;
import lombok.ToString;

@Getter
@ToString
public class AdminPageDTO {
	private AdminPageCriteria criteria;
	private int currentPage;			// 현재 페이지
	
	private int start;					// 해당 페이지의 첫번째 페이지
	private int end;					// 해당 페이지의 마지막 페이지
	
	private int first = 1;				// 전체 페이지의 첫번째 페이지
	private int last;					// 전체 페이지의 마지막 페이지
	
	private boolean prev;				// 현재 기준 -1 페이지
	private boolean next;				// 현재 기준 +1 페이지
	
	private int numberPerPage;			// 한페이지에 출력하고자 하는 상품 수
	
	private int total;					// 전체 상품 수
    private int numberOfPageBlock;		// 한페이지당 출력되는 페이지수  // [1] 2 3 4 5 6 7 8 9 10 >
    private int totalRecords;			// 종합 레코드 수
    
    private String searchWord;			// 검색어
    private int categoryNumber;			// 상품을 분류하는 기준

    public AdminPageDTO(AdminPageCriteria criteria, int total) {
        this.criteria = criteria;
        this.total = total;
        this.currentPage = criteria.getCurrentPage();

        this.start = (criteria.getCurrentPage()-1)/criteria.getNumberOfPageBlock() * criteria.getNumberOfPageBlock() + 1;
        this.end = this.start + criteria.getNumberOfPageBlock() - 1;
        
        first = 1;
        last = (int)(Math.ceil((double)total / criteria.getNumberPerPage()));

		if( this.end > last) this.end = last;
		
		this.prev = (this.currentPage > 1);		// 이전 페이지 블록이 존재하면 true
		this.next = (this.end < last);		// 다음 페이지 블록이 존재하면 true
    }
}
